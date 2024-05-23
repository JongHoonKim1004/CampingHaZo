<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<div>
	<div class="row" style="min-height: 870px;">
		<%@ include file="./includes/sidebar.jsp" %>
		<div style="width: 87.5%; flex: 0 0 auto; background-color: #eaebf2;">
			<div class="row">
				<div class="col-md-12 p-5">
					<div class="row pb-5">
						<h1 class="h2"><strong>회원정보 수정</strong></h1>
					</div>
					<div class="row pb-3 justify-content-md-center">
						<div class="col-md-8 bg-white p-3">
							<form class='form p-5' name="frm">
								<input type="hidden" name="uno" id="uno" value=${uno }>
								<div class="row form-group pb-3">
									<div class="col-md-2">
										<label class='form-label'>아이디(이메일)</label>
									</div>
									<div class="col-md-10">
										<input type="text" class="form-control" name="username" id="username" value="${user.username }" readOnly>
									</div>
								</div>
								<div class="row form-group pb-3">
									<div class="col-md-2">
										<label class="form-label">이름</label>
									</div>
									<div class="col-md-10">
										<input type="text" class="form-control" name="name" id="name" value="${user.name }" readOnly>
									</div>
								</div>
								<div class="row form-group pb-3">
									<div class="col-md-2">
										<label class="form-label">비밀번호</label>
									</div>
									<div class="col-md-10">
										<input type="password" class="form-control" name="password" id="password">
									</div>
								</div>
								<div class="row form-group pb-3">
									<div class="col-md-2">
										<label class="form-label">비밀번호 확인</label>
									</div>
									<div class="col-md-10">
										<input type="password" class="form-control" name="passwordCheck" id="passwordCheck">
									</div>
								</div>
								<div class="row form-group pb-3">
									<div class="col-md-2">
										<label class="form-label">전화번호</label>
									</div>
									<div class="col-md-10">
										<input type="text" class='form-control' name="phone" id="phone" placeholder="'-' 를 제외하고 기입해주세요" value="${user.phone }">
									</div>
								</div>
								<div class="row form-group pb-3">
									<div class="col-md-2">
										<label class="form-label">우편번호</label>
									</div>
									<div class="col-md-4">
										<input type="text" class="form-control" name="zipCode" id="zipCode" value="${user.zipCode }" readOnly>
									</div>
									<div class="col-md-6">
										<button type="button" name="findZipCode" class="btn btn-primary btn-sm" onclick="findaddr()">우편번호 찾기</button>
									</div>
								</div>
								<div class="row form-group pb-3">
									<div class="col-md-2">
										<label class="form-label">기본주소</label>
									</div>
									<div class="col-md-10">
										<input type="text" class="form-control" name="addr" id="addr" value="${user.addr }" readOnly>
									</div>
								</div>
								<div class="row form-group pb-3">
									<div class='col-md-2'>
										<label class="form-label">상세주소</label>
									</div>
									<div class="col-md-10">
										<input type="text" class="form-control" name="addrDetail" id="addrDetail" value="${user.addrDetail }">
									</div>
								</div>
								<div class="row form-group pb-3 justify-content-end">
									<div class="col-md-4">
										<button type="submit" class='btn btn-primary mx-4' onclick="return modifyCheck()">수정하기</button>
										<button type="button" class="btn btn-warning" onclick="confirmBack()">메인 페이지로</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
</div>


<%@ include file="../includes/searchFooter.jsp"%>

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
				console.log(data);
				zipCode.value = data.zonecode;
				addr.value = data.address;
			}
		}).open({
			left: 500,
			top: 500
		});
	}
	</script>
	
	<script type="text/javascript">
		function modifyCheck(){
			if(document.frm.username.value == "" || document.frm.name.value == ""){
				alert("잘못된 접근입니다.");
				window.location.href="/";
				return false;
			}
			if(document.frm.password.value == ""){
				alert("비밀번호를 입력해주세요");
				frm.password.focus();
				return false;
			}
			if(document.frm.password.value != document.frm.passwordCheck.value){
				alert("비밀번호가 일치하지 않습니다.");
				frm.passwordCheck.focus();
				return false;
			}
			if(document.frm.phone.value == ""){
				alert("전화번호를 입력해 주세요");
				frm.phone.focus();
				return false;
			}
			if(document.frm.zipCode.value == "" || document.frm.addr.value == ""){
				alert("'우편번호 찾기' 버튼을 통해 주소를 입력해주세요");
				frm.findZipCode.focus();
				return false;
			}
			if(document.frm.addrDetail.value == ''){
				alert("상세주소를 입력해주세요");
				frm.addrDetail.focus();
				return false;
			}
			
			
			
			return true;
		}
		
		function confirmBack(){
			if(confirm("메인페이지로 돌아가시겠습니까?\n수정한 내용은 저장되지 않습니다" )){
				window.location.replace("http://localhost:8282/mypage/main");
			}
		}
	</script>