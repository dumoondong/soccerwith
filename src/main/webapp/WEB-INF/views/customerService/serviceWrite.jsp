<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	int flag = (Integer)request.getAttribute( "flag" );
	String loginUser = (String)session.getAttribute("loginUser");
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '등록성공' );" );
		out.println( "location.href='./service.do?id="+loginUser+"';" );
	} else {
		out.println( "alert( '실패했습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );

%>