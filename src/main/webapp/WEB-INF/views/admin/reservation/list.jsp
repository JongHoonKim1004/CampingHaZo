<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">예약 목록</div>
			</div>

			<!-- Reservation List -->
			<div class="row">
				<div class="col-md-12">
					<div class="tab-pane fade p-4 show" id="pills-result-1">
						<table class="table bg-white">
							<thead>
								<tr>
									<th class="font-weight-semi-bold border-top-0 py-2">예약번호</th>
									<th class="font-weight-semi-bold border-top-0 py-2">예약자명</th>
									<th class="font-weight-semi-bold border-top-0 py-2">에약한 캠핑장</th>
									<th class="font-weight-semi-bold border-top-0 py-2">예약 날짜</th>
									<th class="font-weight-semi-bold border-top-0 py-2">예약 인원</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${reservationList }" var="reservation">
									<tr>
										<td class="py-3"><a href="/admin/reservation/read?rno=${reservation.rno }">${reservation.rno }</a></td>
										<td class="py-3">${reservation.username }</td>
										<td class="py-3">${reservation.name }</td>
										<td class="py-3">
											<fmt:formatDate value="${reservation.resDate }" pattern="yyyy-MM-dd"/>
										</td>
										<td class="py-3">${reservation.people }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>






			<%@ include file="../includes/innerFooter.jsp"%>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp"%>