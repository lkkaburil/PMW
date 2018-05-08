<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>


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


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

	<DIV class="title">ID 중복 확인</DIV>

	<div class="content">

		ID를 입력하세요. <br><br>
	
		</div>
		
		<FORM name='frm' method='POST' action='./id_proc.jsp'>
			<TABLE>
				<TR>
					<TH>I D</TH>
					<TD><input type ="text" name="id" size="20" required="required"></TD>
				</TR>
			</TABLE>

			<DIV class='bottom'>
				<input type='submit' value='중복확인'>
				<input type='button' value='취소' onclick="window.close()">
			</DIV>
		</FORM>
	
	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
