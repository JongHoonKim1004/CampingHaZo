<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Template -->
    <link rel="stylesheet" href="/resources/public/graindashboard/css/graindashboard.css">
</head>
<body>
	<main class="main">

		<div class="content">

			<div class="container-fluid pb-5">

				<div class="row justify-content-md-center">
					<div class="card-wrapper col-12 col-md-4 mt-5">
						<div class="brand text-center mb-3">
							<a href="/"><img src="/resources/img/header/5g_logo1.png"></a>
						</div>
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">관리자 로그인</h4>
								<form action="/admin/login" method="post" name="frm">
									<div class="form-group">
										<label for="username">아이디</label> <input id="username"
											type="text" class="form-control" name="username"
											>
									</div>

									<div class="form-group">
										<label for="password">비밀번호 </label> <input id="password"
											type="password" class="form-control" name="password"
											>
										
									</div>

									

									<div class="form-group no-margin">
										<button class='btn btn-primary btn-block' onclick="return loginCheck()">
											로그인
										</button>
									</div>
									
								</form>
							</div>
						</div>
						<footer class="footer mt-3">
							<div class="container-fluid">
								<div class="footer-content text-center small">
									<span class="text-muted">&copy; 2019 Graindashboard. All
										Rights Reserved.</span>
								</div>
							</div>
						</footer>
					</div>
				</div>



			</div>

		</div>
	</main>

	<script src="/resources/public/graindashboard/js/graindashboard.js"></script>
	<script src="/resources/public/graindashboard/js/graindashboard.vendor.js"></script>
	<script type="text/javascript">
		// 로그인 체크
		function loginCheck(){
			if(document.frm.username.value == ''){
				alert("아이디를 입력하세요.");
				frm.username.focus();
				return false;
			}
			if(document.frm.password.value == ''){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			return true;
		}
	</script>
</body>
</html>