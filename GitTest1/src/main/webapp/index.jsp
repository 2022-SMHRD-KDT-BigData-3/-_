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
<title>Quixlab - Bootstrap Admin Dashboard Template by
	Themefisher.com</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Pignose Calender -->
<link href="./plugins/pg-calendar/css/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="css/style.css" rel="stylesheet">

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
				<a href="index.jsp"> <b class="logo-abbr"><img
						src="images/logo.png" alt=""> </b> <span class="logo-compact"><img
						src="./images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img src="images/logo-text.png" alt="">
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
				<div class="header-left">
					<div class="input-group icons">
						<div class="input-group-prepend">
							<span
								class="input-group-text bg-transparent border-0 pr-2 pr-sm-3"
								id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
						</div>
						<input type="search" class="form-control"
							placeholder="Search Dashboard" aria-label="Search Dashboard">
						<div class="drop-down animated flipInX d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
						</div>
					</div>
				</div>
				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown"></ui>

							<div class="drop-down animated fadeIn dropdown-menu">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">3 New Messages</span> <a
										href="javascript:void()" class="d-inline-block"> <span
										class="badge badge-pill gradient-1">3</span>
									</a>
								</div>
								<div class="dropdown-content-body">
									<ul>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img" src="images/avatar/1.jpg"
												alt="">
												<div class="notification-content">
													<div class="notification-heading">Saiful Islam</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li class="notification-unread"><a
											href="javascript:void()"> <img
												class="float-left mr-3 avatar-img" src="images/avatar/2.jpg"
												alt="">
												<div class="notification-content">
													<div class="notification-heading">Adam Smith</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Can you do me a
														favour?</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img" src="images/avatar/3.jpg"
												alt="">
												<div class="notification-content">
													<div class="notification-heading">Barak Obama</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hi Teddy, Just wanted
														to let you ...</div>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <img
												class="float-left mr-3 avatar-img" src="images/avatar/4.jpg"
												alt="">
												<div class="notification-content">
													<div class="notification-heading">Hilari Clinton</div>
													<div class="notification-timestamp">08 Hours ago</div>
													<div class="notification-text">Hello</div>
												</div>
										</a></li>
									</ul>
								</div>
							</div></li>

						<!--  로그아웃 -->
						<li class="icons dropdown">
							<div class="ss" data-toggle="dropdown">
								<a> <%if(info!=null){ %> <a href="./LogoutServiceCon"> </a><img
										src="images/user/logout.png" height="40" width="40"
										id="logout"> <%} else{%> <img src="images/user/login.png"
										height="40" width="40" id="login"> <% }%> </a>
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
					<li class="nav-label">Dashboard</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-speedometer menu-icon"></i><span
							class="nav-text">UserInfo</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./index.jsp">Home 1</a></li>
							<!-- <li><a href="./index-2.html">Home 2</a></li> -->
						</ul></li>
					<li class="mega-menu mega-menu-sm"><a class="has-arrow"
						href="javascript:void()" aria-expanded="false"> <i
							class="icon-globe-alt menu-icon"></i><span class="nav-text">ㅇㅇ</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./user-import.jsp">Blank</a></li>
							<li><a href="./layout-one-column.html">One Column</a></li>
							<li><a href="./layout-two-column.html">Two column</a></li>
							<li><a href="./layout-compact-nav.html">Compact Nav</a></li>
							<li><a href="./layout-vertical.html">Vertical</a></li>
							<li><a href="./layout-horizontal.html">Horizontal</a></li>
							<li><a href="./layout-boxed.html">Boxed</a></li>
							<li><a href="./layout-wide.html">Wide</a></li>


							<li><a href="./layout-fixed-header.html">Fixed Header</a></li>
							<li><a href="layout-fixed-sidebar.html">Fixed Sidebar</a></li>
						</ul></li>
					<li class="nav-label">Apps</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-envelope menu-icon"></i>
							<span class="nav-text">Email</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./email-inbox.html">Inbox</a></li>
							<li><a href="./email-read.html">Read</a></li>
							<li><a href="./email-compose.html">Compose</a></li>
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-screen-tablet menu-icon"></i><span
							class="nav-text">Apps</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./app-profile.html">Profile</a></li>
							<li><a href="./app-calender.html">Calender</a></li>
						</ul></li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-graph menu-icon"></i> <span
							class="nav-text">Charts</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./chart-flot.html">Flot</a></li>
							<li><a href="./chart-morris.html">Morris</a></li>
							<li><a href="./chart-chartjs.html">Chartjs</a></li>
							<li><a href="./chart-chartist.html">Chartist</a></li>
							<li><a href="./chart-sparkline.html">Sparkline</a></li>
							<li><a href="./chart-peity.html">Peity</a></li>
						</ul></li>
					<li class="nav-label">UI Components</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-grid menu-icon"></i><span
							class="nav-text">UI Components</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./ui-accordion.html">Accordion</a></li>
							<li><a href="./ui-alert.html">Alert</a></li>
							<li><a href="./ui-badge.html">Badge</a></li>
							<li><a href="./ui-button.html">Button</a></li>
							<li><a href="./ui-button-group.html">Button Group</a></li>
							<li><a href="./ui-cards.html">Cards</a></li>
							<li><a href="./ui-carousel.html">Carousel</a></li>
							<li><a href="./ui-dropdown.html">Dropdown</a></li>
							<li><a href="./ui-list-group.html">List Group</a></li>
							<li><a href="./ui-media-object.html">Media Object</a></li>
							<li><a href="./ui-modal.html">Modal</a></li>
							<li><a href="./ui-pagination.html">Pagination</a></li>
							<li><a href="./ui-popover.html">Popover</a></li>
							<li><a href="./ui-progressbar.html">Progressbar</a></li>
							<li><a href="./ui-tab.html">Tab</a></li>
							<li><a href="./ui-typography.html">Typography</a></li>
							<!-- </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-layers menu-icon"></i><span class="nav-text">Components</span>
                        </a>
                        <ul aria-expanded="false"> -->
							<li><a href="./uc-nestedable.html">Nestedable</a></li>
							<li><a href="./uc-noui-slider.html">Noui Slider</a></li>
							<li><a href="./uc-sweetalert.html">Sweet Alert</a></li>
							<li><a href="./uc-toastr.html">Toastr</a></li>
						</ul></li>
					<li><a href="widgets.html" aria-expanded="false"> <i
							class="icon-badge menu-icon"></i><span class="nav-text">Widget</span>
					</a></li>
					<li class="nav-label">Forms</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-note menu-icon"></i><span
							class="nav-text">Forms</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./form-basic.html">Basic Form</a></li>
							<li><a href="./form-validation.html">Form Validation</a></li>
							<li><a href="./form-step.html">Step Form</a></li>
							<li><a href="./form-editor.html">Editor</a></li>
							<li><a href="./form-picker.html">Picker</a></li>
						</ul></li>
					<li class="nav-label">Table</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-menu menu-icon"></i><span
							class="nav-text">Table</span>
					</a>
						<ul aria-expanded="false">
							<li><a href="./table-basic.html" aria-expanded="false">Basic
									Table</a></li>
							<li><a href="./table-datatable.html" aria-expanded="false">Data
									Table</a></li>
						</ul></li>
					<li class="nav-label">Pages</li>
					<li><a class="has-arrow" href="javascript:void()"
						aria-expanded="false"> <i class="icon-notebook menu-icon"></i><span
							class="nav-text">Pages</span>
					</a> <!--   -->
						<ul aria-expanded="User">
							<%if(info!=null){ %>
							<li><a href="./LogoutServiceCon">로그아웃</a></li>
							<%}else{ %>
							<li><a href="./page-login.jsp"></a></li>
							<%} %>
							<li><a href="./page-register.jsp">회원가입</a></li>
							<li><a href="./page-edit.jsp">개인정보수정</a></li>
							<li><a class="has-arrow" href="javascript:void()"
								aria-expanded="false">하기싫다</a>
								<ul aria-expanded="false">
								</ul></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">

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
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
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
								<h2 class="mt-4">로그인을 해주세요</h2>
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
													<span class="pull-right"> <%
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

											<td><h4 class="userIndex">혈압</h4></td>
											<td><div class="alert alert-success">
													<span class="pull-right"> <%
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
													<span class="pull-right"> <%
											if (info != null) {
												if (ckdto != null) {
													int bmi = (ckdto.getWeigth() / (ckdto.getHeight() * ckdto.getHeight() / 10000));
											%><%=bmi%> <%
											}
											}
											%>
													</span>
												</div></td>
										</tr>
									</tbody>
								</table>
							</div>
							<br>
						</div>
					</div>
					<!-- /# card -->
				</div>

				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Slides With captions</h4>
							<div class="bootstrap-carousel">
								<div data-ride="carousel" class="carousel slide"
									id="carouselExampleCaptions">
									<ol class="carousel-indicators">
										<li class="" data-slide-to="0"
											data-target="#carouselExampleCaptions"></li>
										<li data-slide-to="1" data-target="#carouselExampleCaptions"
											class=""></li>
										<li data-slide-to="2" data-target="#carouselExampleCaptions"
											class="active"></li>
									</ol>
									<div class="carousel-inner">
										<div class="carousel-item">
											<img class="d-block w-100" src="images/big/img5.jpg" alt="">
											<div class="carousel-caption d-none d-md-block">
												<h5>First slide label</h5>
												<p>Nulla vitae elit libero, a pharetra augue mollis
													interdum.</p>
											</div>
										</div>
										<div class="carousel-item">
											<img alt="" class="d-block w-100" src="images/big/img6.jpg">
											<div class="carousel-caption d-none d-md-block">
												<h5>Second slide label</h5>
												<p>Lorem ipsum dolor sit amet, consectetur adipiscing
													elit.</p>
											</div>
										</div>
										<div class="carousel-item active">
											<img alt="" class="d-block w-100" src="images/big/img5.jpg">
											<div class="carousel-caption d-none d-md-block">
												<h5>Third slide label</h5>
												<p>Praesent commodo cursus magna, vel scelerisque nisl
													consectetur.</p>
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
				<div class="col-lg-6">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body pb-0 d-flex justify-content-between">
									<div>
										<h4 class="mb-1">혈압</h4>

									</div>
									<div>
										<ul>
											<li class="d-inline-block mr-3"><a class="text-dark"
												href="#">일</a></li>
											<li class="d-inline-block mr-3"><a class="text-dark"
												href="#">주</a></li>
											<li class="d-inline-block"><a class="text-dark" href="#">달</a></li>
										</ul>
									</div>
								</div>
								<div class="chart-wrapper">
									<canvas id="chart_widget_1"></canvas>
								</div>
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<h6>어제 혈압값</h6>
										<h6>오늘 혈압값</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-lg-6">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body pb-0 d-flex justify-content-between">
									<div>
										<h4 class="mb-1">혈당</h4>

									</div>
									<div>
										<ul>
											<li class="d-inline-block mr-3"><a class="text-dark"
												href="#">일</a></li>
											<li class="d-inline-block mr-3"><a class="text-dark"
												href="#">주</a></li>
											<li class="d-inline-block"><a class="text-dark" href="#">달</a></li>
										</ul>
									</div>
								</div>
								<div class="chart-wrapper">
									<canvas id="chart_widget_2"></canvas>
								</div>
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<h6>어제 혈당값</h6>
										<h6>오늘 혈당값</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-lg-6">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-body pb-0 d-flex justify-content-between">
									<div>
										<h4 class="mb-1">BMI</h4>

									</div>
									<div>
										<ul>
											<li class="d-inline-block mr-3"><a class="text-dark"
												href="#">일</a></li>
											<li class="d-inline-block mr-3"><a class="text-dark"
												href="#">주</a></li>
											<li class="d-inline-block"><a class="text-dark" href="#">달</a></li>
										</ul>
									</div>
								</div>
								<div class="chart-wrapper">
									<canvas id="chart_wid3"></canvas>
								</div>
								<div class="card-body">
									<div class="d-flex justify-content-between">
										<h6>어제 BMI값</h6>
										<h6>오늘 BMI값</h6>
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
				스마트인재개발 &copy; Designed & Developed by <a
					href="https://themeforest.net/user/quixlab">지금우리학원은</a> 2022
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



	<script src="./js/dashboard/dashboard-1.js"></script>

	<script type="text/javascript">
    	document.querySelector("#login").addEventListener("click",function(){
    		location.href="page-login.jsp"
    	});
    </script>
	<script type="text/javascript">
    	document.querySelector("#logout").addEventListener("click",function(){
    		location.href="LogoutServiceCon"
    	});
    </script>
	<script type="text/javascript"> document.getElementById("worldMain").style.display="none" </script>
	<script type="text/javascript"> document.getElementById("SummaryMain").style.display="none" </script>

	<script type="text/javascript">
	    let ctx = document.getElementById("chart_widget_1");
	    ctx.height = 280;
	    new Chart(ctx, {
	        type: 'line',
	        data: {
	            labels: [<%for(int i=0;i<clist.size();i++ ){%>
            	<%=clist.get(i).getCheckday()%>,
                <%}%>],
	            type: 'line',
	            defaultFontFamily: 'Montserrat',
	            datasets: [ {
	                label: [<%for(int i=0;i<clist.size();i++ ){%>
	            	<%String day = clist.get(i).getCheckday();%>
	            	
	                <%}%>],
	                data: [<%for(int i=0;i<clist.size();i++ ){%>
	                	<%=clist.get(i).getBlood()%>,
	                <%}%>],
	               /* backgroundColor: '#ADEB00',*/
	                borderColor: '#ADEB00',
	                borderWidth: 0.5,
	                pointStyle: 'circle',
	                pointRadius: 5,
	                pointBorderColor: 'transparent',
	                pointBackgroundColor: '#ADEB00',
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
	})(jQuery);(function($) {
	    "use strict"

	    let ctx = document.getElementById("chart_widget_2");
	    ctx.height = 280;
	    new Chart(ctx, {
	        type: 'line',
	        data: {
	            labels: [<%for(int i=0;i<clist.size();i++ ){%>
            	<%=clist.get(i).getCheckday()%>,
                <%}%>],
	            type: 'line',
	            defaultFontFamily: 'Montserrat',
	            datasets: [{
	                label: [<%for(int i=0;i<clist.size();i++ ){%>
	            	<%=clist.get(i).getCheckday()%>,
	                <%}%>],
	                data: [<%for(int i=0;i<clist.size();i++ ){%>
	            	<%=clist.get(i).getBsugar()%>,
	                <%}%>],
	               /* backgroundColor: '#ADEB00',*/
	                borderColor: '#ADEB00',
	                borderWidth: 0.5,
	                pointStyle: 'circle',
	                pointRadius: 5,
	                pointBorderColor: 'transparent',
	                pointBackgroundColor: '#ADEB00',
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

	    let ctx = document.getElementById("chart_wid3");
	    ctx.height = 280;
	    new Chart(ctx, {
	        type: 'line',
	        data: {
	            labels: [<%for(int i=0;i<clist.size();i++ ){%>
            	<%=clist.get(i).getCheckday()%>,
                <%}%>],
	            type: 'line',
	            defaultFontFamily: 'Montserrat',
	            datasets: [{
	                label: [<%for(int i=0;i<clist.size();i++ ){%>
	            	<%=clist.get(i).getCheckday()%>,
	                <%}%>],s
	                data: [<%for(int i=0;i<clist.size();i++ ){
	            	int bmi =(ckdto.getWeigth()/(ckdto.getHeight()*ckdto.getHeight()/10000));%><%=bmi%>,
	                <%}%>],
	               /* backgroundColor: '#ADEB00',*/
	                borderColor: '#ADEB00',
	                borderWidth: 0.5,
	                pointStyle: 'circle',
	                pointRadius: 5,
	                pointBorderColor: 'transparent',
	                pointBackgroundColor: '#ADEB00',
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