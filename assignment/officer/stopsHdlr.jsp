<%@page import="java.util.*"%>
<%@page import="wdb.*"%>
<%
ParaMap m = FormParser.getMap (request, response, this);
out.println(m.getParameters()+"<br/>");
out.println(m.getQuotedValues()+"<br/>");
String upd ="insert into stops ("+m.getParameters()+") values ("+m.getQuotedValues()+")";
out.println(upd+"<br/>");

UpdateStatus us=DBModel.runUpdate(upd, this);
if(us.getError()!=null){out.println(us.toString()+"<br/>");}
else {out.println("Data successfully inserted into Database. <br/>");}

String[] headings=null; ArrayList<String[]> tbody=null;
String qry ="select * from stops";
QResult r = DBModel.runQuery(qry, this); 
if(r.getError()!=null){out.println(r.getError()+"<br/>");}
else {headings=r.getHeadings();
		tbody=r.getTable();}
%>
<table>
	<tr>
	<% for (String s: headings) out.println("<th>"+s+"</th>"); %>
	</tr>
	<% for (String[] row: tbody){
		out.println("<tr>");
		for (String s: row) out.println("<td>"+s+"</td>");
		out.println("</tr>");
		}
	%>
</table>
<a href="stopsMan.jsp"> Add another stop </a>

