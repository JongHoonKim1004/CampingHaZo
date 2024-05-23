<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ include file="../includes/header.jsp"%>

<main class="main">
	<%@ include file="../includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">관리자 목록</div>
			</div>

			<!-- Admin List -->
			<div class="row">
				<div class="col-md-12">
					<div class="tab-pane fade p-4 show" id="pills-result-1">
						<table class="table bg-white">
							<thead>
								<tr>
									<th class="font-weight-semi-bold border-top-0 py-2">번호</th>
									<th class="font-weight-semi-bold border-top-0 py-2">아이디</th>
									<th class="font-weight-semi-bold border-top-0 py-2">이름</th>
									<th class="font-weight-semi-bold border-top-0 py-2">사원번호</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${adminList }" var="admin">
									<tr>
										<td class="py-3">${admin.ano }</td>
										<td class="py-3"><a href="/admin/admin/read/${admin.ano }">${admin.username }</a></td>
										<td class="py-3">${admin.name }</td>
										<td class="py-3">${admin.employeeNo }</td>
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