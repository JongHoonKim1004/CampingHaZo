<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">관리자 정보 상세보기</div>
			</div>

			<!-- Admin Detail -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row justify-content-md-center p-5">
							<div class="col-md-8">
								<div class="card-body">
									<div class="row pt-5 pb-5">
										<div class="col-md-12">
											<!-- 관리자 정보 테이블 -->
											<table class="table bg-white">
												<thead>
													<tr>
														<th colspan="2" style="text-align: center;"
															class="pt-4 pb-4">관리자 정보</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th style="text-align: center;">관리자 번호</th>
														<td>${admin.ano }</td>
													</tr>
													<tr>
														<th style="text-align: center;">아이디</th>
														<td>${admin.username }</td>
													</tr>
													<tr>
														<th style="text-align: center;">이름</th>
														<td>${admin.name }</td>
													</tr>
													<tr>
														<th style="text-align: center;">사원번호</th>
														<td>${admin.employeeNo }</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									
									<div class="row pt-5 pb-5">
										<div class="col-md-8"></div>
										<div class='col-md-4'>
											<button class="btn btn-primary mx-3" onclick="location.href='/admin/admin/list'">목록으로</button>
											<button class="btn btn-danger" type="button" onclick="removeCheck()">관리자 삭제하기</button>
											<form id="delete" action="/admin/admin/delete/${admin.ano }" method="post" style={>
												
												<input type="hidden" name="ano" id='ano' value="${admin.ano }">
											</form>
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

<script type="text/javascript">
	function removeCheck(){
		var form = $("#delete");
	
		if(confirm("정말 삭제하시겠습니까?\n삭제 후 되돌릴 수 없습니다.")){
			form.submit();
		} else {
			return false;
		}
	}
</script>