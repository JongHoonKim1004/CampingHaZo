<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div>
	<div class="row">
		<div class="col-md-4">
			<div class="row pb-1" style="border-bottom: 1px solid #999;">
				<div class="col-md-4">
					<i class="fa fa-tasks"></i> <span>2,529</span>개
				</div>
				<div class="col-md-8">
					<span class="campingSpan">거리순</span> <span class="campingSpan">업데이트순</span>
					<span class="campingSpan">찜순</span> <span class="campingSpan">추천순</span>
					<span class="campingSpan">조회순</span>
				</div>
			</div>
			<div class="row mt-3" style="border-bottom: 1px solid #999;">
				<div class="col-md-12">
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item"><a class="page-link" href="#"><<</a></li>
						<li class="page-item"><a class="page-link" href="#"><</a></li>
						<li class="page-item active"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">></a></li>
						<li class="page-item"><a class="page-link" href="#">>></a></li>
					</ul>
				</div>
			</div>
			<div class="row campingListRow">
				<div class="col-md-12 campingList">
					<!-- mapping -->
					
					<!-- /mapping -->
				</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-12">
					<div id="map" style="width:100%; height: 800px"></div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="rightview">
	<div class="container">
		<div class="row rightview-title-div pt-2 pb-2">
			<span class="rightview-title">title</span>
		</div>
		<div class="row pb-4">
			<div class="col-md-12 rightview-img">
				
			</div>
		</div>
		<div class="row rightview-content-div">
			<div class="col-md-12">
				<div class="row rightview-addr-div mb-4 pt-3">
					<div class="col-md-12"><i class="fa fa-map-marker" style="margin-right: 10px;"></i><span class="rightview-addr"></span></div>
				</div>
			</div>
		</div>
		<div class="row rightview-res-div pt-2 pb-2 justify-content-md-center">
			<div class="col-md-8">
				<div class="row">
					<div class="col-md-4">
						<a href="javascript:void();" class="markImg">
							<img alt="" src="/resources/img/camping/roadview.svg" style="width: 50px;">
							<br>
							로드뷰
						</a>
					</div>
					<div class="col-md-4">
						<a href="javascript:void();" class="markImg">
							<img alt="" src="/resources/img/camping/navigation.svg" style="width: 50px;">
							<br>
							길찾기
						</a>
					</div>
					
					<div class="col-md-4">
						<a href="javascript:void();" class="markImg">
							<img alt="" src="/resources/img/camping/share2.svg" style="width: 50px;">
							<br>
							공유하기
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row pt-2 pb-2 rightview-discription-div">
			<div class="col-md-12">
				<div class="row pt-3">
					<div class="col-md-6 rightview-discription-q">주변환경</div>
					<div class="col-md-6 enviroment rightview-discription-a"></div>
				</div>
				<div class="row pt-3">
					<div class="col-md-6 rightview-discription-q">바닥 종류</div>
					<div class="col-md-6 enviroment rightview-discription-a">데크, 파쇄석, 잔디, 잔디블럭, 보도블럭</div>
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
					<div class="col-md-12 discription">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../includes/searchFooter.jsp"%>

<!-- Kakao Map -->	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a19cace20af62221f6c0b0a6273314b0"></script>
<script>
//카카오 맵 초기 호출
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.335887, 126.584063), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 

//공공데이터포탈 API 사용해서 캠핑장 목록 호출

const basedURL = "http://apis.data.go.kr/B551011/GoCamping";
const key = "zQw6PXo%2BVD46UR4OpCnBT9jFkLL7ubkMP%2BFjVV%2FhHxAPkCCzZlpeUqkfBdHoYo589oaV4IgJkJytB7R%2FYbilXg%3D%3D";
const pageNo = 1;
var campingData = null;

