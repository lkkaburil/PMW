<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%

	String id = request.getParameter("id");  //list.jsp

	if(id==null) id =(String) session.getAttribute("id"); //일반사용자가 메뉴에서 접속한 것.

	String fname = dao.getFname(id);

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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">탈퇴하기</DIV>
 
<FORM name='frm' method='POST' action='./deleteProc.jsp'>
<input type="hidden" name="id" value="<%=id %>">
<input type="hidden" name="fname" value="<%=fname %>">

<div class="content">

	탈퇴를 하시면 더 이상 서비스를 제공받을 수 없습니다. <br>
	그래도 탈퇴를 진행하시겠습니까? 

</div>

  <DIV class='bottom'>
    <input type='submit' value='예'>
    <input type='button' value='아니오' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
