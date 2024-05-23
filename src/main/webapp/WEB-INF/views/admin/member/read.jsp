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
				<div class="h3 mb-0">사업자 회원 정보 상세보기</div>
			</div>

			<!-- Member Detail -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="row justify-content-md-center p-5">
							<div class="col-md-8">
								<div class="card-body">
									<div class="row pt-5 pb-5">
										<div class="col-md-12">
											<!-- 사업자 정보 테이블 -->
											<table class="table bg-white">
												<thead>
													<tr>
														<th colspan="2" style="text-align: center;"
															class="pt-4 pb-4">회원 정보</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<th style="text-align: center; width: 200px;">회원번호</th>
														<td>${member.mno }</td>
													</tr>
													<tr>
														<th style="text-align: center;">아이디</th>
														<td>${member.username }</td>
													</tr>
													<tr>
														<th style="text-align: center;">사업자명</th>
														<td>${member.name }</td>
													</tr>
													<tr>
														<th style="text-align: center;">연락처</th>
														<td>${member.phone }</td>
													</tr>
													<tr>
														<th style="text-align: center;">우편번호</th>
														<td>${member.zipCode }</td>
													</tr>
													<tr>
														<th style="text-align: center;">소재지</th>
														<td>${member.addr }</td>
													</tr>
													<tr>
														<th style="text-align: center;">사업자등록번호</th>
														<td>${member.compNo }</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row pt-5 pb-5">
										<div class="col-md-12">
											<!-- 내가 등록한 캠핑장 테이블 -->
											<table class="table bg-white">
												<thead>
													<tr>
														<th colspan="5" style="text-align: center;"
															class="pt-4 pb-4">
															내가 등록한 캠핑장
														</th>
													</tr>
													<tr>
														<th>식별번호</th>
														<th>이름</th>
														<th>주소</th>
														<th>연락처</th>
														<th>등록일</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${campingList }" var="camping">
														<tr>
															<td>${camping.cno }</td>
															<td>${camping.name }</td>
															<td>${camping.addr }</td>
															<td>${camping.phone }</td>
															<td>
																<fmt:formatDate value="${camping.regDate }" pattern="yyyy-MM-dd"/>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<div class="row pt-5 pb-5">
										<div class="col-md-8"></div>
										<div class='col-md-4'>
											<button class="btn btn-primary mx-3" onclick="location.href='/admin/member/list'">목록으로</button>
											<button class="btn btn-danger" onclick="removeMember()">사업자 삭제하기</button>
										</div>
									</div>
									<form action="/admin/member/delete" method="post" id="deleteForm">
										<input type="hidden" name="mno" value="${member.mno }"/>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>





			<%@ include file="../includes/innerFooter.jsp"%>
		</div>
	</div>
</main>

<%@ include file="../includes/footer.jsp"%>

<script type="text/javascript">
	// 사업자 삭제하기
	function removeMember(){
		if(confirm("정말 삭제하시겠습니까?")){
			$("#deleteForm").submit();	
		}
	}
		
</script>