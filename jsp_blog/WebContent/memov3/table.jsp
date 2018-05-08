<%@ page contentType="text/html; charset=UTF-8" %> 

<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 

<html> 
	<head> 
		<meta charset="UTF-8"> 
		<title></title> 
		<style type="text/css"> 
			*{ 
				font-family: gulim; 
				font-size: 20px; 
			}
			table{
				width:50%;
				
				margin: auto;
			}
			table,th,td{
				border:1px solid black;
				border-spacing: 5px;
				padding: 50px;
			}
			th{
				border-right:1px solid black;
			}
		</style> 
	</head> 
	
	<body> 
		<table>
			<tr>
				<td colspan="5"  bgcolor="#AAFFAA">5%</td>	
			</tr>
			
			<tr>
				<td colspan="4" bgcolor="#AAFFAA">4%</td>
				<td></td>		
			</tr>
			<tr>
				<td colspan="3" bgcolor="#AAFFAA">3%</td>
				<td></td>		
				<td></td>		
			</tr>
			<tr>
				<td colspan="2" bgcolor="#AAFFAA">2%</td>
				<td></td>		
				<td></td>		
				<td></td>		
			</tr>
			<tr>
				<td bgcolor="#AAFFAA">1%</td>
				<td></td>		
				<td></td>		
				<td></td>		
				<td></td>		
			</tr>
		</table>
	
		<table>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th rowspan='5' bgcolor='#AAFFAA'></th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th colspan='2' rowspan='4' bgcolor='#AAFFAA'></th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th rowspan='3' bgcolor='#AAFFAA'></th>
				<th></th>
			</tr>
			<TR>
   				<TH> </TH>
    			<TH colspan='5' rowspan='2' bgcolor='#AAFFAA'></TH>
   				
 			</TR>
 			<TR>
   				<TH colspan='6' rowspan='1' bgcolor='#AAFFAA'></TH>
  			</TR>
		</table>
	</body> 
</html> 