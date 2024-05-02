<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="./includes/header.jsp"%>

<div>
	<div class="row">
		<div class="main">
			<div class="main-wrap"></div>
			<div class="upper-main">
				<div class="row">
					<div class="col-md-12">
						<div class="row justify-content-md-center search pt-5 pb-5">
							<div class="col-md-8">
								<h4 style="text-align: center;">오늘은 어디로 가볼까?</h4>
								<div class="searchForm">
									<form>
										<input type="text" name="search" id="search"
											placeholder="캠핑장 검색">
										<button type="submit" id="searchBtn">
											<i class="fa fa-search" aria-hidden="true"></i>
										</button>
									</form>
								</div>
							</div>
						</div>
						<div class="row justify-content-md-center">
							<div class="col-md-8">
								<div class="row">
									<div class="col-md-4" style="height: 230px;">
										<div id="chart1" style="width: 100%; height: 100%;"></div>
										<p
											style="font-size: 20px; fomt-weight: 650; text-align: center;">전체</p>
									</div>
									<div class="col-md-4" style="height: 230px;">
										<div id="chart2" style="width: 100%; height: 100%;"></div>
										<p
											style="font-size: 20px; fomt-weight: 650; text-align: center;">유료캠핑장</p>
									</div>
									<div class="col-md-4" style="height: 230px;">
										<div id="chart3" style="width: 100%; height: 100%;"></div>
										<p
											style="font-size: 20px; fomt-weight: 650; text-align: center;">글램핑/카라반</p>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="background-color: #eceef6">
	<div class="row">
		<div class="col-md-12">
			<div class="middle-main pt-3 pb-3">
				<div class="row justify-content-md-center">
					<div class="col-md-4">
						<div class="row">
							<div class="col-lg-12 main-notice">
								<img alt="" src="/resources/img/main/two-speech-bubbles.svg">
								<span>알려드립니다</span>
								<div style="float: right;">
									<a href="#"><span>+</span></a>
								</div>
							</div>
						</div>
						<div class="row justify-content-md-center pt-2 main-notice-list">
							<div class="col-md-10">
								<p>
									<a href="#" class="mainNoticeList">공지사항 테스트</a>
								</p>
								<p>
									<a href="#" class="mainNoticeList">공지사항 테스트</a>
								</p>

							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="row justify-content-md-center align-items-md-center">
							<img alt="" src="/resources/img/main/camver%20banner.jpg">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>













<script type="text/javascript"
	src="/resources/script/echarts.min.js"></script>
<script type="text/javascript">
// 차트 생성 함수


window.onload = function(){
	// set chart
	var chart1 = echarts.init(document.getElementById("chart1"));
	var chart2 = echarts.init(document.getElementById("chart2"));
	var chart3 = echarts.init(document.getElementById("chart3"));
	// data
	const gaugeData = [
		  {
		    value: 50, // %(비율) 기입
		    detail: {
		      valueAnimation: true,
		      offsetCenter: ['0%', '0%']
		    }
		  }
		];
	
	// option
	option = {
			  series: [
			    {
			      type: 'gauge',
			      startAngle: 90,
			      endAngle: -270,
			      pointer: {
			        show: false
			      },
			      progress: {
			        show: true,
			        overlap: false,
			        roundCap: true,
			        clip: false,
			        itemStyle: {
			          borderWidth: 1,
			          borderColor: 'white',
			          color: 'white'
			        }
			      },
			      axisLine: {
			        lineStyle: {
			          width: 5
			        }
			      },
			      splitLine: {
			        show: false,
			        distance: 0,
			        length: 10
			      },
			      axisTick: {
			        show: false
			      },
			      axisLabel: {
			        show: false,
			        distance: 50
			      },
			      data: gaugeData,
			      title: {
			        fontSize: 14
			      },
			      detail: {
			        width: 50,
			        height: 14,
			        color: 'white',
			        formatter: '2,529',
			        fontSize: 30
			      }
			    }
			  ]
			};
	
	//setOption
	chart1.setOption(option);
	
	// 2
	// data
	const gaugeData2 = [
		  {
		    value: (356/2529)*100, // %(비율) 기입
		    detail: {
		      valueAnimation: true,
		      offsetCenter: ['0%', '0%']
		    }
		  }
		];
	
	// option
	option = {
			  series: [
			    {
			      type: 'gauge',
			      startAngle: 90,
			      endAngle: -270,
			      pointer: {
			        show: false
			      },
			      progress: {
			        show: true,
			        overlap: false,
			        roundCap: true,
			        clip: false,
			        itemStyle: {
			          borderWidth: 1,
			          borderColor: "white",
			          color: 'RGB(51, 204, 51)'
			        }
			      },
			      axisLine: {
			        lineStyle: {
			          width: 5
			        }
			      },
			      splitLine: {
			        show: false,
			        distance: 0,
			        length: 10
			      },
			      axisTick: {
			        show: false
			      },
			      axisLabel: {
			        show: false,
			        distance: 50
			      },
			      data: gaugeData2,
			      title: {
			        fontSize: 14
			      },
			      detail: {
			        width: 50,
			        height: 14,
			        color: 'white',
			        formatter: '356',
			        fontSize: 30
			      }
			    }
			  ]
			};
	
	//setOption
	chart2.setOption(option);
	
	// 3
	
	
	// data
	const gaugeData3 = [
		  {
		    value: (1635/2529) * 100, // %(비율) 기입
		    detail: {
		      valueAnimation: true,
		      offsetCenter: ['0%', '0%']
		    }
		  }
		];
	
	// option
	option = {
			  series: [
			    {
			      type: 'gauge',
			      startAngle: 90,
			      endAngle: -270,
			      pointer: {
			        show: false
			      },
			      progress: {
			        show: true,
			        overlap: false,
			        roundCap: true,
			        clip: false,
			        itemStyle: {
			          borderWidth: 1,
			          borderColor: 'white',
			          color: "RGB(0, 153, 255)"
			        }
			      },
			      axisLine: {
			        lineStyle: {
			          width: 5
			        }
			      },
			      splitLine: {
			        show: false,
			        distance: 0,
			        length: 10
			      },
			      axisTick: {
			        show: false
			      },
			      axisLabel: {
			        show: false,
			        distance: 50
			      },
			      data: gaugeData3,
			      title: {
			        fontSize: 14
			      },
			      detail: {
			        width: 50,
			        height: 14,
			        color: 'white',
			        formatter: '1,635',
			        fontSize: 30
			      }
			    }
			  ]
			};
	
	//setOption
	chart3.setOption(option);
	
}

</script>
<!--Slick Carousel Slider-->

<script type="text/javascript"
	src="/resources/script/slick.js"></script>
<script>
$(document).ready(function(){
    
    $('.items').slick({
 infinite: true,
 slidesToShow: 5,
 slidesToScroll: 1
});
         });
</script>
<%@ include file="./includes/mainFooter.jsp"%>