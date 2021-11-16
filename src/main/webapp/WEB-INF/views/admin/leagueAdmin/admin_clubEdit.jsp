<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%	
	 int flag = (Integer)request.getAttribute( "flag" );
	
		
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		 out.println( "alert( '수정성공' );" );
		out.println( "location.href='./admin_league.do';" ); 
 	} else {
		out.println( "alert( '실패했습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" ); 
%>