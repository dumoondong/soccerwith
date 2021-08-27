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
	private BoardDAO dao;
	
	@RequestMapping( "commoncode.do" )
	public ModelAndView mypage(HttpServletRequest request) {
		return new ModelAndView("admin/commoncode/commoncode");
	}
	
}
