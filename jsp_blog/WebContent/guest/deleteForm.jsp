<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:useBean id="dto" class="guest.GuestDTO"/>

<%

	int num = Integer.parseInt(request.getParameter("num"));

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
	function incheck() {
		alert("정말로 삭제하시겠습니까?");
		
	}
	

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">방명록 삭제</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./deleteProc.jsp'
	  onsubmit='return incheck()'>
	  
<input type="hidden" name="num" value="<%=num%>"> 	  

  
  <DIV class='bottom'>
    <input type='submit' value='삭제'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
