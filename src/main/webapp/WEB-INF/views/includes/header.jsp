<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5G캠핑</title>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/notice.css">
<link rel="stylesheet" href="/resources/css/camping.css">
<link rel="stylesheet" href="/resources/css/mypage.css">

<!-- Naver Smart Editor -->
<link href="/resources/css/smart_editor2.css" rel="stylesheet" type="text/css">

<!-- W3 Bootstrap -->
<link rel="stylesheet" href="/resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.0.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="/resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Slick Carousel -->
<link rel="stylesheet" type="text/css" href="/resources/css/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/slick.css" />

<!-- Daum Address API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<!-- Date Range Picker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
</head>
<body>
	<div class="header">
		<div class="row upper-navbar mb-2">
			<div class="col-md-12">
				<div id="upper-navbar">
					<ul>
						<li><a href="/">HOME</a></li>
						<li><a href="/notice/list">공지사항</a></li>
						<sec:authorize access="!isAuthenticated()">
						<li><a href="#" data-bs-toggle="modal" data-bs-target="#myModal">회원가입</a></li>
						<li><a href="#" data-bs-toggle="modal" data-bs-target="#myModal2">로그인</a></li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a href="/admin/main">관리자 페이지</a></li>
								<li><a href="#" onclick="usersLogout()">로그아웃</a></li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_MEMBER')">
								<li><a href="/member/main">사업자 페이지</a></li>
								<li><a href="#" onclick="usersLogout()">로그아웃</a></li>
							</sec:authorize>
							
							<sec:authorize access="hasRole('ROLE_USERS')">
								<li><a href="/mypage/main">마이페이지</a></li>
							  <c:choose>
							      
							      <c:when test="${empty sessionScope.access_token}">
						        	 <li><a href="#" onclick="usersLogout()">로그아웃</a></li>
						    	  </c:when>
							      
							      <c:otherwise>
							         <li><a href="https://kauth.kakao.com/oauth/logout?client_id=f9a28876f9104e4332a4a3e6cae9c8b5&logout_redirect_uri=http://localhost:8282/users/index">로그아웃</a></li>
							      </c:otherwise>
							      
							  </c:choose>
							</sec:authorize>
						</sec:authorize>
						<li><a href="/voc">고객센터</a></li>
					</ul>
					<form name="logout" id="logout" action="/logout" method="post"></form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
						<a href="/" class="logoAnchor"><img alt="logo"
							src="/resources/img/header/5g_logo1.png" class="logo"></a>
					</div>
					<div class="col-md-10">
						<ul class="lower-navbar">
							<li><a href="/camping/list">전체</a></li>
							<li><a href="/camping/list">유료캠핑장</a></li>
							<li><a href="/camping/list">글램핑/카라반</a></li>
							<li><a href="#">테마검색</a></li>
							<li><a href="#">오캠장터</a></li>
							<li><a href="#">캠핑정보</a></li>
							<li><a href="#">캠핑톡</a></li>
							<li style="float: right;"><img alt="google"
								src="/resources/img/header/googleplay.png"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- 회원가입 modal -->
		<!-- The Modal -->
		<div class="modal" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="/users/join" method="post" name="frm">
						<!-- Modal Header -->
						<div class="modal-header" style="">
							<h4 class="modal-title">회원가입</h4>
							
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="row form-group mb-1">
										<div class="col-md-3">
											<label for="username">아이디</label>
										</div>
										<div class="col-md-9">
											<input type="email" name="username" id="username" class="form-control">
											<input type="hidden" name="usernameChecked" id="usernameChecked">
										</div>
									</div>
									<div class="row form-group mb-5">
										<div class="col-md-3"></div>
										<div class='col-md-9'>
											<button type="button" class="btn btn-primary btn-sm" onclick="usernameCheck()">중복 확인</button>
										</div>
									</div>
									<div class="row mb-5 form-group">
										<div class="col-md-3">
											<label for="name">이름</label>
										
										</div>
										<div class="col-md-9">
											<input type="text" name="name" id="name" class="form-control">
										</div>
									</div>
									<div class="row mb-5 form-group">
										<div class="col-md-3">
											<label for="password">비밀번호</label>
										
										</div>
										<div class="col-md-9">
											<input type="password" name="password" id="password" class="form-control">
										</div>
									</div>
									<div class="row mb-5 form-group">
										<div class="col-md-3" style="padding-right: 0;">
											<label for="password_check">비밀번호 확인</label>
										</div>
										<div class="col-md-9">
											<input type="password" name="password_check" id="password_check" class="form-control">
										</div>
									</div>
									<div class="row mb-5 form-group">
										<div class="col-md-3">
											<label for="phone">전화번호</label>
										</div>
										<div class="col-md-9">
											<input type="text" name="phone" id="phone" class="form-control">
										</div>
									</div>
									<div class="row mb-3 form-group">
										<div class="col-md-3">
											<label for="zipCode">우편번호</label>
										</div>
										<div class="col-md-5">
											<input type="text" name="zipCode" id="zipCode" readOnly class="form-control">
										</div>
										<div class="col-md-4">
											<button class="btn btn-secondary" type="button" onclick="findaddr()">우편번호 찾기</button>
											
										</div>
									</div>
									<div class="row mb-3 form-group">
										<div class="col-md-3">
											<label for="addr">주소</label>
										</div>
										<div class="col-md-9">
											<input type="text" name="addr" id="addr" readOnly class="form-control">
										</div>
									</div>
									<div class="row mb-5 form-group">
										<div class="col-md-3">
											<label for="addrDetail">상세주소</label>
										</div>
										<div class="col-md-9">
											<input type="text" name="addrDetail" id="addrDetail" class="form-control">
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-12">
											<input type="checkbox" name="agree" id="agree">
											<label for="agree" style="margin-left: 15px;">약관에 동의합니다.</label>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							
							<button type="submit" class="btn btn-primary" onclick="return joinCheck()">회원가입</button>
							<button type="button" class="close btn btn-secondary" style="float: right;" data-bs-dismiss="modal">&times;</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /The Modal -->
		
		<!-- 로그인 Modal -->
		<!-- The Modal -->
		<div class="modal" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="/login" method="post" name="loginfrm">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">로그인</h4>
							
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<div class="row">
								<div class="col-md-12">
									<div class="row form-group mb-3">
										<div class="col-md-3">
											<label for="username">아이디</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="username" id="login_username">
										</div>
									</div>
									<div class="row form-group mb-3">
										<div class="col-md-3">
											<label for="password">비밀번호</label>
										</div>
										<div class="col-md-9">
											<input type="password" class="form-control" name="password" id="login_password">
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
						<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=f9a28876f9104e4332a4a3e6cae9c8b5&redirect_uri=http://localhost:8282/login/oauth2/code/kakao&response_type=code">
  <img src="/resources/img/header/kakao_login_medium_narrow.png" style="height:38px"/>
