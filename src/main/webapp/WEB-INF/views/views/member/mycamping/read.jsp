<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main>
	<div class="row justify-content-md-center pt-5 pb-5" style="background-color: #cccccc4f;">
		<div class="col-md-8">
			<div class="row pb-4">
				<h1>사업자 대시보드</h1>
			</div>
			<div class="row justify-content-md-center pt-4">
				<div class="col-md-10">
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="row">
									<div class="col-md-12">
										<div class="card-header p-4">
											<div class="row p-3">
												<h1>Title</h1>
											</div>
											<div class="row p-3">image</div>
										</div>

										<div class="card-body p-4">
											<div class="row pb-3">
												<div class="col-md-6">
													<i class="fa fa-map-marker"></i>
													<span class="adminCampingAddr"></span>
												</div>
												<div class="col-md-6">
													<i class="fa fa-phone"></i>
													<span class="adminCampingTel"></span>
												</div>
											</div>
											<div class="row mt-3 mb-3">
												<div class="col-md-12">
													<table class="table bg-white">
														<tbody>
															<tr>
																<th style="text-align: center; width: 200px;">주변환경</th>
																<td>등등</td>
															</tr>
															<tr>
																<th style="text-align: center;">부대시설</th>
																<td>등등</td>
															</tr>
															<tr>
																<th style="text-align: center;"></th>
																<td></td>
															</tr>
															<tr>
																<th style="text-align: center;"></th>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row pb-3">
									<div class="col-md-12 justify-content-end">
										<div class="row">
											<div class="col-md-9"></div>
											<div class="col-md-3">
												<button type="button" class="btn btn-primary mx-3" onclick="location.href='/member/mycamping/list'">목록으로</button>
												<button class="btn btn-danger">삭제하기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp"%>