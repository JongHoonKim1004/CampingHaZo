<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">캠핑장 정보</div>
			</div>

			<!-- Camping Information -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row justify-content-md-center">
							<div class="col-md-8">
								<div class="card-header p-4">
									<div class="row p-3">
										<h1>${camping.name }</h1>
									</div>
									<div class="row p-3">
										<img alt="캠핑장 대표사진" src="">
									</div>
								</div>

								<div class="card-body p-4">
									<div class="row pb-3">
										<div class="col-md-6">
											<i class="fa fa-map-marker"></i>
											<span class="adminCampingAddr">${camping.addr }</span>
										</div>
										<div class="col-md-6">
											<i class="fa fa-phone"></i>
											<span class="adminCampingTel">${camping.phone }</span>
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
													
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-md-center pb-3">
							<div class="col-md-8 justify-content-end">
								<div class="row">
									<div class="col-md-9"></div>
									<div class="col-md-3">
										<button class="btn btn-primary mx-3" onclick="location.href='/admin/camping/list'">목록으로</button>
										<button class="btn btn-danger">삭제하기</button>
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