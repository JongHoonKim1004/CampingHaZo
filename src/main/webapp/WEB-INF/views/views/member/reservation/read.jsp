<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
									<td></td>
								</tr>
								<tr>
									<th style="text-align: center;">예약한 캠핑장</th>
									<td></td>
								</tr>
								<tr>
									<th style="text-align: center;">예약한 유저</th>
									<td></td>
								</tr>
								<tr>
									<th style="text-align: center;">예약한 날짜</th>
									<td></td>
								</tr>
								<tr>
									<th style="text-align: center;">인원수</th>
									<td></td>
								</tr>
								<tr>
									<th style="text-align: center;">금액</th>
									<td></td>
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
									<td>1</td>
									<td>2</td>
									<td>01050956331</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row pt-5 pb-3">
						<div class="col-md-8"></div>
						<div class="col-md-4">
							<button class="btn btn-danger mx-4">예약 취소하기</button>
							<button class="btn btn-primary mx-2" onclick="location.href='/member/reservation/list'">예약 목록으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp"%>