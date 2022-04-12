<%@page import="java.util.ArrayList"%>
<%@page import="Model.CheckingDAO"%>
<%@page import="Model.CheckingDTO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>LifeGuader</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/clover1.png">
<!-- Pignose Calender -->
<link href="./plugins/pg-calendar/css/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<!--폰트 변경 링크  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet:wght@300&display=swap" rel="stylesheet">

<script src="./jquery-3.6.0.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<%
	
MemberDTO info = (MemberDTO)session.getAttribute("info");
CheckingDTO ckdto= (CheckingDTO)session.getAttribute("ckdto"); 

ArrayList<CheckingDTO> clist = new ArrayList<CheckingDTO>();
CheckingDAO dao = new CheckingDAO();
if(info!=null){
clist = dao.graph(info.getId());

}

%>
	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<div class="brand-logo">
				<a href="index.jsp"><b class="logo-abbr"><img
						src="images/clover2.png" alt=""> </b><span
					class="brand-title"> <img src="images/clover1.png" alt="">
					<span class="mainfont" style="font-size: font-size: 22px; margin-left: -0.5rem;">LifeGuader</span>
				</span>
				</a>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            상단 start
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">

				<div class="nav-control">
					<div class="hamburger">
						<span class="toggle-icon"><i class="icon-menu"></i></span>
					</div>
				</div>

				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown">
                            <div class="user-img c-pointer position-relative" data-toggle="dropdown">
                                <span class="activity active"></span>
                                	<!--  로그인,로그아웃, 회원정보수정, 회원가입 -->
                      			<a> <%if(info!=null){ %> <img
									src="images/user/logout.png" height="40" width="40">
									<%} else{%> <img src="images/user/login.png" height="40"
									width="40"> <% }%>
								</a>
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                    
                                    <%if(info!=null){ %> <li>
                                            <a href="page-edit.jsp">
                                                <i class="icon-people"></i> <span>회원정보수정</span>
                                            </a>
                                        </li>
									<%} else{%> <li>
                                            <a href="page-register.jsp"><i class="icon-user"></i> <span>회원가입</span></a>
                                        </li> <% }%>
                                        <hr class="my-2">
                                         <%if(info!=null){ %> <li> 
                                         <a href="LogoutServiceCon"><i class="icon-key"></i><span>로그아웃</span></a>    
                                        </li>
									<%} else{%> <li>
                                           <a href="page-login.jsp"><i class="icon-lock"></i><span>로그인</span></a>
                                        </li> <% }%>
                                    </ul>
                                </div>
                            </div>
                        </li>
					</ul>
				</div>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            사이드바 start
        ***********************************-->
		<div class="nk-sidebar">
			<div class="nk-nav-scroll">
				<ul class="metismenu" id="menu">
					<li><a href="./index.jsp"
						> <i class="icon-home"></i><span
							class="nav-text">홈</span>
					</a>
					</li>
					<li><a href="./user-import.jsp"
						> <i class="icon-notebook menu-icon"></i><span
							class="nav-text">유저정보입력</span>
					</a>
					</li>
					<li><a href="./page-2.jsp"
						> <i class="icon-note menu-icon"></i><span
							class="nav-text">식단입력</span>
					</a>
					</li>										
					<li><a href="./page-3.jsp"
						> <i class="icon-badge menu-icon"></i><span
							class="nav-text">식단추천</span>
					</a>
					</li>
					<li><a href="./page4.jsp"
						> <i class="icon-social-youtube"></i><span
							class="nav-text">운동추천</span>
					</a>
					</li>
					<li><a href="./Bord.jsp"
						> <i class="icon-list"></i><span
							class="nav-text">게시판</span>
					</a>
					</li>
				</ul>
			</div>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		
		<div class="content-body" >

			<div class="container-fluid mt-3">
				<div class="row">

					<div class="col-lg-3 col-sm-6">
						<div class="card gradient-3">
							<div class="card-body">
								<h3 class="card-title text-white">안녕하세요</h3>
								<div class="d-inline-block">
									<%
									if (info != null) {
									%>
									<h2 class="text-white"><%=info.getNick()%>님
									</h2>
									<p class="text-white mb-0">환영합니다!</p>
								</div>
								<span class="float-right display-5 opacity-5"><i
									class="fa fa-users"></i></span>
								<%
								} else {
								%>
								<h2 class="text-white">로그인을 해주세요</h2>
								<%
								}
								%>

							</div>
						</div>
					</div>
				</div>
				<div class="container-fluid mt-3">
				<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
						<div class="super">
							<div class="card-title">
								<h5 class="text-muted">정보</h5>
								<%
								if (info != null) {
								%>
								<h2 class="mt-4">
									현재
									<%=info.getNick()%>님 건강정보
								</h2>
								<%
								} else {
								%>
								<h1 class="mt-4">로그인을 해주세요</h1>
								<%
								}
								%>
							</div>
							<!-- <span>현재 nickname 건강정보</span> -->
							<div class="table-responsive">
								<table class="table table-hover">
									<tbody>
										<tr>

											<td><h4 class="userIndex">혈당</h4></td>
											<td><div class="alert alert-success">
													<span class="tableText"> <%
											if (info != null) {
												if (ckdto != null) {
											%><%=ckdto.getBsugar()%> <%
											}
											}
											%>
													</span>
												</div></td>
										</tr>
										<tr>

											<td><h4 class="userIndex">혈압</h4></td>
											<td><div class="alert alert-success">
													<span class="tableText"> <%
											if (info != null) {
												if (ckdto != null) {
											%><%=ckdto.getBlood()%> <%
											}
											}
											%>
													</span>
												</div></td>
										</tr>
										<tr>
											<td><h4 class="userIndex">BMI</h4></td>
											<td><div class="alert alert-success">
													<span class="tableText"> <%
											if (info != null) {
												if (ckdto != null) {
													float bmi = ( (float)ckdto.getWeigth() /( (float)ckdto.getHeight() *  (float)ckdto.getHeight() /  (float)10000));
												
													System.out.println("몸무게"+ckdto.getWeigth());
													System.out.println("키"+ckdto.getHeight()*ckdto.getHeight()/10000);
							
													System.out.println("bmi1"+bmi);
											%><%=(int)bmi%> <%
											}
											}
													
											%>
													</span>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							</div>
						</div>
					</div>
					<!-- /# card -->
				</div>

				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
						<div class="super">
							<h4 class="card-title">성인병이란?</h4>
							<div class="bootstrap-carousel">
								<div data-ride="carousel" class="carousel slide"
									id="carouselExampleCaptions">
									<ol class="carousel-indicators">
										<li class="" data-slide-to="0"
											data-target="#carouselExampleCaptions"></li>
										<li data-slide-to="1" data-target="#carouselExampleCaptions"
											class=""></li>
										<li data-slide-to="2" data-target="#carouselExampleCaptions"
											class=""></li>
										<li data-slide-to="3" data-target="#carouselExampleCaptions"
											class="active"></li>
									</ol>
									<div class="carousel-inner">
										<div class="carousel-item">
											<img class="d-block w-100" src="images/고지혈증.png" alt="">
											<div class="carousel-caption d-none d-md-block">
											</div>
										</div>
										<div class="carousel-item">
											<img alt="" class="d-block w-100" src="images/고혈압.png">
											<div class="carousel-caption d-none d-md-block">
											</div>
										</div>
										<div class="carousel-item">
											<img alt="" class="d-block w-100" src="images/당뇨.png">
											<div class="carousel-caption d-none d-md-block">
											</div>
										</div>
										<div class="carousel-item active">
											<img alt="" class="d-block w-100" src="images/비만.png">
											<div class="carousel-caption d-none d-md-block">
											</div>
										</div>
									</div>
									<a data-slide="prev" href="#carouselExampleCaptions"
										class="carousel-control-prev"><span
										class="carousel-control-prev-icon"></span> <span
										class="sr-only">Previous</span> </a><a data-slide="next"
										href="#carouselExampleCaptions" class="carousel-control-next"><span
										class="carousel-control-next-icon"></span> <span
										class="sr-only">Next</span></a>
								</div>
							</div>
						</div>
						</div>
					</div>
				</div>
				</div>
				<div class="col-lg-12">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body pb-0 d-flex justify-content-between">
									<div>
										<h4 class="mb-1">혈압</h4>

									</div>
									<div>
								
									</div>
								</div>
								<div class="chart-wrapper">
									<canvas id="chart_widget_1"></canvas>
								</div>
								<div class="card-body">
									<div class="d-flex justify-content-between">
						
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-lg-12">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body pb-0 d-flex justify-content-between">
									<div>
										<h4 class="mb-1">혈당</h4>

									</div>
									<div>
							
									</div>
								</div>
								<div class="chart-wrapper">
									<canvas id="chart_widget_2"></canvas>
								</div>
								<div class="card-body">
									<div class="d-flex justify-content-between">
						
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-lg-12">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body pb-0 d-flex justify-content-between">
									<div>
										<h4 class="mb-1">BMI</h4>

									</div>
									<div>
						
									</div>
								</div>
								<div class="chart-wrapper">
									<canvas id="chart_wid3"></canvas>
								</div>
								<div class="card-body">
									<div class="d-flex justify-content-between">
						
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row" id="SummaryMain">
					<div class="col-lg-6 col-md-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">Order Summary</h4>
								<div id="morris-bar-chart"></div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-xl-6 col-lg-12 col-sm-12 col-xxl-12" id="worldMain">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title mb-0">Store Location</h4>
							<div id="world-map" style="height: 470px;"></div>
						</div>
					</div>
				</div>
			</div>





		</div>
		<!-- #/ container -->
	</div>
	<!--**********************************
            Content body end
        ***********************************-->


	<!--**********************************
            Footer start
        ***********************************-->
	<div class="footer">
		<div class="copyright">
			<p>
				스마트인재개발 &copy; Designed & Developed by <a harf="https://smhrd.lms.elice.io/">지금우리학원은</a> 2022
			</p>
		</div>
	</div>
	<!--**********************************
            Footer end
        ***********************************-->
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<script src="plugins/common/common.min.js"></script>
	<script src="js/custom.min.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/gleek.js"></script>
	<script src="js/styleSwitcher.js"></script>

	<!-- Chartjs -->
	<script src="./plugins/chart.js/Chart.bundle.min.js"></script>
	<!-- Circle progress -->
	<script src="./plugins/circle-progress/circle-progress.min.js"></script>
	<!-- Datamap -->
	<script src="./plugins/d3v3/index.js"></script>
	<script src="./plugins/topojson/topojson.min.js"></script>
	<script src="./plugins/datamaps/datamaps.world.min.js"></script>
	<!-- Morrisjs -->
	<script src="./plugins/raphael/raphael.min.js"></script>
	<script src="./plugins/morris/morris.min.js"></script>
	<!-- Pignose Calender -->
	<script src="./plugins/moment/moment.min.js"></script>
	<script src="./plugins/pg-calendar/js/pignose.calendar.min.js"></script>
	<!-- ChartistJS -->
	<script src="./plugins/chartist/js/chartist.min.js"></script>
	<script
		src="./plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



	

	<!--  로그인 페이지 이동 실행 -->
	<script type="text/javascript">
    	document.querySelector("#login").addEventListener("click",function(){
    		location.href="page-login.jsp"
    	});
    </script>
	<!--  로그아웃 실행  -->
	<script type="text/javascript">
    	document.querySelector("#logout").addEventListener("click",function(){
    		
    		location.href="LogoutServiceCon"
    	});
    </script>
	<script type="text/javascript"> document.getElementById("worldMain").style.display="none" </script>
	<script type="text/javascript"> document.getElementById("SummaryMain").style.display="none" </script>


	<!--  차트 css  -->
	<script type="text/javascript">

    
    

		(function($) {
		    "use strict"
	

		    let ctx = document.getElementById("chart_widget_1");
		   
		    let arr = []; 
		    
		    <%for(int i=0;i<clist.size(); i++){%> 
			arr[<%=i%>] = "<%=clist.get(i).getCheckday()%>"
				<%System.out.print("체크데이 : "+clist.get(i).getCheckday());%>
		    <%}%>
		    
		   
		
		    ctx.height = 280;
		    new Chart(ctx, {
		        type: 'line',
		        data: {
			labels: arr,
		            type: 'line',
		            defaultFontFamily: 'Montserrat',
		            datasets: [{
		                data: [<%if(ckdto!=null){for(int i=0;i<clist.size();i++ ){%>
		                	<%=clist.get(i).getBlood()%>,
		                <%}}%>],
		                label: "혈압",
		                backgroundColor: '#fff',
		                borderColor: '#f90202',
		                borderWidth: 0.5,
		                pointStyle: 'circle',
		                pointRadius: 5,
		                pointBorderColor: 'transparent',
		                pointBackgroundColor: '#f90202',
		            }]
		        },
		        options: {
		            responsive: !0,
		            maintainAspectRatio: false,
		            tooltips: {
		                mode: 'index',
		                titleFontSize: 12,
		                titleFontColor: '#000',
		                bodyFontColor: '#000',
		                backgroundColor: '#fff',
		                titleFontFamily: 'Montserrat',
		                bodyFontFamily: 'Montserrat',
		                cornerRadius: 3,
		                intersect: false,
		            },
		            legend: {
		                display: false,
		                position: 'top',
		                labels: {
		                    usePointStyle: true,
		                    fontFamily: 'Montserrat',
		                },


		            },
		            scales: {
		                xAxes: [{
		                    display: false,
		                    gridLines: {
		                        display: false,
		                        drawBorder: false
		                    },
		                    scaleLabel: {
		                        display: false,
		                        labelString: 'Month'
		                    }
		                }],
		                yAxes: [{
		                    display: false,
		                    gridLines: {
		                        display: false,
		                        drawBorder: false
		                    },
		                    scaleLabel: {
		                        display: true,
		                        labelString: 'Value'
		                    }
		                }]
		            },
		            title: {
		                display: false,
		            }
		        }
		    });


		    


		})(jQuery);

	(function($) {
	    "use strict"
		
		    
	    let ctx = document.getElementById("chart_widget_2");
	    let arr = []; 
	    
	    <%for(int i=0;i<clist.size(); i++){%> 
		arr[<%=i%>] = "<%=clist.get(i).getCheckday()%>"
	    <%}%>
	    ctx.height = 280;
	    new Chart(ctx, {
	        type: 'line',
	        data: {
		labels: arr,
	            type: 'line',
	            defaultFontFamily: 'Montserrat',
	            datasets: [{
	                data: [<%for(int i=0;i<clist.size();i++ ){%>
	            	<%=clist.get(i).getBsugar()%>,
	                <%}%>],
	                label: "혈당",
	                backgroundColor: '#fff',
	                borderColor: '#f29d56',
	                borderWidth: 0.5,
	                pointStyle: 'circle',
	                pointRadius: 5,
	                pointBorderColor: 'transparent',
	                pointBackgroundColor: '#f29d56',
	            }]
	        },
	        options: {
	            responsive: !0,
	            maintainAspectRatio: false,
	            tooltips: {
	                mode: 'index',
	                titleFontSize: 12,
	                titleFontColor: '#000',
	                bodyFontColor: '#000',
	                backgroundColor: '#fff',
	                titleFontFamily: 'Montserrat',
	                bodyFontFamily: 'Montserrat',
	                cornerRadius: 3,
	                intersect: false,
	            },
	            legend: {
	                display: false,
	                position: 'top',
	                labels: {
	                    usePointStyle: true,
	                    fontFamily: 'Montserrat',
	                },


	            },
	            scales: {
	                xAxes: [{
	                    display: false,
	                    gridLines: {
	                        display: false,
	                        drawBorder: false
	                    },
	                    scaleLabel: {
	                        display: false,
	                        labelString: 'Month'
	                    }
	                }],
	                yAxes: [{
	                    display: false,
	                    gridLines: {
	                        display: false,
	                        drawBorder: false
	                    },
	                    scaleLabel: {
	                        display: true,
	                        labelString: 'Value'
	                    }
	                }]
	            },
	            title: {
	                display: false,
	            }
	        }
	    });


	    


	})(jQuery);
	
	
		(function($) {
		    "use strict"
			 
			let arr = []; 
		    
		    <%for(int i=0;i<clist.size(); i++){%> 
			arr[<%=i%>] = "<%=clist.get(i).getCheckday()%>"
		    <%}%>
		    let ctx = document.getElementById("chart_wid3");
		    
		    ctx.height = 280;
		    new Chart(ctx, {
		        type: 'line',
		        data: {
			labels: arr,
		            type: 'line',
		            defaultFontFamily: 'Montserrat',
		            datasets: [{
		                data: [<%for(int i=0;i<clist.size();i++ ){
		                	float bmi =((float)clist.get(i).getWeigth()/((float)clist.get(i).getHeight()*(float)clist.get(i).getHeight()/(float)10000));%><%=(int)bmi%>,
	                <%}%>],
		                label: "BMI",
		                backgroundColor: '#fff',
		                borderColor: '#018921',
		                borderWidth: 0.5,
		                pointStyle: 'circle',
		                pointRadius: 5,
		                pointBorderColor: 'transparent',
		                pointBackgroundColor: '#018921',
		            }]
		        },
		        options: {
		            responsive: !0,
		            maintainAspectRatio: false,
		            tooltips: {
		                mode: 'index',
		                titleFontSize: 12,
		                titleFontColor: '#000',
		                bodyFontColor: '#000',
		                backgroundColor: '#fff',
		                titleFontFamily: 'Montserrat',
		                bodyFontFamily: 'Montserrat',
		                cornerRadius: 3,
		                intersect: false,
		            },
		            legend: {
		                display: false,
		                position: 'top',
		                labels: {
		                    usePointStyle: true,
		                    fontFamily: 'Montserrat',
		                },


		            },
		            scales: {
		                xAxes: [{
		                    display: false,
		                    gridLines: {
		                        display: false,
		                        drawBorder: false
		                    },
		                    scaleLabel: {
		                        display: false,
		                        labelString: 'Month'
		                    }
		                }],
		                yAxes: [{
		                    display: false,
		                    gridLines: {
		                        display: false,
		                        drawBorder: false
		                    },
		                    scaleLabel: {
		                        display: true,
		                        labelString: 'Value'
		                    }
		                }]
		            },
		            title: {
		                display: false,
		            }
		        }
		    });


		    


		})(jQuery);

	
</script>

</body>
</html>