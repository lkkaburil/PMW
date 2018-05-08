<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>

<%

	session.invalidate();

	//response.sendRedirect(root+"/menu/index.jsp");

%>
<script>
	alert('로그아웃 되었습니다.');
	location.href="<%=root%>/menu/index.jsp";
</script>
