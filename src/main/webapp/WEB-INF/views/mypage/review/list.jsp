<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../includes/header.jsp"%>

<div>
	<div class="row" style="min-height: 870px;">
		<%@ include file="../includes/sidebar.jsp" %>
		<div style="width: 87.5%; flex: 0 0 auto; background-color: #eaebf2;">
			<div class="row">
				<div class="col-md-12 p-5">
					<div class="row pb-5">
						<h1 class="h2"><strong>내가 작성한 리뷰 목록</strong></h1>
					</div>
					<div class="row pb-3 justify-content-md-center">
						<div class="col-md-8">
							<div class="reviewList">
								<table class="table p-3">
									<thead>
										<tr>
											<th>번호</th>
											<th>캠핑장</th>
											<th>제목</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${reviewList }" var="review">
											<tr>
												<td>${review.rno }</td>
												<td>${review.camping }</td>
												<td><a href="/mypage/review/read/${review.rno }">${review.title }</a></td>
												<td>
													<fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd"/>
												</td>
												<td>${review.readCount }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>	
							</div>
						</div>
					</div>
					<div class="row pb-3 justify-content-md-center">
						<div class="col-md-8">
							<div class="row justify-content-end">
								<div class="col-md-2">
									<button class="btn btn-primary" onclick="location.href='/mypage/main'">메인으로</button>
								</div>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
	</div>
</div>


<%@ include file="../../includes/searchFooter.jsp"%>