<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="image.ImageDTO"/>
<jsp:useBean id="dao" class="image.ImageDAO"/>

<%

	UploadSave upload = new UploadSave(request, -1, -1, tempDir3);
	
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	
	FileItem fileItem = upload.getFileItem("fname");
	String fname = UploadSave.saveFile(fileItem, upDir3);
	
	dto.setFname(fname);

	boolean flag = dao.create(dto);
	
	

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
	function ilist() {
		var url = "list.jsp";
		location.href = url;
		
	}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">이미지 등록</DIV>

<div class="content">

	<%
	
		if(flag) {
			out.print("등록 성공");
		}else{
			out.print("등록 실패");
		}
	
	%>

</div> 
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick='ilist()'>
  </DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
