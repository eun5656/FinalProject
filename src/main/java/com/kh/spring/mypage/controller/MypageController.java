package com.kh.spring.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.bookmark.model.vo.Bookmark;
import com.kh.spring.common.page.PageCreate;
import com.kh.spring.member.controller.MemberController;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.mypage.model.service.MypageService;
import com.kh.spring.qna.model.vo.Qna;
import com.kh.spring.reserve.model.vo.Payment;
import com.kh.spring.reserve.model.vo.Reserve;

@SessionAttributes(value = { "memberLoggedIn" })
@Controller
public class MypageController {
	@Autowired
	private MypageService mypageService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	private Logger logger = Logger.getLogger(MemberController.class);

	@RequestMapping("/mypage/mypage.do")
	public ModelAndView mypage1(String memberPk,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		int memberPk1 = Integer.parseInt(memberPk);
		List<Reserve> list = mypageService.mypageReserveList(memberPk1, cPage, numPerPage);

		int totalCount = mypageService.reserveCount(memberPk1);

		String pageBar = new PageCreate().getPageBar(cPage, numPerPage, totalCount,
				"mypage.do?memberPk=" + ((Member) session.getAttribute("memberLoggedIn")).getMemberPk());

		mv.addObject("pageBar", pageBar);
		mv.addObject("list", list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("mypage/mypageReserve");

		return mv;
	}

	@RequestMapping("/mypage/mypageBookmark.do")
	public ModelAndView mypage2(int member_pk) {
		ModelAndView mv = new ModelAndView();
		List<Bookmark> list = mypageService.mypageBookmarkList(member_pk);
		mv.addObject("list", list);
		mv.setViewName("mypage/mypageBookmark");

		return mv;
	}

	@RequestMapping("/mypage/mypageQNAList.do")
	public ModelAndView mypage3(int member_pk,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 10;
		List<Qna> qnaList = mypageService.selectList(member_pk, cPage, numPerPage);
		int totalCount = mypageService.selectCount(member_pk);
		String pageBar = new PageCreate().getPageBar(cPage, numPerPage, totalCount,
				"mypageQNAList.do?member_pk=" + ((Member) session.getAttribute("memberLoggedIn")).getMemberPk());
		mv.addObject("pageBar", pageBar);
		mv.addObject("qnaList", qnaList);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("mypage/mypageQNAList");

		return mv;
	}

	@RequestMapping("/mypage/mypageQNAListContent.do")
	public String mypageQNAListContent(String qna_pk, Model model) {

		model.addAttribute("qna", mypageService.selectOne(Integer.parseInt(qna_pk)));

		return "mypage/mypageQNAListContent";
	}

	// 비밀번호변경
	@RequestMapping("/mypage/mypagePwchange.do")
	public String mypagePwUpdate() {
		return "mypage/mypagePwchange";
	}

	// 비밀번호 변경 시 기존 비밀번호와 일치하는치 체크
	@RequestMapping("/mypage/duplicatePwCheck.do")
	public void duplicatePwCheck(String memberPk, String memberPw, HttpServletResponse response, Model model)
			throws UnsupportedEncodingException, IOException {
		String check_pw = mypageService.duplicatePwCheck(Integer.parseInt(memberPk));

		String msg = "false";
		if (bcryptPasswordEncoder.matches(memberPw, check_pw)) {
			msg = "true";
		}

		logger.debug("check" + msg);

		response.getWriter().write(msg);
	}

	// 비밀번호수정 완료 로직
	@RequestMapping("/mypage/mypagePwchangeEnd.do")
	public String mypagePwUpdateEnd(int memberPk, String memberPwNew_2, Model model) {
		String member_pw = bcryptPasswordEncoder.encode(memberPwNew_2);
		Member member = new Member();
		member.setMemberPk(memberPk);
		member.setMemberPw(member_pw);
		int result = mypageService.mypagePwUpdate(member);

		String msg = "비밀번호변경에 실패하였습니다.";
		String loc = "/mypage/mypagePwchange";
		String view = "/common/msg";

		if (result > 0) {
			msg = "비밀번호변경성공!";
			loc = "/";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return view;
	}

	// 회원정보수정
	@RequestMapping("/mypage/mypageUpdate.do")
	public String mypageUpdate() {
		return "mypage/mypageUpdate";
	}

	// 회원정보수정 완료 로직
	@RequestMapping(value = "/mypage/mypageUpdateEnd.do", method = RequestMethod.POST)
	public String mypageUpdateEnd(Member m, Model model,
			@RequestParam(value = "input-file-preview", required = false) MultipartFile uploadFile, String memberOriImg,
			HttpServletRequest request) {
		String msg = "수정 실패";
		String loc = "/";
		System.out.println("멤버 확인" + m.getMemberId());
		
		boolean flag = false;
		
		// 파일 업로드
		// 저장위치 지정
		String renamedFileName = m.getMemberReImg();
		String originalFileName = null;
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/member");
		String oriRenameFile = mypageService.findImg(memberOriImg);
		
		if(oriRenameFile != null) {
	        File deleteFile=new File(saveDir+"/"+oriRenameFile);
	        flag=deleteFile.delete();
	      }

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
			m.setMemberReImg(renamedFileName);
		}

		int result = mypageService.mypageUpdate(m);
		
		if (result > 0) {
			msg = "수정 성공";
			loc = "/";
			model.addAttribute("memberLoggedIn", m);
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "common/msg";

	}

	// 회원탈퇴
	@RequestMapping("/mypage/mypageDelete.do")
	public String mypagedelete() {
		return "mypage/mypageDelete";
	}

	// 회원탈퇴 완료
	@RequestMapping("/mypage/mypageDeleteEnd.do")
	public String mypageDeleteEnd(int memberPk, String memberPw, Model model) {
		String pw = mypageService.findCheck(memberPk);
		pw = bcryptPasswordEncoder.encode(memberPw);

		String msg = "";
		String loc = "/";
		String view = "/common/msg";

		if (bcryptPasswordEncoder.matches(memberPw, pw)) {
			int result = mypageService.delete(memberPk);
			if (result > 0) {
				msg = "회원탈퇴성공";
				loc = "/";
			} else {
				msg = "회원탈퇴실패";
				loc = "mypage/mypageDelete.do";
			}
		} else {
			msg = "비밀번호가 일치하지 않습니다.";
			loc = "mypage/mypageDelete.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return view;
	}

	@RequestMapping("/mypage/mypagePayment.do")
	public ModelAndView mypagePayment(String reserve_pk) {
		int reserve_pk1 = Integer.parseInt(reserve_pk);
		Payment payment = mypageService.mypagePayment(reserve_pk1);
		System.out.println(payment);
		ModelAndView mv = new ModelAndView();
		mv.addObject("payment", payment);
		mv.setViewName("/mypage/mypageModal");
		return mv;
	}

	@RequestMapping("/mypage/mypagePaymentUpdate.do")
	public String paymentUpdate(String payment_pk, Model model) {
		int payment_pk1 = Integer.parseInt(payment_pk);

		int result = mypageService.paymentUpdate(payment_pk1);
		String msg = "결제 취소가 실패했습니다. 다시 시도해주세요.";
		String loc = "/";
		if (result > 0) {
			msg = "결제 취소를 요청했습니다. 결제취소 승인은 은행에 따라 3영업일 부터 7영업일 까지 걸리실 수 있습니다. ";

		}
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		return "/common/msg";
	}

}