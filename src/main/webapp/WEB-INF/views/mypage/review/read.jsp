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
						<h1 class="h2"><strong>내가 작성한 리뷰</strong></h1>
					</div>
					<form>
						<div class="row pb-3 justify-content-md-center">
							<div class="col-md-8">
								<div class="reviewRead bg-white p-5" style="text-align: center;">
									<div class="row form-group pb-3">
										<div class="col-md-2">
											<label class="form-label">제목</label>
										</div>
										<div class="col-md-10">
											<input type="text" class="form-control" name="title" id="title" value="${review.title }" readOnly>
										</div>
									</div>
									<div class="row form-group pb-3">
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="form-label">작성자</label> 
												</div>
												<div class="col-md-8">
													<input type="text" class="form-control" name="writer" id="writer" value="${review.writer }" readOnly>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="form-label">작성일</label>
												</div>
												<div class="col-md-8">
													<input type="text" class="form-control" name="regDate" id="regDate" value="${review.regDate }" readOnly>
												</div>
											</div>
										</div>
									</div>
									<div class="row form-group pb-3">
										<div class="col-md-6">
											<div class="row">
												<div class='col-md-4'>
													<label class="form-label">조회수</label>
												</div>
												<div class="col-md-8">
													<input type="text" class="form-control" name="readCount" id="readCount" value="${review.readCount }" readOnly>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-4">
													<label class="form-label">수정일</label>
												</div>
												<div class="col-md-8">
													<input type="text" class="form-control" name="updateDate" id="updateDate" value="${review.updateDate }" readOnly>
												</div>
											</div>
										</div>
									</div>
									<div class="row form-group pt-3 pb-5">
										<div class="col-md-2">
											<label class="form-label">내용</label>
										</div>
										<div class="col-md-10">
											<div id="content"></div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<div class="row pb-3 justify-content-md-center">
							<div class="col-md-8">
								<div class="row justify-content-end">
									<div class="col-md-4">
										<button class="btn btn-danger mx-1" type="submit" onclick="return deleteCheck()">삭제하기</button> 
										<button class="btn btn-warning mx-1" type="button" onclick="location.href='/mypage/review/modify'">수정하기</button>
										<button class="btn btn-primary mx-1" type="button" onclick="location.href='/mypage/review/list'">목록으로</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>		
			</div>
		</div>
	</div>
</div>


<%@ include file="../../includes/searchFooter.jsp"%>

<script type="text/javascript">
	function deleteCheck() {
		if(confirm("정말로 삭제하시겠습니까?")){
			return true;
		} else return false;
	}
	
	
	var content = ${review.content};
	$("#content").html(content);
</script>