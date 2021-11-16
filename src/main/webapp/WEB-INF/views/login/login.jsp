<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.bootweb01.MemberTO" %>    

<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html>
  <head>
    <meta charset="utf-8">
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   <!----<title>Login Form Design | CodeLab</title>---->
    <link rel="stylesheet" type="text/css" href="./css/menustyle2.css">
    <link rel="stylesheet" type="text/css" href="./css/login.css">
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
	<script src="https://kit.fontawesome.com/a076d05399.js"></script>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
  </head>
  <body>
	</br>
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
    
  <br /><br /><br /><br /><br /><br /><br /><br />
	  <div class="main_div">
	    <div style="font-size: 250%" class="title">SOCCERWITH</div>
	    <br />

	    <form action="login_ok.do" method="post">
	   	  <div class="input_box">
	        <input type="text" name="id" placeholder="ID" required>
	        <div class="icon"><i class="fas fa-user"></i></div>
	      </div>
	      <div class="input_box">
	        <input type="password" name="password" placeholder="Password" required>
	        <div class="icon"><i class="fas fa-lock"></i></div>
	      </div>
	      <br />
	      <div class="option_div">
	      
	        <div class="forget_div">
	          <a href="IDsearch.do">아이디 찾기</a>
	        </div>

	        <div class="forget_div">
	          <a href="PWsearch.do">비밀번호 찾기</a>
	        </div>
	      </div>
	      
	      
	      
	      <div class="input_box button">
	        <input type="submit" value="로그인">
	      </div>
	      
	      <div class="sign_up">
	        회원이 아니십니까? <a href="/registration.do"> 회원가입</a>
	      </div>

	    </form>
		<!-- <li onclick="kakaoLogin();">
	      <a href="javascript:void(0)">
	          <span>카카오 로그인</span>
	      </a>
		</li>
		<li onclick="kakaoLogout();">
	      <a href="javascript:void(0)">
	          <span>카카오 로그아웃</span>
	      </a>
		</li> -->
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
  
  
  Kakao.init('dfec50b153cd66e82a8c94b3cb65c57e'); //발급받은 키 중 javascript키를 사용해준다.
  console.log(Kakao.isInitialized()); // sdk초기화여부판단
  //카카오로그인
  function kakaoLogin() {
      Kakao.Auth.login({
        success: function (response) {
          Kakao.API.request({
            url: '/v2/user/me',
            success: function (response) {
          	  console.log(response)
            },
            fail: function (error) {
              console.log(error)
            },
          })
        },
        fail: function (error) {
          console.log(error)
        },
      })
    }
  //카카오로그아웃  
  function kakaoLogout() {
      if (Kakao.Auth.getAccessToken()) {
        Kakao.API.request({
          url: '/v1/user/unlink',
          success: function (response) {
          	console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
        Kakao.Auth.setAccessToken(undefined)
      }
    }  
  
//기존 로그인 상태를 가져오기 위해 Facebook에 대한 호출
  function statusChangeCallback(res){
  	statusChangeCallback(response);
  }

  function fnFbCustomLogin(){
  	FB.login(function(response) {
  		if (response.status === 'connected') {
  			FB.api('/me', 'get', {fields: 'name,email'}, function(r) {
  				console.log(r);
  			})
  		} else if (response.status === 'not_authorized') {
  			// 사람은 Facebook에 로그인했지만 앱에는 로그인하지 않았습니다.
  			alert('앱에 로그인해야 이용가능한 기능입니다.');
  		} else {
  			// 그 사람은 Facebook에 로그인하지 않았으므로이 앱에 로그인했는지 여부는 확실하지 않습니다.
  			alert('페이스북에 로그인해야 이용가능한 기능입니다.');
  		}
  	}, {scope: 'public_profile,email'});
  }

  window.fbAsyncInit = function() {
  	FB.init({
  		appId      : '1381167658952543', // 내 앱 ID를 입력한다.
  		cookie     : true,
  		xfbml      : true,
  		version    : 'v10.0'
  	});
  	FB.AppEvents.logPageView();   
  };
  </script>

  <!--반드시 중간에 본인의 앱아이디를 입력하셔야 합니다.-->
  <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v12.0&appId=1381167658952543" nonce="SiOBIhLG"></script>
  </script>
</body>
</html>

