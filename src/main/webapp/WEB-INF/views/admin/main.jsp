<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="./includes/header.jsp"%>

<main class="main">
	<%@ include file="./includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">Dashboard</div>
			</div>

			<!-- upper menu -->
			<div class="row mb-5 pb-5">
				<div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
					<!-- Widget -->
					<div class="card flex-row align-items-center p-3 p-md-4">
						<div class="icon icon-lg bg-soft-primary rounded-circle mr-3">
							<i class="gd-bar-chart icon-text d-inline-block text-primary"></i>
						</div>
						<div>
							<h4 class="lh-1 mb-1">3.1415923565</h4>
							<h6 class="mb-0">일반회원 수</h6>
						</div>
						<i class="gd-arrow-right icon-text d-flex text-success ml-auto"></i>
					</div>
					<!-- End Widget -->
				</div>

				<div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
					<!-- Widget -->
					<div class="card flex-row align-items-center p-3 p-md-4">
						<div class="icon icon-lg bg-soft-secondary rounded-circle mr-3">
							<i class="gd-wallet icon-text d-inline-block text-secondary"></i>
						</div>
						<div>
							<h4 class="lh-1 mb-1">2,529</h4>
							<h6 class="mb-0">등록된 캠핑장 수</h6>
						</div>
						<i class="gd-arrow-right icon-text d-flex text-success ml-auto"></i>
					</div>
					<!-- End Widget -->
				</div>

				<div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
					<!-- Widget -->
					<div class="card flex-row align-items-center p-3 p-md-4">
						<div class="icon icon-lg bg-soft-warning rounded-circle mr-3">
							<i class="gd-money icon-text d-inline-block text-warning"></i>
						</div>
						<div>
							<h4 class="lh-1 mb-1">10000</h4>
							<h6 class="mb-0">현재 등록된 예약 수</h6>
						</div>
						<i class="gd-arrow-right icon-text d-flex text-success ml-auto"></i>
					</div>
					<!-- End Widget -->
				</div>
			</div>
			<!-- ./upper-menu -->

			<!-- middle menu -->
			<!-- 새로 등록된 예약 -->
			<div class="tab-pane fade show mb-5 pb-5" id="pills-result-1"
				role="tabpanel" aria-labelledby="pills-result-tab-1">
				<h2 class="h4">새로 등록된 예약</h2>
				<table class="table bg-white">
					<thead>
						<tr>
							<th class="font-weight-semi-bold border-top-0 py-2">#</th>
							<th class="font-weight-semi-bold border-top-0 py-2">예약자</th>
							<th class="font-weight-semi-bold border-top-0 py-2">예약한 캠핑장</th>
							<th class="font-weight-semi-bold border-top-0 py-2">에약일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reservationList }" var="reservation">
							<tr>
								<td class="py-3">${reservation.rno }</td>
								<td class="py-3">${reservation.username }</td>
								<td class="py-3">${reservation.name }</td>
								<td class="py-3">
									<fmt:formatDate value="${reservation.resDate }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- ./새로 등록된 예약 -->
			
			<!-- 새로 등록된 1:1 문의 -->
			<div class="tab-pane fade show mb-3" id="pills-result-1"
				role="tabpanel" aria-labelledby="pills-result-tab-1">
				<h2 class="h4">새로 등록된 1:1 문의</h2>
				<table class="table bg-white">
					<thead>
						<tr>
							<th class="font-weight-semi-bold border-top-0 py-2">#</th>
							<th class="font-weight-semi-bold border-top-0 py-2">제목</th>
							<th class="font-weight-semi-bold border-top-0 py-2">작성자</th>
							<th class="font-weight-semi-bold border-top-0 py-2">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${vocList }" var="voc">
							<tr>
								<td class="py-3">${voc.vno }</td>
								<td class="py-3">${voc.title }</td>
								<td class="py-3">${voc.writer }</td>
								<td class="py-3">
									<fmt:formatDate value="${voc.regDate }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- ./새로 등록된 1:1 문의 -->
			<!-- ./middle menu -->


			<%@ include file="./includes/innerFooter.jsp"%>
		</div>
	</div>
</main>

<%@ include file="./includes/footer.jsp"%>