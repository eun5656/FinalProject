package com.kh.spring.storeReview.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
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
import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.store.controller.StoreController;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.storeReview.model.service.StoreReviewService;
import com.kh.spring.storeReview.model.vo.StoreReview;


@Controller
public class StoreReviewController {
	
	@Autowired
	private StoreService storeService;

	@Autowired
	private StoreReviewService reviewService;

	@Autowired
	private NailService nailService;
	private Logger logger = Logger.getLogger(StoreController.class);

	@RequestMapping("/storeReview/storeReviewList.do")
	public String storeReviewList(int store_pk, Model model) {
		List<StoreReview> reviews = reviewService.storeReviewList(store_pk);
		return null;
	}

	@RequestMapping(value = "/storeReview/storeReviewInsert.do", method = RequestMethod.POST, consumes = {
			"multipart/form-data" }, produces = { "application/text; charset=utf8" })
	@ResponseBody
	public String storeReviewInsert( 
		   	String member_pk, 
			String store_pk, 
			String review_pk,
			String review_level, 
			String review_date,
			String review_content,
			String review_writer,
			@RequestParam(value ="review_star",required=false,defaultValue="0") String review_star,
			
			MultipartFile review_ori_img, HttpServletRequest request)
			throws JsonProcessingException {

		String renamedFileName = null;
		String originalFileName = null;
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/storeReview");

		File dir = new File(saveDir);
		if (dir.exists() == false)
			System.out.println(dir.mkdirs());// 폴더생성

		if (!review_ori_img.isEmpty()) {
			originalFileName = review_ori_img.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int) (Math.random() * 1000);
			renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName += "_" + rndNum + "." + ext;
			try {
				review_ori_img.transferTo(new File(saveDir + File.separator + renamedFileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		StoreReview store_review = new StoreReview();
		System.out.println("storePK"+store_pk);
		store_review.setMember_pk(Integer.parseInt(parsing(member_pk)));
		store_review.setStore_pk(Integer.parseInt(parsing(store_pk)));
		store_review.setReview_level(Integer.parseInt(parsing(review_level)));
		store_review.setReview_date(parsing(review_date));
		store_review.setReview_content(parsing(review_content));
		store_review.setReview_writer(parsing(review_writer));
		store_review.setReview_star(Integer.parseInt(parsing(review_star)));
		store_review.setReview_ori_img(originalFileName);
		store_review.setReview_re_img(renamedFileName);
		System.out.println("ori"+originalFileName);
		System.out.println("reviewStar"+review_star);
		int result = reviewService.storeReviewInsert(store_review);
		
		Map updateStar=new HashMap();
		updateStar.put("store_pk", Integer.parseInt(parsing(store_pk)));
		updateStar.put("review_star", Integer.parseInt(parsing(review_star)));
		System.out.println(updateStar);
		result=storeService.storeStarUpdate(updateStar);
		
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonstr = "";

		Map map = new HashMap();
		map.put("review_value", store_review);
		jsonstr = mapper.writeValueAsString(map); // javaScrpit객체로 쏴준다.
		return jsonstr;

	}

	@RequestMapping(value = "/storeReview/storeReviewDelete.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String storeReviewDelete(@RequestParam(value = "review_pk") String review_pk,
												HttpServletRequest request)
			throws JsonProcessingException {
		
		int result =0;
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/storeReview");
		System.out.println(Integer.parseInt(review_pk));
		String fileName=reviewService.selectReImg(Integer.parseInt(review_pk));
		System.out.println(fileName);
		boolean flag=false;
		if(fileName!=null && fileName.length()>0) {
			File deleteFile=new File(saveDir+"/"+fileName);
			flag=deleteFile.delete();
		}
		result= reviewService.storeReviewDelete(Integer.parseInt(review_pk));
		
		if(result>0){
			flag=true;
		}
		String msg="삭제실패";	
		if(result>0||flag){
			msg="삭제성공";
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonstr = "";
		jsonstr = mapper.writeValueAsString(msg); // javaScrpit객체로 쏴준다.
		return jsonstr;
	}


	@RequestMapping(value = "/storeReview/storeReviewReplyInsert.do", method = RequestMethod.POST, produces = {
			"application/text; charset=utf8" })
	@ResponseBody
	public String storeReviewReplyInsert(String member_pk, 
									   	String review_writer, 
										String store_pk, 
										String review_pk,
										String review_level, 
										String review_content, HttpServletRequest request) throws JsonProcessingException {
		StoreReview store_review = new StoreReview();
		store_review.setReview_pk(Integer.parseInt(review_pk));
		store_review.setMember_pk(Integer.parseInt(member_pk));
		store_review.setStore_pk(Integer.parseInt(store_pk));
		store_review.setReview_level(Integer.parseInt(review_level));
		store_review.setReview_content(review_content);
		store_review.setReview_writer(review_writer);
		System.out.println(store_review);
		
		int result = reviewService.storeReviewReplyInsert(store_review);
		System.out.println(result);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonstr = "";

		Map map = new HashMap();
		map.put("review_value", store_review);
		jsonstr = mapper.writeValueAsString(map); // javaScrpit객체로 쏴준다.
		
		return jsonstr;

	}
	

	private static String parsing(String value) {

		int idx = value.indexOf(",");
		String temp = value.substring(0, idx);
		System.out.println(temp);

		return temp;
	}

}
