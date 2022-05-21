<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>
	<title>상품등록</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   	<link href="/css/animate.min.css" rel="stylesheet">
   	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   	
   	
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
   	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
	
	
	<script type="text/javascript">
		
		$(function(){
			
			 $('#summernote').summernote({
					// 에디터 높이
			        height: 500,
			        // 에디터 한글 설정
			        lang: "ko-KR",
			        // 에디터에 커서 이동 (input창의 autofocus라고 생각)
			        focus : true,
			        toolbar: [
			            // 글꼴 설정
			            ['fontname', ['fontname']],
			            // 글자 크기 설정
			            ['fontsize', ['fontsize']],
			            // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
			            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			            // 글자색
			            ['color', ['forecolor','color']],
			            // 표만들기
			            ['table', ['table']],
			            // 글머리 기호, 번호매기기, 문단정렬
			            ['para', ['ul', 'ol', 'paragraph']],
			            // 줄간격
			            ['height', ['height']],
			         	// 그림첨부
			            ['insert', ['picture']],
			            // 코드보기, 확대해서보기, 도움말
			            ['view', ['fullscreen', 'help']]			            
			        ],
			        // 추가한 글꼴
			        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			        // 추가한 폰트사이즈
			        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			        
			        callbacks: {
			            onImageUpload: function(files, editor, welEditable) {
			            	// 파일 업로드(다중업로드를 위해 반복문 사용)
			            	for(var i=files.length-1; i>=0; i--){
			            		console.log("aaa");
			            		uploadSummernoteImageFile(files[i], this);	
			            	}
			            }
			        }
			 });			
		});
		
		function uploadSummernoteImageFile(file, el) {
			console.log("bbb");
			data = new FormData();
			data.append('file', file);
			$.ajax({
				data: data,
				type: "POST",
				url: "/product/uploadSummernoteImageFile",
				contentType: false,
				enctype: "multipart/form-data",
				processData: false,
				success: function(data){
					console.log(data);
					$(el).summernote("editor.insertImage", "/images/uploadFiles/"+data);
				}
				
				
			});
		}
		
	</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">상 품 등 록</h3>
	    </div>
	    
		<!-- <div id="summernote">Hello Summernote</div> -->
		
		<form method="post" action="/product/addSummer">
		  
		  <textarea id="summernote" name="content" rows="10"></textarea>
		  
		  <br/><br/>
		  
		  <button type="submit" id="submit" name="submit" class="btn btn-primary pull-right">Submit Form</button>
		  
		</form>
		
		
	</div>
	<!--  화면구성 div end /////////////////////////////////////-->

</body>
</html>