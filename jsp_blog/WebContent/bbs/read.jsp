<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));

	dao.upViewcnt(bbsno); //조회수 증가

	BbsDTO dto = dao.read(bbsno);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href = url;

	}

	function bupdate(bbsno) {
		var url = "updateform.jsp";
		url += "?bbsno=" + bbsno;
		
		url += "&col=<%=request.getParameter("col")%>"; 
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href = url;

	}
	function bdel() {
		var url = "deleteform.jsp";
		url += "?bbsno=<%=bbsno%>";
		url += "&oldfile=<%=dto.getFilename()%>";
		
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
		
		location.href = url;

	}
	function reply(bbsno) {
		var url = "replyform.jsp";
		url += "?bbsno=" + bbsno;
		
		url += "&col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		url += "&nowPage=<%=request.getParameter("nowPage")%>";
	
		location.href= url;
		
	}
	
</script>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<div class="container">
	<h2><span class="glyphicon glyphicon-search"></span> 조회</h2>


	<table class="table table-bordered">
		<TR>
			<TH>성명</TH>
			<TD><%=dto.getWname()%></TD>
		</TR>

		<TR>
			<TH>제목</TH>
			<TD><%=dto.getTitle()%></TD>
		</TR>

		<TR>
			<TH>내용</TH>
			<TD><%=content%></TD>
			<%
				//위에서 이미 선언함!
			%>
		</TR>

		<TR>
			<TH>조회수</TH>
			<TD><%=dto.getViewcnt()%></TD>
		</TR>

		<TR>
			<TH>등록날짜</TH>
			<TD><%=dto.getWdate()%></TD>
		</TR>
		
		<TR>
			<TH>파일명</TH>
			<TD><%if(dto.getFilename()==null) {
				
				out.print("파일없음");
				}else{%>
				<a href="javascript:fileDown('<%=dto.getFilename() %>')">
				<%=dto.getFilename() %>(<%=dto.getFilesize() %>)</a>
				<% } %>
			</TD>
		</TR>


	</TABLE>

	<DIV class='bottom'>
		<button type="button" onclick="reply('<%=dto.getBbsno()%>')">답변</button>
		<button type="button" onclick="bdel()">삭제</button>
		<input type='button' value='목록' onclick="blist()">
		<input type='button' value='수정' onclick="bupdate('<%=dto.getBbsno()%>')">

	</DIV>


	<!-- *********************************************** -->
	</div>
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
