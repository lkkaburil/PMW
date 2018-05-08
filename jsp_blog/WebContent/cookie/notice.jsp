<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<script type="text/javascript">


</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body style="background-color: #DDDDDD">

<div class="content">

	평창 동계 올림픽 SBS에서 생방송<br></br>
	1,2,3부로 나누어 방송합니다.<br></br>
	많은 시청 바랍니다.<br></br>
	
	
	<FORM name='frm' method='POST' action='./notice_cookie.jsp'>
	<input type="checkbox" value="close" onclick="document.frm.submit();"> 1분간 창 열지 않기
	</FORM>
	
</div>




<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
