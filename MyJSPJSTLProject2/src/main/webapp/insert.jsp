<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#output
{
height:200px;
width:80%;
border:2px solid rgb(0, 0, 0);
text-align:center;
background-color:rgb(192, 192, 192);
margin:auto;
}
</style>
</head>
<body>

<%
String firstName=request.getParameter("firstName");
String lastName=request.getParameter("lastName");
int age=Integer.parseInt(request.getParameter("age"));
String phone_number=request.getParameter("phoneNumber");
String jDate=request.getParameter("joinDate");
java.util.Date join_date=null;
SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
try
{
	join_date=sd.parse(jDate);
}
catch(ParseException pe)
{
	pe.printStackTrace();
}



%>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/java_schema" user="root" password="1401"/>
<sql:update dataSource="${myDB}" var="count">
insert into mydata(firstname,lastname,phonenumber,age,join_date) values(?,?,?,?,?)

<sql:param value="<%=firstName%>"></sql:param>
<sql:param value="<%=lastName%>"></sql:param>
<sql:param value="<%=phone_number%>"></sql:param>
<sql:param value="<%=age%>"></sql:param>
<sql:param value="<%=join_date%>"></sql:param>

</sql:update>

<div id="output">
<H1>Record inserted Successfully</H1>
<button onclick="history.back()">Go Back</button>
</div>

</body>
</html>