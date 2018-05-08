<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>

<%
	
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));

	boolean flag = dao.checkRefnum(bbsno);
	
	
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/javascript">
	function blist() {
		var url = "list.jsp";
		location.href = url;

	}
</script>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<% if(flag) { %>
	<div class="content">
		부모글이므로 삭제할 수 없습니다.
	</div>
		<DIV class='bottom'>
		
		 	<input type='button' value='뒤로가기' onclick="history.back()">
		 	<input type='button' value='목록' onclick="blist()">
		
		</DIV>
	<%} else{ %>

	<div class="container">
	<h2><span class="glyphicon glyphicon-trash"></span> 삭제</h2>



	<FORM name='frm' method='POST' action='deleteproc.jsp'>
		<input type="hidden" name="bbsno" value="<%=bbsno%>">
		<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
		<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
		<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>">
		<input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile")%>">
		
		
		<TABLE class="table table-bordered">
			<TR>
				<TH>비밀번호</TH>
				<TD><input type="password" name="passwd" placeholder="비밀번호를 입력하세요." required></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='삭제' onclick="">
		 	<input type='button' value='목록' onclick="blist()">
		</DIV>
	</FORM>

	<%} %>

	<!-- *********************************************** -->
	</div>
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
