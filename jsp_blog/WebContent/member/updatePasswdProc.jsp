<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("newpasswd");
	
	System.out.print(id);
	System.out.print(passwd);
	
	

	Map map = new HashMap();
	map.put("id", id);
	map.put("passwd", passwd);
	
	boolean flag = dao.passwdUP(map);
	

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
	function mlist() {
		var url = "list.jsp";
		
		location.href = url;
		
		
	}

</script> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">비밀번호변경</DIV>

<div class="content">

	<%if(flag) {
		out.print("비밀번호를 변경하였습니다.");
	}else {
		out.print("비밀번호를 변경하지 못했습니다.");
	}
		
	%>


</div>
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="mlist()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
