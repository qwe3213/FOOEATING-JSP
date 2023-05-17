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
   
    <h1>ownerChangeForm4.jsp</h1>
    <fieldset>
        <legend>step4</legend>
        <form id="terms_form" action="./ownerChangeForm2.on" method="post">
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