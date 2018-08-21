package com.kh.spring.store.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.spring.designer.model.service.designerService;
import com.kh.spring.designer.model.vo.designer;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.nail.model.service.NailService;
import com.kh.spring.nail.model.vo.Nail;
import com.kh.spring.store.model.service.StoreService;
import com.kh.spring.store.model.vo.Menu;
import com.kh.spring.store.model.vo.Store;
import com.kh.spring.store.model.vo.Store_time;
import com.kh.spring.storeReview.model.service.StoreReviewService;
import com.kh.spring.storeReview.model.vo.StoreReview;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;



@SessionAttributes(value= {"memberLoggedIn"})
@Controller
public class StoreManageController {
private Logger logger = Logger.getLogger(StoreController.class);
	
	@Autowired
	private designerService designerservice;

	@Autowired
	private NailService Nailservice;

	@Autowired 
	private StoreService service;
	
	@Autowired
	private StoreReviewService reviewService;
	
	@RequestMapping("/store/storeManage.do")
	public String store(
			HttpServletRequest req, Model model,HttpSession session
			) {
		String view="store/storeManage";
		int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
	
		Store store = service.selectOne(member_pk);
		Store_time st = service.selectTime(store.getStore_pk());
		st = st.deleteDate(st);
		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());
		List<StoreReview>reviews=reviewService.storeReviewList(store.getStore_pk());
		System.out.println("메뉴 값 확인 : "+ menus);
		System.out.println("스토어 값 확인 : "+store);
		System.out.println("Nail 값 확인 : "+nails);
		System.out.println("시간 확인  : "+ st);
		System.out.println(reviews.get(1));
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		model.addAttribute("reviews",reviews);
		model.addAttribute("store_time", st);
		List<designer> designers = designerservice.selectdesigner(store.getStore_pk());
		model.addAttribute("designers",designers);
		System.out.println("designer확인 : "+ designers);
		return view;
	}
	
	@RequestMapping("/store/storeManageSales.do")
	public String storeManageSale(
			HttpServletRequest req, Model model, HttpSession session
			) {
		String view="store/storeManageSales";	
		int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
	
		Store store = service.selectOne(member_pk);
		

		System.out.println();
		System.out.println("스토어 값 확인 : "+store);
	
		
		model.addAttribute("store",store);
		return view;
	}
	@RequestMapping("/store/storeManageReserve.do")
	public String storeManageReserve(
			HttpServletRequest req, Model model,HttpSession session
			) {
		String view="store/storeManageReserve";
		int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
		
		Store store = service.selectOne(member_pk);
		
//		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());

		
		
	
		System.out.println("스토어 값 확인 : "+store);
		
		model.addAttribute("store",store);
		
		return view;
	}
	
	@RequestMapping("/store/storeManage/menuInsert.do")
	public String menuInsert(Menu menu, HttpServletRequest req,Model model) {
		System.out.println("메뉴 삽입 접근완료" + menu);
		int result = service.insertMenu(menu);
		if(result>0) {
			System.out.println("삽입 완료");
		}else {
			System.out.println("인서트 실패");
		}
		logger.debug(menu);//입력값 확인
		
		Store store = service.selectOne(menu.getStore_pk());
		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());
		model.addAttribute("store", store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		List<StoreReview>reviews=reviewService.storeReviewList(store.getStore_pk());
		Store_time st = service.selectTime(store.getStore_pk());
		st = st.deleteDate(st);
		model.addAttribute("reviews",reviews);
		model.addAttribute("store_time",st);
		List<designer> designers = designerservice.selectdesigner(store.getStore_pk());
		model.addAttribute("designers",designers);
		return "/store/storeManage";
	}
	
	@RequestMapping("/store/storeManage/menuDelete.do")
	@ResponseBody
	public String menuDelete(HttpServletRequest req,
			@RequestParam String menu_pk
			) throws JsonProcessingException {
		System.out.println("메뉴 삭제 접근완료");
		System.out.println("menu_Pk = " + menu_pk);
		HashMap<String, String> map=new HashMap<String, String>(); 
		map.put("menu_pk", menu_pk);
		ObjectMapper mapper=new ObjectMapper();		
		String jsonstr=mapper.writeValueAsString(map);
		
		int result = service.deleteMenu(menu_pk);
		System.out.println("삭제된 메뉴pk" + menu_pk);
		return jsonstr;
	}

	@RequestMapping(value =  "/store/storeManage/menuUpdate.do",  produces = { "application/text; charset=utf8" })
	@ResponseBody
	public String menuUpdate(HttpServletRequest req,
			Menu menu
			) throws JsonProcessingException {
		System.out.println("메뉴 수정 접근완료");
		System.out.println(menu);
		int result = service.menuUpdate(menu);
		logger.debug("menuUpdate 확인~ : "+result);
		JSONObject json=JSONObject.fromObject(JSONSerializer.toJSON(menu));
		String jsonstr= json.toString();
		logger.debug("jsonstr 확인~ : "+jsonstr);


		return jsonstr;
	}
	@RequestMapping(value="/store/storeManage/nailInsert.do", method = RequestMethod.POST, consumes = {
	"multipart/form-data" }, produces = {"application/text; charset=utf8"})	
	public String nailInsert(Nail nail,
						@RequestParam("input-file-preview") MultipartFile img,
						HttpSession session,
						Model model
			){
		System.out.println(nail);
		System.out.println(img);
		String renamedFileName = null;
		String originalFileName = null;
		String saveDir = session.getServletContext().getRealPath("/resources/images/nails");
		
		File dir = new File(saveDir);
		if (dir.exists() == false)
			System.out.println(dir.mkdirs());// 폴더생성
		if (!img.isEmpty()) {
			originalFileName = img.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int) (Math.random() * 1000);
			renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName += "_" + rndNum + "." + ext;
			try {
				img.transferTo(new File(saveDir + File.separator + renamedFileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			nail.setNail_ori_img(originalFileName);
			nail.setNail_re_img(renamedFileName);
//			이미지 존재시에 오리지널 네임 만들어줌
			
		}
		if(nail.getNail_pk()==0) {
		int result = Nailservice.insertNail(nail);
		if(result>0) {
			System.out.println("Insert 입력 성공"+nail);
		}
		
		}
		int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
		
		Store store = service.selectOne(member_pk);
		
		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());
		List<StoreReview>reviews=reviewService.storeReviewList(store.getStore_pk());
		
		System.out.println("메뉴 값 확인 : "+ menus);
		System.out.println("스토어 값 확인 : "+store);
		System.out.println("Nail 값 확인 : "+nails);
		System.out.println(reviews.get(1));
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		model.addAttribute("reviews",reviews);
		Store_time st = service.selectTime(store.getStore_pk());
		st = st.deleteDate(st);
		model.addAttribute("store_time",st);
		List<designer> designers = designerservice.selectdesigner(store.getStore_pk());
		model.addAttribute("designers",designers);
		return "/store/storeManage";
	}
	@RequestMapping(value="/store/storeManage/nailUpdate.do", method = RequestMethod.POST, consumes = {
	"multipart/form-data" }, produces = {"application/text; charset=utf8"})	
	public String nailUpdate(Nail nail,
						@RequestParam("input-file-preview") MultipartFile img,
						HttpSession session,
						Model model,
						@RequestParam("oldImage") String oldImage
			){
		System.out.println(nail);
		System.out.println(img);
		String renamedFileName = null;
		String originalFileName = null;
		String saveDir = session.getServletContext().getRealPath("/resources/images/nails");
		
		File dir = new File(saveDir);
		if (dir.exists() == false)
			System.out.println(dir.mkdirs());// 폴더생성
		if (!img.isEmpty()) {
			//기존 파일 삭제 
			System.out.println("이미지 변경");
			  File file = new File(saveDir+File.separator+oldImage);
		         
		        if(file.exists()){
		            if(file.delete()){
		                System.out.println("파일삭제 성공");
		            }else{
		                System.out.println("파일삭제 실패");
		            }
		        }else{
		            System.out.println("파일이 존재하지 않습니다.");
		        }
			originalFileName = img.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int) (Math.random() * 1000);
			renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName += "_" + rndNum + "." + ext;
			try {
				img.transferTo(new File(saveDir + File.separator + renamedFileName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			nail.setNail_ori_img(originalFileName);
			nail.setNail_re_img(renamedFileName);
			System.out.println("이미지 삽입 확인" + nail);
//			이미지 존재시에 오리지널 네임 만들어줌
			}
		else {
			Nail temp= Nailservice.selectNailOne(nail.getNail_pk());
			System.out.println("select nail 값 확인" +  temp);
			nail.setNail_ori_img(temp.getNail_ori_img());
			nail.setNail_re_img(temp.getNail_re_img());
		}
		int result = Nailservice.updateNail(nail);
		if(result>0) {
			System.out.println("Update 입력 성공"+nail);
		}
		
		int member_pk = ((Member)session.getAttribute("memberLoggedIn")).getMemberPk();
		
		Store store = service.selectOne(member_pk);
		
		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());
		
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		List<StoreReview>reviews=reviewService.storeReviewList(store.getStore_pk());
		Store_time st = service.selectTime(store.getStore_pk());
		model.addAttribute("reviews",reviews);
		st = st.deleteDate(st);
		model.addAttribute("store_time",st);
		List<designer> designers = designerservice.selectdesigner(store.getStore_pk());
		model.addAttribute("designers",designers);
		return "/store/storeManage";
		}


	@RequestMapping(value =  "/store/storeManage/nailDelete.do")
	@ResponseBody
	public String nailDelete(HttpServletRequest req,
			@RequestParam String nail_pk
			) throws JsonProcessingException {
		System.out.println("네일 삭제 접근완료");
		System.out.println(nail_pk);
		int result = Nailservice.nailDelete(nail_pk);
		HashMap<String, String> map=new HashMap<String, String>(); 
		map.put("nail_pk", nail_pk);
		ObjectMapper mapper=new ObjectMapper();		
		String jsonstr=mapper.writeValueAsString(map);
		logger.debug("jsonstr 확인~ : "+jsonstr);


		return jsonstr;
	}
	@RequestMapping(value =  "/store/storeManage/storeUpdate.do")
	public String nailDelete(Model model,
			Store store,	
			@RequestParam("input-file-preview") MultipartFile img, HttpSession session
			, String StoreOldImg) {
		
	String renamedFileName = null;
	String originalFileName = null;
	String saveDir = session.getServletContext().getRealPath("/resources/images/");
	if (!img.isEmpty()) {
		//기존 파일 삭제 

		  File file = new File(saveDir+File.separator+StoreOldImg);
	         
	        if( file.exists() ){
	            if(file.delete()){
	                System.out.println("파일삭제 성공");
	            }else{
	                System.out.println("파일삭제 실패");
	            }
	        }else{
	            System.out.println("파일이 존재하지 않습니다.");
	        }
		originalFileName = img.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
		int rndNum = (int) (Math.random() * 1000);
		renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
		renamedFileName += "_" + rndNum + "." + ext;
		try {
			img.transferTo(new File(saveDir + File.separator + renamedFileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		store.setStore_ori_img(originalFileName);
		store.setStore_re_img(renamedFileName);
		System.out.println("이미지 삽입 확인" + store);
//		이미지 존재시에 오리지널 네임 만들어줌
		}
		int result = service.updateStore(store);
		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());
		List<StoreReview>reviews=reviewService.storeReviewList(store.getStore_pk());
		Store_time st = service.selectTime(store.getStore_pk());
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		model.addAttribute("reviews",reviews);
		st = st.deleteDate(st);
		model.addAttribute("store_time",st);
		List<designer> designers = designerservice.selectdesigner(store.getStore_pk());
		model.addAttribute("designers",designers);
		return "/store/storeManage";
	}
	@RequestMapping(value="/store/storeManage/store_timeUpdate.do")
	public String store_time_update(Store_time store_time,Model model,String store_pko) {
		//		JSONObject json=JSONObject.fromObject(JSONSerializer.toJSON(store_time));
//		String jsonstr= json.toString();
//		logger.debug("jsonstr 확인~ : "+jsonstr);
		int store_pk = Integer.parseInt(store_pko);
		store_time.setStore_pk(store_pk);
		store_time =store_time.addDate(store_time);
		int result = service.updateStore_time(store_time);
		Store store = service.selectOne(store_pk);
		Store_time st = service.selectTime(store_pk);
		st = st.deleteDate(st);
		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<Menu> menus = service.selectMenu(store.getStore_pk());
		List<StoreReview>reviews=reviewService.storeReviewList(store.getStore_pk());
		model.addAttribute("store",store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		model.addAttribute("reviews",reviews);
		model.addAttribute("store_time",st);
		List<designer> designers = designerservice.selectdesigner(store.getStore_pk());
		model.addAttribute("designers",designers);
		return "/store/storeManage";
	}
	@RequestMapping("/store/storeManage/designerDelete.do")
	@ResponseBody
	public String designerDelete(HttpServletRequest req,
			@RequestParam String designer_pk
			) throws JsonProcessingException {
		System.out.println("디자이너 삭제 접근완료");
		System.out.println("designer_Pk = " + designer_pk);
		HashMap<String, String> map=new HashMap<String, String>(); 
		map.put("designer_pk", designer_pk);
		ObjectMapper mapper=new ObjectMapper();		
		String jsonstr=mapper.writeValueAsString(map);
		
		int result = designerservice.deletedesigner(designer_pk);
		System.out.println("삭제된 메뉴pk" + designer_pk);
		return jsonstr;
	}

	@RequestMapping(value =  "/store/storeManage/designerUpdate.do",  produces = { "application/text; charset=utf8" })
	@ResponseBody
	public String designerUpdate(HttpServletRequest req,
			designer designer
			) throws JsonProcessingException {
		System.out.println("디자이너 수정 접근완료");
		System.out.println(designer);
		int result = designerservice.designerUpdate(designer);
		logger.debug("designerUpdate 확인~ : "+result);
		JSONObject json=JSONObject.fromObject(JSONSerializer.toJSON(designer));
		String jsonstr= json.toString();
		logger.debug("jsonstr 확인~ : "+jsonstr);


		return jsonstr;
	}
	@RequestMapping("/store/storeManage/designerInsert.do")
	public String designerInsert(designer designer, HttpServletRequest req,Model model) {
		Store store = service.selectOne(designer.getStore_pk());
		List<designer> designersCheck = designerservice.selectdesigner(store.getStore_pk());
		int size = designersCheck.size();
		System.out.println("디자이너 삽입 접근완료" + designer);
		System.out.println(size+"디자이너 크기 확인");
		System.out.println(designersCheck.toString());
//디자이너 아이디 검증
		if(size==0) {
			designer.setDesigner_id("a");
			int result = designerservice.insertdesigner(designer);
		}
		else if(size==1) {
			if(designersCheck.get(0).getDesigner_id().equals("a"))					
			{designer.setDesigner_id("b");			
			}
			else if(designersCheck.get(0).getDesigner_id().equals("b"))					
			{designer.setDesigner_id("a");}
			else if(designersCheck.get(0).getDesigner_id().equals("c"))
			{designer.setDesigner_id("a");}
			int result = designerservice.insertdesigner(designer);
		}else if(size==2) {
			if(designersCheck.get(0).getDesigner_id().equals("a") && designersCheck.get(1).getDesigner_id().equals("b")) {
				designer.setDesigner_id("c");}
			else if(designersCheck.get(0).getDesigner_id().equals("b")&&designersCheck.get(1).getDesigner_id().equals("a")) {
				designer.setDesigner_id("c");}
			else if(designersCheck.get(0).getDesigner_id().equals("c")&&designersCheck.get(1).getDesigner_id().equals("a")) {
				designer.setDesigner_id("b");}
			else if(designersCheck.get(0).getDesigner_id().equals("a")&&designersCheck.get(1).getDesigner_id().equals("c")) {
				designer.setDesigner_id("b");}
			else {
				designer.setDesigner_id("a");
			}
			int result = designerservice.insertdesigner(designer);
		}else {
			System.out.println("3명 초과");
		}
		logger.debug(designer);//입력값 확인
		
		List<Nail> nails= Nailservice.nailListStore(store.getStore_pk());
		List<designer> designers = designerservice.selectdesigner(store.getStore_pk());
		model.addAttribute("designers",designers);
		List<Menu> menus = service.selectMenu(store.getStore_pk());
		model.addAttribute("store", store);
		model.addAttribute("menus",menus);
		model.addAttribute("nails",nails);
		List<StoreReview>reviews=reviewService.storeReviewList(store.getStore_pk());
		Store_time st = service.selectTime(store.getStore_pk());
		st = st.deleteDate(st);
		model.addAttribute("reviews",reviews);
		model.addAttribute("store_time",st);
		return "/store/storeManage";
	}
}
