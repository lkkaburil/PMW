<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>


<%

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");


	Map map = new HashMap();
	map.put("id", id);
	map.put("passwd", passwd);
	
	boolean flag = dao.passwdCheck(map);
	
	
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
		if(f.newpasswd.value !=f.renewpasswd.value) {
			alert("비밀번호를 다시 확인해주세요.");
		
			return false;
		
		}
	}
	
	function updatePasswd() {
		var url ="updatePasswdProc.jsp";
		location.href = url;
		
	}
	
	function retry() {
		var url = "passwordCheckForm.jsp";
		location.href = url;
		
	}
	


</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">비밀번호 변경</DIV>


       
       
<%	if(flag) { %>
       
<div class="content">
  	비밀번호 인증이 되었습니다. <br><br>

<form name="frm" method="post" action="updatePasswdProc.jsp" onsubmit="return incheck(this)">      
  <input type="hidden" name="id" value="<%=id%>">
  
  
  <TABLE>
  
    <TR>
      <TH>변경될 비밀번호</TH>
      <TD><input type="password" name="newpasswd" value=""></TD>
    </TR>
    
    <TR>
      <TH>변경될 비밀번호 확인</TH>
      <TD><input type="password" name="renewpasswd" value=""></TD>
    </TR>
 
  </TABLE>
    <input type='submit' value='변경'>
</form>
	</div>
	  
    <DIV class='bottom'>
  </DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
  
	
 
   <% 
      
	}else { 
		out.print("<center> 입력하신 비밀번호가 일치하지 않습니다. </center>"); 
	 %>
     
    
  
  <DIV class='bottom'>
    <input type='button' value='다시 시도' onclick="retry()">
  </DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

<% } %>

