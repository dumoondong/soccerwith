package com.example.bootweb01;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class serviceController {
	
	@Autowired
	private ServiceDAO dao;

	//고객센터 목록
	@RequestMapping( "service.do" )
	public ModelAndView service(HttpServletRequest request) {
		System.out.println( "service() 호출" );
		
		String id = request.getParameter("id");

		ArrayList<ServiceTO> datas = dao.serviceList(id);
		ModelAndView modelAndView = new ModelAndView( "customerService/service" );
		modelAndView.addObject( "datas", datas );
		return modelAndView;
	}
	//고객센터 뷰목록
	@RequestMapping( "service_ask.do" )
	public ModelAndView checkpw(HttpServletRequest request) {
		System.out.println( "service_ask() 호출" );
		ServiceTO to = new ServiceTO();
		to.setSeq(request.getParameter( "seq" ) );

		to = dao.service_ask( to );
		ModelAndView modelAndView = new ModelAndView("customerService/service_ask");
		modelAndView.addObject( "to", to );
		return modelAndView;
	}
	//고객센터 문의
	@RequestMapping( "serviceWrite.do" )
	public ModelAndView commoncodeWrite(HttpServletRequest request) {
		System.out.println( "serviceWrite() 호출" );
		
		ServiceTO to = new ServiceTO();
		to.setId(request.getParameter("id"));
		to.setAsktitle(request.getParameter("title"));
		to.setAskcontent(request.getParameter("content"));
		
		int flag = dao.serviceWrite(to);
		
		ModelAndView modelAndView = new ModelAndView("customerService/serviceWrite");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	//관리자 고객센터 목록
	@RequestMapping( "adminservice.do" )
	public ModelAndView adminservice(HttpServletRequest request) {
		System.out.println( "adminservice() 호출" );

		ArrayList<ServiceTO> datas = dao.adminservice();
		
		ModelAndView modelAndView = new ModelAndView( "admin/adminService/adminservice" );
		modelAndView.addObject( "datas", datas );
		return modelAndView;
	}
	
	//관리자 고객센터 뷰목록
	@RequestMapping( "adminservice_reply.do" )
	public ModelAndView adminservice_reply(HttpServletRequest request) {
		System.out.println( "adminservice_reply() 호출" );
		ServiceTO to = new ServiceTO();
		to.setSeq(request.getParameter( "seq" ) );

		to = dao.service_ask( to );
		ModelAndView modelAndView = new ModelAndView("admin/adminService/adminservice_reply");
		modelAndView.addObject( "to", to );
		return modelAndView;
	}
	//관리자고객센터 답변
	@RequestMapping( "adminServiceWrite.do" )
	public ModelAndView adminServiceWrite(HttpServletRequest request) {
		System.out.println( "adminServiceWrite() 호출" );
		
		
		ServiceTO to = new ServiceTO();
		to.setSeq(request.getParameter("seq"));
		to.setReplyid(request.getParameter("id"));
		to.setReplytitle(request.getParameter("title"));
		to.setReplycontent(request.getParameter("content"));
		System.out.println(request.getParameter("seq"));
		int flag = dao.adminServiceWrite(to);

		ModelAndView modelAndView = new ModelAndView("admin/adminService/adminServiceWrite");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	
}
