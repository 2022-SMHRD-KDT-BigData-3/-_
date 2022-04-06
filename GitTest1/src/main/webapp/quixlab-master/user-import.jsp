<%@page import="Model.CheckingDTO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<html>
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
<link rel="stylesheet" href="./plugins/highlightjs/styles/darkula.css">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	CheckingDTO ckdto= (CheckingDTO)session.getAttribute("ckdto"); 
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

						<!-- 로그인 로그아웃 -->
						<li class="icons dropdown">
							<div class="ss" data-toggle="dropdown">
								<a> <%
 if (info != null) {
 %> <a href="LogoutServiceCon"><img src="images/user/logout.png"
										height="40" width="40" id="logout"> <%
 } else {
 %> <img src="images/user/login.png" height="40" width="40" id="login">
										<%
										}
										%> </a>
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
					</a> <!-- 로그인  -->
						<ul aria-expanded="User">
							<%
							if (info != null) {
							%>
							<li><a href="../LogoutServiceCon">로그아웃</a></li>
							<%
							} else {
							%>
							<li><a href="./page-login.jsp">로그인</a></li>
							<%
							}
							%>
							<li><a href="./page-register.jsp">회원가입</a></li>
							<li><a href="./page-edit.jsp">개인정보수정</a></li>
							<li><a class="has-arrow" href="javascript:void()"
								aria-expanded="false">하고싶다</a>
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
								<%
								if (info != null) {
								%>
								<h3 class="card-title text-white">안녕하세요</h3>
								<div class="d-inline-block">
									<h2 class="text-white"><%=info.getNick()%>님
									</h2>
									<p class="text-white mb-0">환영합니다!</p>
									<%
									} else {
									%>
									<h2 class="text-white">입력한 정보가 없습니다.</h2>
									<p class="text-white mb-0">로그인을 해주세요</p>
									<%
									}
									%>
								</div>
								<%
								if (info != null) {
								%>
								<span class="float-right display-5 opacity-5"><i
									class="fa fa-users"></i></span>
								<%
								}
								%>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<form action="../UserimportServiceCon">
							<div class="card" id="userCard">
								<div class="card-body px-0">
									<div class="col-lg-6">
										<div class="card">
											<div class="card-body">
												<div id=today>
													<script>
														date = new Date()
																.toLocaleDateString();
														document.write(date);
													</script>
												</div>
												<div class="table-responsive">
													<table
														class="table header-border table-hover verticle-middle">
														<tbody>
															<tr>
																
																<td><h4 class="tableId">나이</h4></td>
																<td><div class="dropdown">
												
															<input type="number" name="age"  value="<%if(info!=null){ %><%=ckdto.getAge() %><%} %>"
																			class="btn btn-primary dropdown-toggle"
																			data-toggle="dropdown" id="Dropdown1">
																	</div></td>
															</tr>
															<tr>
																
																<td><h4 class="tableId">키</h4></td>
																<td>
																	<div class="dropdown">
														<input type="number" name="heigth" value="<%if(info!=null){ %><%=ckdto.getHeight() %><%} %>"
																			class="btn btn-primary dropdown-toggle"
																			data-toggle="dropdown" id="Dropdown2">
																	</div>
															</tr>
															<tr>
																
																<td><h4 class="tableId">몸무게</h4></td>
																<td>
																	<div class="dropdown">
																		<input type="number" name="weigth" value="<%if(info!=null){ %><%=ckdto.getWeigth() %><%} %>"
																			class="btn btn-primary dropdown-toggle"
																			data-toggle="dropdown" id="Dropdown3">
																	</div>
																</td>
															</tr>
															<tr>
																
																<td><h4 class="tableId">혈압</h4></td>
																<td>
																	<div class="dropdown">
																		<input type="number" name="bs"
																			class="btn btn-primary dropdown-toggle"
																			data-toggle="dropdown" id="Dropdown4">
																	</div>
																</td>
															</tr>
															<tr>
																
																<td><h4 class="tableId">혈당</h4></td>
																<td>
																	<div class="dropdown">
																		<input type="number" name="bp"
																			class="btn btn-primary dropdown-toggle"
																			data-toggle="dropdown" id="Dropdown5">
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<br>
								<div class="col-lg-3 col-md-6">
									<div class="card" id="userList">
										<div class="card-body px-0">
											<div class="col-lg-6">

												<h4 class="card-title px-4 mb-3">활동지수</h4>
												<div class="todo-list">
													<div class="tdl-holder">
														<div class="tdl-content">
															<ul id="todo_list">
																<li><label><input type="checkbox"
																		name="act" value="1"
																		<%if(info!=null){if(ckdto.getAct()==1){ %>
																		checked="checked" <%}} %> onclick="checkOnlyOne(this)" /><i></i><span>-
																			앉아서 주로 생활하거나 매일 가벼운 움직임만 하며 활동량이 적은 경우</span>
																		<li><label><input type="checkbox"
																				name="act" value="2"
																				<%if(info!=null){if(ckdto.getAct()==2){ %>
																				checked="checked" <%}} %>
																				onclick="checkOnlyOne(this)" /><i></i><span>-
																					규칙적인 생활로 보통의 활동량을 가진 경우</span>
																				<li><label><input type="checkbox"
																						value="3"
																						<%if(info!=null){if(ckdto.getAct()==3){ %>
																						checked="checked" <%}} %> name="act"
																						onclick="checkOnlyOne(this)" /><i></i><span>-
																							육체노동 등 평소 신체 활동량이 많은 경우</span>
															</ul>
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>

								<br> <br>
								<div class="px-4">
									<center>
										<input type="submit" class="btn mb-1 btn-success" id="button1"
											value="입력"> <input type="reset"
											class="btn mb-1 btn-warning" id="button2" value="초기화">
									</center>
								</div>
							</div>
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
				Copyright &copy; Designed & Developed by <a
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
	<script src="./plugins/highlightjs/highlight.pack.min.js"></script>
	<script>
		hljs.initHighlightingOnLoad();
	</script>

	<script>
		(function($) {
			"use strict"

			new quixSettings({
				version : "light", //2 options "light" and "dark"
				layout : "vertical", //2 options, "vertical" and "horizontal"
				navheaderBg : "color_1", //have 10 options, "color_1" to "color_10"
				headerBg : "color_1", //have 10 options, "color_1" to "color_10"
				sidebarStyle : "full", //defines how sidebar should look like, options are: "full", "compact", "mini" and "overlay". If layout is "horizontal", sidebarStyle won't take "overlay" argument anymore, this will turn into "full" automatically!
				sidebarBg : "color_1", //have 10 options, "color_1" to "color_10"
				sidebarPosition : "fixed", //have two options, "static" and "fixed"
				headerPosition : "static", //have two options, "static" and "fixed"
				containerLayout : "wide", //"boxed" and  "wide". If layout "vertical" and containerLayout "boxed", sidebarStyle will automatically turn into "overlay".
				direction : "ltr" //"ltr" = Left to Right; "rtl" = Right to Left
			});

		})(jQuery);
	</script>
	<script type="text/javascript">
		document.querySelector("#login").addEventListener("click", function() {
			location.href = "page-login.jsp"
		});
	</script>
	<script type="text/javascript">
		document.querySelector("#logout").addEventListener("click", function() {
			location.href = "../LogoutServiceCon"
		});
		function checkOnlyOne(element) {
	           
	           const checkboxes 
	               = document.getElementsByName("act");
	     
	           checkboxes.forEach((cb) => {
	             cb.checked = false;
	           })
	           
	           element.checked = true;
	         }
	</script>
</body>
</html>