<%--
  Created by IntelliJ IDEA.
  User: pieter
  Date: 17-10-2022
  Time: 14:27
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Meting - AaadTomaat</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
</head>
<body>
    <g:form action="index">
        <table>
            <tr>
                <td>Device</td>
                <td>
                    <g:select name="boxFilter"
                              from="${boxes}"
                              optionValue="id"
                              optionKey="id"
                              value = "${boxFilter}"
                              noSelection="['':'Kies Device']"
                              onchange="submit();"
                    />
                </td>
            </tr>
        </table>
    </g:form>
    <table>
        <thead>
            <tr>
                <th>Device</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
        <g:each in="${boxes}" var="box" status="teller">
            <tr>
                <td>${box.id}</td>
                <td>${box.plaats}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Device</th>
                <th>Sensor</th>
                <th>Waarde</th>
            </tr>
        </thead>
        <tbody>
        <g:each in="${sensorData}" var="meting">
            <tr>
                <td>${meting.tijd}</td>
                <td>${meting.sensor.box.id}</td>
                <td>${meting.sensor.sensorid}</td>
                <td>${meting.waarde}</td>
            </tr>
        </g:each>
        </tbody>
    </table>
<script>
    const labels = [
        ${raw(sensorData*.label.join(','))}
    ];

    const data = {
        labels: labels,
        datasets: [{
            label: 'My First dataset',
            backgroundColor: 'rgb(255,99,132)',
            borderColor: 'rgb(255,99,132)',
            data: [${sensorData.waarde.join(', ')}],
        }]
    };
    const config = {
        type: 'line',
        data: data,
        options: {}
    };

</script>

<script>
    const myChart = new Chart(
        document.getElementById('myChart'),
        config
    );
</script>
</body>
</html>