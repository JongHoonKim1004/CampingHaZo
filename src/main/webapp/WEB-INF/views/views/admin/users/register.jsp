<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">일반회원 신규 등록</div>
			</div>

			<!-- Users Register Form -->
			<div class="row">
				<div class="col-md-12">
					<div class="row justify-content-md-center p-5">
						<div class="col-md-8">
							<div class="tab-pane fade p-4 show active" id="pills-result-1"
								role="tabpanel" aria-labelledby="pills-result-tab-1">
								<form name="frm" class="bg-white px-5">
									<div class="form-group pt-3 pb-5">
										<p align="right">* 는 필수 입력 사항입니다</p>
									</div>
									<div class="form-group pt-3">
										<label for="username">아이디 (이메일) *</label> 
										<input
											type="text" class="form-control" id="username"
											aria-describedby="emailHelp" placeholder="이메일 주소를 입력해주세요" name="username">
										<input type="hidden" name="usernameChecked" id="usernameChecked">
										
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
										<label for="exampleInputPhone1">전화번호</label> 
										<input
											type="text" class="form-control" name="phone"
											id="exampleInputPhone1" placeholder="전화번호를 입력해주세요">
									</div>
									<div class="form-group pb-3 ">
										<label for="exampleInputZipCode1">우편번호</label>
										<div class="input-group col-md-5 px-0"> 
											<input
												type="text" class="form-control" name="zipCode"
												id="exampleInputZipCode1" readonly
												aria-describedby="#zipCodeHelp">
												
											<div class="input-group-append">
												<button type="button" class="btn btn-primary btn-sm" onclick="findaddr()">우편번호 찾기</button>
											</div>
										</div>
										<small id="zipCodeHelp" class="form-text text-muted">'우편번호 찾기' 버튼을 통해 주소를 입력해주세요</small>
									</div>
									<div class="form-group pb-3">
										<label for="exampleInputAddr1">기본주소</label> 
										<input
											type="text" class="form-control" name="addr"
											id="exampleInputAddr1" readonly="readonly">
										
									</div>
									<div class="form-group pb-3">
										<label for="exampleInputAddrDetail1">상세주소</label> 
										<input
											type="text" class="form-control" name="addrDetail"
											id="exampleInputAddrDetail1">
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
<!-- Daum Address API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
var width = 500;
var height = 500;
var zipCode = document.getElementById("exampleInputZipCode1");
var addr = document.getElementById("exampleInputAddr1");

// username check
function usernameCheck(){
		var username = document.getElementById("username").value;
		
		if(username != ""){
			window.open("/register/usernameCheck?username=" + username, "_blank", "width = 600px, height = 500px, left = 200, top = 200");
		} else {
			alert("아이디를 입력해주세요");
			
		}
	}

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
