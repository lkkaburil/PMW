<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%

	String id =request.getParameter("id");

	boolean flag = dao.duplicateId(id);

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
		opener.frm.id.value='<%=id%>';
		self.close();
		
	}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
<DIV class="title">ID 중복확인</DIV>

<div class="content">
입력된  ID : <%=id %> <br><br>
<%

	if (flag) {
		out.print("중복되어 사용할 수 없습니다.<br><br>");
	}else {
		out.print("사용가능한 ID입니다. <br><br>");
		out.print("<button type='button' onclick='use()'>사용 </button>");
	}


%>


</div> 

  <DIV class='bottom'>
    <input type="button" value='다시시도' onclick="location.href='./id_form.jsp'">
    <input type='button' value='닫기' onclick="window.close()">
  </DIV>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 
