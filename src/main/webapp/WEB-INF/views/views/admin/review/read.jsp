<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">리뷰 상세보기</div>
			</div>

			<!-- Notice Information -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<form class="bg-white">
							<div class="row justify-content-md-center p-5 mb-3">
								<div class="col-md-8">
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="nno">리뷰 번호</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="nno" id="nno" readonly value=${title }>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="title">제목</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="title" id="title" readonly value=${title }>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="writer">작성자</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="writer" id="writer" readonly value=${writer }>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="camping">리뷰한 캠핑장</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="camping" id="camping" readonly value=${writer }>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="content">내용</label>
										</div>
										<div class="col-md-9">
											<div class="content" id="content" style="min-height: 200px;">
											
											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-9"></div>
										<div class="col-md-3">
											<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/admin/review/list'">목록으로</button>
											<button type="submit" class="btn btn-danger btn-sm">삭제하기</button>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>






			<%@ include file="../includes/innerFooter.jsp"%>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp"%>