$.ajax({
	url: basedURL + "/basedList?serviceKey=" + key + "&_type=json&MobileApp=AppTest&MobileOS=ETC&numOfRows=20&pageNo=" + pageNo,
	dataType: "JSON",			
	success: function(response){
		console.log(response);
		
		var items = response.response.body.items.item;
		campingData = response.response.body.items.item;
		var output = "";
		
		items.forEach(function(item, index){
			// 리스트 출력
			output += '<div class="row pt-2 pb-2 camping" id="' + item.contentId + '" style="border-bottom: 1px solid #111;">';
			output += '<input type="hidden" class="lat" value="'+ item.mapY +'">';
			output += '<input type="hidden" class="lng" value="'+ item.mapX +'">';
			output += '<div class="col-md-4 p-2"><img alt="" src="' + item.firstImageUrl + '" style="width: 100%;"></div>';
			output += '<div class="col-md-6">';
			output += '<div class="row mb-2">';
			output += '<div class="col-md-12"><span class="campingListSpan">유료캠핑장</span><a class="campingTitle" href="' + index + '"> ' + item.facltNm + '</a></div></div>';
			output += '<div class="row mb-2">';
			output += item.doNm + ' > ' + item.sigunguNm + '</div>';
			output += '<div class="row mb-2">';
			output += item.addr1 + '</div>'
			output += '<div class="row">';
			output += item.tel + '</div>';
			output += '</div>';
			output += '<div class="col-md-2" style="position: relative;">';
			output += '<a href="/reservation?name=' + item.facltNm+ '" class="reservationBtn"><span>예약</span></a>';
			output += '</div></div>';
			
			$('.campingList').append(output);
			
			output = '';
			
			positions.push({
				title: item.facltNm,
				latlng: new kakao.maps.LatLng(item.mapY, item.mapX)
			});
		});
		
		marking();
		$(".campingListRow").css("overflow-y", "scroll");
	},
	error: function(error){
		console.error(error);
	}
});

// 캠핑장 이름 클릭시 화면 호출 및 지도 이동
var titleClicked = false;
$(".rightview").css("right", "-850px");
$("body").on("click", ".campingTitle", function(e){
	e.preventDefault();
	
	
	if(titleClicked){
		// 우측 화면 제거
		$(".rightview").animate({right: "-850px"});
		titleClicked = false;
	} else {
		// 우측 화면 호출
		$(".rightview").animate({right: "0px"});
		titleClicked = true;
		
		var number = $(this).attr("href");
		var item = campingData[number];
		console.log(item);
		
		// 지도를 캠핑장 위치를 중심으로 하도록 이동
		panTo(item.mapY, item.mapX);
		
		// 설정 화면에 대입
		$(".rightview-title").html(item.facltNm);
		$(".rightview-img").html("<img alt='' src='" + item.firstImageUrl + "'>")
		
		$(".rightview-addr").html(item.addr1 + "<br>" + item.direction);
		
		if(item.themaEnvrnCl != ""){
			$(".enviroment").html(item.lctCl);
		}
		
		
		if(item.sbrsEtc != "" && item.sbrsCl != "" && item.posblFcltyCl != ""){
			$(".facility").html(item.sbrsEtc + ", " + item.sbrs.Cl + ", " + item.posblFcltyCl);
		} else if(item.sbrsEtc != "" && item.sbrsCl != "" && item.posblFcltyCl == ""){
			$(".facility").html(item.sbrsEtc + ", " + item.sbrsCl);
		} else if(item.sbrsEtc != "" && item.sbrsCl == "" && item.posblFcltyCl != ""){
			$(".facility").html(item.sbrsEtc + ", " + item.posblFcltyCl);
		} else if(item.sbrsEtc == "" && item.sbrsCl != "" && item.posblFcltyCl != ""){
			$(".facility").html(item.sbrsCl + ", " + item.posblFcltyCl);
		} else if(item.sbrsEtc != "" && item.sbrsCl == "" && item.posblFcltyCl == ""){
			$(".facility").html(item.sbrsEtc);
		} else if(item.sbrsEtc == "" && item.sbrsCl != "" && item.posblFcltyCl == ""){
			$(".facility").html(item.sbrsCl);
		} else if(item.sbrsEtc == "" && item.sbrsCl == "" && item.posblFcltyCl != ""){
			$(".facility").html(item.posblFcltyCl);
		}
		
		if(item.animalCmgCl == "가능"){
			$(".pet").html(item.animalCmgCl);
		} else{
			$('.pet').html(item.animalCmgCl);
		}
		
		$(".discription").html(item.intro);
	}
});


