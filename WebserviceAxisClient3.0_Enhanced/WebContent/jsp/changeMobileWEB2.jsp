<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bean.MD5Util" %>
 <%@page import="com.bean.GlobalUtil" %>
<%@page import="java.util.*"%>
<%
String endpoint1 = GlobalUtil.endpoint1;
System.out.println(endpoint1);
//参数装填
String appId= request.getParameter("appId");
String userId= request.getParameter("userId");
String identityId=request.getParameter("identityId");
String newMobile=request.getParameter("newMobile");
String oldMobile=request.getParameter("oldMobile");
String appSecretKey= request.getParameter("appSecretKey");
/* String orderId = request.getParameter("orderId"); */
String signType = request.getParameter("signType");
Date needdate = new Date();
long needtime = needdate.getTime();
String time = needtime + "";
//MD5拼接，校验
String md5str= appId + "&" +newMobile+"&" +oldMobile+"&" +identityId+"&"+ time + "&" + userId;
String md5str1=md5str+"&"+appSecretKey;
String sign = MD5Util.MD5Encode(md5str1,"GBK");

String requestIp="";


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
function setRecovery()
     {
     	 document.form4.submit();
     }

</script>
</head>
<body>
<form id="form4" name="form4" method="post" action="<%=request.getContextPath() %>/changeMobileTest">
 <input type="hidden" name="appId" id="appId" value="<%=appId%>">
  <input type="hidden" name="time" id="time" value="<%=time %>">
 <input type="hidden" name="sign" id="sign" value="<%=sign %>">
 <input type="hidden" name="signType" id="signType" value="<%=signType %>">
 <input type="hidden" name="requestIp" id="requestIp" value="<%=requestIp %>">
<%--  <input type="hidden" name="orderId" id="orderId" value="<%=orderId %>"> --%>
 <input type="hidden" name="userId" id="userId" value="<%=userId %>">
 <input type="hidden" name="identityId" id="identityId" value="<%=identityId %>">
 <input type="hidden" name="newMobile" id="newMobile" value="<%=newMobile %>">
 <input type="hidden" name="oldMobile" id="oldMobile" value="<%=oldMobile %>">
 <input type="button" value="查看" class="adduser_btn" onclick="setRecovery();">
</body>
</html>