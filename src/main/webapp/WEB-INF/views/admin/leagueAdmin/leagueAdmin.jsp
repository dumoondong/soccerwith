<%@page import="com.example.bootweb01.leagueTO"%>
<%@page import="com.example.bootweb01.LargecodeTO"%>
<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%
	String loginUser = (String)session.getAttribute("loginUser");
	
	
	ArrayList<leagueTO> datas = (ArrayList)request.getAttribute( "datas" ); //EPL 리스트
	
	StringBuilder sbHtml = new StringBuilder();
	StringBuilder sbHtml1 = new StringBuilder();
	
	for( leagueTO to : datas ){
		String seq = to.getSeq();
		String teamname = to.getTeamname();
		String wri = to.getWri();
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
		
		sbHtml.append( "<tr class='table-secondary'>" );
		sbHtml.append( "	<td class='center'>" );
		sbHtml.append( "		<a href='./leagueEdit.do?seq=" + seq + "'>" + list + "</a>" );
		sbHtml.append( "	<td>" + teamname + "</td>" );
		sbHtml.append( "	<td>" + seq + "</td>" );
		sbHtml.append( "</tr>" );
		
		
	}
	
	
	
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
    	<h2 class="mt-4">클럽관리</h2>
    	<!-- 각 리그 리스트검색 -->
    	<div style="width:60px; margin:0px 0px 8px 0px;"></div>
    	<form action="search_lea.do" method="get" name="mfrm">
    		<!-- <select class="form-select" onchange="myFunction(this.value)" id="search" style="width:10%; height: 47px;"aria-label="Default select example">  -->
    		<!-- <option selected="selected">전체보기</option>  -->
    			<%=sbHtml1 %>
    		</select>
    		<input type="hidden" name="list" id="list"/>
    		<!-- <input style="width:60px; margin:-70px 0px 0px 320px;" type="submit" value="검색" class="btn btn-secondary"/> -->
    	</form>
    	<div style="width:60px; margin:0px 0px 96px 0px;"></div>
    	<table style="width:40%; text-align: center;" class="table table-hover">
    		<thead>
    			<tr>
    				<th width="20%" scope="col">리그</th>
			      	<th width="15%" scope="col">클럽이름</th>
			      	<th width="15%" scope="col">seq</th>
    			</tr>
    		</thead>
    		<tbody>
    			<%=sbHtml %>
    		</tbody>
    	</table>
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
		document.getElementById("league1").value = input;
	}

  </script>
</body>
</html>