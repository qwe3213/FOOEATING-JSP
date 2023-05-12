<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ownerChangerForm2.jsp</title>
<script src="./js/jquery-3.6.4.js"></script>
<script type="text/javascript">



 /* $(document).ready(function(){

    $('div').css({
        'font-size' : '0.7em',
        'color' : 'red'
    });
	
	  $("#fr").on("submit", function(e){
		  let descriptions = document.fr.descriptions.value;
		  console.log(descriptions);
		  if(descriptions == ""){
	        	 $('#divdes').html("가게소개를 입력해주세요!");
	        	 alert("빈칸!!");
	        	 e.preventDefault();
		  }
	
	  });
}); */
 
 
 

</script>

</head>
<body>

          
		  
		  <%
		  request.setCharacterEncoding("UTF-8");
		
         // 업로드된 파일이 저장될 공간 => upload 폴더생성
         String uploadPath = request.getRealPath("/upload");
         	System.out.println(uploadPath);
         // -> 톰캣에 저장되는 경로
       
         
         // 업로드 할 파일의 크기 10mb
         int maxSize = 10 * 1024 * 1024;
         
         //  파일 업로드
         MultipartRequest multi = new MultipartRequest(
        		 request,
        		 uploadPath,
        		 maxSize,
        		 "UTF-8",
        		 new DefaultFileRenamePolicy()
        		 );
         System.out.println("MultipartRequest 객체 생성-파일 업로드 성공!");
         
          // 업로드 된 정보를 저장(DB)
          // multipart/form-data form 태그 이므로 일반적인 방법으로는 정보를 못가져옴
          // 작성자
          //String name = request.getParameter("name");
  
          // 파일
          // String file = request.getParameter("file");
          // String file = multi.getParameter("file");
            
       
          // private String name;
          String name = multi.getParameter("name");  
          String category = multi.getParameter("category");  
          String addr_city = multi.getParameter("addr_city");  
          String addr_district = multi.getParameter("addr_district");  
          String addr_etc = multi.getParameter("addr_etc");  
          String rest_tel = multi.getParameter("rest_tel");  
          String runtime = multi.getParameter("runtime");  
          String dayoff = multi.getParameter("dayoff");  
    	%> 
    	
		  <%=name %>
		  <%=category %>
		  <%=addr_city %>
		  <%=addr_district %>
		  <%=addr_etc %>
		  <%=rest_tel %>
		  <%=runtime %>
		  <%=dayoff %>
	<h1>ownerChangeForm2.jsp</h1>
	<fieldset>
		<legend>step2</legend>
		<form action="./ownerChangeForm3.on" name="fr" id="fr" method="post"  enctype="multipart/form-data">
		가게 소개<br>
		<textarea rows="5" cols="50" name="descriptions" placeholder="가게 소개를 적어주세요!"></textarea><br>		
		<div id="divdes"></div>
		<br>
		이미지 첨부(가게 외관, 내부, 메뉴판) <br>
	    <input type="file" name="file_out" ><br>
		<input type="file" name="file_in" ><br>
		<input type="file" name="file_menu" ><br>
		<br>
		편의 시설 <br>
		<input type="hidden" name="dayoff" value="<%=dayoff %>">
		<input type="hidden" name="runtime" value="<%=runtime %>">
		<input type="hidden" name="name" value="<%=name %>">
		<input type="hidden" name="category" value="<%=category %>">
		<input type="hidden" name="addr_city" value="<%=addr_city %>">
		<input type="hidden" name="addr_district" value="<%=addr_district %>">
		<input type="hidden" name="addr_etc" value="<%=addr_etc %>">
		<input type="hidden" name="rest_tel" value="<%=rest_tel %>">
		<input type="checkbox" name="convenience" value="parking" > 주차 공간
		<input type="checkbox" name="convenience" value="toilet" > 화장실 (남/여) <br>
		<input type="checkbox" name="convenience" value="nokidszone" > 노키즈존
		<input type="checkbox" name="convenience" value="takeout" > 포장 가능 <br>
		<input type="checkbox" name="convenience" value="animal" > 반려 동물
		<input type="checkbox" name="convenience" value="wifi" > 와이파이 <br> 
		<br>    
		<input type="submit" value="다음" >
		</form>

	</fieldset>
	

 
 
</body>
</html>