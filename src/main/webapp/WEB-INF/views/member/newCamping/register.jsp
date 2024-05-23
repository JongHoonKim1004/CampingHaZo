<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main>
	<div class="row justify-content-md-center pt-5 pb-5" style="background-color: #cccccc4f;">
		<div class="col-md-8">
			<div class="row pb-4">
				<h1>새로운 캠핑장 등록</h1>
			</div>
			<div class="row justify-content-md-center pt-4">
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<form class="bg-white p-5" name="frm" action="/member/newCamping/register" method="post">
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-2">
											<label for="name" class="form-label">캠핑장 이름</label>	
										</div>
										<div class="col-md-10">
											<input type="text" name="name" id="name" class="form-control">										
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-2">
											<label for="member" class="form-label">등록 사업자</label>	
										</div>
										<div class="col-md-10">
											<input type="text" name="member" id="member" class="form-control" value="${member.username }" readOnly>										
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-2">
											<label for="addr" class="form-label">캠핑장 주소</label>	
										</div>
										<div class="col-md-10">
											<input type="text" name="addr" id="addr" class="form-control">										
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-2">
											<label for="phone" class="form-label">캠핑장 연락처</label>	
										</div>
										<div class="col-md-10">
											<input type="text" name="phone" id="phone" class="form-control">										
										</div>
									</div>
								</div>
								<div class="form-group pt-4 pb-2">
									<div class="row">
										<div class="col-md-8"></div>
										<div class="col-md-4">
											<button type="submit" class="btn btn-primary mx-3" onclick="return registerCheck()">등록하기</button>
											<button type="button" class="btn btn-warning mx-3" onclick="location.href='/member/main'">메인 페이지로</button>
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

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript">
	// 등록 확인
	function registerCheck(){
		if(document.frm.name.value == ''){
			alert("캠핑장 이름을 입력해주세요");
			frm.name.focus();
			return false;
		}
		if(document.frm.addr.value == ''){
			alert("캠핑장 주소를 입력해주세요.");
			frm.addr.focus();
			return false;
		}
		if(document.frm.phone.value == ''){
			alert("캠핑장 연락처를 입력해주세요");
			frm.phone.focus();
			return false;
		}
		
		return true;
	}
</script>