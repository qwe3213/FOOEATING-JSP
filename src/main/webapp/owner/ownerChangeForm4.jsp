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
       
         String menu_name1 = multis.getParameter("menu_name1");
         String menu_name2 = multis.getParameter("menu_name2");
         String menu_name3 = multis.getParameter("menu_name3");
         String menu_descriptions1 = multis.getParameter("menu_descriptions1");
         String menu_descriptions2 = multis.getParameter("menu_descriptions2");
         String menu_descriptions3 = multis.getParameter("menu_descriptions3");
         String price1 = multis.getParameter("price1");
         String price2 = multis.getParameter("price2");
         String price3 = multis.getParameter("price3");
         String file1 = multis.getFilesystemName("file1");
         String file2 = multis.getFilesystemName("file2");
         String file3 = multis.getFilesystemName("file3");
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
         String convenience = multis.getParameter("convenience");
         %>  
          <%=file_out %>
          <%=file_in %>
          <%=file_menu %>
          <%=name %>
		  <%=category %>
		  <%=addr_city %>
		  <%=addr_district %>
		  <%=addr_etc %>
		  <%=rest_tel %>
		  <%=runtime %>
		  <%=dayoff %>
          <%=descriptions %>
		  <%=menu_name1 %>
          <%=menu_name2 %>
          <%=menu_name3 %>
          <%=menu_descriptions1 %>
          <%=menu_descriptions2 %>
          <%=menu_descriptions3 %>
          <%=price1 %>
          <%=price2 %>
          <%=price3 %>
          <%=file1 %>
          <%=file2 %>
          <%=file3 %> 
    <h1>ownerChangeForm4.jsp</h1>
    <fieldset>
        <legend>step4</legend>
        <form id="terms_form" action="./ownerRequestSuccess.on" method="post">
            <textarea rows="5" cols="50">약관 내용</textarea><br>
            약관에 동의합니다. <input type="checkbox" id="check_1"><br>
            <textarea rows="5" cols="50">약관 내용</textarea><br>
            약관에 동의합니다. <input type="checkbox" id="check_2"><br>
            <textarea rows="5" cols="50">약관 내용</textarea><br>
            약관에 동의합니다. <input type="checkbox" id="check_3"><br>
            <br>
            <input type="button" value="다음" id="nextBtn">
        </form>
    </fieldset>
</body>
</html>