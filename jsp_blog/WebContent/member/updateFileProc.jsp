<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%



	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	String id = upload.getParameter("id");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	FileItem fileItem = upload.getFileItem("fname");
	
	int size = (int)fileItem.getSize();
	
	String fname = null;
	
	if(size>0) {
		if(oldfile!= null && !oldfile.equals("member.jpg"))
		UploadSave.deleteFile(upDir, oldfile);
	
		fname = UploadSave.saveFile(fileItem, upDir);
		
	}
		
	Map map = new HashMap();
	map.put("id", id);
	map.put("fname", fname);
	
	boolean flag = dao.updateFile(map);

	
	
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
		url += "?id=<%=id%>";
		location.href = url;
		
	}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">사진변경</DIV>
 
 <div class="content">
 
 <%
 
 	if(flag) {
 		out.print("사진을 변경했습니다.");
 	}else{
 		out.print("사진변경을 실패했습니다.");
 	}
 
 %>
 
 </div>
 
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="read()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
