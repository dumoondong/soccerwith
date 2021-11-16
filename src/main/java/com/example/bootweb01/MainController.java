package com.example.bootweb01;

import java.awt.Choice;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MainController {
	
	@Autowired
	private BoardDAO dao;	
	@Autowired
	private newsDAO dao2;	
	@Autowired
	private leagueDAO dao3;	
	
	@RequestMapping( "main.do" )
	public ModelAndView main(HttpServletRequest request) {
		ArrayList<BoardTO> mainVOdatas = dao.mainlist(); //인기게시판 상위 10개
		ArrayList<BoardTO> mainSCdatas = dao.mainSClist(); //축구게시물 등록순 10개
		
		String classify = "국내뉴스";
		ArrayList<newsTO> datas4 = dao2.mainNews( classify );
		
		ArrayList<leagueTO> datas = dao3.mainleague();	//축구팀 리스트
		
		newsTO to = new newsTO();
		String seq = "19";
		to.setSeq(seq);
		
		to = dao2.newsView( to );	//뉴스 데이터 출력하기 위한 검색
		
		ModelAndView modelAndView = new ModelAndView( "menu/main" );
		modelAndView.addObject( "mainVOdatas", mainVOdatas );//인기게시판 상위 10개
		modelAndView.addObject( "mainSCdatas", mainSCdatas );//축구게시물 등록순 10개
		modelAndView.addObject( "datas4", datas4 );
		modelAndView.addObject( "datas", datas );
		modelAndView.addObject( "to", to );	//뉴스데이터
		return modelAndView;
	}
	
	@RequestMapping( "admin_main.do" )
	public ModelAndView admin_main(HttpServletRequest request) {
		System.out.println( "admin_main() 호출" );
		
		ArrayList<BoardTO> mainVOdatas = dao.mainlist(); //인기게시판 상위 10개
		ArrayList<BoardTO> mainSCdatas = dao.mainSClist(); //축구게시물 등록순 10개
		
		String classify = "국내뉴스";
		ArrayList<newsTO> datas4 = dao2.mainNews( classify );
		
		ArrayList<leagueTO> datas = dao3.mainleague();	//축구팀 리스트
		
		newsTO to = new newsTO();
		String seq = "19";
		to.setSeq(seq);
		
		to = dao2.newsView( to );	//뉴스 데이터 출력하기 위한 검색
		
		ModelAndView modelAndView = new ModelAndView( "admin/admin_main/main" );
		modelAndView.addObject( "mainVOdatas", mainVOdatas );//인기게시판 상위 10개
		modelAndView.addObject( "mainSCdatas", mainSCdatas );//축구게시물 등록순 10개
		modelAndView.addObject( "datas4", datas4 );
		modelAndView.addObject( "datas", datas );
		modelAndView.addObject( "to", to );	//뉴스데이터
		return modelAndView;

	}
}
