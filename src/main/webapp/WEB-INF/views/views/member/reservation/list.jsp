<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main>
	<div class="row justify-content-md-center pt-5 pb-5" style="background-color: #cccccc4f;">
		<div class="col-md-8">
			<div class="row pb-4">
				<h1>현재 등록된 예약 목록</h1>
			</div>
			<div class="row justify-content-md-center pt-4">
				<div class="col-md-10">
					<div class="row pt-3 pb-3">
						<table class="table bg-white">
							<thead>
								<tr>
									<th>예약 번호</th>
									<th>캠핑장</th>
									<th>예약 날짜</th>
									<th>예약 인원</th>
									<th style="width: 11%;">자세히 보기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>
										<button class="btn btn-primary btn-sm" onclick="location.href='/member/reservation/read'">자세히 보기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="row pb-3">
						<div class="col-md-3">
							<button class='btn btn-primary' onclick="location.href='/member/main'">메인 페이지로</button>
						</div>
						<div class="col-md-9"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp"%>