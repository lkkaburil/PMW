<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import ="java.util.*" %>
<%@ page import ="utility.*" %> 
<%@ page import ="member.*" %> 
<%@ page import ="bbs.*" %>
<%@ page import ="memo.*" %>
<%@ page import ="guest.*" %>
<%@ page import ="image.*" %>

<%@ page import ="org.apache.commons.fileupload.*" %>

<%    request.setCharacterEncoding("utf-8");
      String root = request.getContextPath();
      
      String tempDir = "/member/temp"; 		//임시폴더
      String upDir = "/member/storage";  	//실제 파일이 들어갈 폴더
      
      tempDir = application.getRealPath(tempDir);
      upDir = application.getRealPath(upDir); 		//서버상의 절대 경로를 위해(?)
      
            
      String tempDir2 = "/bbs/temp"; 		//임시폴더
      String upDir2 = "/bbs/storage";  	//실제 파일이 들어갈 폴더
      
      tempDir2 = application.getRealPath(tempDir2);
      upDir2 = application.getRealPath(upDir2); 		//서버상의 절대 경로를 위해(?)
      
      String tempDir3 = "/image/temp"; 		//임시폴더
      String upDir3 = "/image/storage";  	//실제 파일이 들어갈 폴더
      
      tempDir3 = application.getRealPath(tempDir3);
      upDir3 = application.getRealPath(upDir3); 		//서버상의 절대 경로를 위해(?)

%> 
 
