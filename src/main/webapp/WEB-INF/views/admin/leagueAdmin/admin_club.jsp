<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@page import="com.example.bootweb01.leagueTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<%	
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<SmallcodeTO> menudatas = (ArrayList)request.getAttribute( "menudatas" ); // 메뉴를 만들기 위한 해당하는 smallcode 리스트
	String lists = (String)request.getAttribute( "list" ); // 넘겼던 smallcode 값 다시 받기
	ArrayList<SmallcodeTO> datas = (ArrayList)request.getAttribute( "datas" ); //리그 선택 소코드 리스트
	StringBuilder MenuHtml = new StringBuilder();
	StringBuilder MenuHtml1 = new StringBuilder();
	
	StringBuilder sbHtml = new StringBuilder(); // 소코드 리스트
	
	for(SmallcodeTO to : datas) {
		String seq = to.getSeq();
		String smallcode = to.getSmallcode();
		String smallinfo = to.getSmallinfo();
		if(smallcode.equals("LE099")){	
		}else{
			sbHtml.append("<option name='group' value='"+smallcode+"'>"+smallinfo+"</option>");
		}
	}
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
	
	leagueTO to = (leagueTO)request.getAttribute( "to" );
	
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
	
	System.out.println("club 이미지:"+img);
%>
<html>
  <head>
    <meta charset="UTF-8">
     <!-- SmartEditor2 라이브러리 -->
    <script type="text/javascript" src="./smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script> 
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
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
			<input type="button" value="클럽" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./admin_league.do?smallcode=<%=lists %>'" />
			<input type="button" value="팀순위" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./admin_Rank.do?list=<%=lists %>'" />
			<input type="button" value="역대기록" class="btn btn-secondary my-2 my-sm-0" style="cursor: pointer;" onclick="location.href='./admin_Record.do?list=<%=lists %>'" />
		</div><br /><br />

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3">
       <div class="col">
          <div class="card shadow-sm">
          	<!-- <div class="select_img"> -->
          <img style="margin-left : 20px; margin-top :30px;" align="center" src="./images/league/<%=img %>" width="85%" height="200px" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em"></text></svg>
            <div class="card-body">
              <p class="card-text"></p>
              <div class="d-flex justify-content-between align-items-center">
              </div>
            </div>
          </div>
        </div>
       
        
        
        
		<form action="admin_clubEdit.do" method="post" name="mfrm" enctype = "multipart/form-data">
        	<div class="rightBox" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
				<div class="form-group">
				      <div style="width:1000px;" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
					  	
					  	<select style = "width: 500px; height:40px;margin-left:100px; margin-bottom: 60px; " class="form-select" onchange="myFunction(this.value)" id="search" style="width:10%; height: 47px;"aria-label="Default select example">
							<option selected="selected">리그 선택</option>
								<%=sbHtml %>
								<input type="hidden" name="group" id="group"/>
						</select>
					      <div class="modal-body">
						      <div style="width:900px;" class="modal-body">
							      	<div class="row mb-3" >
										<div class="col-md-5 themed-grid-col">클럽명</div>
										<input style="background-color:white" name="teamname" value="<%=teamname %>" class="col-md-7 themed-grid-col" type="text" >
									</div>								
									<div class="row mb-3">
										<div class="col-md-5 themed-grid-col">창단년도</div>
										<input style="background-color:white" name="foundation" value="<%=foundation %>" class="col-md-7 themed-grid-col" type="text" >
									</div>
									
									<div class="row mb-3">
										<div class="col-md-5 themed-grid-col">연고지</div>
										<input style="background-color:white" name="hometown" value="<%=hometown %>" class="col-md-7 themed-grid-col" type="text" >
									</div>
									
									<div class="row mb-3">
										<div class="col-md-5 themed-grid-col">홈구장</div>
										<input style="background-color:white" name="homestadium" value="<%=homestadium %>" class="col-md-7 themed-grid-col" type="text" >
									</div>
									
									<div class="row mb-3">
										<div class="col-md-5 themed-grid-col">닉네임</div>
										<input style="background-color:white" name="nickname" value="<%=nickname %>" class="col-md-7 themed-grid-col" type="text" >
									</div>						
									
									<div class="row mb-3">
										<div class="col-md-5 themed-grid-col">자국리그 우승</div>
										<input style="background-color:white" name="prewin" value="<%=prewin %>" class="col-md-7 themed-grid-col" type="text" >
									</div>			
									
									<div class="row mb-3">
										<div class="col-md-5 themed-grid-col">fa컵 우승</div>
										<input style="background-color:white" name="fawin" value="<%=fawin %>" class="col-md-7 themed-grid-col" type="text" >
									</div>	
									
									<div class="row mb-3">
										<div class="col-md-5 themed-grid-col">리그컵 우승</div>
										<input style="background-color:white" name="leaguewin" value="<%=leaguewin %>" class="col-md-7 themed-grid-col" type="text" >
									</div>
									
									<div class="row mb-3">
										<div class="col-md-5 themed-grid-col">챔스 우승</div>
										<input style="background-color:white" name="chamwin" value="<%=chamwin %>" class="col-md-7 themed-grid-col" type="text" >
									</div>
									
									<div class="row mb-3">
										<div class="col-md-5 themed-grid-col">유로파 우승</div>
										<input style="background-color:white" name="eurowin" value="<%=eurowin %>" class="col-md-7 themed-grid-col" type="text" />
									</div>
									
									<div class="row mb-3" >
											<div class="inputArea">
												<label for="gdsImg">이미지</label>
												<input type="file" id="gdsImg" name="img" data-width="10" data-height="10"  />
											</div>
								<!-- 경로 확인 -->
								<%-- <%=request.getRealPath("/") %> --%>
									</div>
									
									<div style="width:900px;" class="row mb-3" >
										<div class="col-md-5 themed-grid-col">구단 소개</div>
										<textarea class="form-control"  aria-label="Username" name="wri" id="smartEditor" rows="30" aria-describedby="basic-addon1"><%=wri %></textarea>
									</div>
									
									
									<div class="row mb-3" >
										<!-- <div class="col-md-5 themed-grid-col"></div> -->
										<input style="background-color:white" name="seq" value="<%=seq %>" class="col-md-7 themed-grid-col" type="hidden" >
									</div>
																					
									<div class="modal-footer">
									<input type="submit" id="submit1" value="수정 " class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" />
									</div>
									
									</form> 
									<div style="margin:-53px 0px 0px 270px;" >
										<form action="leagueDelete_ok.do"  method="post">
											<input type="hidden" name="seq" value="<%=seq %>"/>
											<input type="submit" value="삭제" class="btn btn-primary"/>
										</form>
									</div>
								</div>
							</div>	
						</div>
					</div>
				</div>	
    	</div>
	</div>	
