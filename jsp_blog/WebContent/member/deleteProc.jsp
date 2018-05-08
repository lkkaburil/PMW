<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%

	String id = request.getParameter("id");
	String fname = request.getParameter("fname");
	
	boolean flag = dao.delete(id);
	
	if(flag) {
		if(fname!=null && !fname.equals("member.jpg"));
		UploadSave.deleteFile(upDir, fname);
	
			session.invalidate();
	
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">탈퇴확인</DIV>
 
 <div class="content">
 
 	<%
 	
 		if(flag) {
 			out.print("탈퇴되었습니다. 자동 로그아웃됩니다.");
 		}else {
 			out.print("탈퇴처리가 실패하였습니다.");
 		}
 	
 	%>
 
 
 </div>
 
  <DIV class='bottom'>
    <input type='button' value='홈' onclick="location.href='../index.jsp'">
    <input type='button' value='다시시도' onclick="history.back()'">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
