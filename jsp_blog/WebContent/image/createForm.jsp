<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<%


%>
 
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
	function incheck(f) {
		if(f.name.value=="") {
			alert("이름!이름!");
			f.name.focus();
			return false;
		}
		if(f.title.value=="") {
			alert("제목!제목!");
			f.title.focus();
			return false;
		}
		if(f.content.value=="") {
			alert("내용!내용!");
			f.content.focus();
			return false;
		}
		if(f.passwd.value=="") {
			alert("비밀번호!");
			f.passwd.focus();
			return false;
		}
		if(f.fname.value==""){
			alert("사진 좀!");
			f.fname.focus();
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
 
<DIV class="title">이미지 등록</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./createProc.jsp'
	  enctype='multipart/form-data'
	  onsubmit='return incheck(this)'>
 
  <TABLE>
      <TR>
      <TH>이름</TH>
      <TD><input type="text" name="name"></TD>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title"></TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="35" name="content"></textarea></TD>
    </TR>
    
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    
    <TR>
      <TH>이미지</TH>
      <TD><input type="file" name="fname" accept=".jpg, .png, .gif"></TD>
    </TR>
  
  
  
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'>
    <input type='reset' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
