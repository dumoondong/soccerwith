<%@page import="ch.qos.logback.core.net.SyslogOutputStream"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.example.bootweb01.newsTO"%>

<%@ page import="java.util.ArrayList" %>

<!--  JSP에서 jsoup을 사용하기 위해 import -->
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%
	ArrayList<newsTO> datas = (ArrayList)request.getAttribute( "datas" );

	int totalRecord = datas.size();
	
	ArrayList<newsTO> datas4 = (ArrayList)request.getAttribute( "datas4" );
	
	int totalRecord2 = datas4.size();
	
	String classify = (String)request.getAttribute("classify");
	
	StringBuilder sbHtml = new StringBuilder();
	
	if (classify != null) {
	
	for( newsTO to : datas4 ) {
		String seq = to.getSeq();
		String newstitle = to.getNewstitle();
		String newswdate = to.getNewswdate();
		String newscontent = to.getNewscontent();
		String newsimage = to.getNewsimage();
		String id = to.getId();
		int newsview = to.getNewsview();
		
		
		
		
		sbHtml.append( " 		<div class='col-md-4'>");
    	sbHtml.append( " 		<div class='card mb-4 box-shadow'>");
    	sbHtml.append( " 		<img class='card-img-top'src=./images/news/"+ to.getNewsimage()+" width=300px height=300px" +"alt='Card image cap'>");
	    sbHtml.append( " 				<div class='card-body'>");
	    sbHtml.append( " 					<p class='card-text'>" +to.getNewstitle()+ "</p>");
	    sbHtml.append( " 						<div class='d-flex justify-content-between align-items-center'> ");
	    sbHtml.append( " 							<div class='btn-group'>");
	    sbHtml.append( " 								<button type='button' class='btn btn-sm btn-outline-secondary' onclick=location.href='./newsview.do?seq="+to.getSeq()+"'>View</button>");
	    sbHtml.append( " 							</div>");
	    sbHtml.append( " 				</div>");
	    sbHtml.append( " 			</div>");
	    sbHtml.append( " 		</div>"); 
	    sbHtml.append( " 		</div>");
    
		}
	}else {
	for( newsTO to : datas ) {
		String seq = to.getSeq();
		String newstitle = to.getNewstitle();
		String newswdate = to.getNewswdate();
		String newscontent = to.getNewscontent();
		String newsimage = to.getNewsimage();
		String id = to.getId();
		int newsview = to.getNewsview();
		
		
		
		sbHtml.append( " 		<div class='col-md-4'>");
    	sbHtml.append( " 		<div class='card mb-4 box-shadow'>");
    	sbHtml.append( " 		<img class='card-img-top'src=./images/news/"+ to.getNewsimage()+" width=300px height=300px" +"alt='Card image cap'>");
	    sbHtml.append( " 				<div class='card-body'>");
	    sbHtml.append( " 					<p class='card-text'>" +to.getNewstitle()+ "</p>");
	    sbHtml.append( " 						<div class='d-flex justify-content-between align-items-center'> ");
	    sbHtml.append( " 							<div class='btn-group'>");
	    sbHtml.append( " 								<button type='button' class='btn btn-sm btn-outline-secondary' onclick=location.href='./newsview.do?seq="+to.getSeq()+"'>View</button>");
	    sbHtml.append( " 							</div>");
	    sbHtml.append( " 				</div>");
	    sbHtml.append( " 			</div>");
	    sbHtml.append( " 		</div>"); 
	    sbHtml.append( " 		</div>");
    
		}
	}
		
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="./css/menustyle2.css">
		<!-- Boxicons CDN Link -->
	    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
	    <!-- bootstrap css -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<!-- popper.js -->
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
		<!-- bootstrap js -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script> 
	     <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
	</head>
	
<style type="text/css">
<!--
	.board_pagetab { text-align: center; }
	.board_pagetab a { text-decoration: none; font: 12px verdana; color: #000; padding: 0 3px 0 3px; }
	.board_pagetab a:hover { text-decoration: underline; background-color:#f2f2f2; }
	.on a { font-weight: bold; }
-->
</style>



<body>



	<!-- 상단메뉴 -->
	<jsp:include page="../module/topmenu.jsp" />
	<!-- 왼쪽메뉴 -->
	<div class="sidebar close">
		<jsp:include page="../module/leftmenu.jsp" />
	</div>
	<br /><br /><br />
	<section class="home-section">
    <div class="home-content">
      <i class='bx bx-menu' ></i>
    </div>
    
    
    <!-- 상단 디자인 -->
    <div class="btn-group">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type="button" name="classify" value="해외뉴스" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./newstemplate.do?classify=해외뉴스'" />
		<input type="button" name="classify" value="국내뉴스" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./newstemplate.do?classify=국내뉴스'" />
		<input type="button" name="classify" value="은퇴선수" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./newstemplate.do?classify=은퇴선수'" />
		<input type="button" name="classify" value="꿈나무들" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./newstemplate.do?classify=꿈나무들'" />
	</div>
    
  </section>	
		      <div class="album py-5 bg-light">
        	<div class="container">

          		<div class="row">
            		<%= sbHtml %>
             </div>
        </div>
   </div>
		<!--//하단 디자인 -->
  <script>
  let arrow = document.querySelectorAll(".arrow");
  for (var i = 0; i < arrow.length; i++) {
    arrow[i].addEventListener("click", (e)=>{
   let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
   arrowParent.classList.toggle("showMenu");
    });
  }
  let sidebar = document.querySelector(".sidebar");
  let sidebarBtn = document.querySelector(".bx-menu");
  console.log(sidebarBtn);
  sidebarBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("close");
  });
  </script>
</body>
</html>