<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>


<!-- 댓글 리스트 -->
<c:set var="articlesList" value="${articlesMap.articlesList }" />
<!-- 총 댓글 수 -->
<c:set var="totArticles" value="${articlesMap.totArticles }" />
<!-- 섹션 -->
<c:set var="section" value="${articlesMap.section }" />
<!-- 페이지 번호 -->
<c:set var="pageNum" value="${articlesMap.pageNum }" />

<c:set var = "total" value = "0" />
<c:forEach var="result" items="${articlesList}" varStatus="status">     
	<c:set var= "total" value="${total + result.comment_rate}"/>
</c:forEach>

<c:set var = "total1" value = "0" />
<c:forEach var="count1" items="${articlesList }" varStatus="status">
<c:set var= "total1" value="${status.count }"/>
</c:forEach>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화정보</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>

/* 상단부분 위치설정 */
#info{
    background-image: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.7) );
    background-size:100%;
    height: 600px;
    position:relative;
}

#back {
	width:100%;
	height: 600px;
	overflow:hidden;
	position:absolute;
	z-index:-2;
}

#back img {
	width:100%;
	position:relative;
	z-index:-1;
}


#info > div {
    display: inline-block;
    vertical-align: top;
}

#left{
	postion:absolute;
    width: 500px;
    height: 600px;
    text-align: left;
    margin-left: 70px;
}
#right{
    margin-left: 280px;
    width: 290px;
    height: 600px;
    text-align: center;
    position:absolute;
}


/* left안의 속성 */
#title1{
    font-size: 50px;
    margin-top: 40px;
    color:white;
}
#title2{
    font-size: 30px;
    margin-bottom: 330px;
    color:white;
}
/* 좋아요버튼 */
#btn0 {
    width: 110px;
    height: 50px;
    background-color: black;
    color:white;
    border: 1px solid white;
    border-radius:5%;
    cursor:pointer;
}

.rate {
    display: inline-block;
    color:white;
    font-size: 25px;
    margin-top:5px;
}

.poster {
    margin-top: 50px;
}

.btn1 {
    margin-top: 20px;
    width: 150px;
    height: 50px;
    background-color: #037b94;
    color:white;
    border: 0;
    outline: 0;
    border-radius:5%;
    cursor:pointer;
}
/* 영화정보위치 */
#info2{
    height: 300px;
    padding: 40px;
}


/* 더보기 */
.article{
	display:none;
}

#load {
    text-decoration: none;
    color: black;
    padding-top: 9px;
    padding-bottom: 9px;
    padding-left: 46%;
    padding-right: 46%;
}
.more {
    padding: 10px;
    margin-top: 70px;
    width: 100%;
    text-align: center;
    font-size: 20px;
    border: 1px solid black;
}

.more1 {
    padding: 10px;
    margin-top: 70px;
    width: 100%;
    text-align: center;
    font-size: 20px;
    border: 1px solid black;
    background-color: gainsboro;
}



/* 관람평 */
#comment{
    padding: 40px;
    height: 700px;
}

.comment_wrap1{
	margin-bottom:20px;
}
.comment_wrap1 input{
	display:inline-block;
	vertical-align:top;
	
}
.a{
	width:5%;
	height:67px;
	background-color: black;
    color:white;
    border: 1px solid white;
    border-radius:5%;
    cursor:pointer;
    font-weight:600;
}
.b{
	width:76%;
	height:60px;
	
}
.c{	
	width:5%;
	height:60px;
	font-size:20px;
}

#comment_btn{
	width: 10%;
	height:67px;
	background-color: black;
    color:white;
    border: 1px solid white;
    border-radius:5%;
    cursor:pointer;
    font-weight:600;
}


/* 댓글목록 */

.comment_wrap2{
	background-color:#f8f8fa;
	margin-bottom: 20px;
	padding:5px;
	
}

.comment_box > div{
	display:inline-block;
	vertical-align:middle
}

.commentNO{
	font-size:20px;
	font-weight:600;
}

.comment_id{
	font-size:30px;
	font-weight:600;
	margin-left:20px;
}

.comment_rate{
	font-size:30px;
	font-weight:600;
	margin-left:20px;
}

.comment_rate{
	font-size:30px;
	margin-left:20px;
	margin-right:20px;
	color:red;
}

.comment_manager{
	float:right;
}
.comment_update{
	background-color: black;
    color:white;
    border: 1px solid white;
    border-radius:5%;
    cursor:pointer;
    font-weight:600;
}
.comment_delete{
	background-color: black;
    color:white;
    border: 1px solid white;
    border-radius:5%;
    cursor:pointer;
    font-weight:600;
}
.commentNO_box >div{
	text-align:center;
}







/* 대댓글 폼 */
.recomment div {
display:inline-block;
}
.recomment{
	margin-top:20px;
}

.recomment_l{
	margin-left:40px;
}

.recomment_id{
	width:7%;
	height:50px;
	background-color: black;
    color:white;
    border: 1px solid white;
    border-radius:5%;
    cursor:pointer;
    font-weight:600;
}

.recomment_text{
	width:70%;
	height:40px;
}

