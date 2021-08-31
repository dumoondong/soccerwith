<%@page import="com.example.bootweb01.MemberTO"%>
<%@page import="com.example.bootweb01.SmallcodeTO"%>
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
    <div align="middle">
    	<div style="width:60px; margin:0px 0px 90px 0px;"></div>
		<form action="/action_page.php" class="was-validated">
			<div style="width:300px;" class="form-group">
				<label for="uname">회원 ID</label>
				<input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
				<div class="invalid-feedback">입력하세요</div>
			</div><br/>
			<div style="width:300px;" class="form-group">
				<label for="uname">회원등급</label>
				<select class="form-select" onchange="myFunction(this.value)" id="search" style="width:100%; height: 47px;"aria-label="Default select example">
				  <option selected="selected">등급 선택</option>
				</select>
			</div><br/>
			<div style="width:300px;" "class="form-group">
			    <label for="text">회원 이름</label>
			    <input type="text" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
			    <div class="invalid-feedback">입력하세요</div>
		    </div><br/>
		    <div style="width:300px;" "class="form-group">
			    <label for="text">핸드폰번호</label>
			    <input type="text" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
			    <div class="invalid-feedback">입력하세요</div>
		    </div><br/>
		    <div style="width:300px;" "class="form-group">
			    <label for="text">email</label>
			    <input type="text" class="form-control" id="pwd" placeholder="Enter password" name="pswd" required>
			    <div class="invalid-feedback">입력하세요</div>
		    </div><br/>
		    <input type="submit" value="수정" class="btn btn-secondary"/>
		    <button class="btn btn-secondary">삭제</button>
		    <button class="btn btn-secondary">취소</button>
		</form>
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

	function myFunction(input) {
		document.getElementById("largecode").value = input;
	}
   
  </script>
</body>
</html>