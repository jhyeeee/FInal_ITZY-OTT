package ITzy.OTT.controller;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ITzy.OTT.dto.NbsDto;
import ITzy.OTT.dto.NbsLoveDto;
import ITzy.OTT.service.NbsService;
import ITzy.OTT.service.impl.NbsServiceImpl;

//like_no == h_number
//seq  == e_number
//id  == m_number
//love  == heart
@Controller
public class NbsLoveController {
//	@RequestMapping(value="detail",method=RequestMethod.GET)
//	public String detail(@RequestParam("seq") int e_number, Model model,
//						@RequestParam(value="page", required=false, defaultValue="1")int page,
//						@RequestParam("id") int id) {
//		// nbsdetail부분
//		NbsDto nbs = new NbsDto();
//		NbsService ns = new NbsServiceImpl();
////		nbs = ns.getNbs(seq);
//		model.addAttribute("nbs",nbs);
//		model.addAttribute("page", page);

		
		
		// 아래부터 좋아요 기능 시 추가되는 부분

//		HeartDTO heart = new HeartDTO();
//		// 좋아요가 되있는지 찾기위해 게시글번호와 회원번호를 보냄.
//		heart = es.findHeart(e_number, m_number);
//		// 찾은 정보를 heart로 담아서 보냄
//		model.addAttribute("heart",heart);
//		return "exhibition/detail";
//	}
}
