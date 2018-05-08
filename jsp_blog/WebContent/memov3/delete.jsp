<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>

<jsp:useBean id="dao" class="memo.MemoDAO" />

<%
	int memono = Integer.parseInt(request.getParameter("memono"));
	
	boolean cflag = dao.checkRefnum(memono);

	
	boolean flag = false;
	
	if (cflag == false) {
	 	flag = dao.delete(memono);	
	}
	
	
	
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="../css/style.css" rel="stylesheet">

<script type="text/javascript">
	function mlist() {
		var url = 'list.jsp';
		
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		
		location.href = url;
	}
</script>
</head>
	<body>
	<jsp:include page="/menu/top.jsp"></jsp:include>
	<div class="title">삭제 확인</div>
	
	<% if(cflag) { %>
	<div class="content">
	부모글이므로 삭제할 수 없습니다.
	
		<br>
			<button type="button" onclick="history.back()">뒤로가기</button>
			<button type="button" onclick="mlist()">목록</button>
	


	<%}else {%>
	
		<%
			if (flag) {
				out.print("메모 삭제에 성공 했습니다.");
			} else {
				out.print("메모 삭제에 실패 했습니다.");
			}
		%><br> <br> <br>
		<button type="button" onclick="mlist()">목록</button>
	</div>
	<jsp:include page="/menu/bottom.jsp"></jsp:include>
</body>
</html>
<% } %>
