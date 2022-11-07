<%--
  Created by IntelliJ IDEA.
  User: pieter
  Date: 17-10-2022
  Time: 14:27
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <script src="https://cdn."></script>
</head>

<body>
<g:form>
    <table>
        <tr><td>Box</td><td><g:textField name="boxFilter" value="${boxFilter}"/></td></tr>
        <tr><td>Sensor</td><td><g:textField name="sensorFilter" value="${sensorFilter}"/></td></tr>
        <tr><td>Plaats</td><td><g:textField name="plaatsFilter" value="${plaatsFilter}"/></td></tr>
    </table>
</g:form>
<table>
    <g:each in="${sensor}" var="sensor" status="teller">
        <tr>
            <td>${sensor.sensorId}</td>
            <td>${sensor.box.plaats}</td>
            <td>${sensor.box.id}</td>
        </tr>
    </g:each>
</table>
</body>
</html>