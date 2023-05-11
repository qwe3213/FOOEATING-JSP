<%@page import="javax.swing.SwingConstants"%>
<%@page import="javax.swing.JLabel"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="./js/jquery-3.6.4.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$('div').css({
        'font-size' : '0.7em',
        'color' : 'red'
    });
	  $("#fr").on("submit", function(e){
		  let menu_name1 = document.fr.menu_name1.value;
		  let menu_descriptions1 = document.fr.menu_descriptions1.value;
		  let price1 = document.fr.price1.value;
		  
	
		  if(descriptions == ""){
	        	 $('#divdes').html("가게소개를 입력해주세요!");
	        	 alert("빈칸!!");
	        	 e.preventDefault();
		  }
	
	  });
	
});

</script> -->
<title>onerChangeForm3.jsp</title>
<body>
	<% request.setCharacterEncoding("UTF-8");

         // 업로드된 파일이 저장될 공간 => upload 폴더생성
         
         String uploadPath = application.getRealPath("/upload");
         	System.out.println(uploadPath);
         	// -> 톰캣에 저장되는 경로
       
         
         // 업로드 할 파일의 크기 10mb
         int maxSize = 10 * 1024 * 1024;
         
         //  파일 업로드
         MultipartRequest multis = new MultipartRequest(
        		 request,
        		 uploadPath,
        		 maxSize,
        		 "UTF-8",
        		 new DefaultFileRenamePolicy()
        		 );
         System.out.println("MultipartRequest 객체 생성-파일 업로드 성공!");
//          MultipartRequest multi = new MultipartRequest(
//         		 request,
//         		 uploadPath,
//         		 maxSize,
//         		 "UTF-8",
//         		 new DefaultFileRenamePolicy()
//         		 );
          // 업로드 된 정보를 저장(DB)
          // multipart/form-data form 태그 이므로 일반적인 방법으로는 정보를 못가져옴
          // 작성자
          //String name = request.getParameter("name");
  
          // 파일
       
          // String file = multi.getParameter("file");
            
           //  String file_out = multi.getFilesystemName("file_out");
       String convenience = "";
       String[] conveniences = multis.getParameterValues("convenience");
       
       if(conveniences!=null){
    	   for(int i = 0 ; i<conveniences.length; i++){
    		   if(conveniences.length-1 == i){
    			   convenience+=conveniences[i];
    		   }else{
    		   convenience+=conveniences[i]+",";    			   
    		   }   		   
    	   }
       }
         String descriptions = multis.getParameter("descriptions");
         String file_out = multis.getFilesystemName("file_out");
         String file_in = multis.getFilesystemName("file_in");
         String file_menu = multis.getFilesystemName("file_menu");
         String name = multis.getParameter("name");  
         String category = multis.getParameter("category");  
         String addr_city = multis.getParameter("addr_city");  
         String addr_district = multis.getParameter("addr_district");  
         String addr_etc = multis.getParameter("addr_etc");  
         String rest_tel = multis.getParameter("rest_tel");  
         String runtime = multis.getParameter("runtime");  
         String dayoff = multis.getParameter("dayoff"); 
         %>  
         
          <%=file_out %>
          <%=file_in %>
          <%=file_menu %>
          <%=name %>
          <%=category %>
          <%=addr_city %>
          <%=addr_district %>
          <%=rest_tel %>
          <%=runtime %>
          <%=dayoff %>
          <%=convenience %>
          <%=descriptions %>
 
           <img src="./upload/<%=file_out%>"><br>	
           <img src="./upload/<%=file_in%>"><br>	
           <img src="./upload/<%=file_menu%>"><br>	
          
          ${file_out }
          <br>
     

 
	<h1>ownerChangeForm3.jsp</h1>
	
	<fieldset>
		<legend>step3</legend>
		<form action="./ownerChangeForm4.on" method="post" enctype="multipart/form-data" name="fr" id="fr">
			1. <br>
			메뉴 이름 : <input type="text" name="menu_name1"> <br>
			메뉴 소개 : <input type="text" name="menu_descriptions1"> <br>
			메뉴 가격 : <input type="text" name="price1"> <br>
			<input type="file" name="file1"> <br>
			<br>
			2. <br>
			메뉴 이름 : <input type="text" name="menu_name2"> <br>
			메뉴 소개 : <input type="text" name="menu_descriptions2"> <br>
			메뉴 가격 : <input type="text" name="price2"> <br>
			<input type="file" name="file2"> <br>
			<br>
			3. <br>
			메뉴 이름 : <input type="text" name="menu_name3"> <br>
			메뉴 소개 : <input type="text" name="menu_descriptions3"> <br>
			메뉴 가격 : <input type="text" name="price3"> <br>
			<input type="file" name="file3"> <br>
			<br>
			<input type="hidden" name="dayoff" value="<%=dayoff %>">
		    <input type="hidden" name="runtime" value="<%=runtime %>">
	  	    <input type="hidden" name="category" value="<%=category %>">
		    <input type="hidden" name="addr_city" value="<%=addr_city %>">
		    <input type="hidden" name="addr_district" value="<%=addr_district %>">
		    <input type="hidden" name="addr_etc" value="<%=addr_etc %>">
		    <input type="hidden" name="rest_tel" value="<%=rest_tel %>">
		    <input type="hidden" name="descriptions" value="<%=descriptions %>">
		    <input type="hidden" name="file_out" value="<%=file_out %>">
		    <input type="hidden" name="file_in" value="<%=file_in %>">
		    <input type="hidden" name="file_menu" value="<%=file_menu %>">
		    <input type="hidden" name="name" value="<%=name%>">	    
			<input type="submit" value="다음" >
		</form>
	</fieldset>
</body>
</head>
</html>