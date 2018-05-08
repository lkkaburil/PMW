<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.MemoDAO" />

<% 
	//검색관련
	String col = Utility.checkNull(request.getParameter("col"));
	String word = Utility.checkNull(request.getParameter("word"));

	if(col.equals("total")) word="";
	
	//페이징 관련
	int nowPage = 1;
	int recordPerPage = 5;
	
	if(request.getParameter("nowPage")!=null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	int sno = ((nowPage-1) * recordPerPage) +1 ;
	int eno = nowPage * recordPerPage ;
	
	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);
	
	
	List<MemoDTO> list = dao.list(map);

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
					text-align: center;
					margin: 2px auto;
		
			 	}
		
		</style>
		
<!-- 		<link href="../css/style.css" rel="stylesheet" > -->
		
		<script type="text/javascript">
			function read(memono){
				//alert(memono);
				var url="read.jsp";
				url+="?memono="+memono;
				
				url += "&col=<%=col%>";
				url += "&word=<%=word%>";
				
				location.href=url;
			}
			function mcreate() {
				var url = "memocreate.jsp";
				location.href=url;
				
			}
		</script> 
	</head> 
	
	<body> 
		<jsp:include page="/menu/top.jsp"/>
		
			<div class="search">

				<form action="list.jsp" method="post">

						<select name="col">
							<option value="title"
								<% if(col.equals("title")) out.print("selected"); %>
																						>제목</option>
							<option value="content"
								<% if(col.equals("content")) out.print("selected"); %>
																						>내용</option>
							<option value="">전체출력</option>
						</select>
						
						
					
					<input type="search" name="word" value="<%=word%>" required="required">
					
					<button>검색</button>
					<button type="button" onclick="mcreate()">등록</button>	
					
				</form>
			</div>
			
			<div class="container">
			 <h2><span class="glyphicon glyphicon-tasks"></span>메모 목록</h2>
			 
			 <table class="table table-hover">
		
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
				<th>조회수</th>
				<th>grpno</th>
				<th>indent</th>
				<th>ansnum</th>
		</tr>
		</thead>
			<%if(list.size()==0){ %>
			
			<tbody>
			<tr>
				<td colspan="7">등록된 메모가 없습니다.</td>
			</tr>
			</tbody>
			<%
			}else{
			for (int i =0; i<list.size(); i++){
				
				MemoDTO dto = list.get(i);
		
				
				%>
			<tbody>
			<tr>
				<td><%=dto.getMemono() %></td>
				<td>
				<%if(dto.getIndent() > 0)  { 
					for (int r=0; r<dto.getIndent(); r++){
						out.print("&nbsp;&nbsp;&nbsp;");
					}
				
					out.print("<img src='../images/콧수염1.PNG' width='5%' height='5%'>"); 
				
				} 
				 
				 %>
				<%
					if(Utility.compareDay(dto.getWdate())) { %>
					
					<img src='../images/new.PNG' width='7%' height='7%'>
				
				<% } %>	
				
				
				<a href="javascript:read('<%=dto.getMemono()%>')"><%=dto.getTitle() %></a>
				
				</td>
				<td><%=dto.getWdate() %></td>
				<td><%=dto.getViewcnt() %></td>
				<td><%=dto.getGrpno() %></td>
				<td><%=dto.getIndent() %></td>
				<td><%=dto.getAnsnum() %></td>
			</tr>	
			</tbody>
			
			<%}// for-end
			} //if-end
			%>
			
			
		</table>
		<div class="bottom">
			<%=Utility.paging3(totalRecord, nowPage, recordPerPage, col, word) %>
		</div>
		
		</div>
		<jsp:include page="/menu/bottom.jsp"/>
	</body> 
</html> 