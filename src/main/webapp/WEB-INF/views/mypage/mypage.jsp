<%@page import="com.example.bootweb01.LoginTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String loginUser = (String)session.getAttribute("loginUser");


	LoginTO to = (LoginTO)request.getAttribute( "to" );
	String id = to.getId();
	String grade = to.getGrade();
	String phone = to.getPhone();
	String email = to.getEmail();
	String name = to.getName();
	String writeboa = to.getWriteboa();
	String writecom = to.getWritecom();

%>
<html>
  <head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/mypage.css">
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
<body >
	<!-- 상단메뉴 -->
	<div style="background-color:white; class="container">
		<jsp:include page="../module/topmenu.jsp" />
	</div>
	<!-- 왼쪽메뉴 -->
	<div class="sidebar close">
		<jsp:include page="../module/leftmenu.jsp" />
	</div>
	
    <section class="home-section" >
	    <div class="home-content">
		    <i class='bx bx-menu' ></i>
		    <img src="./images/로고.PNG" float="right" width="200" height="200" title="반갑습니다. 어서오세요!"/>
	    </div>
    </section>
    <br /><br /><br /><br />
	<main>
	<div class="container" style="margin-left: 850px;">
		<h2 style="margin-left: 200px;"class="mt-4">내정보관리</h2>
		<!-- <form action="mypage_ok.do" method="post" > -->
			<div class="row mb-3" >
				<div class="col-md-2 themed-grid-col">ID</div>
				<div style="background-color:white" class="col-md-3 themed-grid-col"><%=id %></div>
			</div>
			<div class="row mb-3">
				<div class="col-md-2 themed-grid-col">회원등급</div>
				<div style="background-color:white" class="col-md-3 themed-grid-col"><%=grade %></div>
			</div>
			<div class="row mb-3">
				<div class="col-md-2 themed-grid-col">핸드폰번호</div>
				<input style="background-color:white" name = phone placeholder=<%=phone %> class="col-md-3 themed-grid-col" type="text" >
				<input style="background-color:rgb(139, 152, 241)" type="submit" class="col-md-1 themed-grid-col"value="변경">
			</div>

			<div class="row mb-3">
				<div class="col-md-2 themed-grid-col">이메일</div>
				<input style="background-color:white" name = email placeholder=<%=email %> class="col-md-3 themed-grid-col" type="text" >
				<input style="background-color:rgb(139, 152, 241)" type="button" class="col-md-1 themed-grid-col"value="변경">
			</div>
			<div class="row mb-3">
				<div class="col-md-2 themed-grid-col">이름</div>
				<input style="background-color:white" name = name placeholder=<%=name %> class="col-md-3 themed-grid-col" type="text" >
				<input style="background-color:rgb(139, 152, 241)" type="submit" class="col-md-1 themed-grid-col"value="변경">
			</div>
			<div class="row mb-3">
				<div class="col-md-2 themed-grid-col">작성게시글수</div>
				<div style="background-color:white" class="col-md-3 themed-grid-col"><%=writeboa %></div>
			</div>
			<div class="row mb-3">
				<div class="col-md-2 themed-grid-col">작성댓글수</div>
				<div style="background-color:white" class="col-md-3 themed-grid-col"><%=writecom %></div>
			</div>
			<br /><br />
		<!-- </form> -->
	</div>
	</main>
	
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