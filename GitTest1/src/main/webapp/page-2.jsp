<%@page import="Model.MenuDAO"%>
<%@page import="Model.MenuDTO"%>
<%@page import="Model.CheckingDTO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<title>Quixlab - Bootstrap Admin Dashboard Template by
	Themefisher.com</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Custom Stylesheet -->
<link href="css/style.css" rel="stylesheet">

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<title>Document</title>

<script src="./jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
	integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
	integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
	crossorigin="anonymous"></script>

<style>
.pie-chart1 {
	display: inline-block;
	position: relative;
	width: 200px;
	height: 200px;
	border-radius: 50%;
	margin-left: 10rem;
}

.pie-chart1  .center {
	position: absolute;
	width: 100px;
	height: 100px;
	background: #fff;
	border-radius: 50%;
	top: 50px;
	left: 50px;
	text-align: center;
	line-height: 100px;
}
</style>


</head>
<body data-theme-version="light" data-layout="vertical"
	data-nav-headerbg="color_1" data-headerbg="color_1"
	data-sidebar-style="full" data-sibebarbg="color_1"
	data-sidebar-position="static" data-header-position="static"
	data-container="wide" direction="ltr">

	<%
	int act = 0;
	double enCal = 0;
	double enCar = 0;
	double enPro = 0;
	double enFat = 0;
	int hical =100;
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	System.out.println("인포id" + info.getId());
	CheckingDTO ckdto = (CheckingDTO) session.getAttribute("ckdto");
	MenuDTO select = (MenuDTO) session.getAttribute("select");

	if (info != null) {

		if (ckdto.getAct() == 1) {
			act = 25;
		} else if (ckdto.getAct() == 2) {
			act = 35;
		} else if (ckdto.getAct() == 3) {
			act = 40;
		}
		enCal = ((ckdto.getHeight() - 100) * 0.9) * act;
		enCar = enCal * 0.6;
		enPro = enCal * 0.135;
		enFat = enCal * 0.225;

	}
	if (select != null) {
		enCal = enCal / select.getCal();
		enCar = enCar / select.getCar();
		enPro = enPro / select.getPro();
		enFat = enFat / select.getFat();

	}
	%>
	<div id="modal" class="modal" width="400px">
		<div class="modal-content">
			<input id="foodName" type="text" class="form-control"
				placeholder="Search">
			<button class="search" onclick="getData()">선택</button>
			<button class="close">닫기</button>
			<table border="1" id="chart">

			</table>

		</div>
	</div>

	<div id="modalInfo" class="modal" width="400px">
		<div class="modal-content">
			<input id="foodName" type="text" class="form-control"
				placeholder="Search">
			<button class="search" onclick="getData()">선택</button>
			<button class="close">닫기</button>
			<table border="1" id="chart">

			</table>
		</div>
	</div>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader" style="display: none;">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10"></circle>
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper" class="show">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<div class="brand-logo">
				<a href="index.html"> <b class="logo-abbr"><img
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
            Header start
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
						<div class="drop-down   d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
						</div>
					</div>
				</div>
				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-email-outline"></i>
								<span class="badge gradient-1 badge-pill badge-primary">3</span>
						</a>
							<div class="drop-down animated fadeIn dropdown-menu">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">3 New Messages</span>

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
						<li class="icons dropdown"><a href="javascript:void(0)"
							data-toggle="dropdown"> <i class="mdi mdi-bell-outline"></i>
								<span class="badge badge-pill gradient-2 badge-primary">3</span>
						</a>
							<div
								class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									<span class="">2 New Notifications</span>

								</div>
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events near you</h6>
													<span class="notification-text">Within next 5 days</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Started</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-success-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Event Ended
														Successfully</h6>
													<span class="notification-text">One hour ago</span>
												</div>
										</a></li>
										<li><a href="javascript:void()"> <span
												class="mr-3 avatar-icon bg-danger-lighten-2"><i
													class="icon-present"></i></span>
												<div class="notification-content">
													<h6 class="notification-heading">Events to Join</h6>
													<span class="notification-text">After two days</span>
												</div>
										</a></li>
									</ul>

								</div>
							</div></li>
						<li class="icons dropdown d-none d-md-flex"><a
							href="javascript:void(0)" class="log-user" data-toggle="dropdown">
								<span>English</span> <i class="fa fa-angle-down f-s-14"
								aria-hidden="true"></i>
						</a>
							<div
								class="drop-down dropdown-language animated fadeIn  dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="javascript:void()">English</a></li>
										<li><a href="javascript:void()">Dutch</a></li>
									</ul>
								</div>
							</div></li>
						<li class="icons dropdown">
							<div class="user-img c-pointer position-relative"
								data-toggle="dropdown">
								<span class="activity active"></span> <img
									src="images/user/1.png" height="40" width="40" alt="">
							</div>
							<div class="drop-down dropdown-profile   dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="app-profile.html"><i class="icon-user"></i>
												<span>Profile</span></a></li>
										<li><a href="email-inbox.html"><i
												class="icon-envelope-open"></i> <span>Inbox</span>
												<div class="badge gradient-3 badge-pill badge-primary">3</div></a>
										</li>

										<hr class="my-2">
										<li><a href="page-lock.html"><i class="icon-lock"></i>
												<span>Lock Screen</span></a></li>
										<li><a href="page-login.html"><i class="icon-key"></i>
												<span>Logout</span></a></li>
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
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<div class="slimScrollDiv"
				style="position: relative; overflow: hidden; width: auto; height: 100%;">
				<div class="nk-nav-scroll active"
					style="overflow: hidden; width: auto; height: 100%;">
					<ul class="metismenu in" id="menu">
						<li class="nav-label">Dashboard</li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class="icon-speedometer menu-icon"></i><span
								class="nav-text">Dashboard</span>
						</a>
							<ul aria-expanded="false" class="collapse">
								<li><a href="./index.html">Home 1</a></li>
								<!-- <li><a href="./index-2.html">Home 2</a></li> -->
							</ul></li>
						<li class="mega-menu mega-menu-sm"><a class="has-arrow"
							href="javascript:void()" aria-expanded="false"> <i
								class="icon-globe-alt menu-icon"></i><span class="nav-text">Layouts</span>
						</a>
							<ul aria-expanded="false" class="collapse">
								<li><a href="./layout-blank.html">Blank</a></li>
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
							<ul aria-expanded="false" class="collapse">
								<li><a href="./email-inbox.html">Inbox</a></li>
								<li><a href="./email-read.html">Read</a></li>
								<li><a href="./email-compose.html">Compose</a></li>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i
								class="icon-screen-tablet menu-icon"></i><span class="nav-text">Apps</span>
						</a>
							<ul aria-expanded="false" class="collapse">
								<li><a href="./app-profile.html">Profile</a></li>
								<li><a href="./app-calender.html">Calender</a></li>
							</ul></li>
						<li class="active"><a class="has-arrow"
							href="javascript:void()" aria-expanded="false"> <i
								class="icon-graph menu-icon"></i> <span class="nav-text">Charts</span>
						</a>
							<ul aria-expanded="false" class="collapse in">
								<li><a href="./chart-flot.html">Flot</a></li>
								<li><a href="./chart-morris.html">Morris</a></li>
								<li><a href="./chart-chartjs.html">Chartjs</a></li>
								<li><a href="./chart-chartist.html">Chartist</a></li>
								<li class="active"><a href="./chart-sparkline.html"
									class="active">Sparkline</a></li>
								<li><a href="./chart-peity.html">Peity</a></li>
							</ul></li>
						<li class="nav-label">UI Components</li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class="icon-grid menu-icon"></i><span
								class="nav-text">UI Components</span>
						</a>
							<ul aria-expanded="false" class="collapse">
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
							<ul aria-expanded="false" class="collapse">
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
							<ul aria-expanded="false" class="collapse">
								<li><a href="./table-basic.html" aria-expanded="false">Basic
										Table</a></li>
								<li><a href="./table-datatable.html" aria-expanded="false">Data
										Table</a></li>
							</ul></li>
						<li class="nav-label">Pages</li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class="icon-notebook menu-icon"></i><span
								class="nav-text">Pages</span>
						</a>
							<ul aria-expanded="false" class="collapse">
								<li><a href="./page-login.html">Login</a></li>
								<li><a href="./page-register.html">Register</a></li>
								<li><a href="./page-lock.html">Lock Screen</a></li>
								<li><a class="has-arrow" href="javascript:void()"
									aria-expanded="false">Error</a>
									<ul aria-expanded="false" class="collapse">
										<li><a href="./page-error-404.html">Error 404</a></li>
										<li><a href="./page-error-403.html">Error 403</a></li>
										<li><a href="./page-error-400.html">Error 400</a></li>
										<li><a href="./page-error-500.html">Error 500</a></li>
										<li><a href="./page-error-503.html">Error 503</a></li>
									</ul></li>
							</ul></li>
					</ul>
				</div>
				<div class="slimScrollBar"
					style="background: transparent; width: 5px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 1068px;"></div>
				<div class="slimScrollRail"
					style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div>
			</div>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">

			<!-- 날짜 태그 -->
			<div class="row">

				<div class="col-lg-3 col-sm-6">


					<div class="card gradient-2">

						<div class="card-body">
							<!-- 하루전으로 가는 태그 -->
							<div id="backbtn">
								<a data-slide="prev" href="#" class="carousel-control-prev"><span
									class="carousel-control-prev-icon" id="BackClick"
									></span> <span class="sr-only">하루전</span> </a>

								<div id=today style="text-align: center;"></div>

							</div>

							<!-- 하루 후로 가는 태그 -->
							<a data-slide="next" href="#carouselExampleCaptions"
								class="carousel-control-next"><span
								class="carousel-control-next-icon" id="FrontClick"
								></span> <span class="sr-only">하루후</span></a> <span
								class="float-right display-5 opacity-5"><i
								class="fa fa-heart"></i></span>
						</div>
					</div>

				</div>
			</div>

			<div class="go">
				<button type="button" class="btn mb-1 btn-success" onclick="checking()">
					Seccess <span class="btn-icon-right"><i class="fa fa-check"></i></span>
				</button>
			</div>
			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-striped verticle-middle">

							<!-- 칼로리 그래프 태그 -->
							<tr>
								<td id="bp">칼로리</td>
								<td id="green">
									<div class="progress" style="height: 10px">
										<div class="progress-bar gradient-1" style="width: <%=enCal %>%;"
											role="progressbar">
											<span class="sr-only">50% Complete</span>
										</div>
									</div>
								</td>
							</tbody>
						</table>
					</div>
				</div>
			</div>





			<!-- 도넛 그래프 태그 -->


			<%
			int i = 45;
			%>
			<div class="pie-chart1">
				<span class="center">탄수화물</span>

			</div>


			<div class="pie-chart1">
				<span class="center">단백질</span>
			</div>


			<div class="pie-chart1">
				<span class="center">지방</span>
			</div>



			<script>
	 	$(".pie-chart1").css({
	 	   "background":"conic-gradient(#ADEB00 0% <%=i%>%, #DCDCDC <%=i%>% 100%)"
								});
			
		</script>


			<!-- 식단 입력 태그 -->
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">식단입력</h4>
					<div class="table-responsive">
						<table class="table table-bordered table-striped verticle-middle">

							<tbody>
								<tr>
									<td>아침</td>

									<td><button type="button"
											class="btn mb-1 btn-outline-warning">아침 입력</button></td>
									<td></td>
									<td><button type="button"
											class="btn mb-1 btn-outline-primary">저장</button></td>
									<td id="morning"></td>
									<td>
										<button type="button" id="morNutInfo"
											class="btn mb-1 btn-rounded btn-outline-success">영양정보</button>
									</td>
									<td><span><a href="#" data-toggle="tooltip"
											data-placement="top" title="Edit"><i
												class="fa fa-pencil color-muted m-r-5"></i> </a><a href="#"
											data-toggle="tooltip" data-placement="top" title="Close"><i
												class="fa fa-close color-danger"></i></a></span></td>
								</tr>
								<tr>
									<td>점심</td>

									<td><button type="button"
											class="btn mb-1 btn-outline-warning">점심 입력</button></td>
									<td></td>
									<td><button type="button"
											class="btn mb-1 btn-outline-primary">저장</button></td>
									<td id="lunch"></td>
									<td>
										<button type="button" id="lunNutInfo"
											class="btn mb-1 btn-rounded btn-outline-success">영양정보</button>
									</td>
									<td><span><a href="#" data-toggle="tooltip"
											data-placement="top" title="Edit"><i
												class="fa fa-pencil color-muted m-r-5"></i> </a><a href="#"
											data-toggle="tooltip" data-placement="top" title="Close"><i
												class="fa fa-close color-danger"></i></a></span></td>
								</tr>
								<tr>
									<td>저녁</td>

									<td><button type="button"
											class="btn mb-1 btn-outline-warning">저녁 입력</button></td>
									<td></td>
									<td><button type="button"
											class="btn mb-1 btn-outline-primary">저장</button></td>
									<td id="dinner"></td>
									<td>
										<button type="button" id="dinNutInfo"
											class="btn mb-1 btn-rounded btn-outline-success">영양정보</button>
									</td>
									<td><span><a href="#" data-toggle="tooltip"
											data-placement="top" title="Edit"><i
												class="fa fa-pencil color-muted m-r-5"></i> </a><a href="#"
											data-toggle="tooltip" data-placement="top" title="Close"><i
												class="fa fa-close color-danger"></i></a></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>




			<!-- #/ container -->

			<!--**********************************
            Content body end
        ***********************************-->


			<!--**********************************
            Footer start
        ***********************************-->
			<div class="footer">
				<div class="copyright">
					<p>
						Copyright © Designed &amp; Developed by <a
							href="https://themeforest.net/user/quixlab">Quixlab</a> 2018
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

		<script src="./plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
		<script src="./js/plugins-init/sparkline.init.js"></script>
		<script>
			
		/* 날짜 스크립트 */
			let date2 = new Date();
			let year = date2.getFullYear();
			let month = date2.getMonth() + 1;
			let day = date2.getDate();
			console.log(date2);
			let date = year + "년" + month + "월" + day + "일";
			$("#today").text(date);

			

		
			
			/* MenuDTO 들어갈 변수 */
			let foodName = null;	
			let mealTime = null;
			let fname = null;
			let cal = null;
			let pro = null;
			let car = null;
			let fat = null;
			let input_data = {};
			
			/*         $(".choice").on("click", function(){
			 mealTime2 = this.innerText;
			 console.log(mealTime2);
			 $(".modal").fadeIn();
			 }); */
			
			$(".btn-outline-warning").click(function() {
				mealTime = this.innerText;
				console.log(mealTime);
				$("#modal").fadeIn();

			});

			$(".close").click(function() {
				$("#modal").fadeOut();
			});

			$("#morNutInfo").click(function() {
				$("#modalInfo").fadeIn();
				let morFood_data = {};

			});

			$("#lunNutInfo").click(function() {
				$("#modalInfo").fadeIn();
				let lunFood_data = {};
			});

			$("#dinNutInfo").click(function() {
				$("#modalInfo").fadeIn();
				let dinFood_data = {};
			});

			$(".close").click(function() {

				$(".modal").fadeOut();

			});
			
			/* 식품 영양정보 API 연결 */
			function getData() {
		
				$("#chart").empty();
				
				foodName = document.getElementById("foodName").value;
				console.log("성공해봐 ㅋㅋ");

				$
						.ajax({
							headers : {
								'X-Requested-With' : 'XMLHttpRequest'
							},
							url : "https://cors-anywhere.herokuapp.com/http://openapi.foodsafetykorea.go.kr/api/6c16719532f64640814f/I2790/json/1/1000/DESC_KOR="
									+ foodName,
							type : "GET",
							success : function(data) {
								console.log("success : " + mealTime);
								console.log(data);
								let Array = data.I2790.row;

								$("#chart")
										.append(
												"<tr><td> 식품명 </td><td> 열량 </td><td> 탄수화물 </td><td> 단백질 </td><td> 지방 </td><td> 선택 </td></tr>");
								for (let i = 0; i <= Array.length; i++) {

									if (Array[i].NUTR_CONT1 != ""
											&& Array[i].NUTR_CONT2 != ""
											&& Array[i].NUTR_CONT3 != ""
											&& Array[i].NUTR_CONT4 != "") {

										fname = Array[i].DESC_KOR;
										cal = Array[i].NUTR_CONT1;
										pro = Array[i].NUTR_CONT2;
										car = Array[i].NUTR_CONT3;
										fat = Array[i].NUTR_CONT4;

										input_data.num = i;
										input_data.meal = mealTime;

										var str = "<tr>"
												+ "<td id=fname" + i + ">"
												+ fname
												+ "</td>"
												+ "<td id=cal" + i + ">"
												+ cal
												+ "</td>"
												+ "<td id=pro" + i + ">"
												+ pro
												+ "</td>"
												+ "<td id=car" + i + ">"
												+ car
												+ "</td>"
												+ "<td id=fat" + i + ">"
												+ fat
												+ "</td><td><button id=select onclick='Funcinput("
												+ i
												+ ")'> 선택 </button></td></tr>"

										console.log(str)

										$("#chart").append(str);
										console.log("fat" + fat)
									} // if문끝

								} // for문끝

							}, // success 끝

							error : function(data) {
								alert("통신 실패");
							} // error 끝
						}); // ajax끝
			} // getData 함수 끝    
			// let i=0;
			
			/* API 정보 보여주는 기능 */
			
			function Funcinput(i) {
				//console.log("input 안의 숫자"+input_data.num);
				//console.log("input 안의 숫자"+input_data.meal);
				console.log("input 안의 숫자" + i);
				console.log("input 안의 숫자" + mealTime);

				let fnameSec = document.getElementById("fname" + i).innerText;
				let calSec = document.getElementById("cal" + i).innerText;
				let proSec = document.getElementById("pro" + i).innerText;
				let carSec = document.getElementById("car" + i).innerText;
				let fatSec = document.getElementById("fat" + i).innerText;

				if (mealTime == "아침 입력") {
					let td = document.getElementById("morning");
					mor = td.innerText;

					console.log(fnameSec);
					if (mor == "") {
						td.innerText = fnameSec;
					} else {
						td.innerText = mor + ", " + fnameSec;
					}

				} else if (mealTime == "점심 입력") {
					let td = document.getElementById("lunch");
					lun = td.innerText;
					console.log(fnameSec);
					if (lun == "") {
						td.innerText = fnameSec;
					} else {
						td.innerText = lun + ", " + fnameSec;
					}
				} else {
					let td = document.getElementById("dinner");
					din = td.innerText;
					console.log(fnameSec);
					if (din == "") {
						td.innerText = fnameSec;
					} else {
						td.innerText = din + ", " + fnameSec;
					}
				}

			}
		</script>

		<!-- 정보 DB 저장하기 -->

		<script type="text/javascript">

			$(".btn-outline-primary").on("click",function() {
				console.log("이건 " + date);
						let meal = null;

						if (mealTime == "아침 입력") {
							meal = 1;
						} else if (mealTime == "점심 입력") {
							meal = 2;
						} else if (mealTime == "저녁 입력") {
							meal = 3;
						}
												
						location.href ="InsertServiceCon?id="+<%=info.getId()%>+"&fname="+fname+"&date="+date+"&cal="+cal+"&pro="+pro+"&car="+car+"&fat="+fat;
						});
		</script>

		<!-- 날짜 바꾸기 -->

		<script type="text/javascript">
		console.log("그냥 실행");
		let id = <%=info.getId()%>
		function checking(){
			alert("함수 실행00");
			$.ajax({
				url : "SelectFoodSerivceCon",
				data : "id="+id+"&date="+date,
				success: function(){
					console.log(id);
					alert("ajax성공");
				},
				error : function(){
					alert("통신 실패");
				}
			});	
		}
		
	$("#BackClick").on("click", function() {
				day = day - 1;
				console.log("test3" + date2);
				date = year + "년" + month + "월" + day + "일";
				
				$("#today").text(date);
				
				
			}); 
		$("#FrontClick").on("click", function() {
				day = day + 1;
				date = year + "년" + month + "월" + day + "일";
				$("#today").text(date);
				
			
			}); 
		</script>
	</div>
</body>
</html>