<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="bbs.BbsDAO" />

<%
	//검색 관련        ----------------------------------------------------
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));
	
	if (col.equals("total")) word="";
	//검색관련 end ----------------------------------------------------
	
	//paging 관련
	int nowPage = 1; //현재 보고 있는 페이지

	if (request.getParameter("nowPage")!=null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerPage = 5; //한 페이지당 보여줄 레코드 갯수
	
	int sno = ((nowPage-1) * recordPerPage) +1 ;
	int eno = nowPage * recordPerPage;

	//--------------------------------------------------------------
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);


	List<BbsDTO> list = dao.list(map);
	
	//전체 레코드 갯수 가져오기
	int totalRecord = dao.total(map);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	
	<style type="text/css">
	
	
		.search {
					width: 90%;
					margin: 2px auto;
					text-align: center;
						
				}
		th {
		
			background-color: black;
			 }		
	
	
	</style>


	<script type="text/javascript">
		function bcreate() {
		var url = "createform.jsp";
		location.href = url;
	}

		function read(bbsno) {
		var url = "read.jsp";
		url += "?bbsno=" + bbsno; 
		
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url;
		
	}
		
		function fileDown(filename) {
			var url = "<%=root%>/download";
			url += "?filename="+filename;
			url += "&dir=/bbs/storage";
			
			location.href = url;
			
			
		}
		
	</script>

<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

		<div class="search">
	
			<form action="list.jsp" method="post">
		
				<select name="col"> <!-- 검색할 컬럼 -->
					
					<option value="wname" selected
					
							<%if(col.equals("wname")) out.print("selected"); %>>성명</option>
					
					<option value="title"
						
							<%if(col.equals("title")) out.print("selected"); %>>제목</option>
					
					<option value="content"
					
							<%if(col.equals("content")) out.print("selected"); %>>내용</option>
					
					<option value="total">전체출력</option>

				</select>

				<input type="search" name="word" value="<%=word %>" required="required"> <!-- 검색어 -->
		
				<button>검색</button>
				<button type="button" onclick="location.href='createform.jsp'">등록</button>
				
	
			</form>
		
		</div>

	
	<div class="container">
	 <h2><span class="glyphicon glyphicon-tasks"></span> 게시판 목록</h2>
	 
	 <table class="table table-hober">


	<thead>
		<TR>
			<TH>번호</TH>
			<TH>성명</TH>
			<TH>제목</TH>
			<TH>등록날짜</TH>
			<TH>조회수</TH>
			<TH>파일명</TH>
		</TR>

	<thead>	
		<%
			if (list.size() == 0) {
		%>

	<tbody>

		<TR>
			<TD colspan="6">등록된 게시글이 없습니다.</TD>
		</TR>

	</tbody>
	
		<%
			} else {
				for (int i = 0; i < list.size(); i++) {
					BbsDTO dto = list.get(i);
		%>

	<tbody>
		<TR>
			<TD><%=dto.getBbsno()%></TD>
			<TD><%=dto.getWname()%></TD>
			<TD>
				<%
					if (dto.getIndent() > 0) {
				%> 
				<%
					for (int r = 0; r<dto.getIndent(); r++) {
						out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
					}
					
					
			 			out.print("<img src='../images/콧수염1.PNG' width='5%' height='5%'>");
					}
				%>
				<%
					if(Utility.compareDay(dto.getWdate())) { 	%>
					 <img src ="../images/new.PNG" width='10%' height='10%'> 	
				<% } %>
				
				 <a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle()%></a>
				
			</TD>
			<TD><%=dto.getWdate()%></TD>
			<TD><%=dto.getViewcnt()%></TD>
			<TD><%if(dto.getFilename()==null) {
				
				out.print(Utility.checkNull(dto.getFilename()));
				}else{%>
				<a href="javascript:fileDown('<%=dto.getFilename() %>')"><%=dto.getFilename() %></a>
				<% } %>  
			</TD>
		</TR>
		</tbody>
		<%
			} //for-end

			} //if-end
		%>
	</TABLE>

	<DIV class='bottom'>
		<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
	</DIV>

</div>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
