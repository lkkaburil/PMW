<script type="text/javascript">
function test(){
			document.getElementById("ip").value= "<%=request.getRemoteAddr()%>";
			
					}
			window.onload=test;
			</script>