<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">예약 정보 상세보기</div>
			</div>

			<!-- Reservation Detail -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row justify-content-md-center p-5">
							<div class="col-md-8">
								<div class="card-body">
									<div class="row pt-5 pb-5">
										<div class="col-md-12">
											<!-- 예약 정보 테이블 -->
											<table class="table bg-white">
												<thead>
													<tr>
														<th colspan="2" style="text-align: center;"
															class="pt-4 pb-4">예약 정보</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th style="text-align: center; width: 200px;">예약 번호</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">예약한 회원</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">예약한 캠핑장</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">예약 날짜</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">예약 금액</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">인원수</th>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									
									<div class="row pt-5 pb-5">
										<div class="col-md-8"></div>
										<div class='col-md-4'>
											<button class="btn btn-primary mx-3" onclick="location.href='/admin/reservation/list'">목록으로</button>
											<button class="btn btn-danger">예약 삭제하기</button>
										</div>
									</div>
								</div>
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