package com.kh.spring.deal.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.kh.spring.common.page.PageCreate;
import com.kh.spring.common.page.PageCreateDeal;
import com.kh.spring.deal.model.service.DealService;
import com.kh.spring.deal.model.vo.Deal;
import com.kh.spring.deal.model.vo.DealImage;
import com.kh.spring.dealReview.model.service.DealReviewService;
import com.kh.spring.dealReview.model.vo.DealReview;

@Controller
public class DealController {

	@Autowired
	private DealService service;

	@Autowired
	private DealReviewService reviewService;

	@RequestMapping("/deal/dealList.do")
	public ModelAndView dealList(@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {

		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;

		List<Deal> list = service.selectDealList(cPage, numPerPage);

		int totalCount = service.selectCount();

		String pageBar = new PageCreateDeal().getPageBar(cPage, numPerPage, totalCount, "dealList.do");

		mv.addObject("pageBar", pageBar);
		mv.addObject("list", list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("deal/dealList");

		return mv;

	}

	@RequestMapping("/deal/dealForm.do")
	public String dealForm() {
		return "deal/dealForm";
	}

	@RequestMapping("/deal/dealWriter.do")
	public String dealWriter() {
		return "deal/dealWriter";
	}

	@RequestMapping("/deal/dealImages.do")
	public void profileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String realFolder = request.getSession().getServletContext().getRealPath("/resources/images/test/");

		UUID uuid = UUID.randomUUID();

		String org_filename = file.getOriginalFilename();

		String str_filename = uuid.toString() + org_filename;

		/*
		 * System.out.println("원본명 : " + org_filename); System.out.println("이름 재설정 : " +
		 * str_filename);
		 */
		String filepath = realFolder + str_filename;

		/* System.out.println("파일경로 : " + filepath); */

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}

		file.transferTo(f);
		out.println(str_filename);
		out.close();
	}

	@RequestMapping("/deal/dealWriteEnd.do")
	public ModelAndView dealWriteEnd(String subject, String content, String deal_writer, int member_pk, HttpServletRequest request) {

		/*
		 * //받아온 값 확인 System.out.println("제목 :"+subject);
		 * System.out.println("내용 : "+content);
		 */

		String cutting = content;
		List<String> imageList = new ArrayList<String>();

		while (cutting.contains("<img")) {
			int start = cutting.indexOf("src=");
			String checkSrc = cutting.substring(start + 5, start + 9);
			if (checkSrc.equals("http")) {
				// 인터넷 주소 가져온 이미지
				int startHttp = cutting.indexOf("src=");
				int endHttp = cutting.indexOf("\"", start + 5);
				String image = cutting.substring(startHttp + 5, endHttp);
				imageList.add(image);
				cutting = cutting.substring(endHttp);
			} else {
				// 업로드한 이미지
				int startUpload = cutting.indexOf("test/");
				int endUpload = cutting.indexOf("&", start + 5);
				String image1 = cutting.substring(startUpload + 5, endUpload);
				imageList.add(image1);
				cutting = cutting.substring(endUpload);
			}
		}

		// 옮길 주소
		String realFolder = request.getSession().getServletContext().getRealPath("/resources/images/deal/");

		// 원래주소
		String testFolder = request.getSession().getServletContext().getRealPath("/resources/images/test/");

		// 원래 주소의 파일명 가져오기

		File file = new File(testFolder);
		File[] fileList = file.listFiles();

		for (int i = 0; i < imageList.size(); i++) {
			for (File a : fileList) {
				if (imageList.get(i).equals(a.getName())) {

					File file1 = new File(testFolder + a.getName());
					File file2 = new File(realFolder + a.getName());

					if (file1.exists()) {
						file1.renameTo(file2);
						System.out.println("파일 옮기기 성공");
					}
					if (!file2.exists()) {
						file2.mkdirs();
					}
				}
			}
		}

		// 불러올 장소 바꾸기
		String content1 = content.replace("/spring/resources/images/test/", "/spring/resources/images/deal/");
		/* System.out.println(content1); */

		int result = service.insertDeal(subject, content1, deal_writer, imageList, member_pk);

		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "게시글 작성 성공";
		} else {
			msg = "게시글 작성 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/deal/dealList.do");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/deal/dealView.do")
	public ModelAndView dealView(int deal_pk) {
		
		ModelAndView mv = new ModelAndView();

		Deal deal = service.selectOne(deal_pk);

		List<DealReview> dealreviews = reviewService.dealReviewList(deal_pk);

		mv.addObject("dealreviews", dealreviews);
		mv.addObject("deal", deal);
		mv.setViewName("/deal/dealView");

		return mv;

	}

