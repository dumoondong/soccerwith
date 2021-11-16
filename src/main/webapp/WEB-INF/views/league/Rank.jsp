<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@page import="com.example.bootweb01.RankTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<%	
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<SmallcodeTO> menudatas = (ArrayList)request.getAttribute( "menudatas" ); // 메뉴를 만들기 위한 해당하는 smallcode 리스트
	String lists = (String)request.getAttribute( "lists" );
	ArrayList<RankTO> datas = (ArrayList)request.getAttribute( "datas" );//팀순위 테이블 모든 값
	ArrayList<RankTO> datasrank = (ArrayList)request.getAttribute( "datasrank" ); //팀순위 테이블내에 list값
	String listrank = (String)request.getAttribute( "listrank" ); //랭크테이블 구분값
	
	StringBuilder sbHtml = new StringBuilder();
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
	
	
	
	for( RankTO to : datasrank ) {
		String seq = to.getSeq();
		String ranking = to.getRanking();
		String teamname = to.getTeamname();
		String winp = to.getWinp();
		String game = to.getGame();
		String win = to.getWin();
		String draw = to.getDraw();
		String defeat = to.getDefeat();
		String scorep = to.getScorep();
		String losep = to.getLosep();
		String goalp = to.getGoalp();
		String list = to.getList();
		
		sbHtml.append( "<tr>" );
		sbHtml.append( "<th>" + ranking + "</th>");
		sbHtml.append( "<td>" + teamname + "</td>");
		sbHtml.append( "<td>" + winp + "</td>");
		sbHtml.append( "<td>" + game + "</td>");
		sbHtml.append( "<td>" + win + "</td>");
		sbHtml.append( "<td>" + draw + "</td>");
		sbHtml.append( "<td>" + defeat + "</td>");
		sbHtml.append( "<td>" + scorep + "</td>");
		sbHtml.append( "<td>" + losep + "</td>");
		sbHtml.append( "<td>" + goalp + "</td>");
		sbHtml.append( "</tr>" );
		}
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
			<input type="button" value="클럽" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./league.do?smallcode=<%=listrank %>'" />
			<input type="button" value="역대기록" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./Record.do?list=<%=listrank %>'" />
		</div><hr />

      <div align='middle' class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
    	<div align ="center">
		<table style="width:300%; text-align: center;" class="table table-hover">
			<thead>
				<tr>
			      <th scope="col">순위</th>
			      <th scope="col">팀명</th>
			      <th scope="col">경기</th>
			      <th scope="col">승점</th>
			      <th scope="col">승</th>
			      <th scope="col">무</th>
			      <th scope="col">패</th>
			      <th scope="col">득점</th>
			      <th scope="col">실점</th>
			      <th width="8%" scope="col">득실차</th>
			      <!-- width="20%"  -->
			    </tr>
		    </thead>
		 	<tbody>
		 			<%=sbHtml %>
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