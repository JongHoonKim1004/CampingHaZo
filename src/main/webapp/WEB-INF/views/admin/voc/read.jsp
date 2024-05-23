<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">1:1 문의 상세보기</div>
			</div>

			<!-- Voc Information -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<form class="bg-white">
							<div class="row justify-content-md-center p-5 mb-3">
								<div class="col-md-8">
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="vno">문의 번호</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="vno" id="vno" readonly value="${voc.vno }">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="title">제목</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="title" id="title" readonly value="${voc.title }">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="writer">작성자</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="writer" id="writer" readonly value="${voc.writer }">
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
											<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/admin/voc/list'">목록으로</button>
											<button type="submit" class="btn btn-danger btn-sm">삭제하기</button>
										</div>
									</div>
								</div>
							</div>
						</form>
						<form class="bg-white" action="/admin/voc/reply" method="post">
							<input type="hidden" name="vno" id="vno" value="${voc.vno}">
							<div class="row justify-content-md-center p-5 mb-3">
								<div class="col-md-8">
									<div class="form-group row pb-3">
										<h1>답글 작성하기</h1>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="title">제목</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="title" id="title">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="writer">작성자</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="writer" id="writer" readonly value="${admin.username }">
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="content">내용</label>
										</div>
										<div class="col-md-9">
											<div id="smarteditor">
												<textarea rows="20" cols="10" name="content" id="editorTxt" style="width: 100%; height: 100px;"></textarea>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-9"></div>
										<div class="col-md-3">
											<button type="submit" class="btn btn-primary btn-sm" onclick="return clickSubmit()">답글 등록하기</button>
											<button type="reset" class="btn btn-secondary btn-sm">다시 작성하기</button>
										</div>
									</div>
								</div>
							</div>
						</form>
						<div class="row justify-content-md-center pb-5 pt-5">
							<div class="col-md-8">
								<div id="borderedAccordion" class="bg-white">
									<div class="row pt-3 pb-5">
										<h1>답글 리스트</h1>
									</div>
									<!-- forEach reply -->
									<c:forEach items="${replyList }" var="reply">
										<div class="accordion accordion-bordered-y accordion-stacked">
											<header id="borderedAccordion-heading-1" class="accordion-header" aria-expended=true aria-controls="borderedAccordion-1" data-toggle="collapse" data-target="#borderedAccordion-1" style="position: relative;">
												<i class="gd accordion-icon icon-text mr-2"></i>
												<h5>${reply.title }</h5>
												<span class="replyDate" style="position: absolute; right: 130px;">
													<fmt:formatDate value="${reply.regDate }" pattern="yyyy-MM-dd"/>
												</span>
												<i class="accordion-control gd-angle-up icon-text ml-auto"></i>
											</header>
											<div id="borderedAccordion-1" class="collapse" aria-labelledby="borderedAccordion-heading-1" data-parent="#borderedAccordion">
                    	    	                 <div class="accordion-body">
                	    	                     	<div class="row pb-5">
                		                         		<div class="col-md-12 replyContent">
                		                         			${reply.content }
            	    	                         		</div>
        	        	                         		
    	            	                         	</div>
	                	                         	<div class="row">
                	                         			<div class="col-md-12">
                	                         				${reply.writer }
                	                        	 		</div>
                	                    	     		
                	                	         	</div>
                	            	             	<div class="row">
                	        	                 		<div class="col-md-10"></div>
                	    	                     		<div class="col-md-2">
                		                         			<button type="button" class="btn btn-danger btn-sm">삭제하기</button>
                		                         		</div>
            	    	                         	</div>
        	    	                             </div>
    	    	                             </div>
										</div>
									</c:forEach>
									<!-- ./forEach reply -->							
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


<!-- 스마트에디터 함수 -->
<script type="text/javascript" src="/resources/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
let oEditors= [];

const smartEditor = function(){
	console.log("Naver smartEditor");
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: editorTxt,
		sSkinURI: "/resources/SmartEditor2Skin.html",
		htParams: {
			bUseToolbar: true,
			bUseVerticalResizer: true,
			bUseModeChanger: true,
		},
		fCreator: "createSEditor2"
	});
} 

$(function(){
	smartEditor();
});

const clickSubmit = function(){
	oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
	var editor_data = $("#editorTxt").val();
	
	if(editor_data == "" || editor_data == "<br>" || editor_data == "<p>&nbsp;</p>"){
		alert("내용을 입력해주세요.");
		return false;
	}
	
	
	return true;
}

// VOC Content
var content = "${voc.content}";
$("#content").html(content);

// replyContent
</script>
