package ITzy.OTT.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ITzy.OTT.dto.MemberDto;
import ITzy.OTT.dto.QnaDto;
import ITzy.OTT.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	QnaService service;
	
	@RequestMapping(value = "qnalist.do", method = RequestMethod.GET)
	public String qna(Model model,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		MemberDto login = (MemberDto)session.getAttribute("login");
		if (login == null) {
			return "redirect:/login.do";
		}
		
		String id=login.getId();
		
		List<QnaDto> qnalist = service.myQna(id);
		model.addAttribute("qnalist",qnalist);
		
		return "qna/qnalist";
	}
	
	@RequestMapping(value = "qnawrite.do", method = RequestMethod.GET)
	public String qnawrite() {
		return "qna/qnawrite";
	}
	
	
	@RequestMapping(value = "qnawriteAf.do", method = RequestMethod.POST)
	public String qnawriteAf(QnaDto dto, Model model) {
		boolean isS = service.addQna(dto);
		String qnawriteAf = "";
		if (isS) {
			qnawriteAf = "Q_ADD_YES";
		}else {
			qnawriteAf = "Q_ADD_NO";
		}
		model.addAttribute("qnawriteAf", qnawriteAf);
		return "message";
		
	}
	
	@RequestMapping(value = "qnadetail.do", method = RequestMethod.GET)
	public String qnadetail(@RequestParam int seq, Model model) {
		QnaDto dto = service.findQna(seq);
		
		model.addAttribute("dto", dto);
		return "qna/qnadetail";
	}
	
}