package com.example.bootweb01;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class newsController {
	
	@Autowired
	private newsDAO dao;
	
	@RequestMapping( "news.do" )
	public ModelAndView news(HttpServletRequest request) {
		return new ModelAndView("news/news");
	}
	@RequestMapping( "domestic.do" )
	public ModelAndView domestic(HttpServletRequest request) {
		return new ModelAndView("news/domestic");
	}
	@RequestMapping( "oversea.do" )
	public ModelAndView oversea(HttpServletRequest request) {
		return new ModelAndView("news/oversea");
	}
	@RequestMapping( "retire.do" )
	public ModelAndView retire(HttpServletRequest request) {
		return new ModelAndView("news/retire");
	}
	@RequestMapping( "youth.do" )
	public ModelAndView youth(HttpServletRequest request) {
		return new ModelAndView("news/youth");
	}
	@RequestMapping( "newstemplate.do" )
	   public ModelAndView newstemplate(HttpServletRequest request) {
	      
	     // ArrayList<newsTO> datas = dao.newstemplate();
			ModelAndView modelAndView = new ModelAndView( "news/newstemplate" );
			//modelAndView.addObject( "datas", datas );
			return modelAndView;
	   }
}
