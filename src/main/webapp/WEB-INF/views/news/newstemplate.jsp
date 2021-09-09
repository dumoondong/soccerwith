<%@page import="ch.qos.logback.core.net.SyslogOutputStream"%>
<%@page import="com.example.bootweb01.newsTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>

<!--  JSP에서 jsoup을 사용하기 위해 import -->
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<%	
	String loginUser = (String)session.getAttribute("loginUser");
	
/* 	ArrayList<newsTO> datas = (ArrayList)request.getAttribute( "datas" );
	
	StringBuilder sbHtml = new StringBuilder();
	
	for( newsTO to : datas ) {
		String seq = to.getSeq();
		String newstitle = to.getNewstitle();
		String newscontent = to.getNewscontent();
		System.out.println(seq);
		System.out.println(newstitle);
		System.out.println(newscontent);
	} */
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

	</content>
	
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
    <div class="text"></div>
  </section>
<%

        // 파싱할 사이트를 적어준다(해당 사이트에 대한 태그를 다 긁어옴)

 	Document doc2 = Jsoup.connect("https://sports.news.naver.com/kfootball/index").get();

	Document doc1 = Jsoup.connect("https://sports.news.naver.com/kfootball/news/index?isphoto=N").get();



        //System.out.println(doc2.data());

        //System.out.println(doc2.body());

        

                // list 속성안에 li 요소 데이터들을 긁어온다

        Elements posts = doc2.body().getElementsByClass("news_list");

        //System.out.println(doc2.getElementsByClass("news_list"));

        Elements file = posts.select("li");

        //System.out.println(posts.select("li"));

        

        // li 요소 데이터들 반복적으로 츨력(li 요소 끝날때까지 즉, li개수만큼 반복문)

        // select() : select()를 통해 더 구석구석 데이터에 접근

        // 구성요소.text() : 구성요소 값을 반환(태그는 포함되지 않음)

        // 구성요소.attr("속성이름") : 구성요소에 "속성이름"에 대한 값을 반환
		
        //Elements element2 = doc1.select("div.text:not(span)");
        //System.out.println(element2.select("text"));
        
        //Elements newspost = element2.select("li");
        //System.out.println("Title : " + element2.select("a").text());
        //System.out.println("Link : " + element2.select("a").attr("href"));
        
        StringBuilder sbHtml1 = new StringBuilder();
        
        for(Element e : file){
        	
        	
        	
        	sbHtml1.append( "<div> <a> Title : ' "+ e.select("a").text() +"'</a></div>" );
        	sbHtml1.append( "<div> <a href='https://sports.news.naver.com/kfootball/news/index?isphoto=N'>'https://sports.news.naver.com" + e.select("a").attr("href")  + "</a></div>" );
        	
        	//System.out.println("Title : " + e.select("a").text());

        	//System.out.println("Link : " + e.select("a").attr("href"));

                // 사이트 링크가 이상하게 올라가있는 관계로 문자열을 다듬어야 한다

                // substring을 사용해 원하는 문자열만큼 자르고 앞에 주소부분을 붙여주면 끝

               // System.out.println("Link : http://www.playdb.co.kr/magazine/" + e.select(".tit a").attr("href").substring(2, 70));

        	//System.out.println("Image : " + e.select(".thumb img").attr("src"));

        	//System.out.println("text : " + e.select(".txt").text());

        	//System.out.println();
        }
        
	        
%>
	
				<div class="board" align="middle">
					<table style="background-color:white;">
					<tr>
						<th width="3%">&nbsp;</th>
						<th width="5%"></th>
						<th >네이버 축구 인기 뉴스</th>
					</tr>
					</table>
					<%=sbHtml1%>
				</div>
<script>
	    
	var filetag = document.getElementsbyTagName("file")
	= document.querySelector(".file");
	    
	    
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