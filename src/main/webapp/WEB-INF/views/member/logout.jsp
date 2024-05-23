<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./includes/header.jsp"%>

<main>
	<div class="row justify-content-md-center pt-5 pb-5" style="background-color: #cccccc4f;">
		<div class="col-md-8">
			<div class="row pb-4">
				<h1>사업자 로그아웃</h1>
			</div>
			<div class="row justify-content-md-center pt-4">
				<div class="col-md-10">
					<div class="row p-5">
						<div class="col-md-12">
							<div class="container pb-5" style="text-align: center; width: 100%; font-size: 28px;">
								로그아웃 하시겠습니까?
							</div>
							<div class="container">
								<form action="/logout" method="post">
									<button type="submit" class="btn btn-danger mx-auto" style="display: flex;">로그아웃</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="./includes/footer.jsp"%>