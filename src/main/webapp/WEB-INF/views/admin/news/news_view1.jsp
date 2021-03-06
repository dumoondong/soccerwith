<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.example.bootweb01.newsTO"%>

<%
	newsTO to2 = (newsTO)request.getAttribute( "to2" );
	
	String seq = request.getParameter( "seq" );
	String newstitle = to2.getNewstitle();
	String newswdate = to2.getNewswdate();
	String newscontent = to2.getNewscontent();
	String newsimage = to2.getNewsimage();
	String id = to2.getId();
	String classify = to2.getClassify();
	int newsview = to2.getNewsview();
	
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="./css/menustyle2.css">
		<link rel="stylesheet" type="text/css" href="./css/board_list.css">
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
	
<link rel="stylesheet" type="text/css" href="css/board_list.css">
<style type="text/css">
<!--
	.board_pagetab { text-align: center; }
	.board_pagetab a { text-decoration: none; font: 12px verdana; color: #000; padding: 0 3px 0 3px; }
	.board_pagetab a:hover { text-decoration: underline; background-color:#f2f2f2; }
	.on a { font-weight: bold; }
-->
</style>



<body>



	<!-- ???????????? -->
	<jsp:include page="../admin_module/admin_topmenu.jsp" />
	<!-- ???????????? -->
	<div class="sidebar close">
		<jsp:include page="../admin_module/admin_leftmenu.jsp" />
	</div>
	<br /><br /><br />
	<section class="home-section">
    <div class="home-content">
      <i class='bx bx-menu' ></i>
    </div>
    
    
    <!-- ?????? ????????? -->
  </section>
  <div style="margin:-40px 0px 0px 0px;">
  </div>
<section class="py-5" style="padding: 10px 150px 0px 300px;">
			<!--  ?????? ?????? -->
            <div style="padding:0px 50px 0px 50px; margin: 0px 0px 0px 0px; border: 3px ridge black; border-radius: 25px;">
                <div class="row gx-4 gx-lg-5 align-items-center" style="margin: 0px 0px 0px 0px;">
                		<h1 style="margin: 40px 0px 20px 0px;">[<%=classify %>]</h1>
                        <h1 class="display-5 fw-bolder" style="border-bottom: 3px ridge black;"><%=newstitle %></h1>
                        <h6>?????????:<%=id %> </h6>
                        <h5>????????????:<%=newswdate%></h5>
                        <img src="./images/news/<%=newsimage%>" align="middle" style="width:800px; height:500px;">
                        
                        <div class="fs-5 mb-5">
                            <span class="text"></span>
                        </div>
                        <h4 class="content" name="newscontent">
                        <%=newscontent%>
                        </h4>
                        <!-- ?????? ???????????? -->
                        <div style="padding: 50px 0px 50px 1050px;">
                        <ul>
                        	<button type="button" class="btn btn-secondary" onclick="location.href='admnewstemplate.do'">
           					??????
           					</button>
                            <button type="button" class="btn btn-secondary" onclick="location.href='./newsedit.do?seq=<%=seq %>'">
           					??????
           					</button>
           					<button type="button" class="btn btn-secondary" onclick="location.href='./newsDelete_ok.do?seq=<%=seq %>'">
           					??????
           					</button>
                            </ul>
                    </div>
                </div>
            </div>
        </section>



		<!--//?????? ????????? -->
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