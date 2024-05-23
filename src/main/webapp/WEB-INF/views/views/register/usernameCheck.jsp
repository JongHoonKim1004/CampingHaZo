<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인</title>
<!-- W3 Bootstrap -->
<link rel="stylesheet"
	href="/resources/bootstrap-5.3.3-dist/css/bootstrap.min.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.7.0.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="/resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row mt-5 mb-5">
					<div class="col-md-7 mb-3">
						<div class="row">
							<input type="text" name="username" id="username" value="${username }">
						</div>
					</div>
					<div style="width: auto; margin: 0 auto;" >
						<button type="button" class="btn btn-primary btn-sm" onclick="usernameCheck()">중복 확인</button> 
					</div>
				</div>
				<div class="row justify-content-md-center pb-3">
					<div class="col-md-4">
						${message }
					</div>
				</div>
				<div class="row">
					<div>
						<c:if test="${canUse }">
							<button class="btn btn-primary btn-sm" onclick="useThis()">사용하기</button>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
// 중복확인
function usernameCheck(){
	var username = document.getElementById("username").value;
	if(username != ""){
		window.location.href="/register/usernameCheck?username=" + username;
	} else {
		alert("아이디를 입력해주세요");
		return false;
	}
	
}

// 아이디 등록
function useThis(){
	var username = document.getElementById("username").value;
	opener.document.getElementById("username").value = username;
	opener.document.getElementById("usernameChecked").value = username;
	window.close();
}
</script>
</body>
</html>