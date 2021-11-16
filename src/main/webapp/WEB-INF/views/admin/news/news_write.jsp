<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.bootweb01.newsTO"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%
	
String loginUser = (String)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/menustyle2.css">
<link rel="stylesheet" type="text/css" href="./css/board_list.css">
<!-- Boxicons CDN Link -->
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<!-- bootstrap css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- popper.js -->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<!-- bootstrap js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
</head>

<link rel="stylesheet" type="text/css" href="css/board_list.css">
<style type="text/css">
<!--
.board_pagetab {
	text-align: center;
}

.board_pagetab a {
	text-decoration: none;
	font: 12px verdana;
	color: #000;
	padding: 0 3px 0 3px;
}

.board_pagetab a:hover {
	text-decoration: underline;
	background-color: #f2f2f2;
}

.on a {
	font-weight: bold;
}
-->
</style>



<body>



	<!-- 상단메뉴 -->
	<jsp:include page="../admin_module/admin_topmenu.jsp" />
	<!-- 왼쪽메뉴 -->
	<div class="sidebar close">
		<jsp:include page="../admin_module/admin_leftmenu.jsp" />
	</div>
	<br />
	<br />
	<br />
	<section class="home-section">
		<div class="home-content">
			<i class='bx bx-menu'></i>
		</div>

	</section>
	<!-- 상단 디자인 -->

	<div style="margin: -40px 0px 0px 0px;"></div>



	<form action=newswriteOK.do name="submit" method="post"
		enctype="multipart/form-data">
		<section class="py-5" style="padding: 10px 150px 0px 300px;">
			<!--  좌우 여백 -->
			<div
				style="padding: 0px 50px 0px 50px; margin: 0px 0px 0px 0px; border: 3px ridge black; border-radius: 25px;">
				<div class="row gx-4 gx-lg-5 align-items-center"
					style="margin: 0px 0px 0px 0px;">
					<h5 style="margin: 40px 0px 0px 0px;">
						<!-- 분류 부분 select 로 선택 -->
						<label for="exampleSelect1" class="form-label mt-4">뉴스 분류
							선택</label> <select class="form-select" name="classify"
							id="exampleSelect1"
							style="width: 250px; height: 50px; font-size: 15px;">
							<option value="국내뉴스">국내뉴스</option>
							<option value="해외뉴스">해외뉴스</option>
							<option value="은퇴선수">은퇴선수</option>
							<option value="꿈나무들">꿈나무들</option>
						</select> <br />
					</h5>

					<h6 class="display-5 fw-bolder"
						style="margin: 0px 0px 20px 0px; border-bottom: 3px ridge black; font-size: 23px;">
						<!-- 제목입력 -->
						제목 <input type="text" name="newstitle" value=""
							style="width: 500px; height: 30px; font-size: 15px;">
					</h6>
					<!-- ID 자동으로 넘기기 -->
					<input type="hidden" name="id" value="<%=loginUser%>">
					<!-- 등록일 자동등록부분 -->
					<input type="hidden" name="newswdate" value="">
					
					
<!--	이미지 추가생성 부분


 						<div class="form-group" id="file-list">
					       <a href="#this" onclick="addFile()">파일추가</a>
					    	<div class="file-group">
					            <input type="file" name="file"><a href='#this' name='file-delete'>삭제</a>
					        </div>
					    </div> -->
					<div class="inputArea">

						<label for="gdsImg">이미지</label> <input type="file" id="gdsImg"
							name="newsimage" />
						<div class="select_img">
							<img src="" />
						</div>
						<!-- 경로 확인 -->
					
						<%=request.getRealPath("/") %>
						
						
						<div class="fs-5 mb-5">
							<span class="text"></span>
						</div>
						<h4 class="content">
							<textarea name="newscontent" class="board_editor_area"
								style="width: 1000px; height: 350px;"></textarea>
						</h4>
						<!-- 버튼 우측고정 -->
						<div style="padding: 50px 0px 50px 1050px;">
							<ul>
								<input type="submit" value="쓰기" class="btn btn-secondary" />
								<button type="button" class="btn btn-secondary"
									onclick="location.href='admnewstemplate.do'">목록</button>
							</ul>
						</div>
					</div>
				</div>
		</section>
	</form>




	<!--//하단 디자인 -->
	<script>
	// 이미지 추가업로드 및 취소 부분 
 /*     $(document).ready(function() {
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    })
 
    function addFile() {
        var str = "<div class='file-group'><input type='file' name='newsimage'><a href='#this' name='file-delete'>삭제</a></div>";
        $("#file-list").append(str);
        $("a[name='file-delete']").on("click", function(e) {
            e.preventDefault();
            deleteFile($(this));
        });
    }
 
    function deleteFile(obj) {
        obj.parent().remove();
    }
 
 */
	
	
	
  // 이미지 업로드 및 페이지에서 자가 확인
  $("#gdsImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
  
  
  function classifycheck(){
	  i=document.submit.classify.selectedIndex // 선택항목의 인덱스 번호
	  var mail=document.submit.classify.options[i].value // 선택항목 value
	  document.submit.classify.value=""
	 }
  
  
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