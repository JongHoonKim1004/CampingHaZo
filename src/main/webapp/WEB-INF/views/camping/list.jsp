<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="container" >
	<div class="row">
		<div class="col-md-6">
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
			<div class="row">
				<div class="col-md-12 campingList">
					<!-- mapping -->
					
					<!-- /mapping -->
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="row">
				<div id="map" style="width:100%; min-height:772px;"></div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../includes/searchFooter.jsp"%>

<!-- Kakao Map -->	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a19cace20af62221f6c0b0a6273314b0"></script>
<script>

//공공데이터포탈 API 사용해서 캠핑장 목록 호출

const basedURL = "http://apis.data.go.kr/B551011/GoCamping";
const key = "zQw6PXo%2BVD46UR4OpCnBT9jFkLL7ubkMP%2BFjVV%2FhHxAPkCCzZlpeUqkfBdHoYo589oaV4IgJkJytB7R%2FYbilXg%3D%3D";
const pageNo = 1;

$.ajax({
	url: basedURL + "/basedList?serviceKey=" + key + "&_type=json&MobileApp=AppTest&MobileOS=ETC&numOfRows=20&pageNo=" + pageNo,
	dataType: "JSON",			
	success: function(response){
		console.log(response);
		
		var items = response.response.body.items.item;
		var output = "";
		
		
		items.forEach(function(item){
			// 리스트 출력
			output += '<div class="row pt-2 pb-2 camping" id="' + item.contentId + '" style="border-bottom: 1px solid #111;">';
			output += '<input type="hidden" class="lat" value="'+ item.mapY +'">';
			output += '<input type="hidden" class="lng" value="'+ item.mapX +'">';
			output += '<div class="col-md-4 p-2"><img alt="" src="' + item.firstImageUrl + '" style="width: 100%;"></div>';
			output += '<div class="col-md-6">';
			output += '<div class="row mb-2">';
			output += '<span class="campingListSpan">유료캠핑장</span> ' + item.facltNm + '</div>';
			output += '<div class="row mb-2">';
			output += item.doNm + ' > ' + item.sigunguNm + '</div>';
			output += '<div class="row mb-2">';
			output += item.addr1 + '</div>'
			output += '<div class="row">';
			output += item.tel + '</div>';
			output += '</div>';
			output += '<div class="col-md-2" style="position: relative;">';
			output += '<a href="' + item.contentId+ '" class="reservationBtn"><span>예약</span></a>';
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




var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.335887, 126.584063), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [{
    title: '카카오', 
    latlng: new kakao.maps.LatLng(33.450705, 126.570677)
},
{
    title: '생태연못', 
    latlng: new kakao.maps.LatLng(33.450936, 126.569477)
},
{
    title: '텃밭', 
    latlng: new kakao.maps.LatLng(33.450879, 126.569940)
},
{
    title: '근린공원',
    latlng: new kakao.maps.LatLng(33.451393, 126.570738)
}];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
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
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
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

kakao.maps.event.addListener(map, 'dragend', function() {
    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 
    $(".campingList").empty();
    
    positions = [];
    
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
    		var output = "";
    		
    		
    		items.forEach(function(item){
    			// 리스트 출력
    			output += '<div class="row pt-2 pb-2 camping" id="' + item.contentId + '" style="border-bottom: 1px solid #111;">';
    			output += '<input type="hidden" class="lat" value="'+ item.mapY +'">';
    			output += '<input type="hidden" class="lng" value="'+ item.mapX +'">';
    			output += '<div class="col-md-4 p-2"><img alt="" src="' + item.firstImageUrl + '" style="width: 100%;"></div>';
    			output += '<div class="col-md-6">';
    			output += '<div class="row mb-2">';
    			output += '<span class="campingListSpan">유료캠핑장</span> ' + item.facltNm + '</div>';
    			output += '<div class="row mb-2">';
    			output += item.doNm + ' > ' + item.sigunguNm + '</div>';
    			output += '<div class="row mb-2">';
    			output += item.addr1 + '</div>'
    			output += '<div class="row">';
    			output += item.tel + '</div>';
    			output += '</div>';
    			output += '<div class="col-md-2" style="position: relative;">';
    			output += '<a href="' + item.contentId+ '" class="reservationBtn"><span>예약</span></a>';
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
</script>