<%@ page language="java"
		 contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />
<jsp:useBean id="dto" class="memo.MemoDTO" />
<jsp:setProperty name="dto" property="*" />

<%

	//String ip="\r\n"+request.getRemoteAddr();
	
	
	//content=content+ip;
	//content=content.replace("\r\n", "<br>");
		
	boolean flag = dao.create(dto);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			*{
				font-family: fantasy;
				font-size: 24px;
			}
			div{
				text-align:center;
			}
		</style>
		<script type="text/javascript">
			function mcreate() {
				var url = "memocreate.jsp";
				location.href=url;
			}
			function mlist() {
				var url = "list.jsp";
				location.href=url;
				
			}
		
		</script>
	</head>
	
	<body>
		<div>
			<%
				if(flag){
					out.print("메모를 등록했습니다.");
				}else{
					out.print("메모 등록을 실패했습니다.");
				}
			%>
			<br>
			<button type="button" onclick="mcreate()'">계속 등록</button>
			<button type="button" onclick="mlist()">목록</button>
			
		</div>

	</body>
</html>