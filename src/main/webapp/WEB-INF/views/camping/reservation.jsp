<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<!-- 여기 페이지 컨트롤러 만들때 쿼리스트링으로 받은 이름 그대로 Model 에 넣어서 보내주세요 -->

<div>
	<div class="row justify-content-md-center mb-3 p-5">
		<div class="col-md-6">
			<form action="/reservation" method="post">
				<div class="row mb-5 pb-5">
					<div class="col-md-12">
						<h1 style="font-weight: 700;">캠핑장 예약</h1>
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-12 reservationImg"></div>
				</div>
				<div class="row mb-4 pb-4">
					<div class="col-md-12">
						<h2>${name}</h2>
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-6">
						<i class="fa fa-map-marker"></i>&nbsp;<span class="reservationAddr"></span>
					</div>
					<div class="col-md-6">
						<i class="fa fa-phone"></i>&nbsp;<span class="reservationTel"></span>
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-12">
						<div class="row pt-3">
							<div class="col-md-6 rightview-discription-q">주변환경</div>
							<div class="col-md-6 enviroment rightview-discription-a"></div>
						</div>
						<div class="row pt-3">
							<div class="col-md-6 rightview-discription-q">바닥 종류</div>
							<div class="col-md-6 enviroment rightview-discription-a">데크,
								파쇄석, 잔디, 잔디블럭, 보도블럭</div>
						</div>
						<div class="row pt-3">
							<div class="col-md-6 rightview-discription-q">부대시설</div>
							<div class="col-md-6 facility rightview-discription-a"></div>
						</div>
						<div class="row pt-3">
							<div class="col-md-6 rightview-discription-q">애완동물 동반 가능</div>
							<div class="col-md-6 pet rightview-discription-a"></div>
						</div>
						<div class="row pt-3">
							<div class="col-md-12 discription"></div>
						</div>
					</div>
				</div>
				<hr>
				<div class="row mt-4 mb-4 justify-content-md-center">
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-2">
								<label class="form-label">인원수</label>
							</div>
							<div class="col-md-10">
								<input type="number" class="form-control" name="people" id="people">
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-4 justify-content-md-center">
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-2">
								<label class="form-label">에약 날짜</label>
							</div>
							<div class="col-md-10">
								<input type="text" name="daterange" id="demo" class="form-control" value="">
								
							</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-md-center mb-4 reservation-invalid">
					<div class="col-md-8">
						<p> 아래 날짜의 예약이 이미 들어가 있는 관계로 예약이 불가합니다. </p>
						<span class="reservation-invalid-date"></span>
					</div>
				</div>
				<div class='row mb-4 justify-content-md-center'>
					<div class="col-md-4">
						<div class="row">
							<button class="btn btn-primary btn-block" type="submit" onclick="return reservationCheck()">예 약 하 기</button>
						</div>
					</div>
					<input type="hidden" name="username">
					<input type="hidden" name="startdate">
					<input type="hidden" name="enddate">
					<input type="hidden" name="camping">
					<input type="hidden" name="money">
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../includes/searchFooter.jsp"%>

<!-- 페이지 로드 시 캠핑장 정보 기입 -->
<script type="text/javascript">
$(function(){
	// 서버에서 받아온 캠핑장 이름 설정
	const camping = `${name}`;
	
	// 키워드 검색으로 API 호출 
	const keywordUrl = "https://apis.data.go.kr/B551011/GoCamping/searchList?serviceKey=zQw6PXo%2BVD46UR4OpCnBT9jFkLL7ubkMP%2BFjVV%2FhHxAPkCCzZlpeUqkfBdHoYo589oaV4IgJkJytB7R%2FYbilXg%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&keyword=";
	
	$.ajax({
		url: keywordUrl + encodeURI(camping),
		success: function(result){
			let item = result.response.body.items.item[0];
			console.log(item);
			
			// 불러온 정보 본문에 담기
			$(".reservationAddr").html(item.addr1);
			if(item.firstImageUrl != ""){
				$(".reservationImg").html("<img alt='' src='" + item.firstImageUrl + "'>")
			} else {
				$(".reservationImg").html("이미지가 없습니다");
			}
			
			$(".reservationTel").html(item.tel);
			
			if(item.themaEnvrnCl != ""){
				$(".enviroment").html(item.lctCl);
			}
			
			if(item.sbrsEtc != "" && item.posblFcltyCl != ""){
				$(".facility").html(item.sbrsEtc + ", " + item.posblFcltyCl);
			} else if(item.sbrsEtc != "" && item.posblFcltyCl == ""){
				$(".facility").html(item.sbrsEtc);
			} else if(item.sbrsEtc == "" && item.posblFcltyCl != ""){
				$(".facility").html(item.posblFcltyCl);
			}
			
			if(item.animalCmgCl == "가능"){
				$(".pet").html(item.animalCmgCl);
			} else{
				$('.pet').html(item.animalCmgCl);
			}
			
			$(".discription").html(item.intro);
			
			$("input[name='camping']").val(item.fcltyNm);
		},
		error: function(error){
			console.error(error);
		}
		
	})
});
</script>

<!-- Date Range Picker -->
<script type="text/javascript">
$('#demo').daterangepicker({
    "locale": {
        "format": "YYYY/MM/DD",
        "separator": " - ",
        "applyLabel": "적용하기",
        "cancelLabel": "취소하기",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "weekLabel": "W",
        "daysOfWeek": [
            "일",
            "월",
            "화",
            "수",
            "목",
            "금",
            "토"
        ],
        "monthNames": [
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"
        ],
        "firstDay": 1
    },
    "alwaysShowCalendars": true,
    "startDate": moment(),
    "endDate": moment().add(7, 'days'),
    "minDate": moment(),
    "maxDate": moment().add(2, 'months')
    
}, function(start, end, label) {
	// 날짜 추출
	var startdate = start.format("YYYYMMDD"); 
	var enddate = end.format("YYYYMMDD");
	
	// input 넣기
  	$("input[name='startdate']").val(startdate);
  	$("input[name='enddate']").val(enddate);
  	
  	// ajax 로 확인
});

</script>

<!-- 인원수 변경시 확인 작업 -->
<script type="text/javascript">
$("#people").on("change", function(e){
	let people = $(this).val();
	
	if(people < 0){
		alert("그 이상으로 줄일 수 없습니다.");
		$(this).val(1);
	}
	
	if(people > 4){
		alert("예약은 한 번에 4명까지 가능합니다.");
		$(this).val(4);
	}
});

</script>

<!-- 날짜 정하면 ajax 호출할 작업 -->
<script type="text/javascript">
	$(".reservation-invalid").hide();
	
	// ajax 호출
</script>

<!-- 예약하기 버튼 누르고 확인 작업 -->
<script type="text/javascript">
function reservationCheck(){
	
}

</script>