<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>

<%

	UploadSave upload = (UploadSave) request.getAttribute("upload");

	dto.setId(UploadSave.encode(upload.getParameter("id")));
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));
	dto.setZipcode(UploadSave.encode(upload.getParameter("zipcode")));
	dto.setPasswd(UploadSave.encode(upload.getParameter("passwd")));
	dto.setJob(UploadSave.encode(upload.getParameter("job")));
	dto.setEmail(UploadSave.encode(upload.getParameter("email")));
	dto.setTel(UploadSave.encode(upload.getParameter("tel")));
	
	FileItem fileItem = upload.getFileItem("fname");
	String fname = "member.jpg";
	int size = (int)fileItem.getSize();
	
	if(size>0) {
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	
	dto.setFname(fname);
	boolean flag = dao.create(dto);
	
	
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
	function login(){
		var url = "loginForm.jsp";
		location.href= url;
	}
	function mlist(){
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
 
<DIV class="title">회원가입 처리</DIV>

<div class="content">

<%

	if(flag){
		out.print("회원가입을 성공적으로 끝마쳤습니다.");
%>
		<br>
<%
		out.print("<button type='button' onclick='login()'>로그인</button>");
	}else{
		out.print("회원가입을 다시 시도해주시기 바랍니다.");
	}

%>




</div>
 
 
 
  
  <DIV class='bottom'>
    <input type="button" value="홈" onclick="mlist()">
  </DIV>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
