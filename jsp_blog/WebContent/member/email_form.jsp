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

	<DIV class="title">Email 중복 확인</DIV>

	<div class="content">

		Email를 입력하세요. <br><br>
	
		</div>
		
		<FORM name='frm' method='POST' action='./email_proc.jsp'>
			<TABLE>
				<TR>
					<TH>Email</TH>
					<TD><input type ="email" name="email" size="20" required="required"></TD>
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
