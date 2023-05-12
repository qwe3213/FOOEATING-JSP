<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
const changeValue = (target) => {
	  // 선택한 option의 value 값
	  console.log(target.value);
	  
	  // option의 text 값
	  console.log(target.options[target.selectedIndex].text);
	}
	
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            
            var roadAddr = data.roadAddress; // 도로명 주소 변수
    
            var extraRoadAddrs = '';
            var extraRoadAddrss = '';

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[산|구|울|전|천|도|주|]$/g.test(data.sido)){
                extraRoadAddrs += data.sido;
            }
            
           
            if(data.bname !== '' && /[시|군|구]$/g.test(data.sigungu)){
                extraRoadAddrss += data.sigungu;
            }
            
           
            console.log(extraRoadAddrs);
            console.log(extraRoadAddrss);
            // 건물명이 있고, 공동주택일 경우 추가한다.
        
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
       
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = extraRoadAddrs;
            document.getElementById("sample4_jibunAddress").value = extraRoadAddrss;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
          

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddrs;
                guideTextBox.innerHTML = '(예상 주소 : ' + extraRoadAddrs + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 시 도 군: ' + extraRoadAddrss + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="./js/jquery-3.6.4.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	    $('div').css({
	        'font-size' : '0.7em',
	        'color' : 'red'
	    });
	    
	  
	    
	     $("#rest_id").keyup(function() {
	    	 let num = /[0-9]{10}$/;
	    	 let Id = document.fr.rest_id.value; 
	         if(num.test(Id)){
	        	 $('#divbpw').html(""); 
	        	
	         }else{
		       $('#divbpw').html("사업자 번호를 똑바로 입력해주세요.");
		
	         }
            
	     });
	     
	     $("#rest_tel").keyup(function() {
	    	 let num = /[0-9]{7}$/;
	    	 let tel = document.fr.rest_tel.value; 
	         if(num.test(tel)){
	        	 $('#divtel').html(""); 
	        	
	         }else{
		       $('#divtel').html("-빼고 번호를 7자 입력해주세요.");
		
	         }
            
	     });
	     
	     $("#fr").on("submit", function(e){
	    	 let num = /[0-9]{10}$/;
	    	 let id = document.fr.rest_id.value;
	    	 let name = document.fr.name.value;
	    	 let category = document.fr.category.value;
	         let addr_district = document.fr.addr_district.value;
	         let addr_etc = document.fr.addr_etc.value;
	         let runtime = document.fr.runtime.value;
	         let dayoff = document.fr.dayoff.value;
	    	 if(!num.test(id)){
	    		 document.fr.rest_id.focus();
	    		 $('#divbpw').html(" - 빼고 10자 입력해주세요.");
	    		 e.preventDefault();
	         }else if(name == ""){
	        	 $('#divrname').html("상호명을 입력해주세요 .");
	        	 e.preventDefault();
	         }else if(category == "업종을 선택해주세요."){
	        	 $('#divrct').html("업종을 입력해주세요 .");
	        	 e.preventDefault();
	         }else if(addr_district == "" ){
	        	 $('#divradrr').html("주소를 입력해주세요.");
		         e.preventDefault();
	         }else if(addr_etc == ""){
	        	 $('#divretcadrr').html("상세주소를 입력해주세요.");
		         e.preventDefault();
	         }else if(runtime == ""){
	        	 $('#divtime').html("영업시간을 입력해주세요.");
		         e.preventDefault();
	         }else if(dayoff == ""){
	        	 $('#divday').html("휴무일을 입력해주세요.");
		         e.preventDefault();
	         }
	    	 
	    	 
	     });
	     
	     
});
	
</script>
 
</head>
<body>
	<h1>ownerChangeform.jsp</h1>
	<fieldset>
		<legend><b>step1</b></legend>
		<form action="./ownerChangeForm2.on" id="fr" name="fr" method="post" enctype="multipart/form-data">
		사업자등록 번호 <br>
		<input type="text" id ="rest_id" name ="rest_id" placeholder="- 빼고 입력해주세요." maxlength="10"><br>
	    <div id="divbpw"></div>
		상호명 <br>
		<input type="text" name ="name" id ="name"placeholder="상호명 입력해주세요."><br>
		<div id="divrname"></div>
		업종 <br>
		<select onchange="changeValue(this)" name="category" id="category">
		    <option>업종을 선택해주세요.</option>
			<option value="ko">한식</option>
			<option value="ja">일식</option>
			<option value="ch">중식</option>
			<option value="we">양식</option>
			<option value="ds">디저트</option>
		</select><br>
		<div id ="divrct"></div>
		주소 <br>
		<input type="text" id="sample4_postcode" placeholder="우편번호" >
        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="addr_city">
		<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="addr_district">
		<span id="guide" style="color:#999;display:none"></span><br>
		<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="addr_etc"><br>
	    <div id="divradrr"></div>
	     <div id="divretcadrr"></div>
		대표 전화 <br>
		<input type="text" name="rest_tel" id="rest_tel" maxlength="7" placeholder="- 빼고 입력해주세요."><br>
		<div id="divtel"></div>
		영업 시간 <br>
		<input type="text" name="runtime" id ="runtime"placeholder="영업시간대를 입력해주세요."><br>
		<div id="divtime"></div>
		정기 휴일 <br>
		<input type="text" name="dayoff" id="dayoff"placeholder="정기휴일을 입력해주세요."><br>
		<div id="divday"></div>
		<br>
		<input type="submit" value="다음">
		</form>
	</fieldset>
</body>
</html>