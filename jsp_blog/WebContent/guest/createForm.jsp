<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

 
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
			alert("하고 싶은말이 없으신가요?!");
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
 
<DIV class="title">방명록 작성</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./createProc.jsp'
	  onsubmit="return incheck(this)">
  <TABLE>
   
    <TR>
      <TH>작성자</TH>
      <TD>
      	<input type="text" name="name" size="15">		      
      </TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD>
      	<textarea rows="10" cols="30" name="content"></textarea>
      </TD>
    </TR>
 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='작성완료'>
    <input type='button' value='취소' onclick="history.back()">
    
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
