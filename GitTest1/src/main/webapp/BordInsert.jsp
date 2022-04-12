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
<!--폰트 변경 링크  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet:wght@300&display=swap"
	rel="stylesheet">

<script src="./jquery-3.6.0.min.js"></script>

<title>Insert title here</title>


</head>
<body>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");

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
						src="images/clover2.png" alt=""> </b><span class="brand-title">
						<img src="images/clover1.png" alt=""> <span class="mainfont"
						style="font-size: font-size: 22px; margin-left: -0.5rem;">LifeGuader</span>
				</span> </a>
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
							<div class="user-img c-pointer position-relative"
								data-toggle="dropdown">
								<span class="activity active"></span>
								<!--  로그인,로그아웃, 회원정보수정, 회원가입 -->
								<a> <%
 if (info != null) {
 %> <img src="images/user/logout.png" height="40" width="40"> <%
 } else {
 %> <img src="images/user/login.png" height="40" width="40"> <%
 }
 %>
								</a>
							</div>
							<div
								class="drop-down dropdown-profile animated fadeIn dropdown-menu">
								<div class="dropdown-content-body">
									<ul>

										<%
										if (info != null) {
										%>
										<li><a href="page-edit.jsp"> <i class="icon-people"></i>
												<span>회원정보수정</span>
										</a></li>
										<%
										} else {
										%>
										<li><a href="page-register.jsp"><i class="icon-user"></i>
												<span>회원가입</span></a></li>
										<%
										}
										%>
										<hr class="my-2">
										<%
										if (info != null) {
										%>
										<li><a href="LogoutServiceCon"><i class="icon-key"></i><span>로그아웃</span></a>
										</li>
										<%
										} else {
										%>
										<li><a href="page-login.jsp"><i class="icon-lock"></i><span>로그인</span></a>
										</li>
										<%
										}
										%>
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
					<li><a href="./index.jsp"> <i class="icon-grid menu-icon"></i><span
							class="nav-text">메인페이지</span>
					</a></li>
					<li><a href="./user-import.jsp"> <i
							class="icon-notebook menu-icon"></i><span class="nav-text">유저정보입력</span>
					</a></li>
					<li><a href="./page-2.jsp"> <i class="icon-note menu-icon"></i><span
							class="nav-text">식단입력페이지</span>
					</a></li>
					<li><a href="./page-3.jsp"> <i
							class="icon-badge menu-icon"></i><span class="nav-text">식단추천페이지</span>
					</a></li>
					<li><a href="./page4.jsp"> <i class="icon-badge menu-icon"></i><span
							class="nav-text">운동추천페이지</span>
					</a></li>
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
								<h1 class="text-white">로그인을 해주세요</h1>
								<%
								}
								%>

							</div>
						</div>
					</div>
				</div>

				<div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-right-box">

                                    <div class="compose-content mt-5">
                                        <form action="borderinsert" method="post">
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" placeholder=" Subject" name="title">
                                            </div>
                                            <div class="form-group">
                                                <input class="textarea_editor form-control bg-light" rows="15" placeholder="Enter text ..." name="data">
                                            </div>
                                        <h5 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i>첨부파일</h5>
                                            <div class="form-group">
                                                <div class="fallback">
                                                    <input class="l-border-1" name="file" type="file" multiple="multiple">
                                                </div>
                                            </div>
                                       
                                    </div>
                                    <div class="text-left m-t-15">
                                    	<a href="Bord.jsp">

                                        <input class="btn btn-success m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="submit"><i class="fa fa-paper-plane m-r-5"></i> Send</button>
                                        </a>
                                        <a href="BordInsert.jsp">
                                        <button class="btn-warning m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="button"><i class="fa fa-paper-plane m-r-5"></i> Discard</button>
                                        </a> 
                                        </form>
                                    </div>
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
					스마트인재개발 &copy; Designed & Developed by <a
						harf="https://smhrd.lms.elice.io/">지금우리학원은</a> 2022
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
		document.querySelector("#login").addEventListener("click", function() {
			location.href = "page-login.jsp"
		});
	</script>
	<!--  로그아웃 실행  -->
	<script type="text/javascript">
		document.querySelector("#logout").addEventListener("click", function() {

			location.href = "LogoutServiceCon"
		});
	</script>
	<script type="text/javascript">
		document.getElementById("worldMain").style.display = "none"
	</script>
	<script type="text/javascript">
		document.getElementById("SummaryMain").style.display = "none"
	</script>


	<!--  차트 css  -->
	<script src="./js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		next_list(1, 1);

		var arr = null;
		var pageSize = 3;
		var maxRow = 10;

		function button_create(data_list, startPage) {

			var pageNum = null;

			if (data_list.length % maxRow == 0) {
				pageNum = data_list.length / maxRow;
			}

			else {
				pageNum = Math.floor(data_list.length / maxRow) + 1;
			}

			var currentPage = startPage;

			for (var i = 0; i < pageNum; i++) {
				arr = data_list;
				$('#controller').append(
						'<button onclick="page(' + currentPage + ')" id="'
								+ currentPage + '" class="button">'
								+ currentPage + '</button>');
				currentPage = currentPage + 1;
			}

			var next_startRow = data_list[data_list.length - 1].num + 1;

			if (pageNum >= pageSize) {
				$('#controller').append(
						'<button onclick="next_list(' + next_startRow + ','
								+ (startPage + pageSize)
								+ ')" class="next" id="next' + currentPage
								+ '">다음</button>');
				//여기서 currentPage 는 전에 계속 더했던 값이 들어있기 때문에 다음페이지 에서의 페이지블럭의 첫 시작수 이다.
			}

			if (startPage >= pageSize + 1) {//pageSize+1 -->첫 페이지 에서는 이전 버튼이 생기지 않으므로 pageSize+1 이상 일 때만 이전 버튼이 생긴다
				var before_num = data_list[0].num - (pageSize * maxRow);
				var before_page = startPage - pageSize;

				$('#controller').append(
						'<button onclick="before_list(' + before_num + ','
								+ before_page + ')" class="before" id="before'
								+ before_page + '">이전</button>');
			}
		}

		//'다음' 버튼 클릭시 이전 페이지에서의 '이전','다음','각 페이지' 버튼 삭제
		function next_button_delete(startPage) {
			console.log("다음페이지값이 된다고??" + startPage);
			if (startPage >= pageSize + 1) { // startPage 값이 pageSize+1 만큼의 크기일때 생기기 때문 
				$('#next' + startPage).remove();

				if (startPage >= pageSize * 2 + 1) { //이전 버튼은 startPage 값이 pageSize*2+1 만큼의 크기일때 생기기 때문 
					$('#before' + (startPage - pageSize * 2)).remove();
				}

				startPage = startPage - pageSize;
				for (var i = 0; i < pageSize; i++) {
					$('#' + startPage).remove();
					startPage = startPage + 1;
				}
			}
		}

		//이전 페이지 버튼 클릭시 전화면에 나왔던 버튼 삭제
		function before_button_delete(before_page) {

			$('#before' + before_page).remove();
			$('#next' + (before_page + pageSize * 2)).remove(); //이전 버튼 클릭시 페이지 에서 없애야할 다음 버튼은 before_page+pageSize*2 의 값을 가지고 있다

			before_page = before_page + pageSize;
			for (var i = 0; i < pageSize; i++) {
				$('#' + before_page).remove();
				before_page = before_page + 1;
			}
		}

		//이전 버튼이 눌린다면 그에 맞는 버튼들이 생성, 삭제 와 해당 리스트가 출력되기 위한 메소드 
		function before_list(before_num, before_page) {
			$.ajax({
				url : 'border',
				method : 'post',
				dataType : 'json',
				data : {
					"num" : before_num
				},// 한 페이지 에서 가져와야하는 양이 정해저 있으므로 어디 페이지에서 요청했는지 알기위해 가져올DB의 시작 num을 같이 넘겨 준다 
				success : function(data_list) {

					// DB를 통해 가져왔는데 가져온 양이 테이블 행의 갯수인 10 보다 적으면 html의 테이블은 이전값을 가지고 있으므로 안보이게 .hide()를 사용해주어야 한다 
					if (data_list.length < 10) {
						list_write(data_list);

						button_create(data_list, before_page);
						before_button_delete(before_page);
					} else {
						print_list(data_list);
						button_create(data_list, before_page);
						before_button_delete(before_page);
					}

				},
				error : function(e) {
					alert(e);
				}

			});

		}

		//다음 버튼이 눌린다면 그에 맞는 버튼들이 생성, 삭제 와 해당 리스트가 출력되기 위한 메소드 
		function next_list(startRow, startPage) {
			$.ajax({
				/* jsp 시작하면서 바로 border서블릿과 비동기 통신으로 DB 에있는 내용을 가져온다 */
				url : 'border',
				method : 'post',
				dataType : 'json',
				data : {
					"num" : startRow
				},/* 한 페이지 에서 가져와야하는 양이 정해저 있으므로 어디 페이지에서 요청했는지 알기위해 가져올DB의 시작 num을 같이 넘겨 준다 */
				success : function(data_list) {

					if (data_list.length < 10) {/* DB를 통해 가져왔는데 가져온 양이 테이블 행의 갯수인 10 보다 적으면 html의 테이블은 이전값을 가지고 있으므로 안보이게 .hide()를 사용해주어야 한다 */
						list_write(data_list);
						button_create(data_list, startPage);
						next_button_delete(startPage);
					}

					else {
						print_list(data_list);
						button_create(data_list, startPage);
						next_button_delete(startPage);
					}

				},
				error : function(e) {
					alert(e);
				}

			});

		}

		//jsonArray타입의 객체의 갯수가 10개보다 적을경우 객체를 매개변수로 받아 출력하는 함수이다.
		function list_write(data_list) {

			for (var i = 0; i < data_list.length; i++) {//jquery 문을통해 태그안의 내용을 바꾸어준다 --> .text()사용

				$('#num' + i).text(data_list[i].num);
				$('#title' + i).text(data_list[i].title);
				$('#date' + i).text(data_list[i].date);
			}

			for (var i = data_list.length; i < 10; i++) {//jsonArray타입의 객체의 갯수가 10개보다 적을경우 데이터가 들어가지 않는 행은 안보임 처리를 해준다
				$('#num' + i).hide();
				$('#title' + i).hide();
				$('#date' + i).hide();
			}

		}

		//클로저 함수 --> 클릭된 버튼의 값에 맞게 불러온 데이터 를 슬라이싱 해서 보여줌
		//클릭된 버튼의 값을 사용해서 슬라이싱 범위인 startNum,endNum을 지정해 준다.
		//한 페이지 에는 페이지안에 속해있는 페이지 블럭에 맞는 게시물(레코드) 수가 있기 때문이다.
		//--->한 페이지 가 가지고 있는 배열안에서 그때그때 해당페이지 블럭을 클릭 한다면 거기 범위에 맞는 데이터를 가져오기 위해 슬라이싱 해줄 필요가 있다
		function page(currentPage) {

			var startNum = (currentPage - 1) * 10 + 1;
			var endNum = currentPage * 10;

			var start_index = 0;
			var end_index = 0;

			//endNum 이 해당 배열의 마지막 숫자보다 크다면 다시 슬라이싱이 제대로 되지 않으므로 범위를 다시 지정해 주어야 한다
			//구분 하기 위해 check라는 변수를 사용해서 check 값이 변하지 않는다면 endNum의 범위를 다시 지정해준다
			var check = null;

			for (var i = 0; i < arr.length; i++) {
				if (arr[i].num == startNum) {
					start_index = i;
				}
				if (arr[i].num == endNum) {
					end_index = i;
					check = 1;
				}

			}

			var new_arr = new Array();

			if (check != 1) {
				end_index = arr.length - 1; // endNum의 는 배열의 마지막 인덱스 번호이다. 
			}

			new_arr = arr.slice(start_index, end_index + 1);

			if (new_arr.length < maxRow) {//데이터가 maxRow보다 작다면 데이터를 출력하는 데에 있어서 다르게 처리해주어야 함
				list_write(new_arr);
			} else {
				print_list(new_arr);
			}

		}

		//10개 보다 큰 게시물이 출력 될때 이전의 데이터는 10개보다 작을수 있으므로
		//.hide()메소드가 사용되어 가려져 있을 확률 이 있다
		//그래서 전부 .show() 로 보여준다음

		//해당 게시물을 출력한다
		function print_list(data_list) {
			for (var i = 0; i < 10; i++) {
				$('#num' + i).show();
				$('#title' + i).show();
				$('#date' + i).show();

				$('#num' + i).text(data_list[i].num);
				$('#title' + i).text(data_list[i].title);
				$('#date' + i).text(data_list[i].date);
			}
		}

	

	</script>

</body>
</html>