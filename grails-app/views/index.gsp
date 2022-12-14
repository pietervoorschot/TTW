<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>TunnelTomatoes Application - Homepage</title>
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
    <li class="dropdown">
        <a href="sensorinfomation/index" role="button" aria-haspopup="true" aria-expanded="false">Sensor info<span class="caret"></span></a>
    </li>
</content>

<div class="svg" role="presentation">
    <div class="grails-logo-container">
        <asset:image src="tunnel2.jpg" class="grails-logo"/>
    </div>
</div>

<div id="content" role="main">
    <div class="container">
        <section class="row colset-2-its">
            <h1>Welcome to the TunnelTomatoes application</h1>
            <p>In this application, you will be able to view the full history of all measured data,
            create work notes for your employees and much more.</p>
%{--            <div id="controllers" role="navigation">--}%
                <ul id="ul-buttons">
                    <li><a href="sensoren/index" class="button-homepage">Graphs</a></li>
                    <li><a href="#" class="button-homepage">View setpoints</a></li>
                    <li><a href="#" class="button-homepage">Work notes</a></li>
                    <li><a href="sensorinfomation/index" class="button-homepage">Sensor Info</a> </li>
                    <li><a href="machineLearning/index" class="button-homepage">Machine Learning</a></li>
                </ul>
%{--            </div>--}%
        </section>
    </div>
</div>

</body>
</html>
