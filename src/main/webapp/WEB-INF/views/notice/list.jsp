<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					style="border-top: 1px solid black; border-left: 1px solid black; min-height: 1000px;">
					<div class="row"
						style="border-bottom: 1px solid #999; background-color: #CCC;">
						<form style="padding: 0;">
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
					<div class="row" style="height: 90%;">
						<div class="col-md-12 noticeList">
							<div class="row notice justify-content-end">
								<div class="col-md-10">
									<c:forEach items="${noticeList }" var="notice">
										<div class="row" style="border-bottom: 1px solid #f8f8f8">
											<p style="margin-top: 0.5rem; margin-bottom: 0.5rem;">
												<a href="${notice.nno }" class="callNotice">${notice.title }</a>
											</p>
										</div>
										<div class="row">
											<div class="col-md-12">
												<span class="noticeSpan">${notice.writer }</span>
												<span class="noticeSpan">
													<fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd"/>
												</span>
												<span class="noticeSpan">${notice.readCount }</span>
											</div>
										</div>
									</c:forEach>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-8 p-4" style="border-left: 3px solid #d8d8d8;">
			<div class="container">
				<div class="col-md-12">
					<div class="row contentTitle pb-3 mb-5" style="border-bottom: 1px solid #999;">
						<div class="col-md-12">
		                    <div class="row mb-2 noticeTitle">${noticeList[0].title }</div>
		                    <div class="row">
		                        <div class="col-md-12">
		                            <span class="noticeContentSpan noticeWriter" style="margin-left: 0;">${noticeList[0].writer }</span> |
		                            <span class="noticeContentSpan noticeRegDate">
		                            	<fmt:formatDate value="${noticeList[0].regDate }" pattern="yyyy-MM-dd"/>
		                            </span> |
		                            <span class="noticeContentSpan noticeReadCount">
		                                <i class="fa fa-eye"></i> ${noticeList[0].readCount }
		                            </span>
		                        </div>
		                    </div>
		                </div>
					</div>
					<div class="noticeContent"> ${noticeList[0].content }</div>
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
		
		// 누르면 공지사항 호출
		$(".callNotice").on("click", function(e){
			e.preventDefault();
			var num = $(this).attr("href");
			console.log("call notice, nno : " + num);
			
			// 이전 내용 초기화
			$(".noticeTitle").html("");
		    $(".noticeWriter").html("");
		    $(".noticeRegDate").html("");
		    $(".noticeReadCount").html("");
		            
		    $(".noticeContent").html("");
			
			// 부를 내용 호출
			$.ajax({
		        url: "/notice/read/nno/" + num,
		        method: "GET",
		        success: function(data){
		            console.log(data);

		            // 날짜 포맷팅
		            var regDate = new Date(data.regDate).toLocaleDateString();

		            

		            // 컨텐츠 추가
		            $(".noticeTitle").append(data.title);
		            $(".noticeWriter").append(data.writer);
		            $(".noticeRegDate").append(regDate);
		            $(".noticeReadCount").append(data.readCount);
		            
		            $(".noticeContent").html(data.content);
		        },
		        error: function(xhr, status, error){
		            console.error("AJAX Error: ", status, error);
		        }
		    });
		})
	});
</script>
<script>
	
</script>