package com.kh.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.store.model.vo.Store;

@SessionAttributes(value = { "memberLoggedIn" })
@Controller
public class MemberController {

	String user = "jazzhong5@gmail.com"; // gmail 계정
	String password = "1zjvldndb"; // 패스워드

	@Autowired
	private MemberService service;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	private Logger logger = Logger.getLogger(MemberController.class);

	@RequestMapping("/member/memberLogin.do")
	public String MemberLogin() {
		return "member/loginForm";
	}

	// 로그인 로직
	@RequestMapping("/member/Login.do")
	public String memberLogin(String memberId, String memberPw, Model model, HttpSession session) {
		logger.debug("로그인메소드호출");
		Member m = service.loginCheck(memberId);
		int count = service.countMessage();
		// 응답페이지 작성
		String msg = "";
		String loc = "/";
		String view = "/common/msg";

		System.out.println(bcryptPasswordEncoder.encode(memberPw));

		if (m != null) {
			if (bcryptPasswordEncoder.matches(memberPw, m.getMemberPw())) {
				if(count>0) {
					msg="새로운 쪽지가 도착했습니다.";
				}
				else {
					msg="로그인 성공";
				}
				model.addAttribute("memberLoggedIn", m);
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
			}
		} else {
			msg = "없는 아이디입니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		session.setAttribute("count",count);
		return view;
	}

	// 로그아웃
	@RequestMapping("/member/Logout.do")
	public String logout(SessionStatus sessionStatus) {
		if (!sessionStatus.isComplete()) {
			// 세션끊기
			sessionStatus.setComplete();
		}
		return "redirect:/";
	}

	// 아이디 중복체크
	@RequestMapping("/member/checkIdDuplicate.do")
	public void duplicateIdCheck(String memberId, HttpServletResponse response, Model model)
			throws UnsupportedEncodingException, IOException {
		logger.debug("아이디 중복체크 : " + memberId);

		String check = service.duplicateIdCheck(memberId) == 0 ? "true" : "false";

		response.getWriter().write(check);
	}

	// 이메일체크
	@RequestMapping("/member/JHcheckEmail.do")
	@ResponseBody
	public void membercheckEmail(String memberEmail, HttpServletResponse response) throws Exception {

		boolean check = service.duplicateMemberEmailCheck(memberEmail) == 0 ? true : false;

		response.getWriter().print(check);
	}

	@RequestMapping("/member/emailEnd.do")
	public String emailResponse(String memberEmail, Model model) {
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("ppj1017@gmail.com", "ahfmrqhd1!a");
			}
		});
		int ra = 0;

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress("ppj1017@gmail.com", MimeUtility.encodeText("오늘네일 관리자", "UTF-8", "B")));
			// 수신자메일주소
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(memberEmail));
			// Subject
			message.setSubject("오늘네일 메일 인증"); // 메일 제목을 입력
			// Text
			while (true) {
				ra = (int) (Math.random() * 10000);
				if (ra > 1000) {
					break;
				}
			}
			message.setText("인증번호[" + ra + "]"); // 메일 내용을 입력
			// send the message
			Transport.send(message); //// 전송

		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("ra", ra);
		return "member/emailEnd";
	}

	// 소개페이지
	@RequestMapping("/intro/intro.do")
	public String Intro() {
		return "intro/intro";
	}

	// 회원가입 클릭 시 나오는 화면
	@RequestMapping("/member/joinSelect.do")
	public String memberEnroll() {
		return "member/joinSelect";
	}

	// 일반회원 가입 화면
	@RequestMapping("/member/JoinUser.do")
	public String joinUser() {
		return "member/joinUser";
	}

	// 샵원장 가입 화면
	@RequestMapping("/member/JoinShop.do")
	public String joinShop() {
		return "member/joinShop";
	}

	// 일반회원가입완료 로직
	@RequestMapping(value = "/member/memberEnrollEnd.do", method = RequestMethod.POST)
	public String joinMemberEnd(Member m, Store s, Model model,
			@RequestParam(value = "input-file-preview", required = false) MultipartFile uploadFile, HttpServletRequest request) {
		System.out.println("회원가입(개인)을 실행함");
		String msg = "";
		String loc = "";
		s.setStore_address(request.getParameter("shopAddress1") + request.getParameter("shopAddressDetail"));// 기본주소

		boolean checkid = service.duplicateIdCheck(m.getMemberId()) == 0 ? true : false;
		boolean checkemail = service.duplicateEmailCheck(m.getMemberEmail()) == 0 ? true : false;

		if (!checkid) {
			msg = "해당 아이디는 이미 존재합니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}
		if (!checkemail) {
			msg = "해당 이메일은 이미 존재합니다.";
			model.addAttribute("msg", msg);
			model.addAttribute("loc", loc);
			return "common/msg";
		}

		String oldpw = m.getMemberPw();

		System.out.println("암호화 전 : " + oldpw);

		m.setMemberPw(bcryptPasswordEncoder.encode(oldpw));

		System.out.println("암호화 후 : " + m.getMemberPw());

		// 파일 업로드
		// 저장위치 지정
		String renamedFileName = null;
		String originalFileName = null;
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/member");

		File dir = new File(saveDir);
		if (dir.exists() == false)
			System.out.println(dir.mkdirs()); // 폴더 생성

		if (!uploadFile.isEmpty()) {
			originalFileName = uploadFile.getOriginalFilename();
			// 확장자 구하기
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSS");
			int rndNum = (int) (Math.random() * 1000);
			renamedFileName = sdf.format(new Date(System.currentTimeMillis()));
			renamedFileName += "_" + rndNum + "." + ext;
			try {
				uploadFile.transferTo(new File(saveDir + File.separator + renamedFileName));
			} catch (IOException e) {
				e.printStackTrace();
			}

			// DB에 저장할 첨부파일에 대한 정보
			m.setMemberOriImg(originalFileName);
			System.out.println(originalFileName);
			m.setMemberReImg(renamedFileName);
		}

		int result = 0;
		System.out.println("store DB야 나와라 :" + s);

		if (m.getMemberLevel().equals("3")) {
			result = service.insertMember(m);
		} else {
			result = service.insertMember(m);
			Member member = service.loginCheck(m.getMemberId());
			s.setMember_pk(member.getMemberPk());
			result = service.insertStore(s);
		}

		if (result > 0) {
			msg = "회원가입성공!";
		} else {
			msg = "회원가입실패!";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);

		return "common/msg";
	}

}