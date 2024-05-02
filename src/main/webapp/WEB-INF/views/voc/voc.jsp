<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="container p-4" style="background-color: #CCC;">
	<div class="col-md-12">
		<div class="voc">
			<div class="container p-5">
				<div class="row mb-5">
					<div class="col-md-12">
						<h1>
							<strong>1:1 문의</strong>
						</h1>
					</div>
				</div>
				<form>
					<div class="row mb-3">
						<div class='col-md-12'>
							<div class="row form-group">
								<div class="col-md-1">
									<label for="title" class="form-label">제 목</label> 
								</div>
								<div class="col-md-11">
									<input type="text" class="form-control" name="title" id="title">
								</div>
								
								
							</div>
						</div>
					</div>
					<div class="row mb-3">
						<div class='col-md-12'>
							<div class="row form-group">
								<div class="col-md-1">
									<label for="writer" class="form-label">성 함</label> 
								</div>
								<div class="col-md-5">
									<input type="text" class="form-control" name="writer" id="writer">
								</div>
							</div>
						</div>
					</div>
					<div class="row">	
						<div class='col-md-12'>
							<div class="row form-group">
								<label for="email" class="col-md-1">이메일</label> <input
									type="email" class="col-md-5 form-control" name="email"
									id="email">
							</div>
						</div>
						<div class='col-md-12'>
							<div class="row form-group">
								<label for="phone" class="col-md-1">연락처</label> <input
									type="text" class="col-md-5 form-control" name="phone"
									id="phone">
							</div>
						</div>
						<div class='col-md-12'>
							<div class="row form-group">
								<label for="content" class="col-md-1">내용</label>
								<div class="col-md-11">
									<div id="smarteditor">
										<textarea rows="20" cols="10" name="content" id="editorTxt" style="width: 100%;"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row justify-content-md-center mt-3">
						<div class="col-md-3">
							<div class="row">
								<button class="btn btn-primary btn-block" id="submit" type="submit" onclick="return clickSubmit()">등록하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/searchFooter.jsp"%>


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