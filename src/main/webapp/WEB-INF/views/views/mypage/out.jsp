<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<div>
	<div class="row" style="min-height: 870px;">
		<%@ include file="./includes/sidebar.jsp"%>
		<div style="width: 87.5%; flex: 0 0 auto; background-color: #eaebf2;">
			<div class="row">
				<div class="col-md-12 p-5">
					<form name="frm">
					<div class="row justify-content-md-center pb-5">
						<div class="col-md-6 p-5" style="border: 3px solid #d8d8d8; text-align: center;">
							<div class="row pb-5">
								<div class="col-md-12">
									<p>회원탈퇴를 원하시면 비밀번호를 입력하신 후 회원탈퇴 버튼을 클릭해 주세요.</p>
									<p>탈퇴하시면 회원정보가 데이터베이스에서 완전히 삭제됩니다</p>
								</div>
							</div>
							
							<div class="row pb-3 justify-content-md-center">
								<div class="col-md-8">
									<div class="row mb-3">
										<div class="col-md-4">
											<label class="form-label">비밀번호</label>
										</div>
										<div class="col-md-8">
										<input type="password" class="form-control" name="password" id="password">
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-4">
											<label class="form-label">비밀번호 확인</label>
										</div>
										<div class="col-md-8">
											<input type="password" class="form-control" name="passwordCheck" id="passwordCheck">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row justify-content-md-center pt-5 pb-3">
						<div class="col-md-3 d-grid">
							<button type="submit" class="btn btn-danger btn-block" onclick="return pwdCheck()">회원탈퇴</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../includes/searchFooter.jsp"%>

<script type="text/javascript">
function pwdCheck(){
	if(document.frm.password.value == ""){
		alert("비밀번호를 입력해주세요");
		frm.password.focus();
		return false;
	}
	if(document.frm.password.value != document.frm.passwordCheck.value){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		frm.passwordCheck.focus();
		return false;
	}
	
	return true;
}
</script>