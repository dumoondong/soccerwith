<%@page import="com.example.bootweb01.MemberTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.bootweb01.BoardTO"%>
<%@page import="com.example.bootweb01.newsTO"%>
<%@page import="com.example.bootweb01.leagueTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%	
	String loginUser = (String)session.getAttribute("loginUser");

	ArrayList<BoardTO> mainVOdatas = (ArrayList)request.getAttribute( "mainVOdatas" ); // 인기게시판 상위 10개
	ArrayList<BoardTO> mainSCdatas = (ArrayList)request.getAttribute( "mainSCdatas" ); // 축구게시물 등록순 10개
	ArrayList<newsTO> datas4 = (ArrayList)request.getAttribute( "datas4" ); //국내뉴스
	ArrayList<leagueTO> datas = (ArrayList)request.getAttribute( "datas" ); //축구클럽리스트
	int i = 1;
	
	StringBuilder VOHtml = new StringBuilder(); // 인기 게시판
	StringBuilder SCHtml = new StringBuilder(); // 축구 게시판
	StringBuilder NSHtml = new StringBuilder(); // 축구 게시판
	StringBuilder LEHtml = new StringBuilder(); // 축구 게시판
	
	//인기게시판
	for(BoardTO to : mainVOdatas) {
		String seq = to.getSeq();
		String title = to.getTitle();
		String id = to.getId();
		String wdate = to.getWdate();
		String hit = to.getHit();
		String smallcode = to.getSmallcode();
		String smallinfo = to.getSmallinfo();
		String recommend = to.getRecommend();
		int wgap = to.getWgap();
		
		VOHtml.append("<tr class='table-light'>");
		VOHtml.append("<th scope='row'>"+i+"</th>");
		VOHtml.append( "<td class='left'>" );
		VOHtml.append( "<a style='color: black' href='./admin_board_view.do?seq="+seq+"&id="+id+"&smallcode="+smallcode+"&loginUser="+loginUser+"'>" + title + "</a>" );
		VOHtml.append( "	</td>" );
		VOHtml.append("</tr>");
		
		i ++;
	}
	
	i=1;
	//축구게시판
	for(BoardTO to : mainSCdatas) {
		String seq = to.getSeq();
		String title = to.getTitle();
		String id = to.getId();
		String wdate = to.getWdate();
		String hit = to.getHit();
		String smallcode = to.getSmallcode();
		String smallinfo = to.getSmallinfo();
		String recommend = to.getRecommend();
		int wgap = to.getWgap();
		
		SCHtml.append("<tr class='table-light'>");
		SCHtml.append("<th scope='row'>"+i+"</th>");
		SCHtml.append( "<td class='left'>" );
		SCHtml.append( "<a style='color: black' href='./admin_board_view.do?seq="+seq+"&id="+id+"&smallcode="+smallcode+"&loginUser="+loginUser+"'>" + title + "</a>" );
		SCHtml.append( "	</td>" );
		SCHtml.append("</tr>");
		
		i ++;
	}
	//축구팀
	for( leagueTO to : datas ) {
		String seq = to.getSeq();
		String wri = to.getWri();
		String teamname = to.getTeamname(); 
		String img = to.getImg();
		String list = to.getList();
		
		LEHtml.append("<div class= 'col'>");
		LEHtml.append("<div style='height:200px;' class= 'card shadow-sm'>");
		LEHtml.append("<a href='./admin_club.do?teamname="+teamname+"'>");
		LEHtml.append( "<img style='margin-left :0px; margin-top :30px;' align='center' src=./images/league/" +to.getImg()+" width='30%' height='100px' xmlns='http://www.w3.org/2000/svg' role='img' aria-label='Placeholder: Thumbnail'preserveAspectRatio='xMidYMid slice' focusable='false'><title>Placeholder</title><rect width='100%' height='100%' fill=''#55595c'/><text x='50%' y='50%' fill='#eceeef' dy='.3em'></text></svg><div class='card-body'>" );
		LEHtml.append("</a>");
		LEHtml.append("<div class= 'card-body'>");
		LEHtml.append("<p class= 'card-text' style='font-size:25px; margin-bottom : -20px; font-famile:'돋움';>"+teamname+"</>");
		LEHtml.append("<div class= 'btn-group'>");
		LEHtml.append("</div>");
		LEHtml.append("</div>");
		LEHtml.append("</div>");
		LEHtml.append("</div>");
		LEHtml.append("</div>");
	}
	
	//뉴스리스트
	for( newsTO to : datas4 ) {
		String seq = to.getSeq();
		String newstitle = to.getNewstitle();
		String newswdate = to.getNewswdate();
		String newscontent = to.getNewscontent();
		String newsimage = to.getNewsimage();
		String id = to.getId();
		int newsview = to.getNewsview();
		
		NSHtml.append( " 		<div class='col-md-3'>");
		NSHtml.append( " 		<div style='height:550px;' class='card mb-4 box-shadow'>");
		NSHtml.append( " 		<img class='card-img-top'src=./images/news/"+ to.getNewsimage()+" width=300px height=300px" +"alt='Card image cap'>");
		NSHtml.append( " 				<div class='card-body'>");
		NSHtml.append( " 					<p class='card-text'>" +to.getNewstitle()+ "</p>");
		NSHtml.append( " 						<div class='d-flex justify-content-between align-items-center'> ");
		NSHtml.append( " 							<div class='btn-group'>");
		NSHtml.append( " 								<button type='button' class='btn btn-sm btn-outline-secondary' onclick=location.href='./admnewsview.do?seq="+to.getSeq()+"'>View</button>");
		NSHtml.append( " 							</div>");
		NSHtml.append( " 				</div>");
		NSHtml.append( " 			</div>");
		NSHtml.append( " 		</div>"); 
		NSHtml.append( " 		</div>");
    
	}
	
	newsTO to = (newsTO)request.getAttribute( "to" );
	
	String seq = to.getSeq();
	String newstitle = to.getNewstitle();
	String newswdate = to.getNewswdate();
	String newscontent = to.getNewscontent().substring(14, 352) + ".......";
	String newsimage = to.getNewsimage();
	String id = to.getId();
	System.out.println(newsimage);
	String classify = to.getClassify();
	int newsview = to.getNewsview();
	
