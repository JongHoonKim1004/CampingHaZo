<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var message = `${message}`;
if(message.trim() == ``){
	alert("잘못된 접근입니다.");
	location.href="/";
} else {
	alert(message);
	location.href="/";
}
</script>
</body>
</html>