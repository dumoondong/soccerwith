<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@page import="com.example.bootweb01.MemberTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String loginUser = (String)session.getAttribute("loginUser");
	String loginGrade = (String)session.getAttribute("loginGrade");

	MemberTO to = (MemberTO)request.getAttribute( "to" );
	String id = to.getId();
	String phone = to.getPhone();
	String email = to.getEmail();
	String name = to.getName();
	String grade = to.getGrade();
	String writeboa = to.getWriteboa();
	String writecom = to.getWritecom();
	
	SmallcodeTO to1 = (SmallcodeTO)request.getAttribute( "to1" );
	String cggrade = to1.getSmallinfo();
	
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
   <link rel="stylesheet" type="text/css" href="./css/style.css">
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
	<!-- ???????????? -->
	<jsp:include page="../module/topmenu.jsp" />
	<!-- ???????????? -->
	<div class="sidebar close">
		<jsp:include page="../module/leftmenu.jsp" />
	</div>
	<br /><br /><br />
    <section class="home-section" >
	    <div class="home-content">
		    <i class='bx bx-menu' ></i>
	    </div>
    </section>
    <br /><br /><br /><br />
	<main>
	
	<div class="container"> <!-- style="margin :0px 0px 150px 150px; border:1px solid; padding:60px" -->
		<h2 style="margin-left: 0px; font-size:50px;" class="mt-4">??? ?????? ??????&nbsp&nbsp<span style="font-size:15px; color:gray;">???????????? ????????????????????? ?????? ????????? ??????????????????.</span></h2>
		
		<hr style="height:3px; color:#000000;" />
		
			<div class="row mb-3" >
				<div style="background-color:white; border:0px; padding-right: 50px;" class="col-md-2 btn btn-light" >ID</div>
				<div style="background-color:white; border:0px;" class="col-md-3 btn btn-light"><%=loginUser %></div>
			</div>
			<hr style="height:1px" />
			<div class="row mb-3">
				<div style="background-color:white; border:0px;" class="col-md-2 btn btn-light">????????????</div>
				<div style="background-color:white; border:0px;" class="col-md-3 btn btn-light"><%=grade %></div>
			</div>
			<hr style="height:1px" />
			<!-- ??????????????? -->
			<form action="mypage_phone.do" method="post" name="mfrm">
				<div class="row mb-3" >
					<div style="background-color:white; border:0px; padding-left: 23px;" class="col-md-2 btn btn-light">???????????????</div>
					<input type="hidden" name="id" value="<%=id %>" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input style="background-color:white; border:0px;" name = "phone" placeholder=<%=phone %> class="col-md-2 btn btn-light" type="text" >&nbsp&nbsp&nbsp
					<button style="color:white;" type="submit" id="submit1" class="col-md-1 btn btn-dark">??????</button>
				</div>
			</form>
			<hr style="height:1px" />
			<!-- ??????????????? -->
			<form action="mypage_email.do" method="post" name="mfrm">
				<div class="row mb-3">
					<div style="background-color:white; border:0px; padding-right: 35px;" class="col-md-2 btn btn-light">?????????</div>
					<input type="hidden" name="id" value="<%=id %>" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input style="background-color:white; border:0px;" name = "email" placeholder=<%=email %> class="col-md-2 btn btn-light" type="text" >&nbsp&nbsp&nbsp
					<button type="submit" id="submit2" class="col-md-1 btn btn-dark">??????</button>
				</div>
			</form>
			<hr style="height:1px" />
			<!-- ???????????? -->
			<form action="mypage_name.do" method="post" name="mfrm">
				<div class="row mb-3">
					<div style="background-color:white; border:0px; padding-right: 50px;" class="col-md-2 btn btn-light">??????</div>
					<input type="hidden" name="id" value="<%=id %>" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input style="background-color:white; border:0px;" name = "name" placeholder=<%=name %> class="col-md-2 btn btn-light" type="text" >&nbsp&nbsp&nbsp
					<button type="submit" id="submit3" class="col-md-1 btn btn-dark">??????</button>
				</div>
			</form>
			<hr style="height:1px" />
			<div class="row mb-3">
				<div style="background-color:white; border:0px; padding-left: 32px;" class="col-md-2 btn btn-light">??????????????????</div>
				<div style="background-color:white; border:0px;" class="col-md-3 btn btn-light"><%=writeboa %></div>
			</div>
			<hr style="height:1px" />
			<div class="row mb-3">
				<div style="background-color:white; border:0px; padding-right: 11px;" class="col-md-2 btn btn-light">???????????????</div>
				<div style="background-color:white; border:0px;" class="col-md-3 btn btn-light"><%=writecom %></div>
			</div>
			
			<br />
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
	
	
	window.onload = function() {
		document.getElementById( 'submit1' ).onclick = function() {
			if( document.mfrm.phone.value.trim() == '' ) {
				alert( '????????? ?????????????????? ???????????? ?????????.' );
				return false;
			}
			document.mfrm.submit();
		};
		document.getElementById( 'submit2' ).onclick = function() {
			if( document.mfrm.email.value.trim() == '' ) {
				alert( '????????? ???????????? ???????????? ?????????.' );
				return false;
			}
			document.mfrm.submit();
		};
		document.getElementById( 'submit3' ).onclick = function() {
			if( document.mfrm.name.value.trim() == '' ) {
				alert( '????????? ????????? ???????????? ?????????.' );
				return false;
			}
			document.mfrm.submit();
		};
	};
	</script>
</body>
</html>