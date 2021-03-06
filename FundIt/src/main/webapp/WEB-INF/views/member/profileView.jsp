<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>

div#profile-inner-container1{
	padding: 5%;
	margin: 2% auto 0;
	position: relative;
	width:100%;
	box-sizing: border-box;
	text-align: center;
	
}

div#profile-preview1{
	border: 2px dashed lightgray;
	width: 250px;
	min-height: 150px;
	display: inline-block;
	padding:1%;
	position: relative;
	border-radius: 5%;
	margin-left:20px; 
	vertical-align:top;
	box-sizing: border-box;
    text-align: left;
}
div#profile-preview1 img{
	width: 70px;
	height: 70px;
	border-radius: 50%;
	margin-right:3%;
}
div#profile-img1{
	margin: auto 0;
}
div#profile-img1 img{
	width: 70px;
	height: 70px;
	border-radius: 50%;
}
div#profile-file1{
	margin: auto 0;
}
div#profile-file1 p#img-ex1{
	font-size: 11px;	
}
#file1{
	margin-right: 5px;
	margin-bottom: 5px;
}
div#around2{
	border: 2px dashed lightgray;
	border-radius:50px;
	padding: 4%;
	width:670px;
	position: relative;
	display:inline-block;
	
}
@media ( max-width: 1024px ){
	div#profile-preview1{
		width:0%;
		display : none;
	}
	div#profile-container1{
		width :100%;
		padding-top: 40px;
		margin:auto;
	}
	div#around2{
		margin:0 auto;
		width: 80%;
	}
}
</style>
<script>
var file;
$(document).ready(function(){
	$("#file1").on("change",handleFileSelect);
});


