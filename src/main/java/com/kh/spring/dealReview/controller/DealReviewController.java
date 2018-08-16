
package com.kh.spring.dealReview.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.dealReview.model.service.DealReviewService;
import com.kh.spring.dealReview.model.vo.DealReview;



@Controller
public class DealReviewController {

	
	@Autowired
	private DealReviewService service;
	
	
	@RequestMapping("/dealReview/dealReviewList.do")
	public String dealReviewList(int deal_pk,Model model) {
		List<DealReview> dealreviews = service.dealReviewList(deal_pk);
		return null;
	}
	
	
	@RequestMapping(value = "/dealReview/dealReviewInsert.do", method = RequestMethod.POST, consumes = {
	"multipart/form-data" }, produces = { "application/text; charset=utf8" })
	@ResponseBody
	public String dealReviewInsert( 
   	String member_pk, 
	String deal_pk, 
	String deal_review_pk,
	String deal_review_level, 
	String deal_review_date,
	String deal_review_content,
	String deal_review_writer,
	MultipartFile deal_review_ori_img, HttpServletRequest request)
	throws JsonProcessingException {
		

		String renamedFileName = null;
		String originalFileName = null;
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/dealReview");

		File dir = new File(saveDir);
		if (dir.exists() == false)
				System.out.println(dir.mkdirs());//占쎈솁占쎌뵬占쎄문占쎄쉐

		if (!deal_review_ori_img.isEmpty()) {
			originalFileName = deal_review_ori_img.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int) (Math.random() * 1000);
			renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName += "_" + rndNum + "." + ext;
			try {
				deal_review_ori_img.transferTo(new File(saveDir + File.separator + renamedFileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

			DealReview deal_review = new DealReview();
				System.out.println("dealPK"+deal_pk);
				deal_review.setMember_pk(Integer.parseInt(parsing(member_pk)));
				deal_review.setDeal_pk(Integer.parseInt(parsing(deal_pk)));                   
				deal_review.setDeal_review_level(Integer.parseInt(parsing(deal_review_level)));
				deal_review.setDeal_review_date(parsing(deal_review_date));
				deal_review.setDeal_review_content(parsing(deal_review_content));
				deal_review.setDeal_review_writer(parsing(deal_review_writer));
				deal_review.setDeal_review_ori_img(originalFileName);
				deal_review.setDeal_review_re_img(renamedFileName);

				int result = service.dealReviewInsert(deal_review);
				System.out.println("占쎈툧占쎈�욑옙釉�占쎄쉭占쎌뒄 占쎈┷占쎌뵬�넫占� "+result);
				//selectKey 
				ObjectMapper mapper = new ObjectMapper();
				String jsonstr = "";

				Map map = new HashMap();
				map.put("dealreview_value", deal_review);
				jsonstr = mapper.writeValueAsString(map); 
				return jsonstr;

}

	
		//�궘�젣 
		@RequestMapping(value = "/dealReview/dealReviewDelete.do", produces = "application/text; charset=utf8")
			@ResponseBody
			public String dealReviewDelete(@RequestParam(value = "deal_review_pk") String deal_review_pk,
			HttpServletRequest request)
			throws JsonProcessingException {
			
			int result =0;
			String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/dealReview");
			System.out.println(Integer.parseInt(deal_review_pk));
			
			
			String fileName=service.selectReImg(Integer.parseInt(deal_review_pk));
			
			
			
			System.out.println(fileName);
			boolean flag=false;
			if(fileName!=null && fileName.length()>0) {
				File deleteFile=new File(saveDir+"/"+fileName);
				flag=deleteFile.delete();
				
			}
			result= service.dealReviewDelete(Integer.parseInt(deal_review_pk));

			if(result>0){
				flag=true;
			}
			String msg="댓글 삭제 실패";	
			if(result>0&&flag){
				msg="댓글 삭제 성공";
			}

			ObjectMapper mapper = new ObjectMapper();
			String jsonstr = "";
			jsonstr = mapper.writeValueAsString(msg); 
			return jsonstr;
		}


			@RequestMapping(value = "/dealReview/dealReviewReplyInsert.do", method = RequestMethod.POST, produces = {
				"application/text; charset=utf8" })
			@ResponseBody
			public String dealReviewReplyInsert(String member_pk, 
							   	String deal_review_writer, 
								String deal_pk, 
								String deal_review_pk,
								String deal_review_level, 
								String deal_review_content, HttpServletRequest request) throws JsonProcessingException {
				DealReview deal_review = new DealReview();
				deal_review.setDeal_review_pk(Integer.parseInt(deal_review_pk));
				deal_review.setMember_pk(Integer.parseInt(member_pk));
				deal_review.setDeal_pk(Integer.parseInt(deal_pk));
				deal_review.setDeal_review_level(Integer.parseInt(deal_review_level));
				deal_review.setDeal_review_content(deal_review_content);
				deal_review.setDeal_review_writer(deal_review_writer);
				System.out.println(deal_review);

				int result = service.dealReviewReplyInsert(deal_review);
				System.out.println(result);

				ObjectMapper mapper = new ObjectMapper();
				String jsonstr = "";

				Map map = new HashMap();
				map.put("dealreview_value", deal_review);
				jsonstr = mapper.writeValueAsString(map); 

				return jsonstr;

			}


			private static String parsing(String value) {

				int idx = value.indexOf(",");
				String temp = value.substring(0, idx);
				System.out.println(temp);

				return temp;
			}
}
