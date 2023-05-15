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

<title>onerChangeForm3.jsp</title>
<body>
	<% request.setCharacterEncoding("UTF-8");


        String convenience = "";
        String[] conveniences = request.getParameterValues("convenience");
       
        if(conveniences!=null){
    	   for(int i = 0 ; i<conveniences.length; i++){
    		   if(conveniences.length-1 == i){
    			   convenience+=conveniences[i];
    		   }else{
    		   convenience+=conveniences[i]+",";    			   
    		   }   		   
    	   }
       }
       String rest_id = request.getParameter("rest_id");
       String name = request.getParameter("name");
       String category = request.getParameter("category");
       String addr_city  = request.getParameter("addr_city");
       String addr_district  = request.getParameter("addr_district");
       String addr_etc = request.getParameter("addr_etc");
       String dayoff = request.getParameter("dayoff");
       String runtime = request.getParameter("runtime");
       String rest_tel = request.getParameter("rest_tel");  
       
  %>
       <%=convenience %> 
       <%=rest_id %>  
       <%=name %>
       <%=category %>
       <%=addr_city %>
       <%=addr_district %>
       <%=addr_etc %>
       <%=dayoff%>
       <%=runtime %>
       <%=rest_tel %>

       
     

 
	<h1>ownerChangeForm3.jsp</h1>
	
	<fieldset>
		<legend>step3</legend>
		<form action="./ownerRequestSuccessAction.on" method="post" enctype="multipart/form-data" name="fr" id="fr">
			1. <br>
			메뉴 이름 : <input type="text" name="menu_name"> <br>
			메뉴 소개 : <input type="text" name="menu_descriptions"> <br>
			메뉴 가격 : <input type="text" name="price"> <br>
			메뉴 이미지 :<input type="file" name="meunfile"> <br>
		    가게 외부 이미지: <input type="file" name="outfile"> <br>
		    가게 내부 이미지 :<input type="file" name="infile"> <br>
		  	<input type="hidden" name="dayoff" value="<%=dayoff %>">
		    <input type="hidden" name="runtime" value="<%=runtime %>">
			<input type="hidden" name="name" value="<%=name %>">
			<input type="hidden" name="category" value="<%=category %>">
			<input type="hidden" name="addr_city" value="<%=addr_city %>">
			<input type="hidden" name="addr_district" value="<%=addr_district %>">
			<input type="hidden" name="addr_etc" value="<%=addr_etc %>">
			<input type="hidden" name="rest_tel" value="<%=rest_tel %>">
			<input type="hidden" name="rest_id" value="<%=rest_id %>">			      
			<input type="submit" value="다음" >
		</form>
	</fieldset>
</body>
</head>
</html>