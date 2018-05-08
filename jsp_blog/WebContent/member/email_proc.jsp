<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%

	String email =request.getParameter("email");

	boolean flag = dao.duplicateEmail(email);

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
	function use() {
		opener.frm.email.value='<%=email%>';
		self.close();
		
	}


</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">Email 중복확인</DIV>

<div class="content">
입력된  Email : <%=email %> <br><br>
<%

	if (flag) {
		out.print("중복되어 사용할 수 없는 Email입니다.<br><br>");
	}else {
		out.print("사용가능한 Email입니다. <br><br>");
		out.print("<button type='button' onclick='use()'>사용 </button>");
	}


%>


</div> 

  <DIV class='bottom'>
    <input type="button" value='다시시도' onclick="location.href='./email_form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
