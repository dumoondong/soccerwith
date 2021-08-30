package com.example.bootweb01;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class adminController {
	
	@Autowired
	private AdminDAO dao;
	//소코드
	@RequestMapping( "commoncode.do" )
	public ModelAndView commoncode(HttpServletRequest request) {
		System.out.println( "commoncode() 호출" );
		
		ArrayList<SmallcodeTO> datas = dao.smallcodeList();
		ArrayList<LargecodeTO> datas1 = dao.LargecodeList();
		ModelAndView modelAndView = new ModelAndView( "admin/commoncode/commoncode" );
		
		modelAndView.addObject( "datas", datas ); // 소코드 리스트
		modelAndView.addObject( "datas1", datas1 ); // 대코드 정보
		return modelAndView;
	}
	//대코드
	@RequestMapping( "decode.do" )
	public ModelAndView decode(HttpServletRequest request) {
		System.out.println( "decode() 호출" );
		
		ArrayList<LargecodeTO> datas = dao.LargecodeList();
		
		ModelAndView modelAndView = new ModelAndView( "admin/commoncode/decode" );
		modelAndView.addObject( "datas", datas );
		return modelAndView;
	}
	
	//소코드 테이블에서 대코드 검색
	@RequestMapping( "search_de.do" )
	public ModelAndView registration(HttpServletRequest request) {
		
		System.out.println( "search_de() 호출" );
		SmallcodeTO to = new SmallcodeTO();
		
		to.setSmallcode(request.getParameter("largecode"));
		//System.out.println( request.getParameter("largecode") );

		
		ModelAndView modelAndView = new ModelAndView( "admin/commoncode/search_de" );

		return modelAndView;
	}
	
	//회원관리
	@RequestMapping( "management.do" )
	public ModelAndView management(HttpServletRequest request) {
		System.out.println( "management() 호출" );
		
		ArrayList<MemberTO> datas = dao.management(); 
		ArrayList<SmallcodeTO> datas1 = dao.managementcodeList();
		ModelAndView modelAndView = new ModelAndView( "admin/management/management" );
		System.out.println(datas1);
		modelAndView.addObject( "datas", datas );
		modelAndView.addObject( "datas1", datas1 );
		return modelAndView;
	}
	
	
}
