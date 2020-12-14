<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%! int interest=5; %>
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>


</head>
<body >
<script type="text/javascript">

	function select() {
		var index=$("#hid123").val();
		alert(index);
		$.ajax({
    		type:"post",
    		url:"NewFile4.jsp",
    		data:{"index":index},
    		success:function(data){
    		var interest=data;
    		$("#interest").html(interest);
    		
    		}
    		
    	});
		
		
	}
</script>
<form action="">
	<input id="hid123" type="text" value="all"></input>
	<button id="n1" type="button" onclick="select()">下一个</button>
	<text id="interest"><%=interest%></text>
</form>
</body>

</html>