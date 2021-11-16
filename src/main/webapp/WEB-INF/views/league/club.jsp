<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@page import="com.example.bootweb01.leagueTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%	
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<SmallcodeTO> menudatas = (ArrayList)request.getAttribute( "menudatas" ); // 메뉴를 만들기 위한 해당하는 smallcode 리스트
	String lists = (String)request.getAttribute( "list" ); // 넘겼던 smallcode 값 다시 받기

	
	StringBuilder MenuHtml = new StringBuilder();
	StringBuilder MenuHtml1 = new StringBuilder();
	
	//메뉴 리스트
	for(SmallcodeTO to : menudatas) {
		String seq = to.getSeq();
		String smallcode = to.getSmallcode();
		String smallinfo = to.getSmallinfo();
		
		//System.out.println(smallcode);
		//System.out.println(smallinfo);
		
		if(smallcode.equals("LE099")){
			MenuHtml1.append("<a class='navbar-brand' href='league.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
		}else{
			MenuHtml.append("<li class='nav-item'>");
			MenuHtml.append("<a class='nav-link' href='league.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
			MenuHtml.append("</li>");
		}
	}
	
	
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
	String wri = to.getWri();
%>
<html>
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  <div class="container-fluid">
	    <%=MenuHtml1 %>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	
	    <div class="collapse navbar-collapse" id="navbarColor02">
	      <ul class="navbar-nav me-auto">
	        <%=MenuHtml %>
	      </ul>
	    </div>
	  </div>
	</nav>
  </section>
	<div class="album py-5 bg-light">
    <div class="container">
    
		<div class="btn-group btn-group-lg">
			<input type="button" value="클럽" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./league.do?smallcode=<%=lists %>'" />
			<input type="button" value="팀순위" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./Rank.do?list=<%=lists %>'" />
			<input type="button" value="역대기록" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./Record.do?list=<%=lists %>'" />
		</div><br /><br />
	
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3" style="border :1px solid black;">
        <div class="col">
          <div class="card shadow-sm">
          <img style="margin-left : 20px; margin-top :30px;" align="center" src="./images/league/<%=img %>" width="85%" height="200px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
            <div class="card-body">
              <p class="card-text"></p>
              <div class="d-flex justify-content-between align-items-center">
              </div>
            </div>
          </div>
        </div>
        
        <div class="rightBox" >
			<table style="margin-left : 30px; width:410%;" class="arsernaltable"  cellspacing="0" cellpadding="0" border-collapse="collapse">
				<tbody >
					<tr>
						<th>팀명</th>
						<td><%=teamname %></td>
					</tr>
					<tr style="height : 40px; border-top:1px solid black; ">
						<th>창단년도</th>
						<td><%=foundation %></td>
					</tr>
					<tr style="height : 40px; border-top:1px solid black; ">
						<th>연고지</th>
						<td><%=hometown %></td>
					</tr>
					<tr style="height : 40px; border-top:1px solid black; ">
						<th>홈구장</th>
						<td><%=homestadium %></td>
					</tr>
					<tr style="height : 40px; border-top:1px solid black; ">
						<th>닉 네임</th>
						<td><%=nickname %></td>
					</tr>
					<tr style="height : 40px; border-top:1px solid black; ">
						<th>정규리그 우승</th>
						<td><%=prewin %></td>
					</tr>
					<tr style="height : 40px; border-top:1px solid black; ">
						<th>FA컵 우승</th>
						<td><%=fawin %></td>
					</tr>
					<tr style="height : 40px; border-top:1px solid black; ">
						<th>리그컵 우승</th>
						<td><%=leaguewin %></td>
					</tr>
					<tr style="height : 40px; border-top:1px solid black; ">
						<th>챔피언스리그 우승</th>
						<td><%=chamwin %></td>
					</tr>
					<tr style="height : 40px; border-top:1px solid black; border-bottom:1px solid black;  ">
						<th>유로파리그 우승</th>
						<td><%=eurowin %></td>
					</tr>
					<!-- <tr>
						<th>test</th>
						<td><input type="text" value=<%=eurowin %> ></td>
					</tr>-->
				</tbody>
			</table>
		</div>
        <div style="width:100%; border-top :1px solid black;">
			<h4 style="margin-top : 10px;">구단 소개</h4>
			<%=wri %>
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