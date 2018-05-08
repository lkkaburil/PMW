<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>


<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
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
	function incheck(f) {
		if(f.passwd.value==""){ 
		alert("비밀번호를 입력하세요");
		f.passwd.focus();
		}
	}



</script> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">본인확인</DIV>

<div class="content">

본인확인을 위해 현재 비밀번호를 입력해주세요.<br><br>

<FORM name='frm' 
	  method='POST' 
	  action='./prupdatePasswdProc.jsp'
	  onsubmit='return incheck(this)'>
  <TABLE>
    <TR>
      <TH>현재비밀번호</TH>
      <TD><input type="password" name="passwd" value=""></TD>
    </TR>
  </TABLE>


</div>
 
	  
<input type="hidden" name="id" value="<%=id%>">
	  

  
  <DIV class='bottom'>
    <input type='submit' value='확인'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
