<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@page import="com.example.bootweb01.leagueTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.ArrayList" %>
<%	
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<leagueTO> datas = (ArrayList)request.getAttribute( "datas" ); //테이블 내에 모든 데이터 값
	ArrayList<SmallcodeTO> menudatas = (ArrayList)request.getAttribute( "menudatas" ); // 메뉴를 만들기 위한 해당하는 smallcode 리스트
	ArrayList<leagueTO> listdata = (ArrayList)request.getAttribute( "listdata" ); //선택한 메뉴에 일치하는 데이터 리스트
	String code = (String)request.getAttribute( "code" ); // 넘겼던 smallcode 값 다시 받기
	
	StringBuilder sbHtml = new StringBuilder();
	StringBuilder MenuHtml = new StringBuilder();
	StringBuilder MenuHtml1 = new StringBuilder();
	
	//메뉴 리스트
	for(SmallcodeTO to : menudatas) {
		String seq = to.getSeq();
		String smallcode = to.getSmallcode();
		String smallinfo = to.getSmallinfo();
	
		if(smallcode.equals("LE099")){
			MenuHtml1.append("<a class='navbar-brand' href='admin_league.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
		}else{
			MenuHtml.append("<li class='nav-item'>");
			MenuHtml.append("<a class='nav-link' href='admin_league.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
			MenuHtml.append("</li>");
		}
	}
	
	if(code == null || code.equals("LE099")){
		for( leagueTO to : datas ) {
			String seq = to.getSeq();
			String wri = to.getWri();
			String teamname = to.getTeamname(); 
			String img = to.getImg();
			String list = to.getList();
			
			sbHtml.append("<div class= 'col'>");
			sbHtml.append("<div class= 'card shadow-sm'>");
			sbHtml.append("<a href='./admin_club.do?teamname="+teamname+"'>");
			sbHtml.append( "<img style='margin-left :0px; margin-top :30px;' align='center' src=./images/league/" +to.getImg()+" 'width='85%' height='200px' xmlns='http://www.w3.org/2000/svg' role='img' aria-label='Placeholder: Thumbnail'preserveAspectRatio='xMidYMid slice' focusable='false'><title>Placeholder</title><rect width='100%' height='100%' fill=''#55595c'/><text x='50%' y='50%' fill='#eceeef' dy='.3em'></text></svg><div class='card-body'>" );
			sbHtml.append("</a>");
			sbHtml.append("<div class= 'card-body'>");
			sbHtml.append("<p class= 'card-text' style='font-size:25px; margin-bottom : -20px; font-famile:'돋움';>"+teamname+"</>");
			sbHtml.append("<div class= 'btn-group'>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
	}else{
		for( leagueTO to : listdata ) {
			String seq = to.getSeq();
			String wri = to.getWri();
			String teamname = to.getTeamname(); 
			String img = to.getImg();
			String list = to.getList();
			
			//System.out.println("league이미지 : "+img);
			
			sbHtml.append("<div class= 'col'>");
			sbHtml.append("<div class= 'card shadow-sm'>");
			sbHtml.append("<a href='./admin_club.do?teamname="+teamname+"&list="+list+"'>");
			sbHtml.append( "<img style='margin-left :0px; margin-top :30px;' align='center' src=./images/league/" +to.getImg()+" 'width='85%' height='200px' xmlns='http://www.w3.org/2000/svg' role='img' aria-label='Placeholder: Thumbnail'preserveAspectRatio='xMidYMid slice' focusable='false'><title>Placeholder</title><rect width='100%' height='100%' fill=''#55595c'/><text x='50%' y='50%' fill='#eceeef' dy='.3em'></text></svg><div class='card-body'>" );
			sbHtml.append("</a>");
			sbHtml.append("<div class= 'card-body'>");
			sbHtml.append("<p class= 'card-text' style='font-size:25px; margin-bottom : -20px; font-famile:'돋움';>"+teamname+"</>");
			sbHtml.append("<div class= 'btn-group'>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
			sbHtml.append("</div>");
		}
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
		<%if(code == null || code.equals("LE099")){ %>
    		<div style="margin:0px 0px 80px 0px;"></div>
		<%}else{ %>
			<div class="btn-group btn-group-lg">
				<input type="button" value="팀순위" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./admin_Rank.do?list=<%=code %>'" />
				<input type="button" value="역대기록" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./admin_Record.do?list=<%=code %>'" />
				<button type="button" align="right" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="location.href='./leagueWrite.do?smallcode=<%=code %>'">추가</button>
			</div><hr />
		<%} %>
      <div align='middle' class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3">
     		<%=sbHtml %>              
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
  
	function myFunction(input) {
		document.getElementById("group").value = input;
	}
</script>
				
				
</body>
</html>