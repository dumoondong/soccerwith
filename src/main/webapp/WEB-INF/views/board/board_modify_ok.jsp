<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
 	int flag = (Integer)request.getAttribute( "flag" );
	String seq = (String)request.getAttribute("seq");	
	String smallcode = (String)request.getAttribute("smallcode");	
	System.out.println(seq);
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert( '수정되었습니다.' );" );
		out.println( "location.href='./board_view.do?seq="+seq+"&smallcode="+smallcode+"';" );
	} else {
		out.println( "alert( '실패했습니다.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>