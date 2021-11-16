<%@page import="com.example.bootweb01.leagueTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%
	String loginUser = (String)session.getAttribute("loginUser");
	String loginGrade = (String)session.getAttribute("loginGrade");
	
	leagueTO to = (leagueTO)request.getAttribute( "to" );
	String seq = to.getSeq();
	String teamname = to.getTeamname();
	String wri = to.getWri();
	String foundation = to.getFoundation();
	String hometown = to.getHometown();
	String homestadium = to.getHomestadium();
	String nickname = to.getNickname();
	String prewin = to.getPrewin();
	String fawin = to.getFawin();
	String leaguewin = to.getLeaguewin();
	String chamwin = to.getChamwin();
	String eurowin = to.getEurowin();
	String img = to.getImg();
	String list = to.getList();
	
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/admin.css">
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
	<jsp:include page="../admin_module/admin_topmenu.jsp" />
	<!-- 왼쪽메뉴 -->
	<div class="sidebar close">
		<jsp:include page="../admin_module/admin_leftmenu.jsp" />
	</div>
	<br /><br /><br />
    <section class="home-section" >
	    <div class="home-content">
		    <i class='bx bx-menu' ></i>
	    </div>
    </section>
    
    
    <div class="wrapper" >
		<form action="leagueEdit_ok.do" method="post" name="mfrm" >
			<div class="group">
				<h2 class="mt-4">클럽 수정</h2>		
				<div class="row mb-3" >
					<div class="col-md-5 themed-grid-col">기존 클럽명</div>
					<div style="background-color:white" class="col-md-7 themed-grid-col"><%=teamname %> ※수정불가</div>
				</div>
				<div class="row mb-3" >
					<div class="col-md-5 themed-grid-col">클럽명</div>
					<input style="background-color:white" name="teamname" value="<%=teamname %>" class="col-md-7 themed-grid-col" type="text" >
				</div>
				
				<div class="row mb-3" >
					<div class="col-md-5 themed-grid-col">리그</div>
					<input style="background-color:white" name="list" value="<%=list %>" class="col-md-7 themed-grid-col" type="text" >
				</div>

							
				<div class="form-input">
					<input type="hidden" name="seq" value="<%=seq %>"/>
					<input type="submit" value="수정" class="btn btn-secondary"/>
				</div>
		    </div>
		</form>
		<div class="btn-group">
			<form action="leagueDelete_ok.do" method="post" >
				<input type="hidden" name="seq" value="<%=seq %>"/>
				<input type="submit" value="삭제" class="btn btn-secondary"/>
			</form>
			<button class="btn btn-secondary" onclick="location.href='./leagueAdmin.do?id=<%=loginUser %>'">취소</button>
		</div>
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