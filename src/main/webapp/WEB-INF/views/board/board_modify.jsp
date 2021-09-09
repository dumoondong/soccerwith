<%@page import="java.util.ArrayList"%>
<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@ page import="com.example.bootweb01.BoardTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<SmallcodeTO> datas = (ArrayList)request.getAttribute( "datas" ); // 소코드 리스트
	SmallcodeTO infoto = (SmallcodeTO)request.getAttribute( "tosc" ); //선택한 메뉴의 코드정보
	
	String selinfo = infoto.getSmallinfo(); //선택한 메뉴의 코드정보
	
	StringBuilder sbHtml = new StringBuilder(); // 소코드 검색
	StringBuilder sbHtml1 = new StringBuilder(); // 메뉴 소코드 검색  
	StringBuilder sbHtml2 = new StringBuilder(); // 전체 검색
	
	//메뉴 리스트
		for(SmallcodeTO to : datas) {
			String seq = to.getSeq();
			String smallcode = to.getSmallcode();
			String smallinfo = to.getSmallinfo();
			if(smallcode.equals("BD001")){		
				sbHtml2.append("<a class='navbar-brand' href='board.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
			}else{
				if(smallcode.equals("BD002")){
				}else{
					sbHtml1.append("<li class='nav-item'>");
					sbHtml1.append("<a class='nav-link' href='board.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
					sbHtml1.append("</li>");
				}
			}
		}

	
	BoardTO to = (BoardTO)request.getAttribute( "to" );
	
	String seq = to.getSeq();
	String title = to.getTitle();
	String content = to.getContent();
	String id = to.getId();
	String wdate = to.getWdate();
	String smallcode = to.getSmallcode();
	String hit = to.getHit();
	String recommend = to.getRecommend();
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
		    <%=sbHtml2 %>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor02">
		      <ul class="navbar-nav me-auto">
		      		<%=sbHtml1 %>
		      </ul>
		      <form class="d-flex">
		        <input class="form-control me-sm-2" type="text" placeholder="Search">
		        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
		      </form>
		    </div>
		  </div>
		</nav>
	</section>
	<div align="middle">
		<div style="width:60px; margin:0px 0px 70px 0px;"></div>
		<div style="font-size: 15px; margin:0px 0px -30px -1350px;" class="bold";><span  style="font-size: 25px" class="txt_blue">
		<%if(selinfo==null){%>전체<% }else{%>
		<%=selinfo %><%} %></span>게시판</div>
		
		<%if(loginUser != null){ %>		 <!--로그인 했을경우  -->
			<input type="hidden" name="id" value="<%=loginUser %>" />
			<%if(loginUser.equals(id)){ %><!--작성 id와 로그인한 id가 같을 경우 -->
				<div class="btn-group" style="margin: 0px 0px 40px 1290px;" role="group" aria-label="Basic example">
					<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='./board.do'">수정</button>
					<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='./board.do'">삭제</button>
					<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='./board.do'">목록</button>
				</div>
			<%}else{%>					<!-- 로그인id와 작성id가 같을경우 -->
				<button type="button" style="margin:0px 0px 40px 1380px;" class="btn btn-secondary btn-sm" onclick="location.href='./board.do'">목록</button>
			<%}}else{%>					<!-- 로그인 안했을경우 -->
			<button type="button" style="margin:0px 0px 40px 1380px;" class="btn btn-secondary btn-sm" onclick="location.href='./board.do'">목록</button>
		<%} %>
		<form action="board_write_ok.do" method="post" name="mfrm" >
			<div class="wrapper" style="text-align:left; width:60%;" >
				<div class="input-group">
				   <span style="width:70px;"class="input-group-text" id="basic-addon1">제목</span>
				   <div class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=title %></div>
				</div>
				<div class="input-group">
					<span style="width:70px;" class="input-group-text" id="basic-addon1">ID</span>
					<div class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=id %></div>
				</div>	
				<div class="input-group">
					<span style="width:70px;" class="input-group-text" id="basic-addon1">작성일</span>
					<div style="width:300px;" class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=wdate %></div>
					<span style="width:70px;" class="input-group-text" id="basic-addon1">조회수</span>
					<div style="text-align: center;" class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=hit %></div>
					<span style="width:70px;" class="input-group-text" id="basic-addon1">추천수</span>
					<div style="text-align: center;" class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=recommend %></div>
					<button style="width:70px;" type="button" class="btn btn-secondary btn-sm"><i class='bx bxs-like'></i></button>
				</div>	
				<div class="input-group">
					<span style="width:70px;" class="input-group-text">내용</span>
					<div style="overflow:scroll; height:600px;" class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=content %></div>
				</div>
			</div><br /><br /><br />
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
  
</script>
</body>
</html>