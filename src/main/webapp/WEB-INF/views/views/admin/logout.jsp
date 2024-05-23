<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp"%>

<main class="main">
	<%@ include file="./includes/sidebar.jsp"%>
	<div class="content">
		<div class="py-4 px-3 px-md-4">
			<div class="mb-3 mb-md-4 d-flex justify-content-between">
				<div class="h3 mb-0">Logout</div>
			</div>

			<div class='row pt-4 pb-4 justify-content-md-center'>
				<div class="col-md-4">
					<div class="row pb-4">
						<div class="col-md-12">
							<h3 align="center">로그아웃 하시겠습니까?</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<button class="btn btn-warning" style="margin: 0 auto; display: flex;">로그아웃</button>
						</div>
					</div>
				</div>
			</div>


			<%@ include file="./includes/innerFooter.jsp"%>
		</div>
	</div>
</main>

<%@ include file="./includes/footer.jsp"%>