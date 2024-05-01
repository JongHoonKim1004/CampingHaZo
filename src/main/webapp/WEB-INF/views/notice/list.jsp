<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-6 boardList">
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
								<a href="#" data-toggle="tooltip3" data-placement="right"
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
											<span>캠핑장</span>
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
		<div class="col-md-6 p-4">
			<div class="container">
				<div class="col-md-12">
					<div class="row contentTitle pb-3 mb-5" style="border-bottom: 1px solid #999;">
						<div class="col-md-12">
							<div class="row mb-2">title</div>
							<div class="row">
								<span class="noticeContentSpan" style="margin-left: 0;">writer</span>
								|
								<span class="noticeContentSpan">time</span>
								|
								<span class="noticeContentSpan">
									<i class="fa fa-eye"></i>
									readcount
								</span>
							</div>
						</div>
					</div>
					<div class="row contentText mb-3">text</div>
					<div class="row contentImg">img</div>
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