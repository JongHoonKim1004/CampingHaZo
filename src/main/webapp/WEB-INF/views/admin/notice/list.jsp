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
				<div class="h3 mb-0">게시판 목록</div>
			</div>

			<!-- Notice List -->
			<div class="row">
				<div class="col-md-12">
					<div class="tab-pane fade p-4 mb-4 show" id="pills-result-1">
						<div class="row pb-3">
							<table class="table bg-white">
								<thead>
									<tr>
										<th class="font-weight-semi-bold border-top-0 py-2">번호</th>
										<th class="font-weight-semi-bold border-top-0 py-2">제목</th>
										<th class="font-weight-semi-bold border-top-0 py-2">작성자</th>
										<th class="font-weight-semi-bold border-top-0 py-2">작성일</th>
										<th class="font-weight-semi-bold border-top-0 py-2">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${noticeList }" var="notice">
										<tr>
											<td class="py-3">${notice.nno}</td>
											<td class="py-3"><a class="move" href="${notice.nno }">${notice.title}</a></td>
											<td class="py-3">${notice.writer}</td>
											<td class="py-3">
												<fmt:formatDate value="${notice.regDate }" pattern="yyyy-MM-dd"/>
											</td>
											<td class="py-3">${notice.readCount }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="pull-right row mb-5">
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class=“page-link” href="${pageMaker.startPage - 1}">Previous</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : '' }"><a href="${num }">${num}</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next}">
									<li class="page-item"><a class=“page-link” href="${pageMaker.endPage + 1 }">Next</a></li>
								</c:if>
							</ul>
						</div>
						
					</div>
						<div class="row justify-content-end">
							<div class='col-md-2'>
								<button type="button" class="btn btn-primary float-right"
								onclick="location.href='/admin/notice/register'">새 공지
								등록하기</button>
							</div>
						</div>
						<form id='actionForm' action="/admin/notice/list" method='get'>
							<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
						</form>
				</div>
			</div>






			<%@ include file="../includes/innerFooter.jsp"%>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript">
	$(function(){
		
		// pagination
		var actionForm = $("#actionForm");
		$(".paginate_button a ").on("click", function(e){
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"))
			actionForm.submit();
		})
		
		// move to read page
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='nno' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action","/admin/notice/read");
			actionForm.submit();
		})
	})
</script>