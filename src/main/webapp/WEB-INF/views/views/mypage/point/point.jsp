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
						<h1 class="h2"><strong>나의 포인트</strong></h1>
					</div>
					<div class="row pb-3 justify-content-md-center">
						<div class="col-md-8 bg-white p-3">
							<div class="myPoint">
								<div class="row pb-3">
									<div class="col-md-7">
										<h3>김종훈 님의 현재 포인트는</h3>
									</div>
									<div class="col-md-5">
										<h3 id="pointBalance">100 포인트</h3>
									</div>
								</div>
								
								<div class="row pt-3 pb-3">
									<div class="col-md-12">
										<div class="row pb-2">
											<h4>포인트 이력</h4>
										</div>
										<div class="row pb-2">
											<table class='table'>
												<thead>
													<tr>
														<th>번호</th>
														<th>포인트 변동량</th>
														<th>변동 사유</th>
														<th>변동 시간</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>100</td>
														<td>1</td>
														<td>2024-05-09</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row pb-3 justify-content-md-center">
						<div class="col-md-8">
							<div class="row justify-content-end">
								<div class="col-md-2">
									<button class="btn btn-primary" onclick="location.href='/mypage/main'">메인으로</button>
								</div>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
	</div>
</div>


<%@ include file="../../includes/searchFooter.jsp"%>