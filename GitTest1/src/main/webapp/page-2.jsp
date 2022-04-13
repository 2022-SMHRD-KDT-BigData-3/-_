<%@page import="Model.MenuDAO"%>
<%@page import="Model.MenuDTO"%>
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

<style>
.pie-chart1 {
  display:inline-block;
  position:relative;
  width: 20%;
  height: 295px;
  border-radius: 50%;
  margin-left : 8rem;
  margin-bottom: 5rem;
  margin-top: 5rem;
}
.pie-chart1  .center{
  position:absolute;
  width:70%; 
  height: 208px;
  background :#fff;
  border-radius: 50%;
  top: 42px;
  left:47px;
  text-align: center;
  line-height:300px;
  font-size: 27px;
  
}

.center2{
    position:absolute;
    width:70%; 
    height: 208px;
   
    border-radius: 50%;
    top: -6px;
    left:33px;
    text-align: center;
    line-height:300px;
    font-size: 18px;
}

.center3{
   position:absolute;
    width:70%; 
    height: 208px;
    border-radius: 50%;
    top: -73px;
    left:33px;
    text-align: center;
    line-height:300px;
    font-size: 27px;
}



#sikdan{
   text-align: center;
}
.Testicon{
   left: 0px;
   }

</style>


<title>Insert title here</title>
</head>
<body>
   <%
   int act = 0;
   double enCal = 0;
   double enCar = 0;
   double enPro = 0;
   double enFat = 0;
   int hical =100;
   MemberDTO info = (MemberDTO) session.getAttribute("info");
   CheckingDTO ckdto= null;
 ckdto = (CheckingDTO) session.getAttribute("ckdto");
   MenuDTO select = (MenuDTO) session.getAttribute("select");
   %>
   
   <div id="modal" class="modal" width="400px" style="text-align: center;">
   
      <div class="modal-content">
         <input id="foodName" type="text" class="form-control"
            placeholder="Search" style="margin-left:40%; width:20%; text-align:center;">
         <button class="btn mb-1 btn-rounded btn-outline-dark" onclick="getData()"style="width:20%; margin-left:40%;">선택</button>
         <button class="close">닫기</button>
         <table border="1" id="chart">

         </table>

      </div>
   </div>

   <div id="morModal" class="modal" width="400px">
      <div class="modal-content">
         <button class="close">닫기</button>
         <table border="1" id="morInfo" class="modalInfo">
         <tr><th> 식품명 </th><th> 열량 </th><th> 탄수화물 </th><th> 단백질 </th><th> 지방 </th></tr>   
         </table>
      </div>
   </div>
   
   <div id="lunModal" class="modal" width="400px">
      <div class="modal-content">
         <button class="close">닫기</button>
         <table border="1" id="lunInfo" class="modalInfo">
         <tr><th> 식품명 </th><th> 열량 </th><th> 탄수화물 </th><th> 단백질 </th><th> 지방 </th></tr>   
         </table>
      </div>
   </div>
   
   <div id="dinModal" class="modal" width="400px">
      <div class="modal-content">
         <button class="close">닫기</button>
         <table border="1" id="dinInfo" class="modalInfo">
         <tr><th> 식품명 </th><th> 열량 </th><th> 탄수화물 </th><th> 단백질 </th><th> 지방 </th></tr>
         </table>
      </div>
   </div>

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
                        <!-- 하루전으로 가는 태그 -->
                     <div id="backbtn">
                        <a data-slide="prev" href="#" class="carousel-control-prev"><span
                           class="carousel-control-prev-icon" id="BackClick"
                           ></span> <span class="sr-only">하루전</span> </a>

                        <div id=today style="text-align: center;"></div>

                     </div>
                     <!-- 하루 후로 가는 태그 -->
                     <a data-slide="next" href="#"
                        class="carousel-control-next"><span
                        class="carousel-control-next-icon" id="FrontClick"
                        ></span> <span class="sr-only">하루후</span></a>

                     </div>
                  </div>
               </div>
            </div>
      
      <div class="row">
               <div class="col-lg-12" style="width:60%;">
                  <div class="card" style="width:100%;">
                  <!-- 조회하기 -->
         <!-- <div class="go">
            <button type="button" class="btn mb-1 btn-success" onclick="checking()"style="margin-left:88%;
            margin-top:2rem;position:absolute;">
               조회하기 <span class="btn-icon-right"><i class="fa fa-check"></i></span>
            </button>
         </div> -->
                     <div class="card-body" style="margin-left: 100px;">
                        <div class="col-md-12">
                    
                        
                                  <h4 class="card-title" style="font-size: 20px;">칼로리</h4>
                                  <div class="k-bar" style="height: 37px;">
                                      <div class="progress-bar bg-info progress-bar-striped" id="calcart"><span class="sr-only">85% Complete (success)</span>
                                      <span id="cardBar" style="left: 20%;" style="font-size: 20px;">kal</span>
                                      </div>
                                  </div>
                       
                            </div>
                     </div>
                  </div>
               </div>
            </div>




         <!-- 도넛 그래프 태그 -->


      
         <div class="pie-chart1" id="carcart" style="background:conic-gradient(#eaa18a 0% 45%, #DCDCDC 45% 100%)">
            <span class="center"><span class="center3">탄수화물</span><span class="center2" id="carP">수치</span></span>

         </div>


         <div class="pie-chart1" id="procart"  style="background:conic-gradient(#7fc638 0% 45%, #DCDCDC 45% 100%)">
            <span class="center" ><span class="center3">단백질</span><span class="center2" id="proP">수치</span></span>
         </div>


         <div class="pie-chart1" id="fatcart" style="background:conic-gradient(#ADEB00 0% 45%, #DCDCDC 45% 100%)">
            <span class="center" ><span class="center3">지방</span><span class="center2" id="fatP">수치</span></span>
         </div>


         <!-- 식단 입력 태그 -->
         <div class="card"style="width: 100%;">
            <div class="card-body">
               <h4 class="card-title">식단 입력</h4>
                    <div class="put">
                    <div class="custom-media-object-2">
                        <div class="media border-bottom-1 p-t-15">
                 
                              <div class="media-body">
                                  <div class="row">
                                  <!-- 시작 -->
                                  <div class="table-responsive">
                                       <table
                                          class="table header-border table-hover verticle-middle">
                                          <tbody>
                                             <tr>
                                                
                                                <td><div class="col-lg-12"style="margin-left: 65px;"><h4>아침</h4></div></td>
                              <td><div class="col-lg-12"><button type="button" id="mors" class="btn mb-1 btn-rounded btn-outline-success">아침 입력</button></div></td>
                              
                              <td id="morning"></td>
                           <td>
                              <button type="button" id="morNutInfo" class="btn mb-1 btn-rounded btn-outline-success">영양정보</button>
                           </td>
                                             </tr>
                                             <tr>
                                                
                                                <td><div class="col-lg-12" style="margin-left: 65px;" style="margin-top: 2.5rem;"><h4>점심</h4></div></td>

                              <td><div class="col-lg-12"><button type="button" id="luns" class="btn mb-1 btn-rounded btn-outline-success">점심 입력</button></div></td>
                              <td id="lunch"></td>
                           <td>
                              <button type="button" id="lunNutInfo" class="btn mb-1 btn-rounded btn-outline-success">영양정보</button>
                           </td>
                                             </tr>
                                             <tr>
                                                
                                                <td><div class="col-lg-12" style="margin-left: 65px;" style="margin-top: 2.5rem;"><h4>저녁</h4></div></td>

                              <td><div class="col-lg-12"><button type="button" id="dins" class="btn mb-1 btn-rounded btn-outline-success">저녁 입력</button></div></td>
                              <td id="dinner"></td>
                           <td>
                              <button type="button" id="dinNutInfo" class="btn mb-1 btn-rounded btn-outline-success">영양정보</button>
                           </td>
                                             </tr>
                                             
                                             
                                          </tbody>
                                       </table>
                                    </div>
                                  <!-- 끝 -->
                                            
                              <!--           <table>
                              <tr>
                              <td><div class="col-lg-12" style="margin-left: 55px; margin-top: 2.5rem;"><h4>아침</h4></div></td>
                              <td><div class="col-lg-12"><button type="button"class="btn mb-1 btn-rounded btn-outline-success">아침 입력</button></div></td>
                              
                              <td id="morning"></td>
                           <td>
                              <button type="button" id="morNutInfo" class="btn mb-1 btn-rounded btn-outline-success">영양정보</button>
                           </td>
                           
                        </tr>
                              </table>
                              
                        </div>
                             </div>
                          </div>
                          
                          <div class="media border-bottom-1 p-t-15">
                 
                              <div class="media-body">
                                  <div class="row">
                                            
                                        <table>
                              <tr>
                              <td><div class="col-lg-12" style="margin-left: 55px;" style="margin-top: 2.5rem;"><h4>점심</h4></div></td>
                              <td><div class="col-lg-12"><button type="button"class="btn mb-1 btn-rounded btn-outline-success">점심 입력</button></div></td>
                              
                              <td id="morning"></td>
                           <td>
                              <button type="button" id="morNutInfo" class="btn mb-1 btn-rounded btn-outline-success">영양정보</button>
                           </td>
                           
                        </tr>
                              </table>
                              
                        </div>
                             </div>
                          </div>
                          
                          <div class="media border-bottom-1 p-t-15">
                 
                              <div class="media-body">
                                  <div class="row">
                                            
                                        <table>
                              <tr>
                              <td><div class="col-lg-12" style="margin-left: 55px;" style="margin-top: 2.5rem;"><h4>저녁</h4></div></td>
                              <td><div class="col-lg-12"><button type="button"class="btn mb-1 btn-rounded btn-outline-success">저녁 입력</button></div></td>
                              <td id="morning"></td>
                           <td>
                              <button type="button" id="morNutInfo" class="btn mb-1 btn-rounded btn-outline-success">영양정보</button>
                           </td>
                           
                        </tr>
                              </table>
                              
                        </div>
                             </div>
                          </div>
 -->
                     
                     
               </div>
            </div> 

            
         </div>
      </div>
      <!-- #/ container -->
   </div>
   </div>
   </div>
   </div>
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
      <script>
         
      /* 날짜 스크립트 */
         let date2 = new Date();
         let year = date2.getFullYear();
         let month = date2.getMonth() + 1;
         let day = date2.getDate();

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
         let fnameS = null;
         let calS = null;
         let proS = null;
         let carS = null;
         let fatS = null;
         let input_data = {};
         
         /*         $(".choice").on("click", function(){
          mealTime2 = this.innerText;
          console.log(mealTime2);
          $(".modal").fadeIn();
          }); */
         
         $("#mors").click(function() {
            mealTime = this.innerText;
            $("#modal").fadeIn();
         });
          
         $("#luns").click(function() {
               mealTime = this.innerText;
               $("#modal").fadeIn();
            });
          
         $("#dins").click(function() {
               mealTime = this.innerText;
               $("#modal").fadeIn();
            });

         $(".close").click(function() {
            $(".modal").fadeOut();
         });

         $("#morNutInfo").click(function() {
            $("#morModal").fadeIn();   
            let morFood_data = {};

         });

         $("#lunNutInfo").click(function() {
            $("#lunModal").fadeIn();
            let lunFood_data = {};
         });

         $("#dinNutInfo").click(function() {
            $("#dinModal").fadeIn();
            let dinFood_data = {};
         });

         $(".closeInfo").click(function() {

            $(".modalInfo").fadeOut();

         });
         
         /* 식품 영양정보 API 연결 */
         function getData() {
      
            $("#chart").empty();
            
            foodName = document.getElementById("foodName").value;
      

            $
                  .ajax({
                     headers : {
                        'X-Requested-With' : 'XMLHttpRequest'
                     },
                     url : "https://cors-anywhere.herokuapp.com/http://openapi.foodsafetykorea.go.kr/api/6c16719532f64640814f/I2790/json/1/500/DESC_KOR="
                           + foodName,
                     type : "GET",
                     success : function(data) {
                        
            
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
                                    + "</td><td><button class='btn mb-1 btn-rounded btn-outline-dark' onclick='Funcinput("
                                    + i
                                    + ")'> 선택 </button></td></tr>"

                           

                              $("#chart").append(str);
                              $(".modalInfo").fadeOut();
                              
                           } // if문끝

                        } // for문끝
                        
                        $(".tr").css({"width":"14%"})}, // success 끝
                        
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
      
            let fnameSec = document.getElementById("fname" + i).innerText;
            let calSec = document.getElementById("cal" + i).innerText;
            let proSec = document.getElementById("pro" + i).innerText;
            let carSec = document.getElementById("car" + i).innerText;
            let fatSec = document.getElementById("fat" + i).innerText;

            if (mealTime == "아침 입력") {
               
               meal = 1;
               location.href ="InsertServiceCon?id="+<%if(info!=null){%><%=info.getId()%><%}%>+"&meal="+meal+"&fname="+fnameSec+"&date="+date+"&cal="+calSec+"&pro="+proSec+"&car="+carSec+"&fat="+fatSec;
               }
            
               else if (mealTime == "점심 입력") {
               
               meal = 2;
               location.href ="InsertServiceCon?id="+<%if(info!=null){%><%=info.getId()%><%}%>+"&meal="+meal+"&fname="+fnameSec+"&date="+date+"&cal="+calSec+"&pro="+proSec+"&car="+carSec+"&fat="+fatSec;
               } 
            
               else {

               meal = 3;
               location.href ="InsertServiceCon?id="+<%if(info!=null){%><%=info.getId()%><%}%>+"&meal="+meal+"&fname="+fnameSec+"&date="+date+"&cal="+calSec+"&pro="+proSec+"&car="+carSec+"&fat="+fatSec;      
            }
         }
      </script>

      <!-- 정보 DB 저장하기 -->

      

      <!-- 날짜 바꾸기 -->

      <script type="text/javascript">
      <%if(info!=null){%>
   
      let id = <%=info.getId()%>
      let nomalWeigth = (<%if(ckdto!=null){%><%=ckdto.getHeight()%>-100)*0.9
      let act = <%if(ckdto.getAct()==1){%> 25
      <%}else if(ckdto.getAct()==2){%> 35      
      <%}else if(ckdto.getAct()==3){%>40<%}}}%>
      
      let enCal = nomalWeigth*act;
      /* 권장영양소 */
      let enCar = enCal/4*0.6;
      let enPro = enCal/4*0.135;
      let enFat = enCal/9*0.225;      
      
      console.log("권장칼로리 : "+enCar);
      console.log(enPro);
      console.log(enFat);
      
   $("#BackClick").on("click", function() {
            
            day = day - 1;
      
            date = year + "년" + month + "월" + day + "일";
            
            let tdm = document.getElementById("morning");
            let tdl = document.getElementById("lunch");
            let tdd = document.getElementById("dinner");
            
            tdm.innerText = "";
            tdl.innerText = "";
            tdd.innerText = "";
            
            let tdim = document.getElementById("morInfo");
            let tdil = document.getElementById("lunInfo");
            let tdid = document.getElementById("dinInfo");
            
            tdim.innerHTML = null;
            tdil.innerHTML = null;
            tdid.innerHTML = null;
            
            let tdiC = document.getElementById("carP");
            let tdiP = document.getElementById("proP");
            let tdiF = document.getElementById("fatP");
            
            tdiC.innerText = "";
            tdiP.innerText = "";
            tdiF.innerText = "";
            
            $(".modalInfo")
            .append("<tr><th> 식품명 </th><th> 열량 </th><th> 탄수화물 </th><th> 단백질 </th><th> 지방 </th></tr>");
            
            getInfo(date);
            
            $("#today").text(date);

            
            
         }); 
      
      $("#FrontClick").on("click", function() {
            day = day + 1;
            date = year + "년" + month + "월" + day + "일";
            
            let tdm = document.getElementById("morning");
            let tdl = document.getElementById("lunch");
            let tdd = document.getElementById("dinner");
            
            tdm.innerText = "";
            tdl.innerText = "";
            tdd.innerText = "";
            
            let tdim = document.getElementById("morInfo");
            let tdil = document.getElementById("lunInfo");
            let tdid = document.getElementById("dinInfo");
            
            tdim.innerHTML = "";
            tdil.innerHTML = "";
            tdid.innerHTML = "";
            
            let tdiC = document.getElementById("carP");
            let tdiP = document.getElementById("proP");
            let tdiF = document.getElementById("fatP");
            
            tdiC.innerText = "";
            tdiP.innerText = "";
            tdiF.innerText = "";
            
            $(".modalInfo")
            .append("<tr><th> 식품명 </th><th> 열량 </th><th> 탄수화물 </th><th> 단백질 </th><th> 지방 </th></tr>");
            
            getInfo(date);
            $("#today").text(date);
   
         }); 
      
      
      
      function getInfo(date){
               
               $.ajax({
                  url : "SelectFoodSerivceCon",
                  data : "id="+id+"&date="+date,
                  dataType : "json",
                  async:false, 
                  
                  success: function(result){
                  console.log(result);
                  
                  let cal = 0;
                  let pro = 0;
                  let car = 0;
                  let fat = 0;
               
                  for(let a = 0; a < result.length; a++){
                     
                	  /* 먹은데이터 */
                     let fnameS = result[a].fname;
                     let calS = result[a].cal;
                     let proS = result[a].pro;
                     let carS = result[a].car;
                     let fatS= result[a].fat;
                     let mealS = result[a].meal;
                     /* 먹은영양소 */
                     cal += result[a].cal;
                     pro += result[a].pro;
                     car += result[a].car;
                     fat += result[a].fat;
                     
                     if(mealS == 1){
                        
                        let td = document.getElementById("morning");
                        mor = td.innerText;
                        
                        if (mor == "") {                  
                           td.innerText = fnameS;
                        } else {
                           td.innerText = mor + ", " + fnameS;
                        }
                        
                        $("#morInfo")
                        .append("<tr><td>" + fnameS + "</td><td>" + calS + "</td><td>" + carS + "</td><td>" + proS + "</td><td>" + fatS + "</td></tr>");
                        
                     }else if(mealS == 2){
                        
                        let td = document.getElementById("lunch");
                        lun = td.innerText;
                        
                        if (lun == "") {                  
                           td.innerText = fnameS;
                        } else {
                           td.innerText = lun + ", " + fnameS;
                        }
                        
                        $("#lunInfo")
                           .append("<tr><td>" + fnameS + "</td><td>" + calS + "</td><td>" + carS + "</td><td>" + proS + "</td><td>" + fatS + "</td></tr>");
                        
                     }else{
                        
                        let td = document.getElementById("dinner");
                        din = td.innerText;
                        
                        if (din == "") {                  
                           td.innerText = fnameS;
                        } else {
                           td.innerText = din + ", " + fnameS;
                        }
                        
                        $("#dinInfo")
                        .append("<tr><td>" + fnameS + "</td><td>" + calS + "</td><td>" + carS + "</td><td>" + proS + "</td><td>" + fatS + "</td></tr>");
                     }
                  }
                  
                  let pcal = cal/enCal*100;
                  let ppro = pro/enPro*100;
                  let pcar = car/enCar*100;
                  let pfat = fat/enFat*100;
                  
                  console.log("pcal:"+pcal);
                  console.log("ppro:"+ppro);
                  console.log("pcar:"+pcar);
                  console.log("pfat:"+pfat);
                  if(result.length == 0){
                     pcal = 0;
                     ppro = 0;
                     pcar = 0;
                     pfat = 0;
                     
                  }
                  
                  let tdC = document.getElementById("carP");
                  let tdP = document.getElementById("proP");
                  let tdF = document.getElementById("fatP");
                  
                  let tdB = document.getElementById("cardBar");
                  
                  tdC.innerText = car+"(섭취)/"+enCar+"(권장)";
                  tdP.innerText = pro+"(섭취)/"+enPro+"(권장)";
                  tdF.innerText = fat+"(섭취)/"+enFat+"(권장)";
                  tdB.innerText = cal + "kcal(섭취)/"+enCal+"kcal(권장)";
                  
                  $("#calcart").css("width",pcal+"%");
                  
                  $("#procart").css({
                         "background":"conic-gradient(#25673e 0% "+ppro+"%, #DCDCDC 0% 100%)"
                  });
                  $("#carcart").css({
                         "background":"conic-gradient(#eaa18a 0% "+pcar+"%, #DCDCDC 0% 100%)"
                  });
                  $("#fatcart").css({
                         "background":"conic-gradient(#fee19f 0% "+pfat+"%, #DCDCDC 0% 100%)"
                  });
                  
                  },
                  error : function(){
                     alert("통신 실패");
                  }
               });   
         }         
      
      $(document).ready(getInfo(date));
      
      
      </script>
   </div>
</body>
</html>