<%@page import="com.example.bootweb01.RecommendTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
 	int flag = (Integer)request.getAttribute( "flag" );
	String pseq = (String)request.getAttribute("pseq");		
	String id = (String)request.getAttribute("id");	

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '삭제완료.' );" );
		out.println( "location.href='./admin_board_view.do?seq="+pseq+"&loginUser="+id+"';" );
	} else {
		out.println( "alert( '실패했습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>