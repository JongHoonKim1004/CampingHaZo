<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div>
	<div class="row">
		<div class="col-md-4 boardList">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<i class="fa fa-list"></i> <span class="totalNotice">38</span>개
				</div>
				<div class="col-md-8">
					<div style="float: right;">
						<button class="btn btn-link btnList">등록순</button>
						<button class="btn btn-link btnList">조회순</button>
						<button class="btn btn-link btnList">댓글순</button>
						<button class="btn btn-link btnList">추천순</button>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1 mt-5">
					<div class="row mb-3">
						<div class="col-md-12">
							<div class="row justify-content-md-center mb-3">
								<a href="/notice/list" data-toggle="tooltip1"
									data-placement="right" title="공지사항"> <i
									class="fa fa-warning fa-2x"></i>
								</a>
							</div>
							<div class="row justify-content-md-center mb-3">
								<a href="/review/list" data-toggle="tooltip2" data-placement="right"
									title="리뷰 게시판"> <i class="fa fa-comments fa-2x"></i>
								</a>
							</div>
							<div class="row justify-content-md-center mb-3">
								<a href="/voc" data-toggle="tooltip3" data-placement="right"
									title="1:1 문의"> <i class="fa fa-envelope-o fa-2x"></i>
								</a>
							</div>
						</div>
					</div>


				</div>
				<div class="col-md-11"
					style="border-top: 1px solid black; border-left: 1px solid black;">
					<div class="row"
						style="border-bottom: 1px solid #999; background-color: #CCC;">
						<form>
							<div class="row" style="margin-left: 0">
								<div class="col-md-3"
									style="border-right: 1px solid #999; background-color: white;">
									<select name="type" id="type" class="noticeSelect">
										<option value="T">제목</option>
										<option value="C">본문</option>
										<option value="W">작성자</option>
									</select>
								</div>
								<div class="col-md-4" style="border-right: 1px solid #999">
									<div class="row">
										<input type="text" name="search" id="search"
											style="width: 80%; height: 30px; border: 0; border-radius: 0;">
										<button type="submit"
											style="width: 20%; background-color: white; border: 0;">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
								<div class="col-md-5">
									<div class="container"></div>
								</div>
							</div>
						</form>
					</div>
					<div class="row">
						<div class="col-md-12 noticeList">
							<div class="row notice">
								<div class="col-md-2">pic</div>
								<div class="col-md-10">
									<div class="row">
										<p style="margin-top: 0.5rem; margin-bottom: 0.5rem;">
											<span class="noticeSpan">캠핑장</span>
											title
										</p>
									</div>
									<div class="row">
										<span class="noticeSpan">writer</span> <span
											class="noticeSpan">date</span> <span class="noticeSpan">readcount</span>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-8 p-4">
			<div class="container">
				<div class="col-md-12">
					<div class="row contentTitle pb-3 mb-5" style="border-bottom: 1px solid #999;">
						<div class="col-md-12">
							<div class="row mb-2">새 리뷰 작성</div>
						</div>
					</div>
					<form action="/review/register" method="post">
						<div class="row mb-3">
							<div class="col-md-3">
								<label class="form-label">제목</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="title" id="title" class="form-control">
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-3">
								<label class="form-label">작성자</label>
							</div>
							<div class="col-md-9">
								<input type="text" name="writer" id="writer" class="form-control" readonly value="zima0412@gmail.com">
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-md-3">
								<label class="form-label">캠핑장 이름</label>
								
							</div>
							<div class="col-md-9">
								<input type="text" name="camping" id="camping" class="form-control">
							</div>
						</div>
						
						<div class="row mb-3">
							<div class="col-md-3">
								<label class="form-label">내용</label>
							</div>
							<div class="col-md-9">
								<div id="smarteditor">
									<textarea rows="20" cols="10" name="content" id="editorTxt" style="width: 100%;"></textarea>
								</div>
							</div>
						</div>
						
						<div class="row mb-3">
							<div class="col-md-12">
								<button class="btn btn-primary" type="submit" style="float: right;">리뷰 등록하기</button>
							</div>
						</div>
					</form> 
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/searchFooter.jsp"%>
<script>
	$(document).ready(function() {
		$('[data-toggle="tooltip1"]').tooltip();
		$('[data-toggle="tooltip2"]').tooltip();
		$('[data-toggle="tooltip3"]').tooltip();
	});
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