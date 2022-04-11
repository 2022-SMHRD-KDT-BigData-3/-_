<%@page import="java.util.ArrayList"%>
<%@page import="Model.CheckingDAO"%>
<%@page import="Model.CheckingDTO"%>
<%@page import="Model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            Sidebar start
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

						<div class="card gradient-2">
							<div class="card-body">
								<h3 class="card-title text-white">nickName님의</h3>
								<div class="d-inline-block">
									<h2 class="text-white">관련질환 운동</h2>
									<p class="text-white mb-0">주의사항</p>
								</div>
								<span class="float-right display-5 opacity-5"><i
									class="fa fa-heart"></i></span>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<label for="search"></label> <input type="search" id="search"
									name="search" class="form-control input-rounded"
									placeholder="Input Rounded" onkeyup="inputkeyup(event)">
								<br>
								<center>
									<button type="button" class="btn mb-1 btn-outline-danger"
										onclick="ajaxRequest()" placeholder="">Search</button>
								</center>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div id="video" class="card-body">
								<div class="row">
								<div class="col-lg-8">
										<div class="card">
											<div id="videoList" class="card-body">
												<div class="youtube">
													<div
														class="youtube-container home-youtube-container embed-responsive embed-responsive-item videoPlayer">
														<div class="homeVideoThumbnail video-player"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4">
										<div class="card">
											<div id="videoList" class="card-body">
												<div class="side-body">
													<div id="list">
														<ul class="list"></ul>
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

			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
	</div>

	<!--**********************************
            Footer start
        ***********************************-->
	<div class="footer">
		<div class="copyright">
			<p>
				1차프로잭트 &copy; Designed & Developed by <a
					href="https://themeforest.net/user/quixlab">지금우리학원은</a> 2018
			</p>
		</div>
	</div>
	<!--**********************************
            Footer end
        ***********************************-->
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

	<script>
	
    const v = document.querySelector('.videoPlayer');
    const dingnosis = "비만";

    //iframe 추가하고 비디오 재생
    function updateVideo(id){

        v.classList.add("embed-responsive-16by9");
        v.innerHTML = '<iframe src=//www.youtube.com/embed/6XbPmHk2j-h1sdhe'
            + id + '?autoplay=1" width="320" height="315" frameborder="0" allowfullscreen></iframe>';

        document.body.scrollTop = document.documentElement.scrollTop = 0;
    }
    
    //엔터키 이벤트
    
    function inputkeyup(e){
        if(e.keyCode == 13){
            ajaxRequest();
        }
        
    }
		//검색 
		
    	function ajaxRequest(dingnosis){

        const search = document.getElementById("search");
        const ul = document.querySelector(".list");

        if(search.value.length == 0 && dingnosis == null){
            alert("검색어를 입력하세요.");
            search.focus();
            return false;
        } else if(search.value.length == 0) {
        	query = dingnosis + " 운동" + search.value;
            search.value = "";
            search.focus();

        } else {
        	query = search.value;
            search.value = "";
            search.focus();
        	
        }
        console.log(query);
        const key = "AIzaSyDhuGBOZ_JFOXAkyXPBuv8k6dh7984N1uA";
        const url = "https://www.googleapis.com/youtube/v3/search?key="+key+"&q="+query+"&part=snippet&type=video";

        //ul 일단 비우고 시작
        ul.innerHTML = "";
		
        const xhr = new XMLHttpRequest();
        
        //비디오리스트에 검색결과 추가
        
        xhr.onreadystatechange = function() {
            if(this.readyState == 4 && this.status == 200){
                //파싱
                const jsonObj = JSON.parse(this.response);

                console.log(jsonObj['items']);
                const videoList = jsonObj["items"];
                videoList.forEach(element => {
                    const li = document.createElement('li');
                    const div = document.createElement('Div');
                    const img = document.createElement('img');
                    const h3 = document.createElement('h3');
                    const p1 = document.createElement('p');

                    h3.textContent = element["snippet"]["title"];
                    img.src = element["snippet"]["thumbnails"]["medium"]["url"];
                    p1.textContent = element["snippet"]["description"];
                    //div.setAttribute("data-id", element["id"]["videoId"]);
                    div.setAttribute("onClick", `updateVideo('${element["id"]["videoId"]}')`);

                    div.appendChild(img);

                    li.appendChild(div);
                    ul.appendChild(li);

                });
            }
        };
        xhr.open("GET", url, true);
        xhr.send();
    };
    
    $(document).ready(ajaxRequest(dingnosis));

</script>
</body>
</html>