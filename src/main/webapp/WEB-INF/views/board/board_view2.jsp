<%@page import="com.example.bootweb01.RecommendTO"%>
<%@page import="com.example.bootweb01.CommentTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@ page import="com.example.bootweb01.BoardTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginUser = (String)session.getAttribute("loginUser");
	ArrayList<SmallcodeTO> datas = (ArrayList)request.getAttribute( "datas" ); // 소코드 리스트
	ArrayList<CommentTO> comadatas = (ArrayList)request.getAttribute( "comadatas" ); // 댓글 리스트
	ArrayList<CommentTO> likedatas = (ArrayList)request.getAttribute( "likedatas" ); // 댓글 리스트
	SmallcodeTO infoto = (SmallcodeTO)request.getAttribute( "tosc" ); //선택한 메뉴의 코드정보
	
	String selinfo = infoto.getSmallinfo(); //선택한 메뉴의 코드정보
	
	StringBuilder sbHtml = new StringBuilder(); // 댓글 출력
	StringBuilder lkHtml = new StringBuilder(); // 댓글 추천순 출력
	StringBuilder sbHtml1 = new StringBuilder(); // 메뉴 소코드 검색  
	StringBuilder sbHtml2 = new StringBuilder(); // 전체 검색
	StringBuilder reHtml = new StringBuilder(); // 게시글 추천
	
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
	CommentTO countTo = (CommentTO)request.getAttribute( "countTo" );	//댓글 개수
	String count = countTo.getCount();
	
   	//댓글 리스트
	for(CommentTO to : comadatas) {
		String seq = to.getSeq();	
		
		//System.out.println("test : " + seq);
		String pseq = to.getPseq();	
		String id = to.getId();		
		String wdate = to.getWdate();
		String content = to.getContent();
		String recommend = to.getRecommend();
		sbHtml.append("<div class='input-group'>");
		sbHtml.append("<h6>"+id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+wdate+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bxs-like'></i>"+recommend+"");
		if(id.equals(loginUser)){
			sbHtml.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='/comment_delete.do?id="+loginUser+"&seq="+seq+"&pseq="+pseq+"'>삭제</a>");
		}
		sbHtml.append("</h6>");
		sbHtml.append("</div><br />");
		sbHtml.append("<div class='input-group'>");
		//sbHtml.append("<textarea readonly='readonly' class='form-control' aria-label='With textarea'>"+content+"</textarea>");
		sbHtml.append("<div style='width:100; word-break:break-all;word-wrap:break-word;'>"+content+"</div>");
		sbHtml.append("</div><br />");	
		
		sbHtml.append("<div>");	
		sbHtml.append("<button style='width:70px;' type='button' class='btn btn-outline-dark btn-sm'>답글</button>");	
		if(loginUser != null){
			sbHtml.append("<a href='./comment_Recommend.do?id="+loginUser+"&seq="+seq+"&pseq="+pseq+"' <button style='width:70px; float: right;' type='button' class='btn btn-primary btn-sm'><i class='bx bxs-like'></i></button></a>");
		}
		sbHtml.append("</div><hr />");	
	}
   	
	//댓글 추천순 리스트
	for(CommentTO to : likedatas) {
		String seq = to.getSeq();	
		String pseq = to.getPseq();	
		String id = to.getId();		
		String wdate = to.getWdate();
		String content = to.getContent();
		String recommend = to.getRecommend();
		lkHtml.append("<div class='input-group'>");
		lkHtml.append("<h6>"+id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+wdate+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bxs-like'></i>"+recommend+"");
		if(id.equals(loginUser)){
			lkHtml.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='/comment_delete.do?id="+loginUser+"&seq="+seq+"&pseq="+pseq+"'>삭제</a>");
		}
		lkHtml.append("</h6>");
		lkHtml.append("</div><br />");
		lkHtml.append("<div class='input-group'>");
		lkHtml.append("<div style='width:100; word-break:break-all;word-wrap:break-word;'>"+content+"</div>");
		lkHtml.append("</div><br />");	
		
		lkHtml.append("<div>");	
		lkHtml.append("<button style='width:70px;' type='button' class='btn btn-outline-dark btn-sm'>답글</button>");	
		if(loginUser != null){
			lkHtml.append("<a href='./comment_Recommend.do?id="+loginUser+"&seq="+seq+"&pseq="+pseq+"' <button style='width:70px; float: right;' type='button' class='btn btn-primary btn-sm'><i class='bx bxs-like'></i></button></a>");
		}
		lkHtml.append("</div><hr />");		
	}
/*  	ArrayList<RecommendTO> Joindatas = (ArrayList)request.getAttribute( "Joindatas" ); // 댓글 리스트
	//댓글 리스트
	for(RecommendTO to : Joindatas) {
		String pseq = to.getPseq();	//추천 달린 pseq
		String seq = to.getSeq();	//게시글 seq
		String tseq = to.getTseq();	//모든댓글 seq  댓글리스트 seq
		String wdate = to.getWdate();
		String id = to.getComid();
		String content = to.getContent();
		String recommend = to.getRecommend();
		String writeid = to.getWriteid();	// =id
		System.out.println("test : " +writeid);
		
		
		sbHtml.append("<div class='input-group'>");
		sbHtml.append("<h6>"+writeid+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+wdate+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='bx bxs-like'></i>"+recommend+"</h6>");
		sbHtml.append("</div>");
		sbHtml.append("<div class='input-group'>");
		sbHtml.append("<textarea readonly='readonly' class='form-control' aria-label='With textarea'>"+content+"</textarea>");
		if(loginUser != null){
			sbHtml.append("<a href='./comment_Recommend.do?id="+loginUser+"&seq="+tseq+"&pseq="+seq+"' <button style='width:70px;' type='button' class='btn btn-primary btn-sm'><i class='bx bxs-like'></i></button></a>");
		}
		sbHtml.append("</div>"); 
	} */
	
	BoardTO to = (BoardTO)request.getAttribute( "to" );	//게시글 뷰
	
	String seq = to.getSeq();
	String title = to.getTitle();
	String content = to.getContent();
	String id = to.getId();
	String wdate = to.getWdate();
	String smallcode = to.getSmallcode();
	String hit = to.getHit();
	String recommend = to.getRecommend();
	
	
	if(loginUser != null){	//로그인 한상태일때만 추천 가능
		RecommendTO to2 = (RecommendTO)request.getAttribute( "to2" );
		String likeseq = to2.getSeq();
		String likeid = to2.getBoid();

		if(loginUser.equals(likeid) && likeseq.equals(seq)){
			reHtml.append("<a href='./board_cancel.do?id="+loginUser+"&seq="+seq+"' <button style='width:70px;' type='button' class='btn btn-secondary btn-sm'><i class='bx bxs-like'></i></button></a>");
		}else{
			reHtml.append("<a href='./board_Recommend.do?id="+loginUser+"&seq="+seq+"' <button style='width:70px;' type='button' class='btn btn-primary btn-sm'><i class='bx bxs-like'></i></button></a>");
		}
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
		<div style="font-size: 15px; margin:0px 0px -30px -1350px;" class="bold";><span  style="font-size: 25px;" class="txt_blue">
		<%if(selinfo==null){%>전체<% }else{%>
		<%=selinfo %><%} %></span>게시판</div>
		
		<%if(loginUser != null){ %>		 <!--로그인 했을경우  -->
			<input type="hidden" name="id" value="<%=loginUser %>" />
			<%if(loginUser.equals(id)){ %><!--작성 id와 로그인한 id가 같을 경우 -->
				<div class="btn-group" style="margin: 0px 0px 40px 1290px;" role="group" aria-label="Basic example">
					<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='./board_modify.do?seq=<%=seq %>&id=<%=id%>&smallcode=<%=smallcode %>'">수정</button>
					<button type="button" class="btn btn-secondary btn-sm" onclick="deleteok()">삭제</button>
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
					<%if(loginUser != null){ %>
					
					<%-- <%if(seq.equals("") && id.equals("")){ %>
						<button style="width:70px;" type="button" class="btn btn-secondary btn-sm" onclick="location.href='./board_Recommend.do?id=<%=loginUser%>&seq=<%=seq %>&name=cancel'"><i class='bx bxs-like'></i></button>
					<%}else{ %>
						<button style="width:70px;" type="button" class="btn btn-primary btn-sm" onclick="location.href='./board_Recommend.do?id=<%=loginUser%>&seq=<%=seq %>&name=like'"><i class='bx bxs-like' ></i></button>
					<%} %> --%>
					<%=reHtml %>
					
					<%} %>
				</div>	
				<div class="input-group">
					<span style="width:70px;" class="input-group-text">내용 </span>
					<div style="overflow:scroll; height:600px;" class="form-control"  aria-label="Username" aria-describedby="basic-addon1"><%=content %></div>
				</div>
		</form><br />
		<h4>댓글 : <%=count %>개</h4>
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" data-bs-toggle="tab" href="#home">추천순</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-bs-toggle="tab" href="#profile">최신순</a>
		  </li>
		</ul>
		<div id="myTabContent" class="tab-content">
		  <div class="tab-pane fade active show" id="home">
		    <%=lkHtml %>
		  </div>
		  <div class="tab-pane fade" id="profile">
		  	<%=sbHtml %>
		  </div>
		</div>
		<%if(loginUser == null) {}else{%>
		<form action="comment_write_ok.do" method="post" name="mfrm" >
			<div class="input-group">
				 <h4>댓글쓰기</h4>
			</div>
			<div class="input-group">
				 <h6>ID : <%=loginUser %></h6>
			</div>
			<div class="input-group">
			  <textarea class="form-control" name="content" aria-label="With textarea"></textarea>
			  <input type="hidden" name="seq" value="<%=seq %>"/>
			  <input type="hidden" name="id" value="<%=loginUser %>"/>
			  <input type="submit" value="등록" class="btn btn-secondary"/>
			</div>
			</div><br /><br /><br />
		</form>
		<%}%>
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

  function deleteok() {
      if (!confirm("삭제하시겠습니까?")) {
      } else {
    	  location.href="board_delete_ok.do?seq=<%=seq%>";    
      }
  }
  

</script>
</body>
</html>