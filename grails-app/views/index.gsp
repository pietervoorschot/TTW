<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>TunnelTomatoes Application</title>
</head>
<body>
<content tag="nav">
    <li class="dropdown">
        <a href="sensoren/index" role="button" aria-haspopup="true" aria-expanded="false">Graphs<span class="caret"></span></a>
    </li>
    <li class="dropdown">
        <a href="sensoren/index" role="button" aria-haspopup="true" aria-expanded="false">View setpoints<span class="caret"></span></a>
    </li>
    <li class="dropdown">
        <a href="sensoren/index" role="button" aria-haspopup="true" aria-expanded="false">Work notes<span class="caret"></span></a>
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
                    <li><button href="sensoren/index" class="button-homepage">Graphs</button></li>
                    <li><button href="#" class="button-homepage">View setpoints</button></li>
                    <li><button href="#" class="button-homepage">Work notes</button></li>
                </ul>
%{--            </div>--}%
        </section>
    </div>
</div>

</body>
</html>
