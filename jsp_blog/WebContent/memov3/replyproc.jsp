
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty property="*" name="dto" />

<%
	Map map = new HashMap();
	map.put("grpno", dto.getGrpno());
	map.put("ansnum", dto.getAnsnum());

	dao.upAnsnum(map);

	boolean flag = dao.createReply(dto);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/javascript">
	function mlist() {
		var url = "list.jsp";
		
		url += "?col=<%=request.getParameter("col")%>";
		url += "&word=<%=request.getParameter("word")%>";
		
		location.href = url;

	}
</script>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">답변확인</DIV>
	<div class="content">

		<%
			if (flag) {
				out.print("메모 답변을 등록하였습니다.");
			} else {
				out.print("메모 답변을 등록하지 못하였습니다.");
			}
		%>



	</div>


	<DIV class='bottom'>
		<input type='button' value='목록' onclick="mlist()">
	</DIV>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
