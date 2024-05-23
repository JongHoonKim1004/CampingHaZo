<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
								<div class="card-header">김종훈님 정보</div>
								<div class="card-body">
									<ul class="mainInformation">
										<li>
											<img alt="" src="/resources/img/mypage/play-button.svg" style="width: 16px;">
											&nbsp;
											아이디 :
											<span class="informationSpan username">kim9823</span>
										</li>
										<li>
											<img alt="" src="/resources/img/mypage/play-button.svg" style="width: 16px;">
											&nbsp;
											가입일 :
											<span class="informationSpan regDate">2024년 5월 8일</span>
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
											<span class="informationSpan reply">0개</span>
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
											김종훈님 예약
											<span style="float: right; line-height: 17px;">
												<a href="#"><img alt="" src="/resources/img/mypage/plus.svg" style="width: 16px;"></a>
											</span>
										</div>
										<div class="card-body">
											<div class="mypageMainReservation">
												<table class="table p-3">
													<thead>
														<tr>
															<th>장소</th>
															<th>날짜</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><a href="#">123</a></td>
															<td>11</td>
														</tr>
													</tbody>
												</table>
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
											<div class="container mypageMainNoData">
												찜한 캠핑장이 없습니다.
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
												<div class="container mypageMainNoData">
													내가 등록한 리뷰가 없습니다.
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
</div>


<%@ include file="../includes/searchFooter.jsp"%>