<script>
$("#gdsImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(200);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });


var oEditors = []; 
nhn.husky.EZCreator.createInIFrame({ 
oAppRef : oEditors, 
elPlaceHolder : "smartEditor",
sSkinURI : "./smarteditor2/SmartEditor2Skin.html",
fCreator : "createSEditor2", 
	htParams : { 
	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
	bUseToolbar : true, 
	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	bUseVerticalResizer : false, 
	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
	bUseModeChanger : false
} 
});	
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
  
  window.onload = function() {
		document.getElementById('submit1').onclick = function() {
			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
			var value = document.getElementById("smartEditor").value;
			console.log(value);
			
	 		if( document.wfrm.smallcode.value.trim() == '' ) {
				alert( '분류를 선택하세요.' );
				return false;
			}
			if( document.wfrm.title.value.trim() == '' ) {
				alert( '제목 입력하셔야 합니다.' );
				return false;
			} 
			if(value == "" || value == null || value == '&nbsp;' || 
				value == '<br>' || value == '<br/>' || value == '<p>&nbsp;</p>'){ 
				alert("내용을 작성해주세요."); 
				oEditors.getById["smartEditor"].exec("FOCUS"); //포커싱 
				return false; 
			}

			document.wfrm.submit();
		};
	};
</script>
				
				
</body>
</html>