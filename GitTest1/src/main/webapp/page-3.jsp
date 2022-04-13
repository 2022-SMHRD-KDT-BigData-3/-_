<%@page import="Model.MemberDTO"%>
<%@page import="Model.FoodRecDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.FoodRecDAO"%>
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


<title>Insert title here</title>
</head>
<body>
<% MemberDTO info = (MemberDTO)session.getAttribute("info");%>
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
      
      
	<!-- 박스 -->
		<div class="content-body" >
		<div class="container-fluid mt-3">
		<div class="row">
		
			<div class="col-lg-3 col-sm-6" style="width:200%">
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
		<!-- 드롭다운메뉴 -->
                        <div class="dropdown"style="margin-left:33rem;">
						  <button class="dropbtn" id="checkResult">성분 별 음식추천</button>
							  <div class="dropdown-content" id="checkContent">
							    <a href="./FoodRecCon?choice=car">저탄수화물</a>
							    <a href="./FoodRecCon?choice=pro">고단백질</a>
							    <a href="./FoodRecCon?choice=fat">저지방</a>
							    <a href="./FoodRecCon?choice=sug">저당류</a>
							    <a href="./FoodRecCon?choice=cal">저칼로리</a>
							  </div>
						</div>
                     </div>
                  </div>
               </div>		
		</div>


	<script type="text/javascript">

			

			
			</script>
			
        	
			
					
			<div class="card"style="width:100%">
                            <div class="card-body">
                                <div class="card-title" >
                                    <h4>음식 추천</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table" style="background-color: #FFFFE0">
                               <%
							ArrayList<FoodRecDTO> list = (ArrayList<FoodRecDTO>)session.getAttribute("list");
							
							
							if(list!=null){%>

								<tr>
								<td>번호</td>
								<td>식품명</td>
								<td>칼로리</td>							
								<td>단백질</td>							
								<td>지방</td>							
								<td>탄수화물</td>							
								<td>총당류</td>													
								</tr>
							<%for(int i=0; i<20;i++){ %>
								<tr>
								<td><%= i+1 %></td>
								<td><%=list.get(i).getFname() %></td>
								<td><%=list.get(i).getCal() %></td>
								<td><%=list.get(i).getPro() %></td>							
								<td><%=list.get(i).getFat() %></td>							
								<td><%=list.get(i).getCar() %></td>							
								<td><%=list.get(i).getSug() %></td>							
								</tr>
							<%} 
							}%>
							
							
                                            
                                        
                                    </table>
                                </div>
                            </div>
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
			<br> <br> <br>
					<div class="footer">
		<div class="copyright">
			<p>
				스마트인재개발 &copy; Designed & Developed by <a harf="https://smhrd.lms.elice.io/home">지금우리학원은</a> 2022
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

		<script src="./plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
		<script src="./js/plugins-init/sparkline.init.js"></script>



	</div>
</body>
</html>