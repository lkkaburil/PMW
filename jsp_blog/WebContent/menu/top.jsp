<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>

<%

	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");

%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<style type="text/css">
/*
ul#menu li {
	display: inline;
}

ul#menu li a {
	background-color: black;
	color: white;
	pading: 10px 20px;
	text-decoration: none;
	border-radius: 4px 4px 0 0;
}

ul#menu li a:hover {
	background-color: orange;
}
*/

.table {
	width: 100%;
}

.table, .td {
	border-style: none;
}
</style>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>

<body>

	<div style="background-color: #EEEEEE;">
		<table class="table">
			<tr>
				<td class="td">
				<img src="<%=root%>/images/콧수염.png"
					width='90%' height='90%'></td>
			</tr>

			<tr>
				<td class="td">
				
						<nav class="navbar navbar-inverse">
						  <div class="container-fluid">
						    <div class="navbar-header">
						      <a class="navbar-brand" href="<%=root%>/menu/index.jsp"><span class="glyphicon glyphicon-sunglasses"></span></a>
						    </div>
						    <ul class="nav navbar-nav">
						      <li class="active"><a href="<%=root%>/menu/index.jsp">Home</a></li>
						      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="">게시판<span class="caret"></span></a>
						        <ul class="dropdown-menu">
						          <li><a href="<%=root%>/bbs/list.jsp">게시글 목록</a></li>
						          <li><a href="<%=root%>/bbs/createform.jsp">게시글 등록</a></li>
						        </ul>
						      </li>
						      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="">메모<span class="caret"></span></a>
						        <ul class="dropdown-menu">
						          <li><a href="<%=root%>/memov3/list.jsp">메모 목록</a></li>
						          <li><a href="<%=root%>/memov3/memocreate.jsp">메모 등록</a></li>
						        </ul>
						      </li>
						      </li>
						      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="">방명록<span class="caret"></span></a>
						        <ul class="dropdown-menu">
						          <li><a href="<%=root%>/guest/list.jsp">방명록 목록</a></li>
						          <li><a href="<%=root%>/guest/createForm.jsp">방명록 등록</a></li>
						        </ul>
						      </li>
						      
						      <%if(id!=null) { %>
						      
						      <li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li>
						      <li><a href="<%=root%>/member/deleteForm.jsp">회원탈퇴</a></li>
						      
						      <% } %>
						    </ul>
						    <ul class="nav navbar-nav navbar-right">
						    <% if(id==null) { %>
						      <li><a href="<%=root%>/member/agreement.jsp"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
						      <li><a href="<%=root%>/member/loginForm.jsp"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
						 
						 	<% }else{ %>	
						 	
						 	  <li><a href="<%=root%>/member/read.jsp"><span class="glyphicon glyphicon-user"></span>내 정보</a></li>
						      <li><a href="<%=root%>/member/logout.jsp"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
						      
						 	<% } %>
						      <%if(id!=null && grade.equals("A")) {%>
						      
						      <li><a href="<%=root%>/admin/list.jsp"><span class="glyphicon glyphicon-ok-circle"></span>회원목록</a></li>
						 	<% } %>
						 
						    </ul>
						  </div>
						</nav>
						
<!-- 					<ul id="menu"> -->
<%-- 						<li><a href="<%=root%>/menu/index.jsp">홈</a></li> --%>
						
<%-- 						<%if(id==null){ %> --%>
<%-- 						<li><a href="<%=root%>/member/agreement.jsp">회원 가입</a></li> --%>
<%-- 						<li><a href="<%=root%>/member/loginForm.jsp">로그인</a></li> --%>
						
<%-- 						<%}else{%> --%>
<%-- 						<li><a href="<%=root%>/member/read.jsp">정보확인</a></li> --%>
<%-- 						<li><a href="<%=root%>/member/deleteForm.jsp">회원탈퇴</a></li> --%>
<%-- 						<li><a href="<%=root%>/member/logout.jsp">로그아웃</a></li> --%>
						
<%-- 						<% } %> --%>
<%-- 						<li><a href="<%=root%>/memov3/list.jsp">메모</a></li> --%>
<%-- 						<li><a href="<%=root%>/guest/list.jsp">방명록</a></li> --%>
<!-- 					</ul> -->
				</td>
			</tr>

		</table>
	</div>
	<!-- 상단 메뉴 끝 -->



	<!-- 내용 시작 -->
	<div style="width: 100%; padding-top: 10px;">
</body>
</html>