%>
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
   <style>
		#slideshow { 
		    margin: 50px auto; 
		    position: relative; 
		    width: 2375px; 
		    height: 250px; 
		    padding: 0px; 
		    box-shadow: 0 0 20px rgba(0,0,0,0.4); 
		}
		
		#slideshow > div { 
		    position: absolute; 
		    top: 10px; 
		    left: 10px; 
		    right: 10px; 
		    bottom: 10px; 
		}
		#rightshow { 
		    margin: 50px auto; 
		    position: relative; 
		    width: 250px; 
		    height: 900px; 
		    padding: 0px; 
		    box-shadow: 0 0 20px rgba(0,0,0,0.4); 
		}
		
		#rightshow > div { 
		    position: absolute; 
		    top: 10px; 
		    left: 10px; 
		    right: 10px; 
		    bottom: 10px; 
		}
   </style>
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
		<!-- 센터 광고 -->
		<div id="slideshow" style="position: absolute;left: 0px;bottom:770px;">
		   <div>
		     <img src="./images/test/1.png">
		   </div>
		   <div>
		     <img src="./images/test/2.png">
		   </div>
		   <div>
		     <img src="./images/test/3.png">
		   </div>
		</div>
		<!-- 오른쪽광고 -->
		<div id="rightshow" style="position: fixed; right: 20px;bottom:-137px;">
		   <div>
		     <img src="./images/test/4.png">
		   </div>
		   <div>
		     <img src="./images/test/5.png">
		   </div>
		   <div>
		     <img src="./images/test/6.png">
		   </div>
		</div>
		
		<!-- 센터 뉴스 -->
		<div style="width:1224px; height:700px; position: absolute; left: 77px; top: 398px; border :1px solid black;">
			 <div style="margin : 30px 600px 0px 0px;">
			 	<img src="./images/news/<%=newsimage%>" align="middle" style="width:570px; height:640px;">
			 </div>
			 
			 <div style="margin : -620px 0px 0px 600px;">
			 	<a href="admnewsview.do?seq=19" style="color: black"><h4><%=newstitle %></h4></a>
			 	<h6><%=newswdate%></h6>
			 </div><br />
			 <div style="width:610px; margin-right: -590px; font-size: 20px;">
				 <%=newscontent%>
			 </div>

		</div>
		
		<!-- 인기 best 게시물 -->
		<div style="width:800px; height:550px; position: absolute; left: 1300px; top: 398px; border :1px solid black;">
			<div style="font-size: 25px; margin-top:20px; margin-left : 3px; text-align:left; color:blue;">인기&nbsp<span style="font-size:20px; color: black;">BEST게시물</span></div>
			<div style="margin:-30px 0px 0px 720px;"><a href="admin_board.do?smallcode=BD098" style="color: black">MORE></a></div>
			<br /><hr />
			<table style="width:97%; margin:0px 3px 3px 3px;" class="table table-hover">
			  <thead>
			  </thead>
			  <tbody>
				  <%=VOHtml %>
			  </tbody>
			</table>
		</div>
		
		<!-- 국내 뉴스 -->
		<div style="width:1224px; height:700px; position: absolute; left: 77px; top: 1096px; border :1px solid black;">
			<div style="font-size: 25px; margin-top:20px; margin-left : 3px; text-align:left; color:blue;">국내&nbsp<span style="font-size:20px; color: black;">뉴스</span></div>
			<div style="margin:-30px 0px 0px 1100px;"><a href="admnewstemplate.do?classify=국내뉴스" style="color: black">MORE></a></div>
			
			<div class="album py-5 bg-light" style="margin: 10px 10px 10px 10px;">
				<div class="row">
					<%= NSHtml %>
				</div>
	   		</div>
		</div>
		
		<!-- 축구 게시물 -->
		<div style="width:800px; height:550px; position: absolute; left: 1300px; top: 946px; border :1px solid black;">
			<div style="font-size: 25px; margin-top:20px; margin-left : 3px; text-align:left; color:blue;">축구&nbsp<span style="font-size:20px; color: black;">게시물</span></div>
			<div style="margin:-30px 0px 0px 720px;"><a href="admin_board.do?smallcode=BD003" style="color: black">MORE></a></div>
			
			<br /><hr />
			<table style="width:97%; margin:0px 3px 3px 3px;" class="table table-hover">
			  <thead>
			  </thead>
			  <tbody>
				  <%=SCHtml %>
			  </tbody>
			</table>
		</div>
		
		<!-- 각 클럽 -->
		<div style="width:2024px; height:300px; position: absolute; left: 77px; top: 1795px; border :1px solid black;">
			<div style="font-size: 25px; margin-top:20px; margin-left : 3px; text-align:left; color:blue;">인기클럽&nbsp<span style="font-size:20px; color: black;">바로가기</span></div>
			
			<div align='middle' class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3">
	     		<%=LEHtml %>              
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
  
  $("#slideshow > div:gt(0)").hide();

  setInterval(function() { 
    $('#slideshow > div:first')
      .fadeOut(1000)
      .next()
      .fadeIn(1000)
      .end()
      .appendTo('#slideshow');
  },  3000);
  
  $("#rightshow > div:gt(0)").hide();

  setInterval(function() { 
    $('#rightshow > div:first')
      .fadeOut(1000)
      .next()
      .fadeIn(1000)
      .end()
      .appendTo('#rightshow');
  },  3000);
 </script>
</body>
</html>