package com.kh.spring.message.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.kh.spring.common.page.PageCreate;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.message.model.service.MessageService;
import com.kh.spring.message.model.vo.Message;

@SessionAttributes(value={"memberLoggedIn"})
@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;
	
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/message/sendMessage.do")
	public String SendMessage() {
		return "message/sendForm";
	}

	
	@RequestMapping("/message/receiveMessage.do")
	public ModelAndView ReceiveMessage(String send_user,@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,HttpSession session) {
	
		ModelAndView mv = new ModelAndView();
		
		 int numPerPage=10;

		List<Message> messageList = messageService.selectList(send_user,cPage,numPerPage);
		
		int totalCount=messageService.selectCount(send_user);
		
		String pageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount,"receiveMessage.do?send_user="+((Member)session.getAttribute("memberLoggedIn")).getMemberId());
	      
		mv.addObject("pageBar", pageBar);
		mv.addObject("messageList", messageList);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);

		mv.setViewName("message/receiveForm1");
		
		return mv;
	}
	
	@RequestMapping("/message/receiveMessage2.do")
	public ModelAndView ReceiveMessage2(String receive_user,@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		int numPerPage=10;
		
		List<Message> messageList2 = messageService.selectList2(receive_user,cPage,numPerPage);
		
		int totalCount=messageService.selectCount2(receive_user);
		
		String pageBar=new PageCreate().getPageBar(cPage,numPerPage,totalCount,"receiveMessage2.do?receive_user="+((Member)session.getAttribute("memberLoggedIn")).getMemberId());
	      
		mv.addObject("pageBar", pageBar);
		mv.addObject("messageList2", messageList2);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("message/receiveForm2");
		
		return mv;
	}
	
	@RequestMapping("/message/sendMessageEnd.do")
	public ModelAndView sendMessageEnd(int member_pk,String send_user,String receive_user, String send_content,HttpServletRequest req,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map=new HashMap();
		
		map.put("member_pk", member_pk);
		map.put("send_user", send_user);
		map.put("receive_user", receive_user);
		map.put("send_content", send_content);
		
		int result=messageService.insertMsg(map);
		
		String msg="";
        String loc="";
        if(result>0) {
           msg="쪽지보내기 성공";
        }else {
           msg="쪽지보내기 실패";
        }
        mv.addObject("msg",msg);
        mv.addObject("loc","/message/receiveMessage.do?send_user="+((Member)session.getAttribute("memberLoggedIn")).getMemberId());
        mv.setViewName("common/msg");

        return mv;
		
	}
	
	@RequestMapping("/member/checkId.do")
	public ModelAndView CheckId(String receive_user,ModelAndView mv) throws UnsupportedEncodingException {
		
		boolean check = messageService.CheckId(receive_user)==0?true:false;
		
		Map map = new HashMap();
		
		map.put("check", check);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	@RequestMapping("/message/receiveContent.do")
	public String ReadCheck(@RequestParam("message_pk" ) int message_pk, Model model) {
	
		int result = messageService.update(message_pk);
		
		model.addAttribute("msg", messageService.selectOne(message_pk));
		
		return "message/receiveContent2";
	}
	
	@RequestMapping("/message/deleteMessage.do")
	public ModelAndView sendMessageDelete(int message_pk, ModelAndView mv) {
		
		int result = messageService.delete(message_pk);
		
		System.out.println("result값:"+result);
		Map map = new HashMap();
		
		map.put("result", result);
		
		mv.addAllObjects(map);
		
		mv.setViewName("jsonView");
	
		return mv;
	}

}