<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../../includes/header.jsp"%>

<div>
	<div class="row" style="min-height: 870px;">
		<%@ include file="../includes/sidebar.jsp" %>
		<div style="width: 87.5%; flex: 0 0 auto; background-color: #eaebf2;">
			<div class="row">
				<div class="col-md-12 p-5">
					<div class="row pb-5">
						<h1 class="h2"><strong>내 예약</strong></h1>
					</div>
					<form>
						<div class="row pb-3 justify-content-md-center">
							<div class="col-md-8">
								<div class="reviewRead bg-white p-5" style="text-align: center;">
									<div class="row form-group mb-3">
										<div class="col-md-2">
											<label class="form-label">예약번호</label>
										</div>
										<div class="col-md-10">
											<input type="text" class="form-control" name="rno" id="rno" value="${reservation.rno }" readOnly>
										</div>
									</div>
									<div class="row form-group mb-3">
										<div class="col-md-2">
											<label class="form-label">캠핑장 이름</label>
										</div>
										<div class="col-md-10">
											<input type="text" class="form-control" name="name" id="name" value="${reservation.name }" readOnly>
										</div>
									</div>
									<div class="row form-group mb-3">
										<div class="col-md-2">
											<label class="form-label">예약일</label>
										</div>
										<div class="col-md-10">
											<input type="text" class="form-control" name="resDate" id="resDate" value="${reservation.resDate }" readOnly>
										</div>
									</div>
									<div class="row form-group mb-3">
										<div class="col-md-2">
											<label class="form-label">인원수</label>
										</div>
										<div class="col-md-10">
											<input type="text" class="form-control" name="people" id="people" value="${reservation.people }" readOnly>
										</div>
									</div>
									<div class="row form-group mb-3">
										<div class="col-md-2">
											<label class="form-label">금액</label>
										</div>
										<div class="col-md-10">
											<input type="text" class="form-control" name="money" id="money" value="${reservation.money }" readOnly>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row pb-3 justify-content-md-center">
							<div class="col-md-8">
								<div class="row justify-content-end">
									<div class="col-md-4">
										<button class="btn btn-danger mx-1" type="submit" onclick="return deleteCheck()">삭제하기</button> 
										<button class="btn btn-primary mx-1" type="button" onclick="location.href='/mypage/reservation/list'">목록으로</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>		
			</div>
		</div>
	</div>
</div>


<%@ include file="../../includes/searchFooter.jsp"%>

<script type="text/javascript">
	function deleteCheck() {
		if(confirm("정말로 삭제하시겠습니까?")){
			return true;
		} else return false;
	}
</script>