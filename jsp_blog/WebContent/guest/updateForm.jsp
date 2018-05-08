<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="guest.GuestDTO"/>
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:setProperty property="*" name="dto"/>
 
 <%
 
 	int num = Integer.parseInt(request.getParameter("num"));
	dto = dao.read(num);
 

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
		if(f.name.value==null) {
			alert("작성자 이름을 입력해주세요!");
			f.name.focus();
			return false;
		}
	
		if(f.content.value==null) {
			alert("하고 싶은 말이 없으신가요?!");
			f.content.focus();
			return false;
		}
	
	}
	

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">방명록 수정</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./updateProc.jsp'
	  onsubmit="return incheck(this)">

<input type="hidden" name="num" value="<%=dto.getNum()%>">

	  
  <TABLE>
   
    <TR>
      <TH>작성자</TH>
      <TD>
      	<input type="text" name="name" size="15" value="<%=dto.getName()%>">	      
      </TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD>
      	<textarea rows="10" cols="30" name="content" ><%=dto.getContent()%></textarea>
      </TD>
    </TR>
 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정완료'>
    <input type='button' value='취소' onclick="history.back()">
    
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
