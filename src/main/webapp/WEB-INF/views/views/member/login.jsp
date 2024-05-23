<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오지캠핑 - 사업자 페이지</title>
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/member.css">


<!-- Naver Smart Editor -->
<link href="/resources/css/smart_editor2.css" rel="stylesheet" type="text/css">

<!-- W3 Bootstrap -->
<link rel="stylesheet" href="/resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.0.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="/resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/47e044986f.js" crossorigin="anonymous"></script>

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
<main>
	<div class="row justify-content-md-center pt-5 pb-5" style="background-color: #cccccc4f;">
		<div class="col-md-8">
			<div class="row pb-4">
				<h1></h1>
			</div>
			<div class="row justify-content-md-center pt-4">
				<div class="col-md-6">
					<div class="row justify-content-md-center">
						<div class="col-md-8">
							<img alt="logo" src="/resources/img/header/5g_logo1.png" style="width: 100%;">
						</div> 
					</div>
					<div class="row p-5">
						<div class="col-md-12">
							<form class="bg-white p-4" action="/member/login" method="post" name="frm">
								<div class="form-group pt-3 pb-3">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">아이디</label>
										</div>
										<div class="col-md-9">
											<input type="text" name='username' id="username" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group pb-3">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">비밀번호</label>
										</div>
										<div class="col-md-9">
											<input type="password" name='password' id="password" class="form-control">
										</div>
									</div>
								</div>
								<div class='form-group pb-3'>
									<div class="row">
										<div class="col-md-6 px-2 justify-content-end" style="display: flex;">
											<button type="submit" class="btn btn-primary" onclick="return loginCheck()">로그인</button>
										</div>
										<div class="col-md-6 px-2">
											<button type="button" class='btn btn-warning' onclick="location.href='/'">메인 페이지로</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="./includes/footer.jsp"%>
<script type="text/javascript">
	function loginCheck(){
		if(document.frm.username.value = ''){
			alert("아이디를 입력하세요");
			frm.username.focus();
			return false;
		}
		if(document.frm.password.value = ''){
			alert("비밀번호를 입력하세요");
			frm.password.focus();
			return false;
		}
		
		return true;
	}
</script>