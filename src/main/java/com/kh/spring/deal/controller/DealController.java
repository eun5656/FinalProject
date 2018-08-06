package com.kh.spring.deal.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
import com.kh.spring.deal.model.service.DealService;
import com.kh.spring.deal.model.vo.Deal;
import com.kh.spring.deal.model.vo.DealImage;

@Controller
public class DealController {
	
	@Autowired
	private DealService service;
	
	
	@RequestMapping("/deal/dealList.do")
	public ModelAndView dealList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage){
		
		ModelAndView mv=new ModelAndView();
		int numPerPage=10;
		
		List<Deal> list=service.selectDealList(cPage,numPerPage);
		
		
		int totalCount=service.selectCount();

		
		String pageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount,"/deal/dealList.do");
		
		
		mv.addObject("pageBar", pageBar);
		mv.addObject("list",list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("/deal/dealList");
		
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
	public void profileUpload( MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String realFolder=request.getSession().getServletContext().getRealPath("/resources/images/test/");
		//String realFolder ="C:\\Users\\hong\\Desktop\\파이널플젝\\파이널 플젝\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalProject\\resources\\images\\test\\"; 
		//String realFolder = request.getSession().getServletContext().getRealPath("upload");
		UUID uuid = UUID.randomUUID();

	
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본명 : " + org_filename);
		System.out.println("이름 재설정 : " + str_filename);
		String filepath = realFolder + str_filename;
		//String filepath = "C:\\ExpertJava\\FinalProject1234\\src\\main\\webapp\\resources\\images\\deal\\"  + str_filename;
		//String filepath = realFolder + File.separator  + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
		f.mkdirs();
		}
		
		file.transferTo(f);
	      out.println(str_filename);
	      out.close();
	}
	
	
	
	
	@RequestMapping("/deal/dealWriteEnd.do")
	public ModelAndView dealWriteEnd(String subject, String content,String dealWriter, HttpServletRequest request) {
		
		//받아온 값 확인
		System.out.println("제목 :"+subject);
		System.out.println("내용 : "+content);
		
		String cutting=content;
		List<String> imageList=new ArrayList<String>();
		
		while(cutting.contains("<img")){
			int start=cutting.indexOf("src=");
			String checkSrc = cutting.substring(start+5, start+9);
			if(checkSrc.equals("http")) {
				//인터넷 주소 가져온 이미지
				int startHttp=cutting.indexOf("src=");
				int endHttp=cutting.indexOf("\"",start+5);
				String image = cutting.substring(startHttp+5, endHttp);
				imageList.add(image);
				cutting=cutting.substring(endHttp);
			}else {
				//업로드한 이미지
				int startUpload=cutting.indexOf("test/");
				int endUpload=cutting.indexOf("&",start+5);
				String image1 = cutting.substring(startUpload+5, endUpload);
				imageList.add(image1);
				cutting=cutting.substring(endUpload);
			}	
		}
		
		
		for(String a: imageList) {
			System.out.println("이미지 명 : "+a);
		}
	
		//옮길 주소
		String realFolder=request.getSession().getServletContext().getRealPath("/resources/images/deal/");
		//String realFolder ="C:\\Users\\hong\\Desktop\\파이널플젝\\파이널 플젝\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalProject\\resources\\images\\deal\\";
		
		//원래주소
		String testFolder=request.getSession().getServletContext().getRealPath("/resources/images/test/");
		//String testFolder="C:\\Users\\hong\\Desktop\\파이널플젝\\파이널 플젝\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalProject\\resources\\images\\test\\";
		
		//원래 주소의 파일명 가져오기
		//File file= new File("C:\\Users\\hong\\Desktop\\파이널플젝\\파이널 플젝\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FinalProject\\resources\\images\\test\\");
		File file= new File(testFolder);
		File[] fileList=file.listFiles();

		
		for(int i=0;i<imageList.size();i++) {
			for(File a: fileList) {
				if(imageList.get(i).equals(a.getName())) {
				
				 File file1=new File(testFolder+a.getName());
				 File file2=new File(realFolder+a.getName());
				 if(file2.exists()) {
					 file2.mkdirs();
				 }
				 
				 if(file1.exists()) {
					 file1.renameTo(file2);
					 System.out.println("파일 옮기기 성공");
				 }
			}
		}
		}
		
		

		//예시
		String content1=content.replace("/spring/resources/images/test/", "/spring/resources/images/deal/");
		
		int result=service.insertDeal(subject,content1,dealWriter,imageList);
		System.out.println("딜 번호 : "+ result);
		
		ModelAndView mv= new ModelAndView();
		String msg="";
		String loc="";
		if(result>0) {
			msg="게시글 작성 성공";
		}else {
			msg="게시글 작성 실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/deal/dealList.do" );
		mv.setViewName("common/msg");

		return mv;
	}
	
	@RequestMapping("/deal/dealView.do")
	public ModelAndView dealView(int dealPk) {
		ModelAndView mv=new ModelAndView();
		
		
		
		Deal deal=service.selectOne(dealPk);
		
		mv.addObject("deal", deal);
		mv.setViewName("/deal/dealView");
		
		return mv;
		
	}
	
	
	
	
	@RequestMapping("/deal/dealDelete.do")
	public ModelAndView dealDelete(int dealPk, HttpServletRequest request) {
		ModelAndView mv= new ModelAndView();
		
		
		
		
		List<DealImage> list=service.dealImageList(dealPk);
		System.out.println("사이즈가 뭐니"+list.size());
		//이미지 이름 저장 리스트
		List<String> listImgName=new ArrayList<String>();
		
		
		for(DealImage a: list) {
			listImgName.add(a.getDealOriImg());
			System.out.println(a.getDealOriImg());
		}
		System.out.println("나오니 사이즈가 뭐니"+listImgName.size());
		//이미지 명 삭제
		int result=service.deleteDeal(dealPk);
		
		//파일위치
		String realFolder=request.getSession().getServletContext().getRealPath("/resources/images/deal/");
		//deal Pk에 해당하는 이미지 파일명이 있다면 
		if(result>0) {
			for(String a: listImgName) {
				String deleteFile=realFolder+a;
				File file= new File(deleteFile);
				if(file.exists()) {
					
					file.delete();
				}	
			}
		}
		
		
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="거래글 삭제 성공";
		}else {
			msg="거래글 삭제 실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc","/deal/dealList.do" );
		mv.setViewName("common/msg");

		return mv;
		
	}
}
