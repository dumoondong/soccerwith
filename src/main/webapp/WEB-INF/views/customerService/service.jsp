<%@page import="java.util.ArrayList"%>
<%@page import="com.example.bootweb01.ServiceTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<ServiceTO> datas = (ArrayList)request.getAttribute( "datas" );
	
	StringBuilder sbHtml = new StringBuilder();
	
	for( ServiceTO to : datas ) {
		String seq = to.getSeq();
		String asktitle = to.getAsktitle();
		String adate = to.getAdate();
		String dedlornot = to.getDeleornot();
		
		sbHtml.append( "<tr class='table-active'>" );
		sbHtml.append( "	<td><div class='pgn-checkbox'></div><input type='checkbox'><span></span> </td>" );
		sbHtml.append( "	<td width='50%' >" );
		sbHtml.append( "		<a href='./service_ask.do?seq=" + seq + "'>" + asktitle + "</a>" );
		sbHtml.append( "	<td width='25%'>" + adate + "</td>" );
		sbHtml.append( "	<td>" + dedlornot + "</td>" );
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
	</section>
	<div align="middle">
    	<h2 class="mt-4">고객센터</h2>
		<!-- 회원등급리스트검색 -->
		<div style="width:60px; margin:0px 0px 8px 0px;"></div>
		<div style="margin:50px 0px 10px 900px;">
			<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
 			 문의</button>
		</div>
		
		<table style="width:40%; text-align: center;" class="table table-hover">
		  <thead>
		    <tr>
		      <th> <div class="pgn-checkbox"></div><input type="checkbox" id="all_select"><span></span>
		      </th>
		      <th scope="col">제목</th>
		      <th scope="col">작성일</th>
		      <th scope="col">답변여부</th>
		    </tr>
		  </thead>
		  <tbody>
				<%=sbHtml %>
		  </tbody>
		</table>
	</div>
		<!-- Modal -->
	<form action="serviceWrite.do?id=<%=loginUser %>" method="get" name="mfrm" >
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content" style="width: 800px;">
					<div class="modal-header">
						<h5 class="modal-title">문의</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
					<div class="modal-body" style="margin:20px 20px 20px 20px;">				
						<div class="row mb-3" style="width:405px;">
							<div class="col-md-3 themed-grid-col">작성자</div>
							<div style="background-color:white" class="col-md-9 themed-grid-col"><%=loginUser %></div>
						</div>	
						<div class="row mb-3" style="width:405px;">
							<div class="col-md-3 themed-grid-col">문의제목</div>
							<input style="background-color:white" name="title" class="col-md-9 themed-grid-col" type="text" >
						</div>
						
						<div class="form-group">
							<label for="exampleTextarea" class="form-label mt-4">문의내용</label>
							<textarea class="form-control" name="content" id="exampleTextarea" rows="10"></textarea>
					    </div>
					</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" name="id" value=<%=loginUser %> />
						<input type="submit"  value="문의 "class="btn btn-primary"/>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</form>
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