package com.example.bootweb01;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class newsController {
	
	@Autowired
	private newsDAO dao;
	
	//일반 사용자용 뉴스 총목록 및 식별목록
	@RequestMapping( "/newstemplate.do" )
	public ModelAndView newstemplate(HttpServletRequest request) {
		System.out.println( "newstemplate() 호출" );
		
		ArrayList<newsTO> datas = dao.newstemplate();
		
		newsTO to =new newsTO();
		System.out.println(request.getParameter("classify"));
		String classify = request.getParameter("classify");
		
		ArrayList<newsTO> datas4 = dao.admnewsduplicate( classify );
		
		ModelAndView modelAndView = new ModelAndView( "news/newstemplate" );
		modelAndView.addObject( "datas", datas );
		modelAndView.addObject( "datas4", datas4 );
		modelAndView.addObject( "classify", classify );
		return modelAndView;
	}
	
	@RequestMapping( "newsview.do" )
	public ModelAndView view(HttpServletRequest request) {
		System.out.println( "view() 호출" );
		
		newsTO to = new newsTO();
		to.setSeq( request.getParameter( "seq" ) );

		to = dao.newsView( to );
		
		ModelAndView modelAndView = new ModelAndView( "news/news_view1" );
		modelAndView.addObject( "to", to );
		return modelAndView;
		
	}
	// 어드민 뉴스 리스트
	@RequestMapping( "/admnewstemplate.do" )
	public ModelAndView admnewstemplate(HttpServletRequest request) {
		System.out.println( "admnewstemplate() 호출" );
		
		ArrayList<newsTO> datas3 = dao.admnewstemplate();
		
		newsTO to =new newsTO();
		System.out.println(request.getParameter("classify"));
		String classify = request.getParameter("classify");
		ArrayList<newsTO> datas4 = dao.admnewsduplicate( classify );
		
		
		ModelAndView modelAndView = new ModelAndView( "admin/news/newstemplate" );
		modelAndView.addObject( "datas3", datas3 );
		modelAndView.addObject( "datas4", datas4 );
		modelAndView.addObject( "classify", classify );
		return modelAndView;
	}
	// 어드민 뉴스 상세내역
	@RequestMapping( "admnewsview.do" )
	public ModelAndView admview(HttpServletRequest request) {
		System.out.println( "admview() 호출" );
		
		newsTO to2 = new newsTO();
		to2.setSeq( request.getParameter( "seq" ) );

		to2 = dao.admnewsView( to2 );
		
		ModelAndView modelAndView = new ModelAndView( "admin/news/news_view1" );
		modelAndView.addObject( "to2", to2 );
		return modelAndView;
		
	}
	@RequestMapping( "newswrite.do" )
	public ModelAndView newswrite(HttpServletRequest request) { 
		System.out.println( "newswrite() 호출");
		
		newsTO to3 = new newsTO();
		to3.setSeq(request.getParameter("seq"));
		
		ModelAndView modelAndView = new ModelAndView("admin/news/news_write");
		modelAndView.addObject( "to3", to3 );
		return modelAndView;
	}
	@RequestMapping( "newswriteOK.do" )
	public ModelAndView newswriteOK(MultipartHttpServletRequest request) { 
			
		  newsTO to3 = new newsTO();
		  
		  to3.setId(request.getParameter("id"));
		  to3.setClassify(request.getParameter("classify"));
		  to3.setNewstitle(request.getParameter("newstitle"));
		  to3.setNewscontent(request.getParameter("newscontent"));
		  to3.setNewsimage(request.getParameter("newsimage"));
		  
		  MultipartFile newsimage = request.getFile("newsimage"); // 업로드 파라미터
		  String path = request.getRealPath("/images/news/"); // 저장될 위치
		  String filename = newsimage.getOriginalFilename(); // 업로드 파일 이름
		  File uploadFile = new File (path +"//"+filename); //복사될 위치
		  try {
			  newsimage.transferTo(uploadFile); // 업로드
		  } catch (IllegalStateException e ) {
			  e.printStackTrace();
		  } catch (IOException e) {
			  e.printStackTrace();
		  }
		  
		  to3.setNewsimage(filename);
		  
		  int flag = dao.newsWrite(to3);
		  
		  ModelAndView modelAndView = new ModelAndView("admin/news/newswriteOK");
		  modelAndView.addObject( "flag", flag );
		  
		  return modelAndView;
		 
	}
	
	//어드민 뉴스 수정
	@RequestMapping( "newsedit.do" )
	public ModelAndView newsedit(HttpServletRequest request) {
		newsTO to4 = new newsTO();
		to4.setSeq(request.getParameter("seq"));
		to4.setNewscontent(request.getParameter("newscontent"));
		to4.setNewstitle(request.getParameter("newstitle"));
		to4.setClassify(request.getParameter("classify"));

		System.out.println(request.getParameter("classify"));
		System.out.println(request.getParameter("classify"));
		System.out.println(request.getParameter("classify"));
		
		
		to4 = dao.newsedit( to4 );
		ModelAndView modelAndView = new ModelAndView("admin/news/newsedit");
		modelAndView.addObject( "to4", to4 );
		return modelAndView;
	}
	// 어드민 뉴스 수정 확인
	@RequestMapping( "newseditOK.do" )
	public ModelAndView newseditOK(HttpServletRequest request) {
		System.out.println( "newseditOK() 호출" );
		
		newsTO to5 = new newsTO();
	
		to5.setSeq(request.getParameter( "seq" ) );
		to5.setNewstitle(request.getParameter( "newstitle" ));
		to5.setNewscontent(request.getParameter( "newscontent" ));
		to5.setClassify(request.getParameter( "classify" ));
		int flag = dao.newseditOK(to5);
		
		ModelAndView modelAndView = new ModelAndView("admin/news/newseditOK");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	
	//어드민 뉴스 삭제
	@RequestMapping( "newsDelete_ok.do" )
	public ModelAndView newsDelete_ok(HttpServletRequest request) {
		/*
		 * newsTO to = new newsTO();
		 * 
		 * to.setSeq(request.getParameter( "seq" ) ); int flag = dao.newsDelete_ok(to);
		 */
		
		newsTO to = new newsTO();
		to.setSeq(request.getParameter("seq"));
		System.out.println(request.getParameter("seq"));
		
		//String test = "test22";
		
		//int flag = dao.newsDelete_ok(test);
		
		// 컨트롤러에서 to를 DAO에 대입 및 newsDAO 로 보내는과정
		int flag = dao.newsDelete_ok(to);
		
		
		ModelAndView modelAndView = new ModelAndView("admin/news/newsDelete_OK");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
}