.recomment_btn{
	width:10%;
	height:50px;
	background-color: black;
    color:white;
    border: 1px solid white;
    border-radius:5%;
    cursor:pointer;
    font-weight:600;
}


/* 대댓글 출력 */

.comment_wrap22 {
	background-color: #bebec1;
	margin-left:40px;
	margin-bottom:10px;
}
.qqq div{
	display:inline-block;
	line-height:50px;
	margin-left : 10px;
	font-size:20px;
}
.qqq{
	height:50px;
}
.recomment_ll{
	font-weight:600;
	font-size:20px;
}


/* 페이징 */


.no-uline{text-decoration:none;
display:inline-block;
}
.sel-page{text-decoration:none; color:red;
display:inline-block;
}
#paging{
	text-align:center;
}
#paging input {
	background-color: black;
    color:white;
    border: 1px solid white;
    border-radius:5%;
    cursor:pointer;
    font-weight:600;
    width:30px;
    height:30px;
}
.c_total{
	font-size:20px;
	font-weight:600;
	margin-bottom:20px;
}


</style>
<script>

	window.onload =() =>{
		// 더보기
		document.querySelector(".more").addEventListener("mouseover",function(){
		    document.querySelector(".more").classList.add("more1");
		});
		document.querySelector(".more").addEventListener("mouseout",function(){
		    document.querySelector(".more").classList.remove("more1");
		});
		
		$(function(){
		    $(".article").slice(0, 1).show(); 
		    $("#load").click(function(e){ 
		        e.preventDefault();
		        $(".article:hidden").slice(0, 1).show();
		        if($(".article:hidden").length == 0){
		            $(".more").css('display', 'none');
		        }
		    });
		});
		
		
		 for (let k = 1; k < 5; k++) {
				document.querySelector(".like_btn"+k).addEventListener("click", function(){
			   	 $.ajax({
					    url: "like.do",
					    type: "POST",
					    dataType: "html",
					   	data:{
				            command : $('.command').val(),
				            articleNO1 : $('.articleNO1'+k).val()
				        },
					    success:function(data){  
					    	alert("성공");
					    	let a = data;
					    	console.log(a);
					    	 /* 화면에 표시하는 방법  */
					    	$(".like_btn"+k).val("♡ "+a);
					    },   
					    error: 
					    function (request, status, error){  
					    }
					  });
			   })
			}
		
		
	}
