<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>
	<title>��ǰ���</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
   	
   	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
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
					// ������ ����
			        height: 300,
			        // ������ �ѱ� ����
			        lang: "ko-KR",
			        // �����Ϳ� Ŀ�� �̵� (inputâ�� autofocus��� ����)
			        focus : true,
			        toolbar: [
			            // �۲� ����
			            ['fontname', ['fontname']],
			            // ���� ũ�� ����
			            ['fontsize', ['fontsize']],
			            // ����, ����Ӳ�, ����,��� ��, ���������
			            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			            // ���ڻ�
			            ['color', ['forecolor','color']],
			            // ǥ�����
			            ['table', ['table']],
			            // �۸Ӹ� ��ȣ, ��ȣ�ű��, ��������
			            ['para', ['ul', 'ol', 'paragraph']],
			            // �ٰ���
			            ['height', ['height']],
			            // �ڵ庸��, Ȯ���ؼ�����, ����
			            ['view', ['codeview','fullscreen', 'help']]
			        ],
			        // �߰��� �۲�
			        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','���� ���','�ü�','����ü','����','����ü','����ü'],
			        // �߰��� ��Ʈ������
			        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
			 });
			
		});
		
	</script>
</head>

<body bgcolor="#ffffff" text="#000000">

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">�� ǰ �� ��</h3>
	    </div>
	    
		<!-- <div id="summernote">Hello Summernote</div> -->
		
		<form method="post" action="/product/addSummer">
		  
		  <textarea id="summernote" name="boardContents" rows="10"></textarea>
		  
		  <br/><br/>
		  
		  <button type="submit">���</button>
		  
		</form>
		
		
	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->

</body>
</html>