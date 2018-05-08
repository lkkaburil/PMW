<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/>

 <%
 	
 	int imgno = Integer.parseInt(request.getParameter("imgno"));
 	String passwd = request.getParameter("passwd");
 	
 
 	Map map = new HashMap();
 	map.put("imgno", imgno);
 	map.put("passwd", passwd);
 
 	boolean pflag = dao.pwCheck(map);
 	boolean flag = false;
 	
 	
 
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
 
<DIV class="title">삭제</DIV>
 
  <div class="content">
  
  	<%
  	
	 	if(pflag) {
	 		flag = dao.delete(imgno);
	 	}else {
	 		out.print("비밀번호를 다시 한번 확인해주세요.<br>");
	 	}
  	
  	
  	
  	
  		if(flag){
  			out.print("삭제 성공하였습니다.");
  		}else{
  			out.print("삭제 실패하였습니다.");
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
