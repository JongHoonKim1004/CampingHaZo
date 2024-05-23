<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">공지사항 상세보기</div>
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
											<label for="nno">공지사항 번호</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="nno" id="nno" readonly value=${notice.nno }>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="title">제목</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="title" id="title" readonly value=${notice.title }>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="writer">작성자</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="writer" id="writer" readonly value=${notice.writer }>
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
										<div class="col-md-8"></div>
										<div class="col-md-4">
											<button type="button" id="submitBtn" class="btn btn-warning btn-sm">수정하기</button>
											<button type="button" id="removeBtn" class="btn btn-danger btn-sm">삭제하기</button>
											<button type="button" id="listBtn" class="btn btn-primary btn-sm" onclick="location.href='/admin/notice/list'">목록으로</button>
											
										</div>
									</div>
								</div>
							</div>
						</form>
							<form id='operForm' action="/admin/notice/modify" method='get'>
								<input type='hidden' id="nno" name='nno' value='${notice.nno}'>
								<input type='hidden' name='pageNum' value='${cri.pageNum}'>
								<input type='hidden' name='amount' value='${cri.amount}'>
							</form>
					</div>
				</div>
			</div>






			<%@ include file="../includes/innerFooter.jsp"%>
		</div>
	</div>
</main>

<script type="text/javascript">
$(document).ready(function() {
	// insert content
	let content = `${notice.content}`;
	$("#content").html(content);
	
	// pagnition
  var operForm = $("#operForm"); 
  $("#submitBtn").on("click", function(e){
    operForm.attr("action","/admin/notice/modify").submit();
  });
  
    
  $("#listBtn").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/admin/notice/list");
    operForm.submit();
    
  }); 
  
  $("#removeBtn").on("click", function(e){
	  if(confirm("정말 삭제하시겠습니까?")){
		  operForm.attr("action","/admin/notice/remove");
		  operForm.attr("method", "post");
		  operForm.submit();
	  }
	  
  });
  
  
});
</script>

<%@ include file="../includes/footer.jsp"%>
