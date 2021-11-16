<%@page import="com.example.bootweb01.BoardTO"%>
<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.bootweb01.ServiceTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<SmallcodeTO> datas = (ArrayList)request.getAttribute( "datas" ); // 메뉴를 만들기 위한 게시판에 해당하는 smallcode 리스트
	ArrayList<BoardTO> codedatas = (ArrayList)request.getAttribute( "codedatas" ); // 해당데이터 게시판 리스트
	String code = (String)request.getAttribute( "code" ); // 넘겼던 smallcode 값 다시 받기
	ArrayList<BoardTO> alldatas = (ArrayList)request.getAttribute( "alldatas" ); // 게시판 모든 리스트
	ArrayList<BoardTO> voguedatas = (ArrayList)request.getAttribute( "voguedatas" ); // 게시판 모든 리스트
	SmallcodeTO infoto = (SmallcodeTO)request.getAttribute( "tosc" ); //선택한 메뉴의 코드정보
	
	ArrayList<BoardTO> TitleDatas = (ArrayList)request.getAttribute( "TitleDatas" ); // 해당데이터 게시판 리스트
	ArrayList<BoardTO> idDatas = (ArrayList)request.getAttribute( "idDatas" ); // 해당데이터 게시판 리스트
	
	
	String selinfo = infoto.getSmallinfo(); //선택한 메뉴의 코드정보
	
	StringBuilder sbHtml = new StringBuilder(); // 메뉴 소코드 검색  
	StringBuilder sbHtml1 = new StringBuilder(); // 전체 검색
	StringBuilder SCHtml1 = new StringBuilder(); // small코드에 해당하는 테이블
	
	//메뉴 리스트
	for(SmallcodeTO to : datas) {
		String seq = to.getSeq();
		String smallcode = to.getSmallcode();
		String smallinfo = to.getSmallinfo();
		if(smallcode.equals("BD001")){		
			sbHtml1.append("<a class='navbar-brand' href='admin_board.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
		}else{
			if(smallcode.equals("BD002")){
			}else{
				sbHtml.append("<li class='nav-item'>");
				sbHtml.append("<a class='nav-link' href='admin_board.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
				sbHtml.append("</li>");
			}
		}
	}
	
	
	if(TitleDatas != null || idDatas !=null){
		if(TitleDatas != null){
			for(BoardTO to : TitleDatas) {
				String seq = to.getSeq();
				String title = to.getTitle();
				String id = to.getId();
				String wdate = to.getWdate();
				String hit = to.getHit();
				String smallcode = to.getSmallcode();
				String smallinfo = to.getSmallinfo();
				//System.out.println(smallinfo2);
				String recommend = to.getRecommend();
				int wgap = to.getWgap();
				
				SCHtml1.append("<tr class='table table-hover'>");
				SCHtml1.append("<td width='5%'>"+smallinfo+"</td>");
				SCHtml1.append("<th width='5%' scope='row'>"+seq+"</th>");
				SCHtml1.append( "<td class='left'>" );
				SCHtml1.append( "<a href='./admin_board_view.do?seq="+seq+"&id="+id+"&smallcode="+smallcode+"&loginUser="+loginUser+"'>" + title + "</a>" );
				if( wgap == 0 ) {
					SCHtml1.append( "	&nbsp;<img src='./images/icon_new.gif' alt='NEW'>" );
				}
				SCHtml1.append( "	</td>" );
				SCHtml1.append("<td width='15%'>"+id+"</td>");
				SCHtml1.append("<td width='15%'>"+wdate+"</td>");
				SCHtml1.append("<td width='5%'>"+hit+"</td>");
				SCHtml1.append("<td width='5%'>"+recommend+"</td>");
				SCHtml1.append("</tr>");
			}
		}else if(idDatas != null){
			for(BoardTO to : idDatas) {
				String seq = to.getSeq();
				String title = to.getTitle();
				String id = to.getId();
				String wdate = to.getWdate();
				String hit = to.getHit();
				String smallcode = to.getSmallcode();
				String smallinfo = to.getSmallinfo();
				//System.out.println(smallinfo2);
				String recommend = to.getRecommend();
				int wgap = to.getWgap();
				
				SCHtml1.append("<tr class='table table-hover'>");
				SCHtml1.append("<td width='5%'>"+smallinfo+"</td>");
				SCHtml1.append("<th width='5%' scope='row'>"+seq+"</th>");
				SCHtml1.append( "<td class='left'>" );
				SCHtml1.append( "<a href='./admin_board_view.do?seq="+seq+"&id="+id+"&smallcode="+smallcode+"&loginUser="+loginUser+"'>" + title + "</a>" );
				if( wgap == 0 ) {
					SCHtml1.append( "	&nbsp;<img src='./images/icon_new.gif' alt='NEW'>" );
				}
				SCHtml1.append( "	</td>" );
				SCHtml1.append("<td width='15%'>"+id+"</td>");
				SCHtml1.append("<td width='15%'>"+wdate+"</td>");
				SCHtml1.append("<td width='5%'>"+hit+"</td>");
				SCHtml1.append("<td width='5%'>"+recommend+"</td>");
				SCHtml1.append("</tr>");
			}
		}
	}else{
		if(code == null || code.equals("BD001")){  //전체 게시판 데이터 출력
			for(BoardTO to : alldatas) {
				String seq = to.getSeq();
				String title = to.getTitle();
				String id = to.getId();
				String wdate = to.getWdate();
				String hit = to.getHit();
				String smallcode = to.getSmallcode();
				String smallinfo = to.getSmallinfo();
				System.out.println(smallcode);
				//System.out.println(smallinfo2);
				String recommend = to.getRecommend();
				int wgap = to.getWgap();
				if(smallcode.equals("BD099")){
				}else{
					SCHtml1.append("<tr class='table table-hover'>");
					SCHtml1.append("<td width='5%'>"+smallinfo+"</td>");
					SCHtml1.append("<th width='5%' scope='row'>"+seq+"</th>");
					SCHtml1.append( "<td class='left'>" );
					SCHtml1.append( "<a href='./admin_board_view.do?seq="+seq+"&id="+id+"&smallcode="+smallcode+"&loginUser="+loginUser+"'>" + title + "</a>" );
					if( wgap == 0 ) {
						SCHtml1.append( "	&nbsp;<img src='./images/icon_new.gif' alt='NEW'>" );
					}
					SCHtml1.append( "	</td>" );
					SCHtml1.append("<td width='15%'>"+id+"</td>");
					SCHtml1.append("<td width='15%'>"+wdate+"</td>");
					SCHtml1.append("<td width='5%'>"+hit+"</td>");
					SCHtml1.append("<td width='5%'>"+recommend+"</td>");
					SCHtml1.append("</tr>");
				}
			}
		}else if(code == null || code.equals("BD098")){  //인기 게시판 데이터 출력
			for(BoardTO to : voguedatas) {
				String seq = to.getSeq();
				String title = to.getTitle();
				String id = to.getId();
				String wdate = to.getWdate();
				String hit = to.getHit();
				String smallcode = to.getSmallcode();
				String smallinfo = to.getSmallinfo();
				String recommend = to.getRecommend();
				int wgap = to.getWgap();
				
				if(smallcode.equals("BD099")){
				}else{
					SCHtml1.append("<tr class='table table-hover'>");
					SCHtml1.append("<td width='5%'>"+smallinfo+"</td>");
					SCHtml1.append("<th width='5%' scope='row'>"+seq+"</th>");
					SCHtml1.append( "<td class='left'>" );
					SCHtml1.append( "<a href='./admin_board_view.do?seq="+seq+"&id="+id+"&smallcode="+smallcode+"&loginUser="+loginUser+"'>" + title + "</a>" );
					if( wgap == 0 ) {
						SCHtml1.append( "	&nbsp;<img src='./images/icon_new.gif' alt='NEW'>" );
					}
					SCHtml1.append( "	</td>" );
					SCHtml1.append("<td width='15%'>"+id+"</td>");
					SCHtml1.append("<td width='15%'>"+wdate+"</td>");
					SCHtml1.append("<td width='5%'>"+hit+"</td>");
					SCHtml1.append("<td width='5%'>"+recommend+"</td>");
					SCHtml1.append("</tr>");
				}
			}
		}else{
			for(BoardTO to : codedatas) { //small코드에 해당하는 데이터 출력
				String seq = to.getSeq();
				String title = to.getTitle();
				String id = to.getId();
				String wdate = to.getWdate();
				String hit = to.getHit();
				String smallcode = to.getSmallcode();
				String recommend = to.getRecommend();
				int wgap = to.getWgap();
				
				SCHtml1.append("<tr class='table table-hover'>");
				SCHtml1.append("<th width='5%' scope='row'>"+seq+"</th>");
				SCHtml1.append( "<td class='left'>" );
				SCHtml1.append( "<a href='./admin_board_view.do?seq="+seq+"&id="+id+"&smallcode="+smallcode+"&loginUser="+loginUser+"'>" + title + "</a>" );
				if( wgap == 0 ) {
					SCHtml1.append( "	&nbsp;<img src='./images/icon_new.gif' alt='NEW'>" );
				}
				SCHtml1.append( "	</td>" );
				SCHtml1.append("<td width='15%'>"+id+"</td>");
				SCHtml1.append("<td width='15%'>"+wdate+"</td>");
				SCHtml1.append("<td width='5%'>"+hit+"</td>");
				SCHtml1.append("<td width='5%'>"+recommend+"</td>");
				SCHtml1.append("</tr>");
			}
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
		    <%=sbHtml1 %>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor02">
		      <ul class="navbar-nav me-auto">
					<%=sbHtml %>
		      </ul>      
		      <form action="admin_board.do"  method="post" name="wfrm" class="d-flex">
		      	<select style="width:130px; margin:0px 2px 0px 0px;" class="form-select" onchange="myFunction(this.value)" aria-label="Default select example">
					<option selected>구분</option>
					<option name="choice" value="title">제목</option>
					<option name="choice" value="id">아이디</option>
					<input type="hidden" name="choice" id="choice"/>
				</select>
		        <input style="width:300px; class="form-control me-sm-2" type="text" name="search" placeholder="검색내용">
		        <button id="submit1" class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
		      </form>
		    </div>
		  </div>
		</nav>
	</section>
	
	<div class="wrapper" >
	<div align="container" style="margin :0px 0px 150px 300px; border:0px solid; padding:100px">
		<div style="width:1000px; margin:10px 200px 10px 10px;"></div>
		<div style="font-size: 15px; margin:0px 500px 0px 0px;" class="bold";><span  style="font-size: 25px" class="txt_blue">
		<%if(selinfo==null){%>전체<% }else{%>
		<%=selinfo %><%} %>&nbsp&nbsp</span>게시판</div>
		<%if(loginUser == null){%><br /><% }else{ %>
		<button type="button" style="margin:0px 0px 0px 1650px;" class="btn btn-secondary btn-sm" onclick="location.href='./admin_board_write.do'">글쓰기</button>
		<%} %>
		
		<br /><br />
		
		<table style="width:90%; text-align: center;" class="table table-hover">
		  <thead>
		    <tr>
		    <%if(code == null || code.equals("BD001") || code.equals("BD098")){ %>
		      <th scope="col">분류</th>
		      <%}else{} %>
		      <th scope="col">번호</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">일 시</th>
		      <th scope="col">조회수</th>
		      <th scope="col"><i class='bx bxs-like'></th>
		    </tr>
		  </thead>
		  <tbody>
			<%=SCHtml1 %>
		  </tbody>
		</table>
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
  
$('#all_select').click(function() {
	if ($("input:checkbox[id='all_select']").prop("checked")){
		$("input[type=checkbox]").prop("checked",true);
	}else{
		$("input[type=checkbox]").prop("checked",false);
	}
});

function myFunction(input) {
	document.getElementById("choice").value = input;
}

window.onload = function() {
	document.getElementById('submit1').onclick = function() {
 		if( document.wfrm.choice.value.trim() == '' ) {
			alert( '분류를 선택하세요.' );
			return false;
		}
		document.wfrm.submit();
	};
};
</script>
</body>
</html>