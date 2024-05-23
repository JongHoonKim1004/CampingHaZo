<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>

<div>
	<div class="row" style="min-height: 870px;">
		<%@ include file="./includes/sidebar.jsp" %>
		<div style="width: 87.5%; flex: 0 0 auto; background-color: #eaebf2;">
			<div class="row">
				<div class="col-md-12 p-5">
					<div class="row">
						<div class="col-md-4">
							<div class="card">
								<div class="card-header">${user.username }님 정보</div>
								<div class="card-body">
									<ul class="mainInformation">
										<li>
											<img alt="" src="/resources/img/mypage/play-button.svg" style="width: 16px;">
											&nbsp;
											아이디 :
											<span class="informationSpan username">${user.username }</span>
										</li>
										<li>
											<img alt="" src="/resources/img/mypage/play-button.svg" style="width: 16px;">
											&nbsp;
											가입일 :
											<span class="informationSpan regDate">
												${user.regDate }
											</span>
										</li>
										<li>
											<img alt="" src="/resources/img/mypage/play-button.svg" style="width: 16px;">
											&nbsp;
											게시글 :
											<span class="informationSpan board">0개</span>
										</li>
										<li>
											<img alt="" src="/resources/img/mypage/play-button.svg" style="width: 16px;">
											&nbsp;
											리뷰 :
											<span class="informationSpan reply">${reviewList.size() }</span>
										</li>
									</ul>
								</div>
								
							</div>
						</div>
						<div class="col-md-4">
							<div class="row pb-3">
								<div class="col-md-12">
									<div class="card">
										<div class="card-header">
											${user.username }님 예약
											<span style="float: right; line-height: 17px;">
												<a href="#"><img alt="" src="/resources/img/mypage/plus.svg" style="width: 16px;"></a>
											</span>
										</div>
										<div class="card-body">
											<div class="mypageMainReservation">
												<c:choose>
													<c:when test="${empty reservationList }">
														<div class="container mypageMainNoData">
															예약이 없습니다.
														</div>
													</c:when>
													<c:otherwise>
														<table class="table p-3 mypageDataList">
															<thead>
																<tr>
																	<th>장소</th>
																	<th>날짜</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${reservationList }" var="reservation" begin="0" end="3">
																	<tr>
																		<td><a href="#">${reservation.name }</a></td>
																		<td>
																			<fmt:formatDate value="${reservation.resDate }" pattern="yyyy-MM-dd"/>
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class='card'>
										<div class='card-header'>찜한 캠핑장</div>
										<div class="card-body">
											<div class="mypageUsersCamping">
												<c:choose>
													<c:when test="${empty campingList }">
														<div class="container mypageMainNoData">
															찜한 캠핑장이 없습니다.
														</div>
													</c:when>
													<c:otherwise>
														<table class="table p-3 mypageDataList">
															<thead>
																<tr>
																	<th>장소</th>
																	<th>날짜</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${campingList }" var="usersCamping" begin="0" end="3">
																	<tr>
																		<td>${usersCamping.camping }</td>
																		<td>${usersCamping.addr }</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="row pb-3">
								<div class="col-md-12">
									<div class="card">
										<div class="card-header">
											내가 등록한 게시글
											<span style="float: right; line-height: 17px;">
												<a href="#"><img alt="" src="/resources/img/mypage/plus.svg" style="width: 16px;"></a>
											</span>
										</div>
										<div class="card-body">
											<div class="mypageMainBoard">
												<div class="container mypageMainNoData">
													내가 등록한 게시글이 없습니다.
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row pb-3">
								<div class="col-md-12">
									<div class="card">
										<div class="card-header">
											내가 작성한 리뷰
											<span style="float: right; line-height: 17px;">
												<a href="/mypage/review/list"><img alt="" src="/resources/img/mypage/plus.svg" style="width: 16px;"></a>
											</span>
										</div>
										<div class="card-body">
											<div class="mypageMainReply">
												<c:choose>
													<c:when test="${empty reviewList }">
														<div class="container mypageMainNoData">
															내가 작성한 리뷰가 없습니다.
														</div>
													</c:when>
													<c:otherwise>
														<table class="table p-3 mypageDataList">
															<thead>
																<tr>
																	<th>제목</th>
																	<th>날짜</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${reviewList }" var="review" begin="0" end="3">
																	<tr>
																		<td>${review.title }</td>
																		<td>
																			<fmt:formatDate value="${review.regDate }" pattern="yyyy-MM-dd"/>
																		</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</div>
	</div>
</div>


<%@ include file="../includes/searchFooter.jsp"%>