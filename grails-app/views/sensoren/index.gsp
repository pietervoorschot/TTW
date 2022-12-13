<%--
  Created by IntelliJ IDEA.
  User: pieter
  Date: 17-10-2022
  Time: 14:27
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>TunnelTomatoes Application - Graphs</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
</head>
<body>
    <content tag="nav">
        <li class="dropdown">
            <a href="sensoren/index" role="button" aria-haspopup="true" aria-expanded="false">Graphs<span class="caret"></span></a>
        </li>
        <li class="dropdown">
            <a href="#" role="button" aria-haspopup="true" aria-expanded="false">View setpoints<span class="caret"></span></a>
        </li>
        <li class="dropdown">
            <a href="#" role="button" aria-haspopup="true" aria-expanded="false">Work notes<span class="caret"></span></a>
        </li>
    </content>
    <g:form action="index">
        <table>
            <tr>
                <td>From date</td>
                <td>
                    <g:datePicker   name = "fromDate"
                                    from = "${new Date()}"
                                    precision = "day"
                                    optionValue = "tijd"
                                    optionKey = "tijd"
                                    value = "${startDateFilter}"
                                    noSelection = "['':'-Choose-']"
                                    onchange = "submit();"
                    />
                </td>
            </tr>
            <tr>
                <td>To date</td>
                <td>
                    <g:datePicker   name = "toDate"
                                    from = "${new Date()}"
                                    optionValue = "tijd"
                                    optionKey = "tijd"
                                    precision = "day"
                                    value = "${endDateFilter}"
                                    noSelection = "['':'-Choose-']"
                                    onchange = "submit();"
                    />
                </td>
            </tr>
            <tr>
                <td>Device</td>
                <td>
                    <g:select   name = "boxFilter"
                                from = "${boxes}"
                                optionValue = "id"
                                optionKey = "id"
                                value = "${boxFilter}"
                                noSelection = "['':'Kies Device']"
                                onchange = "submit();"
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
                <th>SensorId</th>
                <th>Soort</th>
                <th>Eenheid</th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${sensors}" var="sensor" status="teller">
                <tr>
                    <td>${sensor.id}</td>
                    <td>${sensor.soort}</td>
                    <td>${sensor.eenheid}</td>
                </tr>
            </g:each>
        </tbody>
    </table>
    <table>
        <thead>
            <tr>
                <th>Date</th>
                <th>Device</th>
                <th>SensorId</th>
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

<div>
    <canvas id="myChart"></canvas>
</div>
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