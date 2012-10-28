<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%  
	String uri = request.getRequestURI();
	int idx = uri.indexOf("/",1);
	String app = uri;
	if(idx > 1)
		app = uri.substring(0,idx);
	
	// check if user is logged in
	String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html>
	<head>
		<title><decorator:title default="" /> - Metropolis City Transit</title>
		<link rel='stylesheet' href="<%=app%>/css/global.css" />
		<link rel='stylesheet' href="<%=app%>/css/routeSearch.css" />
		<link rel='stylesheet' href="<%=app%>/css/route.css" />
		
		<script src="<%=app%>/js/routes.js"></script>
		<script src="<%=app%>/js/jquery-1.8.2.min.js"></script>
		
		<decorator:head />
	</head>
	<body>
		<header>
			<h1><a href="<%=app%>">Metropolis City Transit</a></h1>
			<nav>
			<a href="<%=app%>/routeSearch/begin.jsp">Route Search</a>
			<a href="<%=app%>/routes.jsp">Routes</a>
			<a href="<%=app%>/officer/stopsMan.jsp">Stops</a>
			<% if (username == null) { %>
				<a href="<%=app%>/login/login.jsp">Log In</a>
			<% } else { %>
				<!--<a href="<%=app%>/admin.jsp">Administration</a>-->
				<a href="<%=app%>/login/logout.jsp"><%=username%> - Log Out</a>
			<% } %>
			
			</nav>
			
		</header>
		<div class="body">
			<decorator:body />
			</div>
		</div>
		<footer>
			&copy; 2012 Metropolis City Transit. All rights reserved. <br />
			Powered by JSP, Tomcat, SiteMesh and WDB.
		</footer>
</html>