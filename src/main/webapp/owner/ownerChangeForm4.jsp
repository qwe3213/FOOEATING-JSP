<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script type="text/javascript">
        $(document).ready(function(){
    
            $("#nextBtn").click(function(){    
                if($("#check_1").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                    return;
                }else if($("#check_2").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                    return;
                }else if($("#check_3").is(":checked") == false){
                    alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다...");
                    return;
                }else{
                    $("#terms_form").submit();
                }
            });    
        });
    </script>
</head>
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
      /*  String convenience = "";
          String[] conveniences = multis.getParameterValues("convenience"); */
         String rest_id = multis.getParameter("rest_id");
         String menu_name = multis.getParameter("menu_name");
         String menu_descriptions = multis.getParameter("menu_descriptions");
         String price = multis.getParameter("price");
         String descriptions = multis.getParameter("descriptions");
         String name = multis.getParameter("name");  
         String category = multis.getParameter("category");  
         String addr_city = multis.getParameter("addr_city");  
         String addr_district = multis.getParameter("addr_district");  
         String addr_etc = multis.getParameter("addr_etc");  
         String rest_tel = multis.getParameter("rest_tel");  
         String runtime = multis.getParameter("runtime");  
         String dayoff = multis.getParameter("dayoff"); 
         String convenience = multis.getParameter("convenience");
         %>  
          <%=rest_id %>
          <%=name %>
		  <%=category %>
		  <%=addr_city %>
		  <%=addr_district %>
		  <%=addr_etc %>
		  <%=rest_tel %>
		  <%=runtime %>
		  <%=dayoff %>
          <%=descriptions %>
		  <%=menu_name %>  
          <%=menu_descriptions %>   
          <%=price%>      
          <%=convenience %>
  
    <h1>ownerChangeForm4.jsp</h1>
    <fieldset>
        <legend>step4</legend>
        <form id="terms_form" action="./ownerRequestSuccessAction.on" method="post">
            <textarea rows="5" cols="50">약관 내용</textarea><br>
            약관에 동의합니다. <input type="checkbox" id="check_1"><br>
            <textarea rows="5" cols="50">약관 내용</textarea><br>
            약관에 동의합니다. <input type="checkbox" id="check_2"><br>
            <textarea rows="5" cols="50">약관 내용</textarea><br>
            약관에 동의합니다. <input type="checkbox" id="check_3"><br>
            <br>
            <input type="hidden" name="dayoff" value="<%=dayoff %>">
		    <input type="hidden" name="runtime" value="<%=runtime %>">
	  	    <input type="hidden" name="category" value="<%=category %>">
		    <input type="hidden" name="addr_city" value="<%=addr_city %>">
		    <input type="hidden" name="addr_district" value="<%=addr_district %>">
		    <input type="hidden" name="addr_etc" value="<%=addr_etc %>">
		    <input type="hidden" name="rest_tel" value="<%=rest_tel %>">
		    <input type="hidden" name="descriptions" value="<%=descriptions %>">
		    <input type="hidden" name="name" value="<%=name%>">	  
		    <input type="hidden" name="rest_id" value="<%=rest_id%>">
		    <input type="hidden" name="menu_name" value="<%=menu_name%>">
		    <input type="hidden" name="menu_descriptions" value="<%=menu_descriptions%>">
		    <input type="hidden" name="price" value="<%=price%>">
		    <input type="hidden" name="convenience" value="<%=convenience%>">
		    
            <input type="button" value="다음" id="nextBtn">
        </form>
    </fieldset>
</body>
</html>