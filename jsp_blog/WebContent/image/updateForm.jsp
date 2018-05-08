<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/>


<%


	int imgno = Integer.parseInt(request.getParameter("imgno"));

	ImageDTO dto = dao.read(imgno);



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
 
<DIV class="title">이미지 수정</DIV>
 
<FORM name='frm' 
	  method='POST' 
	  action='./updateProc.jsp'
	  enctype='multipart/form-data'
	  onsubmit='return incheck(this)'>
	  
	<input type="hidden" name="imgno" value="<%=imgno %>">
	<input type="hidden" name="word" value="<%=request.getParameter("word")%>" >
	<input type="hidden" name="col" value="<%=request.getParameter("col")%>" >
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>" >
	<input type="hidden" name="oldfile" value="<%=dto.getFname()%>" >
 
  <TABLE>
      <TR>
      <TH>이름</TH>
      <TD><input type="text" name="name" value="<%=dto.getName()%>"></TD>
    </TR>
    
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle()%>"></TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD><textarea rows="10" cols="35" name="content"><%=dto.getContent()%></textarea></TD>
    </TR>
    
    <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
    
    <TR>
      <TH>이미지</TH>
      <TD><input type="file" name="fname" accept=".jpg, .png, .gif">(<%=Utility.checkNull(dto.getFname())%>)</TD>
    </TR>
  
  
  
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='수정'>
    <input type='reset' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
