<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">관리자 신규 등록</div>
			</div>

			<!-- Admin Register Form -->
			<div class="row">
				<div class="col-md-12">
					<div class="row justify-content-md-center p-5">
						<div class="col-md-8">
							<div class="tab-pane fade p-4 show active" id="pills-result-1"
								role="tabpanel" aria-labelledby="pills-result-tab-1">
								<form name="frm" class="bg-white px-5" action="/admin/admin/register" method="post">
									<div class="form-group pt-3 pb-5">
										<p align="right">* 는 필수 입력 사항입니다</p>
									</div>
									<div class="form-group pt-3">
										<label for="username">아이디 (이메일) *</label> 
										<input
											type="text" class="form-control" id="username"
											aria-describedby="emailHelp" placeholder="이메일 주소를 입력해주세요" name="username">
										<input type="hidden" name="usernameChecked" id="usernameChecked" onchange="usernameChenged()">
										
									</div>
									<div class="form-group pb-3">
										<button type="button" class="btn btn-primary btn-sm" onclick="usernameCheck()">중복 확인</button>
									</div>
									<div class="form-group pt-3 pb-3">
										<label for="exampleInputName1">이름 *</label> 
										<input
											type="text" class="form-control" name="name"
											id="exampleInputName1" placeholder="이름을 입력해주세요">
									</div>
									<div class="form-group pb-3">
										<label for="exampleInputPassword1">비밀번호 *</label> 
										<input 
											type="password" class="form-control" name="password"
											id="exampleInputPassword1" placeholder="비밀번호를 입력해주세요">
									</div>
									<div class="form-group pb-3">
										<label for="exampleInputPasswordCheck1">비밀번호 확인 *</label> 
										<input
											type="password" class="form-control" name="passwordCheck"
											id="exampleInputPasswordCheck1" placeholder="비밀번호를 다시 한 번 입력해주세요">
									</div>
									<div class="form-group pb-3">
										<label for="exampleInputEmployeeNo1">사원번호</label> 
										<input
											type="text" class="form-control" name="employeeNo"
											id="exampleInputEmployeeNo1">
									</div>
									
									<div class="row justify-content-md-center mt-5 pt-5 pb-5">
										<div class="col-md-2">
											<button type="submit" class="btn btn-primary" onclick="return adminUsersRegisterCheck()">등록하기</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>




			<%@ include file="../includes/innerFooter.jsp"%>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp"%>
<script type="text/javascript">
// username check
function usernameCheck(){
		var username = document.getElementById("username").value;
		
		if(username != ""){
			window.open("/register/usernameCheck?username=" + username, "_blank", "width = 600px, height = 500px, left = 200, top = 200");
		} else {
			alert("아이디를 입력해주세요");
			
		}
	}

// 중복확인 후 작업
function usernameChenged(e){
	
	$("input[name='username']").attr("readOnly", true);
}

// 회원가입 폼 입력 확인
function adminUsersRegisterCheck(){
	
	if(document.frm.username.value == ""){
		alert("아이디를 입력해주세요");
		frm.username.focus();
		return false;
	}
	if(document.frm.usernameChecked.value == ""){
		alert("중복 확인을 해주세요");
		frm.username.focus();
		return false;
	}
	
	if(document.frm.name.value == ""){
		alert("이름을 입력해주세요");
		frm.name.focus();
		return false;
	}
	if(document.frm.password.value == ""){
		alert("비밀번호를 입력해주세요");
		frm.password.focus();
		return false;
	}
	if(document.frm.password.value != document.frm.passwordCheck.value){
		alert("비밀번호가 일치하지 않습니다");
		frm.passwordCheck.focus();
		return false;
	}
	
	return true;
}
</script>
