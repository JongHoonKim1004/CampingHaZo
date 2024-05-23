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
						<h1 class="h2"><strong>내가 작성한 리뷰 수정</strong></h1>
					</div>
					<form name="frm">
						<div class="row pb-3 justify-content-md-center">
							<div class="col-md-8">
								<div class="reviewRead bg-white p-5" style="text-align: center;">
									<div class="row form-group pb-3">
										<div class="col-md-2">
											<label class="form-label">제목</label>
										</div>
										<div class="col-md-10">
											<input type="text" class="form-control" name="title" id="title" value="${review.title }">
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
									</div>
									<div class="row form-group pt-3 pb-5">
										<div class="col-md-2">
											<label class="form-label">내용</label>
										</div>
										<div class="col-md-10">
											<div id="smarteditor">
												<textarea rows="20" cols="10" name="content" id="editorTxt" style="width: 100%;">${review.content }</textarea>
											</div>
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<div class="row pb-3 justify-content-md-center">
							<div class="col-md-8">
								<div class="row justify-content-end">
									<div class="col-md-3">
										<button class="btn btn-warning mx-1" type="submit" onclick="return modifyCheck()">수정하기</button>
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
	function modifyCheck() {
		if(document.frm.title.value == ""){
			alert("제목을 입력해주세요");
			frm.title.focus();
			return false;
		}
		if(document.frm.writer.value == ""){
			alert("비정상적인 접근입니다");
			window.location.href="/";
			return false;
		}
		
		oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
		var editor_data = $("#editorTxt").val();
		
		if(editor_data == "" || editor_data == "<br>" || editor_data == "<p>&nbsp;</p>"){
			alert("내용을 입력해주세요.");
			return false;
		}
		
		return true;
	}
</script>

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
</script>