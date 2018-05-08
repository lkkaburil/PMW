<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:useBean id="dto" class="guest.GuestDTO"/>


<%
	

	int num = Integer.parseInt(request.getParameter("num"));

	boolean flag = dao.delete(num);

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

	function glist() {
		var url = "list.jsp";
		
		location.href =url;

		
	}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">삭제하기</DIV>

<div class="content">
 	<%
 	
 		if(flag) {
 			out.print("방명록이 삭제되었습니다.");
 		}else{
 			out.print("다시 시도해주세요.");
 		}
 	
 	%>

</div>
 
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="glist()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
