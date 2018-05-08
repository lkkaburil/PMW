<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="image.ImageDAO" />

<%

	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if(col.equals("total")) word="";
	
	int nowPage = 1;
	
	if(request.getParameter("nowPage")!=null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	int recordPerPage = 5;
	
	int sno = ((nowPage-1) * recordPerPage) +1 ;
	int eno = nowPage * recordPerPage;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	
	List<ImageDTO> list = dao.list(map);
	
	int totalRecord = dao.total(map);
	


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<style type="text/css">
		* {
			font-family: gulim;
			font-size: 20px;
		}
		.search {
					width: 90%;
					text-align: center;
					margin: 2px auto;
		
			 	}

	</style>

<script type="text/javascript">
	function imgcreate() {
		var url = "createForm.jsp";
		location.href = url;

	}
	function read(imgno) {
		var url = "read.jsp";
		
		url += "?imgno="+imgno;
		url += "&col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href=url;
		
	}
	
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">이미지 게시판</DIV>

	<div class="search">
		<form action="list.jsp" method="post">
			<select name ="col">
				<option value="title"
					<%if(col.equals("title")) out.print("selected"); %>
																		>제목</option> 
				
				<option value="name"
					<%if(col.equals("name")) out.print("seleceted"); %> 
																		>이름</option>
				
				<option value="total">모두보기</option>
			
			</select>
			
		<input type="search" name="word" value="<%=word%>" required="required">
		<button>검색</button>
		
		</form>
	</div>
	
		<TABLE>
			<TR>
				<TH>번호</TH>
				<TH>제목</TH>
				<TH>이름</TH>
				<TH>이미지</TH>
			</TR>

			<%
				if (list.size() == 0) {
			%>

			<TR>
				<TD colspan="4">등록된 이미지가 없습니다.</TD>
			</TR>

			<%
				} else {
					for (int i = 0; i < list.size(); i++) {
						ImageDTO dto = list.get(i);
			%>

			<TR>
				<TD><%=dto.getImgno()%></TD>
				<TD><a href="javascript:read('<%=dto.getImgno()%>')"><%=dto.getTitle()%></a></TD>
				<TD><%=dto.getName()%></TD>
				<TD><a href="javascript:read('<%=dto.getImgno()%>')">
				    <img src="./storage/<%=dto.getFname()%>" width="45%" height="45%"></a>
					</TD>
				
			</TR>


			<%
				}
				}
			%>

		</TABLE>

		<DIV class='bottom'>
			<button type='button' onclick="imgcreate()">등록</button>
			<%Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);%>
		</DIV>


		<!-- *********************************************** -->
		<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