</script>
</head>
<body>
    <div id="wrap">
    
        <jsp:include page="../common/header.jsp"></jsp:include>
	    
	    <!-- articleNO에 맞는 영화리스트  -->
        <!-- 영화이미지 div -->
        <c:forEach var="movie" items="${movieList }" varStatus="status">
        	
        	<!-- 상단부분 -->
	        <div id="info">
        		<div id="back"><img src="${movie.poster_back }"></div>
	            <div id="left">
	                <div id="title1">${movie.title}</div>
	                <div id="title2">${movie.title_en}</div>
	                
	                <form action="like.do">
	    	    		<input class="like_num" type="hidden" name="like_num" value="${movie.like_num}">
					  	<input class="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
					  	<input class="command" type="hidden" name="command1" value="like_it">
					  	<input id="btn0" class="like_btn${status.count }" type="button" value="♡ ${movie.like_num }">
    	    		</form>
	                
	             
				  	
				  	
	                <div class="rate">평점 : ${String.format("%.1f", (total / totArticles))}</div>
	            </div>
	            <div id="right">
	                <div class="poster"><img src="${movie.poster_main}" width="290" height="404"></div>
	                <form action="booking.do">
	                	<input type="hidden" name="articleNO" value="${articleNO }">
	                	<input class="btn1" type="submit" value="예매">
	                </form>
	            </div>
        	</div>
        	<div id="info2">
            	<h2>영화정보</h2>
            	<div class="article">
              		${movie.explain}
            	</div>
            	<div class="article">
                	<br>
                	감독 : ${movie.director} / 장르 : ${movie.genre} / ${movie.runningtime} 등급 : ${movie.age}이상관람가 
                	<br>
	                <div>
						<fmt:parseDate var="parsedDate" value="${movie.opendate }" pattern="yyyyMMdd" />
						 개봉일 : <fmt:formatDate value="${parsedDate }" pattern="yyyy/MM/dd"/> 
				    </div>
                	<br>
                	출연진 : ${movie.actor}
            	</div>
            	<div class="more"><a href="#" id="load">더보기 ▽ </a></div>
        	</div>
        	
        <!-- 댓글영역 -->
			<div id="comment">
				<!-- db에서 부모요소만 출력하게 -->
	           	<div class="c_total">${movie.title}에 대한 ${total1 }개의 이야기가 있어요!</div>
		            <div class="comment_wrap1">
		            	<h3>관람평쓰기</h3>
						<form method="get" action="/reply.do">
							<input type="hidden" name="articleNO" value="${movie.articleNO }">
							<a href="login.do"><input class="a" type="button" name="comment_login" value="로그인"></a>
							<!-- <div><input class="a" type="text" name="comment_text" placeholder="아이디"></div> -->
							<input class="b" type="text" name = "comment_id" placeholder="  관람평을 입력해주세요">
							<input class="c" type="number" min="0" max="10" name = "comment_rate" placeholder="평점">
							<input id="comment_btn" type="submit" value="관람평쓰기">
						</form>
					</div>
					<br>
				
				
				<h3>댓글목록</h3>
				<c:forEach var="comment" items="${articlesList }">
	            <c:choose>
	            	<c:when test="${comment.lvl == 1}">
			            <div class="comment_wrap2">
			            	<div class="comment_box">
				            	<div class="commentNO_box">
				            		<div style="font-size:15px;">댓글번호</div>
				            		<div class="commentNO">${comment.commentNO}</div>
			            		</div>
				            	<div class="comment_id">${comment.comment_id }</div>
				            	<div class="comment_rate">${comment.comment_rate}점</div>
								<div class="comment_text">${comment.comment_text}</div>
								<div class="comment_manager">
									<input class="comment_update" type="button" value="수정">
									<input class="comment_delete" type="button" value="삭제">
								</div>
							</div>
			            	
			            	<div class="recomment">
		        				<form method="get" action="/reply.do">
		        					<div class="recomment_l"><h3>ㄴ</h3></div>
									<input type="hidden" name="articleNO" value="${movie.articleNO }">
									<input type="hidden" name="commentNO" value="${comment.commentNO }">
									<a href="login.do"><input class="recomment_id" type="button" name="recomment_text" value="로그인"></a>
									<input class="recomment_text" type="text" name = "recomment_id" placeholder="대댓글입력">
									<input class="recomment_btn" type="submit" value="대댓글입력">
								</form>
			            	</div>
			            	
			            	
			            </div>
		            </c:when>
		            <c:when test="${comment.lvl > 1}">
			            <div class="comment_wrap22">
			            	<div class="qqq">
				            	<div class="recomment_ll">ㄴ </div>
				            	<div class="dd">${comment.comment_id }님의 답글:</div>
								<div class="ee">${comment.comment_text}</div>
							</div>
			            </div>
		            </c:when>
	            </c:choose>
           	</c:forEach>
           	
           	
           	
	            	<!-- 페이징 -->
	        	<div id="paging" style="height:100px">
		        	<c:if test="${totArticles != null }">
		        		<c:choose>
		        			<c:when test="${totArticles > 100 }">
			        			<c:forEach var="page" begin="1" end="10" step="1">
			        				<c:if test="${section > 1 && page == 1 }">
			        					<div class="no-uline">
				        					<form action="movieInfo.do" method="get">
					        					<input type="hidden" name="articleNO" value="${movie.articleNO }">
				        						<input type="hidden" name="section" value="${section-1 }">
				        						<input type="hidden" name="pageNum" value="${(section-1)*10 }">
				        						<input type="submit" value="pre">
				        					</form>
			        					</div>
			        				</c:if>
			        				<div class="no-uline">
				        				<form action="movieInfo.do" method="get">
				        					<input type="hidden" name="articleNO" value="${movie.articleNO }">
			        						<input type="hidden" name="section" value="${section}">
			        						<input type="hidden" name="pageNum" value="${page}">
			        						<input type="submit" value="${(section-1)*10 +page}">
			        					</form>
		        					</div>
		        			
			        				<c:if test="${page == 10 }">
				        				<form class="no-uline" action="movieInfo.do" method="get">
				        					<input type="hidden" name="articleNO" value="${movie.articleNO }">
			        						<input type="hidden" name="section" value="${section+1 }">
			        						<input type="hidden" name="pageNum" value="${section*10+1}">
			        						<input type="submit" value="next">
			        					</form>
			        				</c:if>
			        			</c:forEach>
			        		</c:when>
			        		<c:when test="${totArticles == 100 }">
			        			<c:forEach var="page" begin="1" end="10" step="1">
			        				<a class="no-uline" href="#">${page}</a>
			        			</c:forEach>
			        		</c:when>
			        		<c:when test="${totArticles < 100 }">
			        			<c:forEach var="page" begin="1" end="${totArticles/10 + 1}" step="1">
			        				<c:choose>
			        					<c:when test="${page==pageNum }">
				        					<div class="sel-page">
					        					<form action="movieInfo.do" method="get">
					        						<input type="hidden" name="articleNO" value="${movie.articleNO }">
					        						<input type="hidden" name="section" value="${section}">
					        						<input type="hidden" name="pageNum" value="${page }">
					        						<input type="submit" value="${page }">
					        					</form>
				        					</div>
			        					</c:when>
			        					<c:otherwise>
				        					<div class="no-uline">
					        					<form action="movieInfo.do" method="get">
					        						<input type="hidden" name="articleNO" value="${movie.articleNO }">
					        						<input type="hidden" name="section" value="${section}">
					        						<input type="hidden" name="pageNum" value="${page }">
					        						<input type="submit" value="${page }">
					        					</form>
				        					</div>
			        					</c:otherwise>
			        				</c:choose>
			        			</c:forEach>
			        		</c:when>
	        			</c:choose>
		        	</c:if>
		        </div>
           	
           	
        		</div>
         	
   		</c:forEach>
   	</div>
</body>
</html>