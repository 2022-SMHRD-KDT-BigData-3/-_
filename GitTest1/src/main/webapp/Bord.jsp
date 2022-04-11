<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	body{
	position : absolute;
	left:50%;
	transform:translate(-50%,50%);
	}
	
	.before{
	position: relative;
	left: 0px;
	}
	
	.next{
	position: relative;
	left: 298px;
	}
	
	.button{
	position: relative;
	left: 225px;
	}
	
</style>
</head>
<body id="body">

	<table border="1" width="600">
		<tr bgcolor="#87CEEB">
			<td>순서</td>
			<td>제목</td>
			<td>날짜</td>
		</tr>
		
		<%for(int i = 0; i<10;i++){ %> <!-- 스크립틀릿 을 통한 table 생성 -->
		<tr>
			<td id="num<%=i%>"></td>
			<td id="title<%=i%>"></td>
			<td id="date<%=i%>"></td>
		</tr>
		<%} %>
		<tr>
			<td colspan="3" id="controller"></td>
		</tr>
	</table>
	
<script src="./js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

next_list(1,1);

var arr=null;
var pageSize = 3;
var maxRow=10;


function button_create(data_list,startPage){
	
	var pageNum=null;
	
	if(data_list.length%maxRow == 0){
		pageNum = data_list.length/maxRow;
	}
	
	else{
		pageNum =Math.floor(data_list.length/maxRow)+1;  
	}
	
	var currentPage=startPage;
	
	for(var i =0;i<pageNum;i++){
		arr=data_list;
		$('#controller').append('<button onclick="page('+currentPage+')" id="'+currentPage+'" class="button">'+currentPage+'</button>');
		currentPage= currentPage+1;
	}
	
	var next_startRow=data_list[data_list.length-1].num+1;
	
	
	if(pageNum>=pageSize){
		$('#controller').append('<button onclick="next_list('+next_startRow+','+(startPage+pageSize)+')" class="next" id="next'+currentPage+'">다음</button>');
		//여기서 currentPage 는 전에 계속 더했던 값이 들어있기 때문에 다음페이지 에서의 페이지블럭의 첫 시작수 이다.
	}
	
 	if(startPage >= pageSize+1){//pageSize+1 -->첫 페이지 에서는 이전 버튼이 생기지 않으므로 pageSize+1 이상 일 때만 이전 버튼이 생긴다
 		var before_num = data_list[0].num-(pageSize*maxRow);
 		var before_page = startPage-pageSize;
 		
		$('#controller').append('<button onclick="before_list('+before_num+','+before_page+')" class="before" id="before'+before_page+'">이전</button>');
	} 
}

//'다음' 버튼 클릭시 이전 페이지에서의 '이전','다음','각 페이지' 버튼 삭제
function next_button_delete(startPage){
	console.log("다음페이지값이 된다고??"+startPage);
	if(startPage >= pageSize+1){ // startPage 값이 pageSize+1 만큼의 크기일때 생기기 때문 
		$('#next'+startPage).remove();
		
		if(startPage >=pageSize*2+1){ //이전 버튼은 startPage 값이 pageSize*2+1 만큼의 크기일때 생기기 때문 
			$('#before'+(startPage-pageSize*2)).remove();
		}

		startPage=startPage-pageSize;
		for(var i=0;i<pageSize;i++){
			$('#'+startPage).remove();
			startPage=startPage+1;
		}	
	}
}

//이전 페이지 버튼 클릭시 전화면에 나왔던 버튼 삭제
function before_button_delete(before_page){
	
	$('#before'+before_page).remove();
	$('#next'+(before_page+pageSize*2)).remove(); //이전 버튼 클릭시 페이지 에서 없애야할 다음 버튼은 before_page+pageSize*2 의 값을 가지고 있다
	
	before_page=before_page+pageSize;
	for(var i=0;i<pageSize;i++){
		$('#'+before_page).remove();
		before_page=before_page+1;
	}
}

//이전 버튼이 눌린다면 그에 맞는 버튼들이 생성, 삭제 와 해당 리스트가 출력되기 위한 메소드 
function before_list(before_num,before_page){
	$.ajax({
		url:'border',
		method:'post',
		dataType :'json',
		data :{"num":before_num},// 한 페이지 에서 가져와야하는 양이 정해저 있으므로 어디 페이지에서 요청했는지 알기위해 가져올DB의 시작 num을 같이 넘겨 준다 
		success:function(data_list){
		
			// DB를 통해 가져왔는데 가져온 양이 테이블 행의 갯수인 10 보다 적으면 html의 테이블은 이전값을 가지고 있으므로 안보이게 .hide()를 사용해주어야 한다 
			if(data_list.length<10){
				list_write(data_list);
				
				button_create(data_list,before_page);
				before_button_delete(before_page);
			}
			else{
				print_list(data_list);
				button_create(data_list ,before_page);
				before_button_delete(before_page);
			}
	
		},
		error:function(e){
			alert(e);
		}
		
	});
	
}