</a>
							<button type="submit" class="btn btn-primary">로그인</button>
							<button type="button" class="close btn btn-secondary" style="float: right;" data-bs-dismiss="modal">&times;</button>
							
				
						</div>
							</form>
				</div>
			</div>
		</div>
		<!-- /The Modal -->
	</div>
	
	<script type="text/javascript">
	var width = 500;
	var height = 500;
	var zipCode = document.getElementById("zipCode");
	var addr = document.getElementById("addr");
	
	// find Address
	function findaddr(){
		new daum.Postcode({
			width: width,
			height: height,
			oncomplete: function(data){
				zipCode.value = data.zonecode;
				addr.value = data.address;
			}
		}).open({
			left: 500,
			top: 500
		});
	}
	</script>
	<script>
	function usernameCheck(){
		var username = document.getElementById("username").value;
		
		if(username != ""){
			window.open("/register/usernameCheck?username=" + username, "_blank", "width = 600px, height = 500px, left = 200, top = 200");
		} else {
			alert("아이디를 입력해주세요");
			
		}
	}
	
	function joinCheck(){
		if(!document.frm.agree.checked){
			alert("약관에 동의해주세요");
			return false;
		}
		
		if(document.frm.username.value == ""){
			alert("아이디를 작성해주세요");
			frm.username.focus();
			return false;
		}
		if(document.frm.usernameChecked.value == ""){
			alert("중복확인을 진행해주세요");
			frm.username.focus();
			return false;
		}
		if(document.frm.password.value == ""){
			alert("비밀번호를 입력해주세요");
			frm.password.focus();
			return false;
		}
		if(document.frm.password.value !== document.frm.password_check.value){
			alert("비밀번호가 일치하지 않습니다" + document.frm.password.value + ", " + document.frm.password_check.value);
			frm.password.focus();
			return false;
		}
		if(document.frm.phone.value == ""){
			alert("연락처를 작성해주세요");
			frm.phone.focus();
			return false;
		}
		if(document.frm.zipCode.value == ""){
			alert("우편번호 찾기를 통해 주소를 찾아주세요");
			frm.zipCode.focus();
			return false;
		}
		if(document.frm.addr.value == ""){
			alert("우편번호 찾기를 통해 주소를 찾아주세요");
			frm.addr.focus();
			return false;
		}
		if(document.frm.addrDetail.value == ""){
			alert("상세주소를 작성해주세요");
			frm.addrDetail.focus();
			return false;
		}
		
		
		return true;
	}
	
	function adminLogout(){
		$("#logout").attr("action","/logout");
		$("#logout").submit();
	}
	
	function memberLogout(){
		$("#logout").attr("action","/logout");
		$("#logout").submit();
	}
	
	function usersLogout(){
		$("#logout").attr("action","/logout");
		$("#logout").submit();
	}
	</script>