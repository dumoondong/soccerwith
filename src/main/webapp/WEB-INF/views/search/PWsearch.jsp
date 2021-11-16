<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%
	String loginUser = (String)session.getAttribute("loginUser");
	String loginGrade = (String)session.getAttribute("loginGrade");

	
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <!------<title> Website Layout | CodingLab</title>------>
    <link rel="stylesheet" type="text/css" href="./css/topmenu.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
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
    
    <div class="container" >
    	
    		<div class="group" style="margin :0px 0px 150px 150px; border:0px solid; padding:100px">
    			<h2 style="margin-left: 0px; font-size:30px;" class="mt-4">비밀번호 찾기</h2>
    			<hr style="height:3px; color:#000000;" />
    			<div class="row mb-3" >
					<div style="background-color:white; border:0px; text-align:left;" class="col-md-2 btn btn-light" >아이디</div>
					<input style="background-color:white; width:280px;  border:1px solid;" name = "" class="col-md-2 btn btn-light" type="text" >
				</div>
    			
    			<div class="row mb-3" >
					<div style="background-color:white; border:0px; text-align:left;" class="col-md-2 btn btn-light" >이름</div>
					<input style="background-color:white; width:280px;  border:1px solid;" name = "" class="col-md-2 btn btn-light" type="text" >
				</div>
				
				<div class="row mb-3" >
					<div style="background-color:white; border:0px; text-align:left;" class="col-md-2 btn btn-light" >이메일 주소</div>
					<input style="background-color:white; width:280px; border:1px solid;" name = "" class="col-md-2 btn btn-light" type="text" >&nbsp&nbsp
					<button style="color:white; width:150px;" type="submit" id="submit1" class="col-md-1 btn btn-dark">인증메일 전송</button>
				</div>
				
				<div class="row mb-3">
					<div style="background-color:white; border:0px; text-align:left;" class="col-md-2 btn btn-light"></div>
					<input type="hidden" name="" value="" />
					<input style="background-color:#e9e9e9; width:280px; border:1px solid; " name = "" placeholder="인증번호입력" class="col-md-2 btn btn-light" type="text" >&nbsp&nbsp
					<button type="" id="" class="col-md-1 btn btn-dark">확인</button>
				</div>
				
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