<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">공지사항 수정하기</div>
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
											<label for="title">제목</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="title" id="title"  value=${title }>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="writer">작성자</label>
										</div>
										<div class="col-md-9">
											<input type="text" class="form-control" name="title" id="title" readonly value=${writer }>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-2" align="center">
											<label for="content">내용</label>
										</div>
										<div class="col-md-9">
											<div id="smarteditor">
												<textarea rows="20" cols="10" name="content" id="editorTxt" style="width: 100%;"></textarea>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-9"></div>
										<div class="col-md-3">
											<button type="submit" class="btn btn-warning btn-sm">등록하기</button>
											<button type="button" class="btn btn-primary btn-sm" onclick="location.href='/admin/notice/list'">목록으로</button>
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
