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
            <a href="../sensoren/index" role="button" aria-haspopup="true" aria-expanded="false">Graphs<span class="caret"></span></a>
        </li>
        <li class="dropdown">
            <a href="" role="button" aria-haspopup="true" aria-expanded="false">View setpoints<span class="caret"></span></a>
        </li>
        <li class="dropdown">
            <a href="" role="button" aria-haspopup="true" aria-expanded="false">Work notes<span class="caret"></span></a>
        </li>
        <li class="dropdown">
            <a href="../sensorinfomation/index" role="button" aria-haspopup="true" aria-expanded="false">Sensor information<span class="caret"></span></a>
        </li>
        <li class="dropdown">
            <a href="../machineLearning/index">Machine Learning<span class="caret"></span></a>
        </li>
    </content>
    <g:form action="index">
        <table>
            <tr>
                <td>From date</td>
                <td>
                    <g:datePicker   name = "fromDate"
                                    from = "${new Date()}"
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
                    <td>${sensor.sensorid}</td>
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
    const labels = [ ${raw(sensorData*.label.join(','))} ];
    const filteredLabels = [];
    let c = 0;
    labels.forEach(item => {
        if(!filteredLabels.includes(item)){
            filteredLabels[c] = item;
            c++;
        }
    })
    const values = { items: [${sensorData.waarde.join(',')}] };
    const humidity = [];
    const temperature = [];
    const occupation = [];
    const co2 = [];
    const luminosity = [];
    const windspeed = [];
    const winddirection = [];
    let i = 0;

    '${sensorData.sensor.soort}'.split(', ').forEach(item => {
        if (item.includes('[')){
            item = item.replace('[', '');
        }
        if (item.includes(']')){
            item = item.replace(']', '');
        }

        switch (item) {
            case 'humidity':
                humidity.push(values.items.at(i));
                break;
            case 'temperature':
                temperature.push(values.items.at(i));
                break;
            case 'occupation':
                occupation.push(values.items.at(i));
                break;
            case 'co2':
                co2.push(values.items.at(i));
                break;
            case 'luminosity':
                luminosity.push(values.items.at(i));
                break;
            case 'windsnelheid':
                windspeed.push(values.items.at(i));
                break;
            case 'windrichting':
                winddirection.push(values.items.at(i));
                break;
        }

        i++;
    })

    console.log("humidity = " + humidity);
    console.log("temperature = " + temperature);
    console.log("occupation = " + occupation);
    console.log("co2 = " + co2);
    console.log("luminosity = " + luminosity);
    console.log("windspeed = " + windspeed);
    console.log("winddirection = " + winddirection);

    const data = {
        labels: filteredLabels,
        datasets: [
            {
                label: 'Humidity',
                backgroundColor: 'rgb(56,161,225)',
                borderColor: 'rgb(56,161,225)',
                data: humidity
            },
            {
                label: 'Temperature',
                backgroundColor: 'rgb(210,28,66)',
                borderColor: 'rgb(210,28,66)',
                data: temperature
            },
            {
                label: 'Occupation',
                backgroundColor: 'rgb(143,218,29)',
                borderColor: 'rgb(143,218,29)',
                data: occupation
            },
            {
                label: 'Co2',
                backgroundColor: 'rgb(80,35,238)',
                borderColor: 'rgb(80,35,238)',
                data: co2
            },
            {
                label: 'Luminosity',
                backgroundColor: 'rgb(227,153,79)',
                borderColor: 'rgb(227,153,79)',
                data: luminosity
            },
            {
                label: 'Wind speed',
                backgroundColor: 'rgb(183,168,232)',
                borderColor: 'rgb(183,168,232)',
                data: windspeed
            },
            {
                label: 'Wind direction',
                backgroundColor: 'rgb(154,122,89)',
                borderColor: 'rgb(154,122,89)',
                data: winddirection
            }
        ]
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