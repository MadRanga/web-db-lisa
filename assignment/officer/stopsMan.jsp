<%@page import="java.util.*"%>
<%@page import="wdb.*"%>
<link rel="stylesheet" type="text/css" href="css/global.css">
	<div>
	<p>Enter stop no, street name and suburb and click submit to search.
	If the stop exists, the result will be displayed. If not, complete 
	all details to add the stop to the database.</p>
	</div>
	
	
		<div style="width:800px; height:200px; margin-right:auto; margin-left:auto; margin-top:50px; ">
		<table>
			<form action="stopsHdlr.jsp" method="post">
			<div>
			<tr><td><label for class="lb">Stop No:</label></td>
			<td><input type="text" name="stopNo"></td><td><label for class="lb">Interchange:</label></td>
			<td><input type="checkbox" name="interchange"></td></tr>
			
			<tr><td><label for class="lb">Street No:</label></td>
			<td><input type="text" name="streetNo"></td><td><label for class="lb">Street Name:</label></td>
			<td><input type="text" name="streetName"></td></tr>
			
			<tr><td><label for class="lb">Suburb:</label></td>
			<td><input type="text" name="suburb"></td><td><label for class="lb">Postcode:</label></td>
			<td><input type="text" name="postcode"></td></tr>
			<td><tr></td></tr>
			</div>
			<tr><td><button>Submit</button</td></tr>
			</form>
		</table>
		</div>
		<p>Existing stops display below</p>
<%

String[] headings=null; ArrayList<String[]> tbody=null;
String qry = "select * from stops";
QResult r=DBModel.runQuery(qry, this);
if(r.getError()!=null){out.println(r.toString()+"<br/>");}
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
			

		
		

