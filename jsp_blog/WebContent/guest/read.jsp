<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:useBean id="dto" class="guest.GuestDTO"/>


 <%
 
 	int num = Integer.parseInt(request.getParameter("num"));
 
 	dto = dao.read(num);
 	
 	String content = dto.getContent();
 	content = content.replaceAll("\r\n", "<br>");
	
 
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
		
		location.href = url;
		
		
	}
	
	function gupdate(num) {
		var url = "updateForm.jsp";
		url += "?num="+num;
		location.href = url;
		
	}

	function gdelete(num) {
		var url = "deleteForm.jsp";
		url += "?num="+num;
		
		location.href = url;
		
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">방명록</DIV>
 
 <div class="content">
 
  <TABLE>
  
    <TR>
      <TH>작성자</TH>
      <TD><%=dto.getName() %></TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD><%=content%></TD>
    </TR>
    
    <TR>
      <TH>등록날짜</TH>
      <TD><%=dto.getGdate() %></TD>
    </TR>
  
  </TABLE>
  
  </div>
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="glist()">
    <input type='button' value='새로 등록' onclick="gcreate()">
    <input type='button' value='수정' onclick="gupdate('<%=dto.getNum()%>')">
    <input type='button' value='삭제' onclick="gdelete('<%=dto.getNum()%>')">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
