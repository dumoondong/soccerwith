<%@page import="java.util.ArrayList"%>
<%@page import="com.example.bootweb01.SmallcodeTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<SmallcodeTO> datas = (ArrayList)request.getAttribute( "datas" ); // 소코드 리스트
	
	StringBuilder sbHtml = new StringBuilder(); // 소코드 검색
	StringBuilder sbHtml1 = new StringBuilder(); // 메뉴 소코드 검색  
	StringBuilder sbHtml2 = new StringBuilder(); // 전체 검색
	
	//메뉴 리스트
		for(SmallcodeTO to : datas) {
			String seq = to.getSeq();
			String smallcode = to.getSmallcode();
			String smallinfo = to.getSmallinfo();
			if(smallcode.equals("BD001")){		
				sbHtml2.append("<a class='navbar-brand' href='admin_board.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
			}else{
				if(smallcode.equals("BD002")){
				}else{
					sbHtml1.append("<li class='nav-item'>");
					sbHtml1.append("<a class='nav-link' href='admin_board.do?smallcode="+smallcode+"'>"+smallinfo+"</a>");
					sbHtml1.append("</li>");
				}
			}
		}
	//소코드 리스트 출력
	for(SmallcodeTO to : datas) {
		String seq = to.getSeq();
		String smallcode = to.getSmallcode();
		String smallinfo = to.getSmallinfo();
		if(smallcode.equals("BD001") || smallcode.equals("BD002") || smallcode.equals("BD098")){
		}else{
			sbHtml.append("<option name='"+smallcode+"' value='"+smallcode+"'>"+smallinfo+"</option>");
		}
	}

%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <!-- SmartEditor2 라이브러리 -->
    <script type="text/javascript" src="./smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script> 
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>

    
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
		<div style="font-size: 15px; margin:0px 0px -30px -1310px;" class="bold";><span  style="font-size: 25px" class="txt_blue">게시판 </span>글쓰기</div>
		<button type="button" style="margin:0px 0px 40px 1380px;" class="btn btn-secondary btn-sm" onclick="location.href='./admin_board.do'">목록</button>
		<form action="admin_board_write_ok.do" method="post" name="wfrm" >
			<div class="wrapper" style="text-align:left; width:60%;" >
				<select class="form-select form-select-sm"onchange="myFunction(this.value)" aria-label=".form-select-sm example">
				  <option selected>분류 선택</option>
						<%=sbHtml %>
						<input type="hidden" name="smallcode" id="smallcode"/>
				</select><br/>
				<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label">제목</label>
				  <input type="text" name="title" class="form-control" id="exampleFormControlInput1">
				</div>
				<div class="mb-3">
				  <label for="exampleFormControlTextarea1" class="form-label">내용</label>
				  <textarea class="form-control" name="content" id="smartEditor" rows="20"></textarea>
				</div>
<!-- 				<div class="form-group">
			      <label for="formFile" class="form-label mt-4">첨부 파일</label>
			      <input class="form-control" type="file" name="upload" id="formFile">
			    </div> -->
			</div><br /><br /><br />
			<input type="hidden" name="id" value="<%=loginUser %>" />
			<input type="submit" id="submit1" value="작성" class="btn btn-secondary"/>
			<button type="button" class="btn btn-secondary" onclick="location.href='./admin_board.do'">취소</button>
		</form>
	</div>
<script>
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
		document.getElementById("smallcode").value = input;
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