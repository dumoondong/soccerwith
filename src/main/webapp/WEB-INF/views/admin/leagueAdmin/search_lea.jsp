<%@page import="com.example.bootweb01.leagueTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%	
	ArrayList<leagueTO> datas = (ArrayList)request.getAttribute( "datas" );

	out.println( "<script type='text/javascript'>" );
	session.setAttribute("datas", datas);  //세션에 값 저장
	out.println( "location.href='./leagueAdmin.do';" );
	
	out.println( "</script>" );

%>