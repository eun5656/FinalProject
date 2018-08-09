package com.kh.spring.storeReview.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.store.controller.StoreController;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.storeReview.model.service.StoreReviewService;
import com.kh.spring.storeReview.model.vo.StoreReview;

@Controller
public class StoreReviewController {

	@Autowired
	private StoreReviewService reviewService;
	
	@Autowired
	private StoreService storeService;

	@Autowired
	private NailService nailService;
	private Logger logger = Logger.getLogger(StoreController.class);


	@RequestMapping("/storeReview/storeReviewList.do")
	public String storeReviewList(int store_pk, Model model) {
		List<StoreReview>reviews=reviewService.storeReviewList(store_pk);
		return null;
	}
	
	@RequestMapping(value="/storeReview/storeReviewInsert.do",produces = "application/text; charset=utf8",method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String storeReviewInsert(MultipartHttpServletRequest req, HttpServletRequest request)throws JsonProcessingException
	{
		
		
		
			Iterator<String> itr =  req.getFileNames();

		  MultipartFile files = req.getFile(itr.next());
		  System.out.println(files);
		return null;



			
		
		/*ObjectMapper mapper=new ObjectMapper();		
		String jsonstr="";
		String newFileName = null;
		String fileName = null;
		Map shopList=new HashMap();
		Iterator<String> files = multi.getFileNames();
        while(files.hasNext()){
            String uploadFile = files.next();
                         
            MultipartFile mFile = multi.getFile(uploadFile);
             fileName = mFile.getOriginalFilename();
            System.out.println("실제 파일 이름 : " +fileName);
            newFileName = System.currentTimeMillis()+"."
                    +fileName.substring(fileName.lastIndexOf(".")+1);
             
           try {
                mFile.transferTo(new File(path+newFileName));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println(fileName);
        System.out.println(newFileName);/



		jsonstr=mapper.writeValueAsString(shopList);
		return jsonstr;*/
	}

}
