<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>

<main>
	<div class="row justify-content-md-center pt-5 pb-5" style="background-color: #cccccc4f;">
		<div class="col-md-8">
			<div class="row pb-4">
				<h1>예약 상세 보기</h1>
			</div>
			<div class="row justify-content-md-center pt-4">
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<h3>예약 정보</h3>
						</div>
					</div>
					<div class="row pb-5">
						<table class="table">
							<tbody>
								<tr>
									<th style="text-align: center; width: 15%;">예약 번호</th>
									<td>${reservation.rno }</td>
								</tr>
								<tr>
									<th style="text-align: center;">예약한 캠핑장</th>
									<td>${reservation.name }</td>
								</tr>
								<tr>
									<th style="text-align: center;">예약한 유저</th>
									<td>${reservation.username }</td>
								</tr>
								<tr>
									<th style="text-align: center;">예약한 날짜</th>
									<td>
										<fmt:formatDate value="${reservation.resDate }"/>
									</td>
								</tr>
								<tr>
									<th style="text-align: center;">인원수</th>
									<td>${reservation.people }</td>
								</tr>
								<tr>
									<th style="text-align: center;">금액</th>
									<td>${reservation.money }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row pt-5">
						<div class="col-md-12">
							<h3>예약자 정보</h3>
						</div>
					</div>
					<div class="row pb-5">
						<table class="table">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>연락처</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${users.username }</td>
									<td>${users.name }</td>
									<td>${users.phone }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row pt-5 pb-3">
						<div class="col-md-8">
							<form name="frm" action="/member/reservation/delete" method="post">
								<input type="hidden" name="rno" id="rno" value="${reservation.rno }">
							</form>
						</div>
						<div class="col-md-4">
							<button class="btn btn-danger mx-4" onclick="removeCheck()">예약 취소하기</button>
							<button class="btn btn-primary mx-2" onclick="location.href='/member/reservation/list'">예약 목록으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript">
	// 예약 취소하기 버튼
	function removeCheck(){
		if(confirm("정말로 예약을 취소하시겠습니까?")){
			$("input[name='frm']").submit();
		}
	}
	
</script>