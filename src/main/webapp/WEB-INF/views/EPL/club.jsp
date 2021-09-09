<%@page import="com.example.bootweb01.leagueTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%	
	String loginUser = (String)session.getAttribute("loginUser");

	leagueTO to = (leagueTO)request.getAttribute( "to" );
	
	String teamname = to.getTeamname();
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
<html>
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
    
    </br>
    <div class="btn-group">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type="button" value="클럽" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='./league.do'" />
		<input type="button" value="팀순위" class="btn_write btn_txt01" style="cursor: pointer;" onclick="" />
		<input type="button" value="역대기록" class="btn_write btn_txt01" style="cursor: pointer;" onclick="" />
	</div>
    
  </section>	
	<div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3">
        <div class="col">
          <div class="card shadow-sm">
          <br />
          <span align="center" style="font-size: 25px" class="txt_black"><%=teamname %></span>
          <br />
          <img align="center" src="<%=img %>" width="%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
            <div class="card-body">
              <p class="card-text"></p>
              <div class="d-flex justify-content-between align-items-center">
              </div>
            </div>
          </div>
        </div>
        
        <div class="rightBox">
			<table class="arsernaltable" border="0" cellspacing="0" cellpadding="0" border-collapse="collapse">
				<colgroup>
					<col width="50%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>창단년도</th>
						<td>&nbsp&nbsp&nbsp&nbsp<%=foundation %></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<br />
					<tr>
						<th>연고지</th>
						<td>&nbsp&nbsp&nbsp&nbsp<%=hometown %></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<th>홈구장</th>
						<td>&nbsp&nbsp&nbsp&nbsp<%=homestadium %></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<th>닉 네임</th>
						<td>&nbsp&nbsp&nbsp&nbsp<%=nickname %></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<th>프리미어리그 우승</th>
						<td>&nbsp&nbsp&nbsp&nbsp<%=prewin %></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<th>FA컵 우승</th>
						<td>&nbsp&nbsp&nbsp&nbsp<%=fawin %></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
						<tr>
						<th>리그컵 우승</th>
						<td>&nbsp&nbsp&nbsp&nbsp<%=leaguewin %></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<th>챔피언스리그 우승</th>
						<td>&nbsp&nbsp&nbsp&nbsp<%=chamwin %></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<th>유로파리그 우승</th>
						<td>&nbsp&nbsp&nbsp&nbsp<%=eurowin %></td>
					</tr>
				</tbody>
			</table>
		</div>
        
        
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