//다음 버튼이 눌린다면 그에 맞는 버튼들이 생성, 삭제 와 해당 리스트가 출력되기 위한 메소드 
function next_list(startRow,startPage){
	$.ajax({
		/* jsp 시작하면서 바로 border서블릿과 비동기 통신으로 DB 에있는 내용을 가져온다 */
		url:'border',
		method:'post',
		dataType :'json',
		data :{"num":startRow},/* 한 페이지 에서 가져와야하는 양이 정해저 있으므로 어디 페이지에서 요청했는지 알기위해 가져올DB의 시작 num을 같이 넘겨 준다 */
		success:function(data_list){
			
			if(data_list.length<10){/* DB를 통해 가져왔는데 가져온 양이 테이블 행의 갯수인 10 보다 적으면 html의 테이블은 이전값을 가지고 있으므로 안보이게 .hide()를 사용해주어야 한다 */
				list_write(data_list);
				button_create(data_list,startPage);
				next_button_delete(startPage);
			}
			
			else{
				print_list(data_list);
				button_create(data_list ,startPage);
				next_button_delete(startPage);
			}
			
		},
		error:function(e){
			alert(e);
		}
		
	});
	
}

//jsonArray타입의 객체의 갯수가 10개보다 적을경우 객체를 매개변수로 받아 출력하는 함수이다.
function list_write(data_list){
	
	for(var i =0 ; i<data_list.length;i++){//jquery 문을통해 태그안의 내용을 바꾸어준다 --> .text()사용
		
		$('#num'+i).text(data_list[i].num); 
		$('#title'+i).text(data_list[i].title);
		$('#date'+i).text(data_list[i].date);
	}
	
	for(var i =data_list.length;i<10;i++){//jsonArray타입의 객체의 갯수가 10개보다 적을경우 데이터가 들어가지 않는 행은 안보임 처리를 해준다
		$('#num'+i).hide(); 
		$('#title'+i).hide();
		$('#date'+i).hide();
	}
	
}

//클로저 함수 --> 클릭된 버튼의 값에 맞게 불러온 데이터 를 슬라이싱 해서 보여줌
//클릭된 버튼의 값을 사용해서 슬라이싱 범위인 startNum,endNum을 지정해 준다.
//한 페이지 에는 페이지안에 속해있는 페이지 블럭에 맞는 게시물(레코드) 수가 있기 때문이다.
//--->한 페이지 가 가지고 있는 배열안에서 그때그때 해당페이지 블럭을 클릭 한다면 거기 범위에 맞는 데이터를 가져오기 위해 슬라이싱 해줄 필요가 있다
function page(currentPage){
	
	var startNum = (currentPage-1)*10+1;
	var endNum = currentPage*10;
	
	var start_index=0;
	var end_index=0;
	
	 //endNum 이 해당 배열의 마지막 숫자보다 크다면 다시 슬라이싱이 제대로 되지 않으므로 범위를 다시 지정해 주어야 한다
	 //구분 하기 위해 check라는 변수를 사용해서 check 값이 변하지 않는다면 endNum의 범위를 다시 지정해준다
	var check=null;
	
	for(var i = 0; i<arr.length;i++){
		if(arr[i].num==startNum){
			start_index=i;
		}
		if(arr[i].num==endNum){
			end_index=i;
			check=1;
		}
		
	}
	
	var new_arr = new Array();
	
	if(check != 1){
		end_index=arr.length-1; // endNum의 는 배열의 마지막 인덱스 번호이다. 
	}
		
	new_arr = arr.slice(start_index, end_index+1);	
	
	
	if(new_arr.length<maxRow){//데이터가 maxRow보다 작다면 데이터를 출력하는 데에 있어서 다르게 처리해주어야 함
		list_write(new_arr);
	}
	else{
		print_list(new_arr);
	} 
	

}

//10개 보다 큰 게시물이 출력 될때 이전의 데이터는 10개보다 작을수 있으므로
//.hide()메소드가 사용되어 가려져 있을 확률 이 있다
//그래서 전부 .show() 로 보여준다음

//해당 게시물을 출력한다
function print_list(data_list){
	for(var i=0;i<10;i++){
		$('#num'+i).show();
		$('#title'+i).show();
		$('#date'+i).show();
		
		$('#num'+i).text(data_list[i].num);
		$('#title'+i).text(data_list[i].title);
		$('#date'+i).text(data_list[i].date);
	}
}

</script>
	

</body>
</html>