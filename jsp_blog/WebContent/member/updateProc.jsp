<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%

	boolean flag = dao.update(dto);

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

	function read() {
		var url = "read.jsp";
		url += "?id=<%=dto.getId()%>";
		
		location.href = url;
		
	}



</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">정보수정</DIV>

<DIV class="content">

	<%
	
		if(flag) {
			out.print("정보수정이 완료되었습니다.");
		}else{
			out.print("정보수정이 실패되었습니다.");
		}
	
	%>



</DIV>
  
  <DIV class='bottom'>
    <input type='button' value='확인' onclick="read()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
