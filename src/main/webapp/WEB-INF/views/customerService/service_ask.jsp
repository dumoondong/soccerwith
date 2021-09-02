<%@page import="com.example.bootweb01.ServiceTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String loginUser = (String)session.getAttribute("loginUser");
	String loginGrade = (String)session.getAttribute("loginGrade");
	
	StringBuilder sbHtml = new StringBuilder();
	
	ServiceTO to = (ServiceTO)request.getAttribute( "to" );
	String id = to.getId();
	String adate = to.getAdate();
	String asktitle = to.getAsktitle();
	String askcontent = to.getAskcontent();
	String rdate = to.getRdate();
	String replytitle = to.getReplytitle();
	String replycontent = to.getReplycontent();
	if(rdate != null){
		sbHtml.append( "<h2 class='mt-4'>답변내용</h2>" );
		sbHtml.append( "<div style='width:700px; text-align: left'>" );
		sbHtml.append( "<div class='input-group'>" );
		sbHtml.append( "<span class='input-group-text' id='basic-addon1'>답변 날짜</span>" );
		sbHtml.append( "<div class='form-control'  aria-label='Username' aria-describedby='basic-addon1'>"+rdate+"</div>" );
		sbHtml.append( "</div>" );
		sbHtml.append( "<div class='input-group'>" );
		sbHtml.append( "<span class='input-group-text' id='basic-addon1'>답변 제목</span>" );
		sbHtml.append( "<div class='form-control'  aria-label='Username' aria-describedby='basic-addon1'>"+replytitle+"</div>" );
		sbHtml.append( "</div>" );
		sbHtml.append( "<div class=input-group>" );
		sbHtml.append( "<span class='input-group-text'>답변 내용</span>" );
		sbHtml.append( "<div style='height:400px;' class='form-control'  aria-label='Username' aria-describedby='basic-addon1'>"+replycontent+"</div>" );
		sbHtml.append( "</div>" );
		sbHtml.append( "</div><br /><br />" );
	}
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
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
	    
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>
	<!-- 상단메뉴 -->
	<jsp:include page="../module/topmenu.jsp" />
	<!-- 왼쪽메뉴 -->
	<div class="sidebar close">
		<jsp:include page="../module/leftmenu.jsp" />
	</div>
	<br /><br /><br />
	<section class="home-section" >
		<div class="home-content">
		<i class='bx bx-menu' ></i>
	    </div>
	</section>
	<div align="middle">
    	<h2 class="mt-4">문의내용</h2>
    	<div style="width:700px; text-align: left">
	    	<div class="input-group">
			  <span class="input-group-text" id="basic-addon1">ID</span>
			  <div class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=id %></div>
			  <span class="input-group-text" id="basic-addon1">날짜</span>
			  <div class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=adate %></div>
			</div>	
			<div class="input-group">
			  <span class="input-group-text" id="basic-addon1">문의 제목</span>
			  <div class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=asktitle %></div>
			</div>
			<div class="input-group">
				<span class="input-group-text">문의 내용</span>
				<div style="height:400px;" class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=askcontent %></div>
			</div>
			<div class="form-input" style="text-align: right">
				<button class="btn btn-secondary" onclick="location.href='./service.do?id=<%=loginUser %>'">돌아가기</button>
			</div>
		</div><br />
		<%=sbHtml %>
	</div>
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