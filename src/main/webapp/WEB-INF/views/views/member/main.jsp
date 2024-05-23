<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp"%>

<main>
	<div class="row justify-content-md-center pt-5 pb-5" style="background-color: #cccccc4f;">
		<div class="col-md-8">
			<div class="row pb-4">
				<h1>사업자 대시보드</h1>
			</div>
			<div class="row justify-content-md-center pt-4">
				<div class="col-md-10">
					<div class="row pb-4">
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-5">
											<i class="fa-solid fa-campground fa-6x"
												style="display: flex; justify-content: center; margin: 0 auto;"></i>
										</div>
										<div class="col-md-7" style="text-align: right;">
											<span>내가 등록한 캠핑장</span><br> <span id="mycampingNumber"
												class="spanNumber">2</span><span> 개</span>

										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class='card'>
								<div class="card-body">
									<div class="row">
										<div class="col-md-5">
											<i class="fa-regular fa-envelope fa-6x"
												style="display: flex; justify-content: center; margin: 0 auto;"></i>
										</div>
										<div class="col-md-7" style="text-align: right;">
											<span>현재 등록된 예약은</span><br> <span class="spanNumber"
												id="reservationNumber">1</span><span> 개</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col-md-5">
											<i class="fa-regular fa-comments fa-6x"
												style="display: flex; justify-content: center; margin: 0 auto;"></i>
										</div>
										<div class="col-md-7" style="text-align: right">
											<span>캠핑장에 달린 리뷰는</span><br> <span
												class="spanNumber" id="reviewNumber">3192</span><span>
												개</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row pb-4 pt-4">
						<div class="col-md-12">
							<div class="row pb-3">
								<h2>최근 예약 리스트</h2>
							</div>
							<div class="row pb-3">
								<table class="table">
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
												<button class="btn btn-primary btn-sm"
													onclick="location.href='/member/reservation/read'">자세히
													보기</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row pb-3">
								<div class="col-md-3">
									<button class="btn btn-primary"
										onclick="location.href='/member/reservation/list'">전체
										예약 목록 보기</button>
								</div>
								<div class="col-md-9"></div>
							</div>
						</div>
					</div>
					<div class="row pb-4 pt-4">
						<div class="col-md-12">
							<div class="row pb-3">
								<h2>내가 등록한 캠핑장 목록</h2>
							</div>
							<div class="row pb-3">
								<table class="table">
									<thead>
										<tr>
											<th>식별번호</th>
											<th>이름</th>
											<th>주소</th>
											<th>연락처</th>
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
												<button class="btn btn-primary btn-sm" onclick="location.href='/member/mycamping/read'">자세히 보기</button>
											</td>
										</tr>
									</tbody>
								</table> 
							</div>
							<div class="row pb-3">
								<div class="col-md-3">
									<button class='btn btn-primary' onclick="location.href='/member/mycamping/list'">내 캠핑장 목록 보기</button>
								</div>
								<div class="col-md-9"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="./includes/footer.jsp"%>