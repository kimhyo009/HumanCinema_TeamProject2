<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.menu{
			font-size: 20px;
			font-weight: bold;
		}
		
	
		.menu{
		     border: solid 1px red;
		     border : hidden;
		     position: relative;
		     text-align: center;
		     display: inline-block;
		     width: 300px;
		     height: 300px;
	     
	    }
	
	
		.menu_image{
			filter: brightness(1);
		}
		.menu_image:hover{
			filter: brightness(0.7);
		}
		
		.menu_name{
			font-size: 20px;
			font-weight:bold;
		}
	
		.menu_price{
			font-size: 20px;
			font-weight:nomal;
		}
		.menu_main{
			padding-left: 10%;
	    	padding-right: 10%;
		}
	
	
</style>
		
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

<c:set var = "type" value = "${menu_type }" />

<body>

<!-- menu_type 받아서 그걸로 class 적용 -->

<c:if test="${menu_type == 10 }">
		 <div class = "menu10">	  
			<span id = "text1">스낵</span>
			출출할땐 다양한 스낵이 정답이죠
		</div>	
		</c:if>
<c:if test="${menu_type == 20 }">
		<div class = "menu20">	    
			<span id = "text1">음료</span>
			탄산부터 에이드까지, 마시는 즐거움!
		</div>	
		</c:if>
		<c:if test="${menu_type == 30 }">
		<div class = "menu30">	  	  
			<span id = "text1">영화관람권</span>
			영화, 모두에게 즐거운 경험
		</div> 	
</c:if>
		<c:forEach var = "list" items = "${selectMenu }">
			<div class = "menu">
				<div class = "menu_image"><a href = "/Store/storeinfo.do?menu_id=${list.menu_id }"><img src="${list.image }" width="300px" height= "300px"></a></div>
				<div class = "menu_name">${list.name }</div>
				<div class = "menu_price">${list.price }</div>
			</div>
	
		</c:forEach>
</body>
</html>