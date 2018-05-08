<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/>
<jsp:useBean id="dto" class="image.ImageDTO"/>

<%

	UploadSave upload = new UploadSave(request, -1, -1, tempDir3);

	int imgno = Integer.parseInt(upload.getParameter("imgno"));
	
	dto.setImgno(Integer.parseInt(upload.getParameter("imgno")));
	dto.setName(UploadSave.encode(upload.getParameter("name")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));

	String nowPage = upload.getParameter("nowPage");
	String col = upload.getParameter("col");
	String word = UploadSave.encode(upload.getParameter("word"));
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));
	
	FileItem fileItem = upload.getFileItem("fname");
	String fname = UploadSave.saveFile(fileItem, upDir3);
	
	dto.setFname(fname);
	
	Map map = new HashMap();
	map.put("imgno", imgno);
	map.put("passwd", dto.getPasswd());
	
	boolean pflag = dao.pwCheck(map);
	
	boolean flag = false;
	
	if(pflag) {
		flag = dao.update(dto);
	}else{
		out.print("비밀번호를 다시 한번 확인해주세요.");
	}
	




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
	function imglist() {
		var url = "./list.jsp";
		location.href=url;
		
	}



</script> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">수정</DIV>

<div class= "content">
	
	<%	
	
	
		if(flag) {
			out.print("수정 성공");
		}else{
			out.print("수정 실패");
			}
	
	

	%>


</div>  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="imglist()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
