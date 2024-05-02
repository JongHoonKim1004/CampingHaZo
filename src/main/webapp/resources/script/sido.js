/**
 * 사용금지
 * 
 * //메인페이지 select 변경시 다음 select 출력 및 검색 하도록
 */

$('#sido2').hide();
$("#sido3").hide();

const 서울 = ["강동구","강북구","구로구","노원구","마포구","성동구","은평구", "중랑구"];
const 경기 = ["가평군","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주시","연천군","오산시",];
const 인천 = "";
const 강원 = "";
const 충남 = "";
const 대전 = "";
const 충북 = "";
const 세종 = "";
const 부산 = "";
const 울산 = "";
const 대구 = "";
const 경북 = "";
const 경남 = "";
const 전남 = "";
const 광주 = "";
const 전북 = "";
const 제주 = "";


// select 선택시 함수

function sido(location1){
	const sido1 = location1;
	// ajax 검색
	
	$("#sido2").show();	
	
}