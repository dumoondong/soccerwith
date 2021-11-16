<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@page import="com.example.bootweb01.RecordTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<%	
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<SmallcodeTO> menudatas = (ArrayList)request.getAttribute( "menudatas" ); // 메뉴를 만들기 위한 해당하는 smallcode 리스트
	ArrayList<RecordTO> datasrecord = (ArrayList)request.getAttribute( "datasrecord" ); //Record 테이블 내의 list에 관한 값
	String listrecord = (String)request.getAttribute( "listrecord" ); //리그테이블 구분값
	
	StringBuilder MenuHtml = new StringBuilder();
	StringBuilder MenuHtml1 = new StringBuilder();
	StringBuilder sbHtml = new StringBuilder();
	
	//메뉴 리스트
	for(SmallcodeTO to : menudatas) {
		String seq = to.getSeq();
		String smallcode = to.getSmallcode();
		String smallinfo = to.getSmallinfo();
		
		//System.out.println(smallcode);
		//System.out.println(smallinfo);
		
		if(smallcode.equals("LE099")){
			MenuHtml1.append("<a class='navbar-brand' href='admin_league.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
		}else{
			MenuHtml.append("<li class='nav-item'>");
			MenuHtml.append("<a class='nav-link' href='admin_league.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
			MenuHtml.append("</li>");
		}
	}
	
	for( RecordTO to : datasrecord ) {
		String seq = to.getSeq();
		String season = to.getSeason();
		String leaguewin = to.getLeaguewin();
		String leaguecup = to.getLeaguecup();
		String list = to.getList();
		
		
		sbHtml.append( "<tr>" );
		sbHtml.append( "<th>" + season + "</th>");
		sbHtml.append( "<td>" + leaguewin + "</td>");
		sbHtml.append( "<td>" + leaguecup + "</td>");
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
	    	<input type="button" value="클럽" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./admin_league.do?smallcode=<%=listrecord %>'" />
			<input type="button" value="팀순위" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./admin_Rank.do?list=<%=listrecord %>'" />
    	</div><hr />
      <div align='middle' class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		    	<div align ="center">
					<table style="width:300%; text-align: center;" class="table table-hover">
						<thead>
							<tr>
						      <th scope="col">시즌</th>
						      <th scope="col">우승팀</th>
						      <th width="30%" scope="col">FA컵</th>
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