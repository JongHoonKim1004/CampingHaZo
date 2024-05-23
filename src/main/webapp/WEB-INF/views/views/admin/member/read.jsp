<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">사업자 회원 정보 상세보기</div>
			</div>

			<!-- Member Detail -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row justify-content-md-center p-5">
							<div class="col-md-8">
								<div class="card-body">
									<div class="row pt-5 pb-5">
										<div class="col-md-12">
											<!-- 사업자 정보 테이블 -->
											<table class="table bg-white">
												<thead>
													<tr>
														<th colspan="2" style="text-align: center;"
															class="pt-4 pb-4">회원 정보</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th style="text-align: center; width: 200px;">회원번호</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">아이디</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">사업자명</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">연락처</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">우편번호</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">소재지</th>
														<td></td>
													</tr>
													<tr>
														<th style="text-align: center;">사업자등록번호</th>
														<td></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row pt-5 pb-5">
										<div class="col-md-12">
											<!-- 내가 등록한 캠핑장 테이블 -->
											<table class="table bg-white">
												<thead>
													<tr>
														<th colspan="5" style="text-align: center;"
															class="pt-4 pb-4">
															내가 등록한 캠핑장
														</th>
													</tr>
													<tr>
														<th>식별번호</th>
														<th>이름</th>
														<th>주소</th>
														<th>연락처</th>
														<th>등록일</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>1</td>
														<td>2</td>
														<td>3</td>
														<td>4</td>
														<td>5</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row pt-5 pb-5">
										<div class="col-md-8"></div>
										<div class='col-md-4'>
											<button class="btn btn-primary mx-3" onclick="location.href='/admin/member/list'">목록으로</button>
											<button class="btn btn-danger">회원 삭제하기</button>
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