<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp"%>

<main>
	<div class="row justify-content-md-center pt-5 pb-5" style="background-color: #cccccc4f;">
		<div class="col-md-8">
			<div class="row pb-4">
				<h1>사업자 정보 변경</h1>
				<p>아이디, 사업자명, 사업자등록번호 변경은 고객센터로 직접 문의해 주세요</p>
			</div>
			<div class="row justify-content-md-center pt-4">
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<form class="bg-white p-5">
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">아이디</label>
										</div>
										<div class="col-md-9">
											<input type="text" name="username" id="username" class="form-control" value='${username }' readonly>
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">사업자명</label>
										</div>
										<div class="col-md-9">
											<input type="text" name="name" id="name" class="form-control" value='${name }' readonly>
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">비밀번호</label>
										</div>
										<div class="col-md-9">
											<input type="password" name="password" id="password" class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">비밀번호 확인</label>
										</div>
										<div class="col-md-9">
											<input type="password" name="passwordCheck" id="passwordCheck"  class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">우편번호</label>
										</div>
										<div class="col-md-4">
											<input type="text" name="zipCode" id="zipCode" value='${zipCode }' readonly class="form-control">
										</div>
										<div class="col-md-5">
											<button type="button" class="btn btn-info" onclick="findaddr()">우편번호 찾기</button>
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">사업자 소재지</label>
										</div>
										<div class="col-md-9">
											<input type="text" name="addr" id="addr" value='${addr }' readonly class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">사업자 연락처</label>
										</div>
										<div class="col-md-9">
											<input type="text" name="phone" id="phone" value='${phone }' class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group pt-2 pb-2">
									<div class="row">
										<div class="col-md-3">
											<label class="form-label">사업자등록번호</label>
										</div>
										<div class="col-md-9">
											<input type="text" name="compNo" id="compNo" value='${compNo }' readonly class="form-control">
										</div>
									</div>
								</div>
								<div class="form-group pt-4 pb-2">
									<div class="row">
										<div class="col-md-8"></div>
										<div class="col-md-4">
											<button type="submit" class="btn btn-primary mx-2">변경하기</button>
											<button type="button" class='btn btn-warning mx-2'>메인 페이지로</button>
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