	@RequestMapping("/deal/dealDelete.do")
	public ModelAndView dealDelete(int deal_pk, HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();

		List<DealImage> list = service.dealImageList(deal_pk);
		/* System.out.println("사이즈가 뭐니"+list.size()); */
		// 이미지 이름 저장 리스트
		List<String> listImgName = new ArrayList<String>();

		for (DealImage a : list) {
			listImgName.add(a.getDeal_ori_img());
			System.out.println(a.getDeal_ori_img());
		}
		/* System.out.println("나오니 사이즈가 뭐니"+listImgName.size()); */
		// 이미지 명 삭제
		int result = service.deleteDeal(deal_pk);

		// 파일위치
		String realFolder = request.getSession().getServletContext().getRealPath("/resources/images/deal/");
		// deal Pk에 해당하는 이미지 파일명이 있다면
		if (result > 0) {
			for (String a : listImgName) {
				String deleteFile = realFolder + a;
				File file = new File(deleteFile);
				if (file.exists()) {

					file.delete();
				}
			}
		}

		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "거래글 삭제 성공";
		} else {
			msg = "거래글 삭제 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/deal/dealList.do");
		mv.setViewName("common/msg");

		return mv;

	}

	@RequestMapping("/deal/dealUpdate.do")
	public ModelAndView dealUpdate(int deal_pk) {
		ModelAndView mv = new ModelAndView();
		Deal deal = service.selectOne(deal_pk);
		mv.addObject("deal", deal);
		mv.setViewName("/deal/dealUpdate");

		return mv;
	}

	@RequestMapping("/deal/dealUpdateEnd.do")
	public ModelAndView dealUpdateEnd(String subject, String content, String deal_writer, int deal_pk, HttpServletRequest request) {
		/*
		 * //받아온 값 확인 System.out.println("제목 :"+subject);
		 * System.out.println("내용 : "+content);
		 */

		// 내용 잘라서 이미지 명 가져오기
		String cutting = content;

		// 이미지 명 받아오는 리스트
		List<String> imageList = new ArrayList<String>();

		// 이미지 명 잘라오는 로직
		while (cutting.contains("<img")) {
			int start = cutting.indexOf("src=");
			String checkSrc = cutting.substring(start + 5, start + 9);

			if (checkSrc.equals("http")) {
				// 인터넷 주소 가져온 이미지
				int startHttp = cutting.indexOf("src=");
				int endHttp = cutting.indexOf("\"", start + 5);
				String image = cutting.substring(startHttp + 5, endHttp);
				imageList.add(image);
				cutting = cutting.substring(endHttp);
			} else {

				int startUpload = cutting.indexOf("test/");
				/* System.out.println("테스트가 언제나오니"+startUpload); */
				int startUploadDeal = cutting.indexOf("deal/");
				/* System.out.println("딜이언제나오니"+startUploadDeal); */

				if (startUpload != -1 && (startUpload < startUploadDeal || startUploadDeal == -1)) {
					// 업로드한 이미지
					int endUpload = cutting.indexOf("&", start + 5);
					String image1 = cutting.substring(startUpload + 5, endUpload);
					/* System.out.println("추가할 이미지야 : "+image1); */
					imageList.add(image1);
					cutting = cutting.substring(endUpload);

				} else if (startUploadDeal != -1 && (startUpload > startUploadDeal || startUpload == -1)) {
					int endUploadDeal = cutting.indexOf("&", start + 5);
					String image1 = cutting.substring(startUploadDeal + 5, endUploadDeal);
					imageList.add(image1);
					/* System.out.println("원래 있던 이미지야 : "+image1); */
					cutting = cutting.substring(endUploadDeal);
				}
			}
		}

		// 이미지 명 확인하기
		/*
		 * for(String a: imageList) { System.out.println("이미지 명 : "+a); }
		 */

		// 저장되어 있던 이미지 명 가져오기
		List<DealImage> saveImage = service.selectDealImageList(deal_pk);
		/*
		 * for(DealImage a: saveImage) {
		 * System.out.println("이미지 명 저장저장 : "+a.getDeal_ori_img()); }
		 */

		// 딜 폴더에서 지울 파일
		List<String> deleteImage = new ArrayList<String>();

		// 지울 파일명 가져오기
		for (int i = 0; i < saveImage.size(); i++) {
			boolean check = imageList.contains(saveImage.get(i).getDeal_ori_img());
			if (!check) {
				deleteImage.add(saveImage.get(i).getDeal_ori_img());
			}
		}

		// 옮길 주소
		String realFolder = request.getSession().getServletContext().getRealPath("/resources/images/deal/");
		/* System.out.println("파일 경로오오오오오오오오오:" + realFolder); */

		// 원래주소
		String testFolder = request.getSession().getServletContext().getRealPath("/resources/images/test/");

		// 임시폴더 파일 가져오기(새로 입력되는 값)
		File file = new File(testFolder);
		File[] fileList = file.listFiles();

		File fileDeal = new File(realFolder);
		File[] fileDealList = fileDeal.listFiles();

		// 수정 이후 안쓰는 파일 삭제하기
		for (int i = 0; i < deleteImage.size(); i++) {
			/* System.out.println("지울 파일 입네다 지워주세요 : "+deleteImage.get(i)); */
			for (File a : fileDealList) {
				if (deleteImage.get(i).equals(a.getName())) {
					File fileDelete = new File(realFolder + a.getName());
					if (fileDelete.exists()) {
						fileDelete.delete();
					}
				}
			}
		}

		// submit 임시 폴더에 있던 파일 deal폴더로 이동시키기
		for (int i = 0; i < imageList.size(); i++) {
			for (File a : fileList) {
				if (imageList.get(i).equals(a.getName())) {

					File file1 = new File(testFolder + a.getName());

					File file2 = new File(realFolder + a.getName());

					if (file1.exists()) {
						file1.renameTo(file2);
					}
					if (!file2.exists()) {
						file2.mkdirs();
						/* System.out.println("파일생성 성공"); */
					}
				}
			}
		}

		// 디비 저장할때 불러올 위치 변경시켜주기
		String content1 = content.replace("/spring/resources/images/test/", "/spring/resources/images/deal/");

		/* System.out.println("내용 뽑아온거 확인하기"+content1); */
		// DB 업데이트 해주기
		int result = service.updateDeal(deal_pk, subject, content1, deal_writer, imageList);

		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "";
		if (result > 0) {
			msg = "게시글 작성 성공";
		} else {
			msg = "게시글 작성 실패";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", "/deal/dealList.do");
		mv.setViewName("common/msg");

		return mv;
	}

	@RequestMapping("/deal/dealSelect.do")
	public ModelAndView dealSelect(String selectOption, String searchOption,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {

		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		Map<String, String> search = new HashMap<String, String>();

		search.put("selectOption", selectOption);
		search.put("searchOption", searchOption);

		List<Deal> searchList = service.searchList(cPage, numPerPage, search);

		int totalCount = service.searchSelectCount(search);

		String pageBar = new PageCreate().getPageBar(cPage, numPerPage, totalCount, "dealSelect.do?selectOption=" + selectOption + "&searchOption=" + searchOption);

		System.out.println(pageBar);

		mv.addObject("pageBar", pageBar);
		mv.addObject("list", searchList);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("deal/dealSelect");

		return mv;
	}

}