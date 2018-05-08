
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%

	String id = request.getParameter("id"); //list.jsp
	String passwd = request.getParameter("passwd"); //list.jsp
 
	if(id==null) id = (String) session.getAttribute("id"); //일반사용자가 메뉴를 통해 접속한 것.
	
	MemberDTO dto = dao.read(id);
	
	
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

</style>

<script type="text/javascript">
	function updatePasswd() {
		var url = "passwordCheckForm.jsp";
		url += "?id=<%=id%>";
		url += "&passwd=<%=passwd%>";
		
		location.href = url;
		
	}

	function updateFile() {
		var url = "./updateFileForm.jsp";
		url += "?id=<%=id%>";
		url += "&oldfile=<%=dto.getFname()%>";
		
		location.href=url;
	}
	function mlist() {
		var url = "list.jsp";
			
		location.href=url;
			
		}
	function mupdate() {
		var url = "updateForm.jsp";
		
		url += "?id=<%=id%>";
		location.href = url;
		
		
	}
	
	function mdelete() {
		var url = "deleteForm.jsp";
		url += "?id=<%=id%>";
		
		location.href = url;
		
	}
		
	


</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title"><%=dto.getId()%>의 회원정보 </DIV>

		<table>
			<tr>
				<td colspan="2">
					<img src="./storage/<%=dto.getFname() %>">
				</td>
			</tr>	
		
			<tr>
				<th>아이디</th>
				<td><%=dto.getId() %></td>
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
				<th>우편번호</th>
				<td><%=dto.getZipcode() %></td>
			</tr>	
			
			<tr>
				<th>주소</th>
				<td><%=dto.getAddress1() %></td>
			</tr>
			
			<tr>
				<th>상세주소</th>
				<td><%=dto.getAddress2() %></td>
			</tr>
			
			<tr>
				<th>직업</th>
				<td>
				    직업코드: <%=dto.getJob() %>
				  (<%=Utility.getCodeValue(dto.getJob()) %>)
				</td>
			</tr>
			
			<tr>
				<th>가입날짜</th>
				<td><%=dto.getMdate() %></td>
			</tr>
		
		
		</table>

		<DIV class='bottom'>
			<input type='button' value='정보수정' onclick="mupdate()">
			<input type='button' value='사진수정' onclick="updateFile()">
			<input type='button' value='비밀번호변경' onclick="updatePasswd()">
			<input type='button' value='회원탈퇴' onclick="mdelete()">
			
			<input type='button' value='목록' onclick="mlist()">
			<input type='button' value='다운로드'  
           onclick="location.href='<%=root %>/download?dir=/member/storage&filename=<%=dto.getFname()%>'"> 
			
		</DIV>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
