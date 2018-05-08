<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

 <%

 		//검색관련
  		String col = Utility.checkNull(request.getParameter("col"));
  		String word = Utility.checkNull(request.getParameter("word"));
  		
  		if(col.equals("total")) {
  			word ="";
  		}
  		  		
 		//페이징관련
 		int nowPage = 1;
 		int recordPerPage = 3;
 		
 		if(request.getParameter("nowPage")!=null) {
 			nowPage = Integer.parseInt(request.getParameter("nowPage"));
 		}
 	
 		//db에서 가져올 순번
 		int sno = ((nowPage-1) * recordPerPage) +1;
 		int eno = nowPage * recordPerPage;
 		
 		//dao 메소드 호출
 		Map map = new HashMap();
 		
 		map.put("col", col);
 		map.put("word", word);
 		map.put("sno", sno);
 		map.put("eno", eno);
 		
 		List<MemberDTO> list = dao.list(map);
 		
 		int totalRecord = dao.total(map);
 		
 		//페이징 출력 메소드 호출
 		String paging = Utility.paging3(totalRecord, nowPage, recordPerPage, col, word);
 		
 %>
 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
@charset "UTF-8";
@import url(http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css);
*{
font-family: 'Nanum Brush Script' !important;
font-size: 28px;
}


.search {
		width : 80%;
		text-align: center;
		margin : 5px auto;
	
		}
</style>

<script type="text/javascript">
	function read(id) {
		var url = "<%=root%>/member/read.jsp";
		url += "?id="+id;
		
		location.href=url;
		
	}
	
	function login() {
		var url = "loginForm.jsp";
		
		location.href = url;
		
	}


</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 

<div class="search">
	<form method="post" action="list.jsp">
		<select name="col">
			<option value="mname"
								<% if(col.equals("mname")) out.print("selected"); %>
																					>성명</option>
			<option value="id"
								<% if(col.equals("id")) out.print("selected"); %>		
																					>아이디</option>
			<option value="email"
								<% if(col.equals("email")) out.print("selected"); %>
																					>이메일</option>
			<option value="total">전체출력</option>
		</select>
	<input type="search" name="word" required="required" value="<%=word%>">
	<button>검색</button> 
	<button type="button" onclick="location.href='<%=root%>/member/createForm.jsp'">회원가입</button> 
	<button type="button" onclick="login()">로그인</button> 
	
	</form>

		 <div class="container">
		 <h2><span class="glyphicon glyphicon-tasks"></span>회원목록</h2>
		 
 	<% 
 		for(int i=0; i<list.size(); i++) { 
 		
 		MemberDTO dto = list.get(i);
 	%>

 <table>
 
 	<tr>
 		<td rowspan="5" width="15%"><img src="<%=root%>/member/storage/<%=dto.getFname()%>" width='200px' height='150px'></td>
		<th width="20%">아이디</th>
		<td width="50%"><a href="javascript:read('<%=dto.getId() %>')"><%=dto.getId()%></a></td>
 	</tr>

	<tr>
	 	<th>성명</th>
	 	<td><%=dto.getMname() %></td>
 	</tr>
 	
 	<tr>
	 	<th>전화번호</th>
	 	<td><%=dto.getTel() %></td>
 	</tr>
 	
 	<tr>
	 	<th>이메일</th>
	 	<td><%=dto.getEmail() %></td>
 	</tr>
 	
 	<tr>
	 	<th>주소</th>
	 	<td>
	 		<%=Utility.checkNull(dto.getAddress1()) %>  
	 		<%=Utility.checkNull(dto.getAddress2()) %>
	 	
	 	</td>
 	</tr>

 </table> 
  
  <% } %>
 
 
    
  <DIV class='bottom'>
		<%=paging %>

  </DIV>
</div> 
 
<!-- *********************************************** -->
</div>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
