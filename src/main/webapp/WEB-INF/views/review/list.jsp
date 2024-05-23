<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
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
						<sec:authorize access="hasRole('ROLE_USERS')">
							<a href="/review/register" class="newReview">새 리뷰 등록하기</a>
						</sec:authorize>
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
									<div class="container">
										<div class="col-md-12">
											
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="row" style="height: 90%;">
						<div class="col-md-12 noticeList">
							<c:forEach items="${reviewList }" var="review">
								<div class="row notice justify-content-end" style="border-bottom: 1px solid #d8d8d8;">
									<div class="col-md-10">
										<div class="row">
											<p style="margin-top: 0.5rem; margin-bottom: 0.5rem;">
												<span class="noticeSpan">${review.camping }</span>
												<a href="${review.rno }" class="callReview">
													${review.title }
												</a>
											</p>
										</div>
										<div class="row">
											<div class="col-md-12">
												<span class="noticeSpan">${review.writer }</span>
												<span class="noticeSpan">
													<fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd"/>
												</span> 
												<span class="noticeSpan">${review.readCount }</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
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
							<div class="row mb-2 reviewTitle">${reviewList[0].title }</div>
							<div class="row">
								<div class="col-md-12">
									<span class="noticeContentSpan reviewWriter" style="margin-left: 0;">${reviewList[0].writer }</span>
									|
									<span class="noticeContentSpan reviewRegDate">
										<fmt:formatDate value="${reviewList[0].regDate }" pattern="yyyy-MM-dd"/>
									</span>
									|
									<span class="noticeContentSpan reviewReadCount">
										<i class="fa fa-eye"></i>
										${reviewList[0].readCount }
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="reviewContent"></div>
					<div class="row mt-5 mb-5 pt-3" style="border-top: 1px solid #999;">
						<sec:authorize access="T(org.springframework.security.core.context.SecurityContextHolder).context.authentication.name == '${reviewList[0].writer}'">
				            <security:authorize access="hasRole('ROLE_USERS')">
				            <div class="col-md-12 reviewButtons">
                				<button class="btn btn-warning btn-sm" onclick="return modifyReview()">수정하기</button>
				                <button class="btn btn-danger btn-sm" onclick="return removeCheck()">삭제하기</button>
				            </div>
				            </security:authorize>
				        </sec:authorize>
					</div>
				</div>
			</div>
			<form action="/review/delete" method="post" id="removeForm">
				<input type="hidden" name="rno" id="rno">
			</form>
		</div>
	</div>
</div>

<%@ include file="../includes/searchFooter.jsp"%>
<script>

	$(document).ready(function() {
		$('[data-toggle="tooltip1"]').tooltip();
		$('[data-toggle="tooltip2"]').tooltip();
		$('[data-toggle="tooltip3"]').tooltip();
		
		// first content insert
		let firstContent = `${reviewList[0].content}`;
		$(".reviewContent").html(firstContent);
		
		// 제목 누르면 정보 호출
		$(".callReview").on("click", function(e){
			e.preventDefault();
			var num = $(this).attr("href");
			console.log("call notice, nno : " + num);
			
			// 이전 내용 초기화
			$(".reviewTitle").html("");
		    $(".reviewWriter").html("");
		    $(".reviewRegDate").html("");
		    $(".reviewReadCount").html("");
		            
		    $(".reviewContent").html("");
		    $(".reviewButtons").html(""); // 기존 버튼 제거
			// 부를 내용 호출
			$.ajax({
		        url: "/review/read/rno/" + num,
		        method: "GET",
		        success: function(data){
		            console.log(data);

		            // 날짜 포맷팅
		            var regDate = new Date(data.regDate).toLocaleDateString();

		            var loggedInUser = `${username}`; // 로그인한 사용자의 정보를 저장하는 hidden input

		            // 컨텐츠 추가
		            $(".reviewTitle").append(data.title);
		            $(".reviewWriter").append(data.writer);
		            $(".reviewRegDate").append(regDate);
		            $(".reviewReadCount").append(data.readCount);
		            
		            $(".reviewContent").html(data.content);
		            
		            $("#rno").val(data.rno);
		            
		            
	                
	                if(loggedInUser != ''){
	                	if (loggedInUser === data.writer) {
		                    $(".reviewButtons").append(`
		                        <div class="col-md-12">
		                            <button class="btn btn-warning btn-sm" onclick="return modifyReview()">수정하기</button>
		                            <button class="btn btn-danger btn-sm" onclick="return removeCheck()">삭제하기</button>
		                        </div>
		                    `);
		                }
	                }
		        },
		        error: function(xhr, status, error){
		            console.error("AJAX Error: ", status, error);
		        }
		    });
		});
		
		
	});
</script>
<script type="text/javascript">
//삭제하기 버튼 이벤트
function removeCheck(){
	
		if(confirm("정말 삭제하시겠습니까?")){
			$("#removeForm").attr("action", "/review/remove");
			$("#removeForm").submit();
		} else return false;
	
	
	
}

function modifyReview(){
	
		$("#removeForm").attr("action", "/review/modify");
		$("#removeForm").attr("method", "get");
		
		$("#removeForm").submit();
	
	
	
}
</script>