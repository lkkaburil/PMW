<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();

	String id = (String) session.getAttribute("id");
	String grade = (String) session.getAttribute("grade");
	String title = "suna 블로그";
	
	if(id!=null && grade.equals("A")) {
		title = "관리자 페이지입니다.";
	}
	
	String str = "";
	
	if(id == null) {
		str = "메인 페이지입니다.";
	}else {
		str = "안녕하세요! " +id+ "님! ^.^";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
@charset "UTF-8";
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
*{
font-family: 'Nanum Brush Script' !important;
font-size: 28px;
}
</style>
<script type="text/javascript">

	function login() {
		var url = "../member/loginForm.jsp";
		
		location.href = url;
		
	}

	function logout() {
		var url = "../member/logout.jsp";
		
		location.href = url;
		
	}

</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title"><%=title %></DIV>

	<div class="content">
	
		<img src ="../images/콧수염1.PNG" width="10%"><br>
		<h1><%=str %></h1>
		
		<%
		
			if(id==null) {
		
		%>
		<input type ="button" value="로그인" onclick="login()">
	
	
		<% }else{ %>
	
		<input type ="button" value="로그아웃" onclick="logout()">

		<% } %>
	</div>

	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>
