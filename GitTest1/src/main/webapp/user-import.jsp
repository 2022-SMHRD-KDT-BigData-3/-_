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
<!--폰트 변경 링크  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Beau+Rivage&family=Grape+Nuts&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&family=Poor+Story&family=Stylish&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu:wght@700&family=Hi+Melody&family=Nanum+Brush+Script&family=Nanum+Pen+Script&family=Poor+Story&family=Stylish&family=Yeon+Sung&display=swap" rel="stylesheet">

</head>
<body>
	<%
	CheckingDTO ckdto = null;
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	if(info!=null){
	 ckdto= (CheckingDTO)session.getAttribute("ckdto"); 
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
					<span class="mainfont" style="font-size: x-large;">LifeGuader</span>
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
                                        <li>
                                            <a href="page-login.jsp"><i class="icon-lock"></i><span>로그인</span></a>
                                        </li>
                                        <li><a href="LogoutServiceCon"><i class="icon-key"></i><span>로그아웃</span></a></li>
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
					<li class="nav-label">Dashboard</li>
					<li><a href="./index.jsp"
						> <i class="icon-grid menu-icon"></i><span
							class="nav-text">메인페이지</span>
					</a>
					</li>
					<li><a href="./user-import.jsp"
						> <i class="icon-notebook menu-icon"></i><span
							class="nav-text">유저정보입력</span>
					</a>
					</li>
					<li><a href="./page-2.jsp"
						> <i class="icon-note menu-icon"></i><span
							class="nav-text">식단입력페이지</span>
					</a>
					</li>										
					<li><a href="./page-3.jsp"
						> <i class="icon-badge menu-icon"></i><span
							class="nav-text">식단추천페이지</span>
					</a>
					</li>
					<li><a href="./page4.jsp"
						> <i class="icon-badge menu-icon"></i><span
							class="nav-text">운동추천페이지</span>
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
						<form action="./UserimportServiceCon">
							<div class="card" id="userCard">
								<div class="card-body px-0">
									<div class="col-lg-3">
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
												
															<input type="number" name="age"  value="<%if(info!=null){if(ckdto!=null){ %><%=ckdto.getAge() %><%}} %>"
																			class="btn btn-primary dropdown-toggle"
																			data-toggle="dropdown" id="Dropdown1">
																	</div></td>
															</tr>
															<tr>
																
																<td><h4 class="tableId">키</h4></td>
																<td>
																	<div class="dropdown">
														<input type="number" name="heigth" value="<%if(info!=null){if(ckdto!=null){ %><%=ckdto.getHeight() %><%}} %>"
																			class="btn btn-primary dropdown-toggle"
																			data-toggle="dropdown" id="Dropdown2">
																	</div>
															</tr>
															<tr>
																
																<td><h4 class="tableId">몸무게</h4></td>
																<td>
																	<div class="dropdown">
																		<input type="number" name="weigth" value="<%if(info!=null){if(ckdto!=null){ %><%=ckdto.getWeigth() %><%} }%>"
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
																		<%if(info!=null){if(ckdto!=null){if(ckdto.getAct()==1){ %>
																		checked="checked" <%}}} %> onclick="checkOnlyOne(this)" /><i></i><span>-
																			앉아서 주로 생활하거나 매일 가벼운 움직임만 하며 활동량이 적은 경우</span>
																		<li><label><input type="checkbox"
																				name="act" value="2"
																				<%if(info!=null){if(ckdto!=null){if(ckdto.getAct()==2){ %>
																				checked="checked" <%}} }%>
																				onclick="checkOnlyOne(this)" /><i></i><span>-
																					규칙적인 생활로 보통의 활동량을 가진 경우</span>
																				<li><label><input type="checkbox"
																						value="3"
																						<%if(info!=null){if(ckdto!=null){if(ckdto.getAct()==3){ %>
																						checked="checked" <%}}} %> name="act"
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
				Copyright &copy; Designed & Developed by <a>지금 우리 학원은</a> 2018
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