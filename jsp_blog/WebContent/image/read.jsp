<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="image.ImageDAO"/>

<%
   int imgno = Integer.parseInt(request.getParameter("imgno"));

   ImageDTO dto = dao.read(imgno);
   
   String content = dto.getContent();
   
   content = content.replaceAll("\r\n", "<br>");
   
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

.curImg{
	margin-right:0;
	border-style:solid;
	border-width: 3px;
	border-color: red;
}
.td_padding{
	padding:5px 5px;
}

</style> 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function readGo(imgno){
		var url = "./read.jsp";
		url += "?imgno="+imgno;
		
		location.href=url;
	}
	
	function imglist() {
		var url = "./list.jsp";
		
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href = url;
		
	}
	
	function imgupdate(imgno) {
		var url= "./updateForm.jsp";
		url += "?imgno="+imgno;
		
		url += "&col=<%=request.getParameter("col")%>"; 
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
		
	}
	
	function imgdel(imgno) {
		var url = "./deleteForm.jsp";
		
		url += "?imgno="+imgno;
		
		url += "&col=<%=request.getParameter("col")%>"; 
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href=url;
		
	}
	
	function imgcreate() {
		var url = "./createForm.jsp";
		location.href=url;

		
	}

</script>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">조회</DIV>
 
  <TABLE style="width: 50%">
    <TR>
      <TD colspan="2">
      <img src="./storage/<%=dto.getFname() %>" width="100%">
      </TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH>내용</TH>
      <TD><%=content %></TD>
    </TR>
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getName() %></TD>
    </TR>
  </TABLE>
  <TABLE style="width: 50%">
  <TR>
  <%
  	List list = dao.imgRead(imgno);
    String[] files = (String[])list.get(0);
    int[] noArr = (int[])list.get(1);
    for(int i=0;i<5;i++){
    	if(files[i]==null){  
  %>
  <td class="td_padding"><img src="./storage/default.jpg" width="100%"><td>
  <%
    	}else{
    		if(noArr[i]==imgno){
  %> 	
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img class="curImg" src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  <%		
    		}else{
  %>
  <td class="td_padding"><a href="javascript:readGo('<%=noArr[i]%>')">
  <img src="./storage/<%=files[i] %>" width="100%" border="0">
  </a></td>
  			
  <%
    		}
    	 }   		
      }
  %>
  </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='등록' onclick="imgcreate()">
    <input type='button' value='목록' onclick="imglist()">
  	<input type='button' value='수정' onclick="imgupdate('<%=imgno%>')">
  	<input type='button' value='삭제' onclick="imgdel('<%=imgno%>')">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 

