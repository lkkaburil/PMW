<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="guest.GuestDAO"/>
<jsp:useBean id="dto" class="guest.GuestDTO"/>


<%

	String col = "";
	String word = "";

	int nowPage = 1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int sno = ((nowPage-1)*recordPerPage) +1;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("sno", sno);
	map.put("eno", eno);
	
	List <GuestDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);

	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
@charset "UTF-8";
@import
	url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);

* {
	font-family: 'Nanum Brush Script' !important;
	font-size: 28px;
}

</style>

<script type="text/javascript">
	function gcreate() {
		var url = "createForm.jsp";
		
		location.href = url;
	}
	
	function read(num){
		var url = "read.jsp";
		url += "?num="+num;
		
		location.href = url;
		
	}


</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">방명록</DIV>

	<div class="content">
	
	
		<TABLE>
			<TR>
				<TH>번호</TH>
				<TH>이름</TH>
				<TH>내용</TH>
				<TH>등록날짜</TH>
			</TR>
			<%if(list.size()==0) { %>
			
			<TR>
				<td colspan="4"> 등록된 방명록이 없습니다.</td> 
			</TR>
			
			<%
			}else {
				for(int i =0; i<list.size(); i++) {

					dto = list.get(i);
				
			%>
			
			<TR>
				<TD><%=dto.getNum()%></TD>
				<TD><a href="javascript:read('<%=dto.getNum()%>')"><%=dto.getName() %></a></TD>
				<TD><a href="javascript:read('<%=dto.getNum()%>')"><%=dto.getContent() %></a></TD>
				<TD><%=dto.getGdate() %></TD>
			</TR>
			
		<% }
		  }
		 %>
		</TABLE>
		

	</div>

		<DIV class='bottom'>
			<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
			<br>
			<input type='button' value='작성' onclick="gcreate()">
		</DIV>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
