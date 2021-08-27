package com.example.bootweb01;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mypageController {
	
	@Autowired
	private LoginDAO dao;
	
	@RequestMapping( "mypage.do" )
	public ModelAndView mypage(HttpServletRequest request) {
		System.out.println( "mypage() 호출" );
		LoginTO to = new LoginTO();
		
		to.setId(request.getParameter("id"));
		to = dao.mypageView( to );
		
		ModelAndView modelAndView = new ModelAndView( "mypage/mypage" );
		modelAndView.addObject( "to", to );
		return modelAndView;
	}
	@RequestMapping( "checkpw.do" )
	public ModelAndView checkpw(HttpServletRequest request) {
		return new ModelAndView("mypage/checkpw");
	}
	
	@RequestMapping( "checkpw_ok.do" )
	public ModelAndView checkpw_ok(HttpServletRequest request) {
		System.out.println( "checkpw_ok() 호출" );
		
		LoginTO to = new LoginTO();
		to.setId(request.getParameter( "id" ) );
		to.setPassword(request.getParameter( "password" ) );
		
		int flag = dao.checkpw(to);
		
		ModelAndView modelAndView = new ModelAndView("mypage/checkpw_ok");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	@RequestMapping( "changepw.do" )
	public ModelAndView changepw(HttpServletRequest request) {
		return new ModelAndView("mypage/changepw");
	}
	
}