/* //파일 업로드 ajax
$("#send").on("click",function(){
	var formData = new FormData();
	
	formData.append('uploadFile',$("#file1").files);
	console.log(formData.append('uploadFile',$("#file1").files));
	$.ajax({
		url:"profileUpdate.do",
		data: formData,
		processData:false,
		contentType:false,
		type:"POST",
		success:function(data){
			alert("수정완료");
		}
	});
	
}); */
function handleFileSelect(evt){
	var files = evt.target.files;
	
	for(var i = 0; f= files[i]; i++){
		
		if(!f.type.match("image.*")){
			alert("이미지 파일만!");
			return true;
		}
		var reader = new FileReader();
		reader.onload = function(e){
			$("#imgpro").attr("src",e.target.result);
			$("#previewImg").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	}
}
var length='';
$(function(){
	var num = $("#cnt").text($("#introduce").val().length);
	
	$("#name").on("keyup",function(){
		var nameIn=$(this).val();
		console.log(nameIn);
		$("#pre-name").text(nameIn);
	});
	$("#introduce").on("keyup",function(){
		var intro = $(this).val();
		$("#pre-intro").text(intro);
		
		var length = intro.length;
		var letter = $("#cnt").text(length);
		console.log("dfdsfa"+length);
		/* console.log(letter); */
		/* console.log(intro);
		if(length>letter){
			var cnt = length -letter;
			$()
		} */
		if(length>100){
			  $(this).val($(this).val().substring(0, 100));
			  $("#cnt").css("color","red");
		}else{
			  $("#cnt").css("color","black");
		}
	});
});

function validate(){
	var tel = $("#phoneNum").val();
	
	var regExp = /^[0-9]+$/;
	
	if ( !regExp.test( tel ) ) {
	      alert("잘못된 휴대폰 번호입니다. 숫자만 입력하세요.");
	      return false
	} 
	
	
}
</script>

<div id="profile-inner-container1">
	<div id="around2">
		<form action="profileUpdate.do" id="proFrm"name="proFrm" method="post" enctype="multipart/form-data" autocomplete="off" onsubmit="return validate();">
		<input type="hidden" name="email" value="${param.email }" />
	<div id="profile-image1" class="form-group row">
		<label for="profile-img1" class="col-form-label col-sm-3"  >프로필 사진 </label>
		<div id="profile-img1" class="form-group row">
		<c:if test="${profile.profileImage eq null}">
			<img alt="프로필사진선택" id="imgpro" src="${pageContext.request.contextPath }/resources/images/surprised.png">
		</c:if>
		<c:if test="${profile.profileImage ne null }">
			<img alt="프로필사진선택" id="imgpro" src="${pageContext.request.contextPath }/resources/upload/profileImg/${profile.profileImage}">
		</c:if>
		</div>
		<div id="profile-file1" class="form-group row col-5">
			<input type="file" id="file1" name="profileImage" class="btn btn-sm">
			<input type="hidden" name="file2" value="${profile.profileImage }" />
			<!-- <label for="file1"class="filename">선택된 파일 없음</label> -->
			<p id="img-ex1">이미지는 jpg, gif, png파일을 지원합니다.</p>
		</div>
	
	</div>
	<hr />
	<div id="profile-name" class="form-group row">
		<label for="name" class="col-form-label col-sm-3">이름</label>
		<input type="text" name="name" id="name" class="col-sm-3 form-control" value="${memberLoggedIn.name }" readonly/>
	</div>
	<hr />
	<div id="profile-local" class="form-group row">
		<label for="localCode" class="col-form-label col-sm-3">지역</label>
		 <select class="custom-select col-sm-5" id="localCode" name="localCode">
		    <option selected value="">지역을 고르세요</option>
		    <option value="L1" ${profile.localCode eq "L1"?"selected":""}>서울</option>
		    <option value="L2" ${profile.localCode eq "L2"?"selected":""}>부산</option>
		    <option value="L3" ${profile.localCode eq "L3"?"selected":""}>대구</option>
		    <option value="L4" ${profile.localCode eq "L4"?"selected":""}>인천</option>
		    <option value="L5" ${profile.localCode eq "L5"?"selected":""}>광주</option>
		    <option value="L6" ${profile.localCode eq "L6"?"selected":""}>대전</option>
		    <option value="L7" ${profile.localCode eq "L7"?"selected":""}>울산</option>
		    <option value="L8" ${profile.localCode eq "L8"?"selected":""}>경기</option>
		    <option value="L9" ${profile.localCode eq "L9"?"selected":""}>강원</option>
		    <option value="L10" ${profile.localCode eq "L10"?"selected":""}>충북</option>
		    <option value="L11" ${profile.localCode eq "L11"?"selected":""}>충남</option>
		    <option value="L12" ${profile.localCode eq "L12"?"selected":""}>전북</option>
		    <option value="L13" ${profile.localCode eq "L13"?"selected":""}>전남</option>
		    <option value="L14" ${profile.localCode eq "L14"?"selected":""}>경북</option>
		    <option value="L15" ${profile.localCode eq "L15"?"selected":""}>경남</option>
		    <option value="L16" ${profile.localCode eq "L16"?"selected":""}>제주</option>
		  </select>
	</div>
	<hr />
	<div id="profile-local" class="form-group row">
		<label for="introduce" class="col-form-label col-sm-3">소개</label>
	 	<textarea style="resize: none;" name="profileIntroduce" class="form-control col-6" id="introduce" rows="4" placeholder="100자이내" >${profile.profileIntroduce }</textarea> <br />
 		 	<br /><br /><br />
 		 	<span id="cnt" style="text-align:right">0</span>/100자
		 	
	</div>
	 	
	<hr />
	<div id="profile-local" class="form-group row">
		<label for="phoneNum" class="col-form-label col-sm-3">전화번호</label>
		<input type="text" name="phoneNum" id="phoneNum" class="col-sm-5 form-control" maxlength="11" placeholder="'-'없을 제외한 전화번호" value="${profile.phone }"/>
	</div>
	
	<hr />
	
		<input type="submit" value="수정하기" id="send" class="btn btn-danger btn-lg">
	</form>
	</div>
	
	<div id="profile-preview1">
		<span id="preview-text">프로필카드 미리보기</span> <br />
		<br />
		<div id="inner-preview1">
			<img alt="미리보기 이미지" src="${pageContext.request.contextPath }/resources/upload/profileImg/${profile.profileImage}" id="previewImg">
			<span id="pre-name">${memberLoggedIn.name }</span> <br />
		</div>
		<br />
		<span id="pre-intro">${profile.profileIntroduce}</span>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>