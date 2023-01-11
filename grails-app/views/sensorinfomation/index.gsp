<%--
  Created by IntelliJ IDEA.
  User: araml
  Date: 14-12-2022
  Time: 14:05
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main"/>
        <title>TunnelTomatoes Application - Sensorinfo</title>
        <asset:stylesheet src="application.css"/>
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
    <div id="content" role="main">
        <div class="container">
            <section class="row colset-2-its">
                <h1>Sensor Infomation</h1>
                <form action="../sensorinfomation/index">
                    <p>Please select the sensor you want.</p>
                         <input type="radio" id="Ph-Sensor" name="fav_language" value="Ph-Sensor">
                         <label for="Ph-Sensor">Ph-Sensor</label><br>
                         <input type="radio" id="EC-Meter" name="fav_language" value="EC-Meter">
                         <label for="EC-Meter">EC-Meter</label><br>
                         <input type="radio" id="Waterflowsensor" name="fav_language" value="Waterflowsensor">
                         <label for="Waterflowsensor">Waterflowsensor</label><br>
                         <input type="radio" id="Gewichtsensor" name="fav_language" value="Gewichtsensor">
                         <label for="Gewichtsensor">Gewichtsensor</label><br>
                         <input type="radio" id="Tempatuurmeter" name="fav_language" value="Tempatuurmeter">
                         <label for="Tempatuurmeter">Tempatuurmeter</label><br><br>
                    <input type="submit" value="Submit">
                </form>
            </section>
        </div>
    </div>
    </body>
</html>