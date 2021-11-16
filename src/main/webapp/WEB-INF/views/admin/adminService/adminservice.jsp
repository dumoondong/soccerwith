<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.bootweb01.ServiceTO"%>
<%
	String loginUser = (String)session.getAttribute("loginUser");
	String loginGrade = (String)session.getAttribute("loginGrade");
	
	ArrayList<ServiceTO> datas = (ArrayList)request.getAttribute( "datas" );
	
	StringBuilder sbHtml = new StringBuilder();
	
	for( ServiceTO to : datas ) {
		String seq = to.getSeq();
		String id = to.getId();
		String asktitle = to.getAsktitle();
		String adate = to.getAdate();
		String replyid = to.getReplyid();
		String dedlornot = to.getDeleornot();
		String rdate = to.getRdate();
		System.out.println(to.getReplyid());
		sbHtml.append( "<tr class='table table-hover'>" );
		sbHtml.append( "	<td width='3%'><div class='pgn-checkbox'></div><input type='checkbox'><span></span> </td>" );
		sbHtml.append( "	<td width='6%'>" + seq + "</td>" );
		sbHtml.append( "	<td width='7%'>" + id + "</td>" );
		sbHtml.append( "	<td>" );
		sbHtml.append( "		<a href='./adminservice_reply.do?seq=" + seq + "'>" + asktitle + "</a>" );
		sbHtml.append( "	<td width='16%'>" + adate + "</td>" );
		sbHtml.append( "	<td width='10%'>" + replyid + "</td>" );
		sbHtml.append( "	<td width='6%'>" + dedlornot + "</td>" );
		sbHtml.append( "	<td width='16%'>" + rdate + "</td>" );
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
    	<h2 class="mt-4">고객문의내역</h2>
		<!-- 회원등급리스트검색 -->
		<div style="width:60px; margin:70px 0px 0px 0px;"></div>		
		<table style="width:85%; text-align: center;" class="table table-hover">
		  <thead>
		    <tr>
		      <th> <div class="pgn-checkbox"></div><input type="checkbox" id="all_select"><span></span>
		      </th>
		      <th scope="col">번호</th>
		      <th scope="col">ID</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성날짜</th>
		      <th scope="col">답변 관리자 ID</th>
		      <th scope="col">답변여부</th>
		      <th scope="col">답변날짜</th>
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
  
  $('#all_select').click(function() {
		if ($("input:checkbox[id='all_select']").prop("checked")){
			$("input[type=checkbox]").prop("checked",true);
		}else{
			$("input[type=checkbox]").prop("checked",false);
		}
	});
</script>
</body>
</html>