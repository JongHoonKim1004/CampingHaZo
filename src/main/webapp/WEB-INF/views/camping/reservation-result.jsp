<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>

<div class="pt-5">
	<div class="row justify-content-md-center pt-5">
		<div class="col-md-6">
			<div class="row p-5">
				<div class="col-md-12">
					<div class="row mb-5 pb-5">
						<h1 align="center">예약이 완료되었습니다.</h1>
					</div>
					<div class="row mb-3">
						<p align="center"> 마이페이지 에서 예약 정보를 확인할 수 있습니다.</p>
					</div>
					<div class="row justify-content-md-center">
						<div class="col-md-3">
							<div class="row">
								<button onclick="location.href='/mypage/reservation/list'" class="btn btn-primary btn-block">
									마이페이지로
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../includes/searchFooter.jsp" %>