// 지도 마커 클릭시 해당 정보 호출


// 지도 부드럽게 이동 함수
function panTo(lat, lng){
	var moveLatLon = new kakao.maps.LatLng(lat, lng);
	
	map.panTo(moveLatLon);
}


// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [{
	title: "",
	latlng: ""
}];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "/resources/img/camping/tent2.png"; 

// 목록 호출이 완료되면 지도에 마커를 추가합니다
function marking(){
	for (var i = 0; i < 20; i ++) {
	    for(var j = 0 ; j < 20; j++){
	    	var pos = {
		    		title: $(".campingList").find(".camping").eq(i).attr("id"),
		    		latlng: new kakao.maps.LatLng($(".campingList").find(".lat").eq(i).val(),$(".campingList").find(".lng").eq(i).val())
		    }
		    positions.push(pos);
		    
		    pos = null;
	    }
	    
	 
		
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(35, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}

}

// 지도를 드래그 하고 놓을 때 중심 좌표 근처 20km 캠핑장 목록을 출력합니다
kakao.maps.event.addListener(map, 'dragend', function() {
    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 
    $(".campingList").empty();
    
    positions = [];
    
    // 지도를 새롭게 호출하여 이전의 모든 마커를 제거합니다
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(latlng.getLat(), latlng.getLng()), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

	map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    
    
    
    $.ajax({
    	url: basedURL + "/locationBasedList?serviceKey=" + key + "&_type=json&MobileApp=AppTest&MobileOS=ETC&numOfRows=20&pageNo=" + pageNo + "&mapY=" + latlng.getLat() + "&mapX=" + latlng.getLng() + "&radius=20000",
    	dataType: "JSON",			
    	success: function(response){
    		console.log(response);
    		
    		var items = response.response.body.items.item;
    		campingData = response.response.body.items.item;
    		var output = "";
    		
    		
    		items.forEach(function(item, index){
    			// 리스트 출력
    			output += '<div class="row pt-2 pb-2 camping" id="' + item.contentId + '" style="border-bottom: 1px solid #111;">';
    			output += '<input type="hidden" class="lat" value="'+ item.mapY +'">';
    			output += '<input type="hidden" class="lng" value="'+ item.mapX +'">';
    			output += '<div class="col-md-4 p-2"><img alt="" src="' + item.firstImageUrl + '" style="width: 100%;"></div>';
    			output += '<div class="col-md-6">';
    			output += '<div class="row mb-2">';
    			output += '<div class="col-md-12"><span class="campingListSpan">유료캠핑장</span><a class="campingTitle" href="' + index + '"> ' + item.facltNm + '</a></div></div>';
    			output += '<div class="row mb-2">';
    			output += item.doNm + ' > ' + item.sigunguNm + '</div>';
    			output += '<div class="row mb-2">';
    			output += item.addr1 + '</div>'
    			output += '<div class="row">';
    			output += item.tel + '</div>';
    			output += '</div>';
    			output += '<div class="col-md-2" style="position: relative;">';
    			output += '<a href="/reservation?name=' + item.facltNm+ '" class="reservationBtn"><span>예약</span></a>';
    			output += '</div></div>';
    			
    			$('.campingList').append(output);
    			
    			output = '';
    			
    			positions.push({
    				title: item.facltNm,
    				latlng: new kakao.maps.LatLng(item.mapY, item.mapX)
    			});
    		});
    		
    		marking();
    	},
    	error: function(error){
    		console.error(error);
    	}
    });
});

// 예약버튼 클릭시 해당 예약 사이트로 이동

</script>