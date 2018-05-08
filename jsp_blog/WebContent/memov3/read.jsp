<%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/> 
 
<%
	int memono=Integer.parseInt(request.getParameter("memono"));


	dao.upViewcnt(memono);
	MemoDTO dto = dao.read(memono);
	
	String content=	dto.getContent();
	
	content=content.replaceAll("\r\n", "<br>");
	
	
%> 

<!DOCTYPE html> 

<html> 
	<head> 
		<meta charset="UTF-8"> 
		<title></title> 
		<link href="../css/style.css" rel="stylesheet">
		
		<script type="text/javascript">
			function mdelete(memono){
				
				if(confirm("정말 삭제하시겠습니까?")) {
					var url="delete.jsp";
					
					url+="?memono="+memono;
					url += "&col=<%=request.getParameter("col")%>";
					url += "&word=<%=request.getParameter("word")%>";
					
					location.href=url;	
				
				}else{
					var url="list.jsp";
					
					location.href=url;
				}
				
			}
			function mupdate(memono){
				var url="updateForm.jsp";
			
				url+="?memono="+memono;
				
				url +="&col=<%=request.getParameter("col")%>";
				url +="&word=<%=request.getParameter("word")%>"
				
				location.href=url;
			}
			function mcreate(){
				var url="memocreate.jsp";
				location.href=url;
			}
			function mlist(){
				var url="list.jsp";
				
				url += "?col=<%=request.getParameter("col")%>";
				url += "&word=<%=request.getParameter("word")%>";
				
				location.href=url;
			}
			function mreply(memono) {
				var url="replyform.jsp";
				
				url += "?memono="+memono;
				url += "&col=<%=request.getParameter("col")%>";
				url += "&word=<%=request.getParameter("word")%>";
			
				location.href=url;
				
				
			}
		</script>
	</head> 
	
	<body> 
	<jsp:include page="/menu/top.jsp"/>
		<div class="title">조회</div>
		<table>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=content %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewcnt() %></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=dto.getWdate() %></td>
			</tr>
		</table>
		<div class="bottom">
			<button type="button" onclick="mreply('<%=memono%>')">답변</button>
			<button type="button" onclick="mcreate()">등록</button>
			<button type="button" onclick="mupdate('<%=memono%>')">수정</button>
			<button type="button" onclick="mdelete('<%=memono%>')">삭제</button>
			<button type="button" onclick="mlist()">목록</button>
		</div>
		<jsp:include page="/menu/bottom.jsp"/>
	</body> 
</html> 