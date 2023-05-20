<%@page import="javax.swing.SwingConstants"%>
<%@page import="javax.swing.JLabel"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- css파일 -->
<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" href="assets/css/owl-carousel.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/question.css">

<title>점주 전환</title>

<script src="./js/jquery-3.6.4.js"></script>
<script type="text/javascript">
  $(document).ready(function(){

//     $('div').css({
//         'font-size' : '0.7em',
//         'color' : 'red'
//     });
	
	  $("#fr").on("submit", function(e){
		  let descriptions = document.fr.descriptions.value;
		  console.log(descriptions);
		  if(descriptions == ""){
	        	 $('#divdes').html("가게소개를 입력해주세요!");
	        	 alert("빈칸!!");
	        	 e.preventDefault();
		  }
	
	  });
}); 
 
</script>


<title>onerChangeForm3.jsp</title>
<body>

<!-- ***** Preloader Start ***** --> <!-- !!가운데 로딩 점!! -->
<div id="preloader">
    <div class="jumper">
        <div></div>
        <div></div>
        <div></div>
    </div>
</div>
<!-- ***** Preloader End ***** -->


<!-- ***** Header Area Start ***** -->
	<jsp:include page="../inc/headerDiv.jsp" />
<!-- ***** Header Area End ***** -->


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

<!-- main -->
<main>
	<div id="top">
	<div style="margin:0% 40% 0% 40%; ">
	<br>
	<fieldset style="text-align: left; color: rgb(0,0,0); font-size: small;">
		<legend style="">step3</legend>
		<form action="./ownerRequestSuccessAction.on" method="post" enctype="multipart/form-data" name="fr" id="fr">
		    가게 소개<br>
		    <textarea rows="5" cols="50" name="descriptions" placeholder="가게 소개를 적어주세요!"></textarea><br>
		    <br><br>	
		    <div id="divdes"></div>
			메뉴 이름 : <input type="text" name="menu_name" style="margin-bottom: 5px;"> <br>
			메뉴 소개 : <input type="text" name="menu_descriptions" style="margin-bottom: 5px;"> <br>
			메뉴 가격 : <input type="text" name="price"> <br>
			<br><br>
			메뉴 이미지 <input type="file" name="menufile" style="margin-bottom: 5px; "> <br>
		   	가게 외부 이미지 <input type="file" name="outfile" style="margin-bottom: 5px; "> <br>
		    가게 내부 이미지 <input type="file" name="infile" > <br>
		    
		  	<input type="hidden" name="dayoff" value="<%=dayoff %>">
		    <input type="hidden" name="runtime" value="<%=runtime %>">
			<input type="hidden" name="name" value="<%=name %>">
			<input type="hidden" name="category" value="<%=category %>">
			<input type="hidden" name="addr_city" value="<%=addr_city %>">
			<input type="hidden" name="addr_district" value="<%=addr_district %>">
			<input type="hidden" name="addr_etc" value="<%=addr_etc %>">
			<input type="hidden" name="rest_tel" value="<%=rest_tel %>">
			<input type="hidden" name="rest_id" value="<%=rest_id %>">      
			<input type="hidden" name="convenience" value="<%=convenience %>">   
			<br><br>
			<div style="text-align: right;">
				<input class="btn-2" type="submit" value="다음" >
			</div>
		</form>
	</fieldset>
			<br>
	</div>
	</div>
</main>
<!-- main -->
</body>


<!-- ***** Footer Start ***** -->
	<jsp:include page="../inc/footerDiv.jsp" />
<!-- ***** Footer End ***** -->

<!-- jQuery -->
<script src="assets/js/jquery-2.1.0.min.js"></script>

<!-- Bootstrap -->
<script src="assets/js/popper.js"></script>
<script src="assets/js/bootstrap.min.js"></script>

<!-- Plugins -->
<script src="assets/js/owl-carousel.js"></script>
<script src="assets/js/accordions.js"></script>
<script src="assets/js/datepicker.js"></script>
<script src="assets/js/scrollreveal.min.js"></script>
<script src="assets/js/waypoints.min.js"></script>
<script src="assets/js/jquery.counterup.min.js"></script>
<script src="assets/js/imgfix.min.js"></script> 
<script src="assets/js/slick.js"></script> 
<script src="assets/js/lightbox.js"></script> 
<script src="assets/js/isotope.js"></script> 

<!-- Global Init -->
<script src="assets/js/custom.js"></script>
<script>
    $(function() {
        var selectedClass = "";
        $("p").click(function(){
        selectedClass = $(this).attr("data-rel");
        $("#portfolio").fadeTo(50, 0.1);
            $("#portfolio div").not("."+selectedClass).fadeOut();
        setTimeout(function() {
          $("."+selectedClass).fadeIn();
          $("#portfolio").fadeTo(50, 1);
        }, 500);
            
        });
    });
</script>


</body>
</html>