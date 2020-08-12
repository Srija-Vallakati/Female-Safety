<html>
<head>
<style>
	body
	{
		background:rgba(0,0,0,0.8);
		background-image:url("template2.jpg");
		background-repeat:no-repeat;
		background-size:110%,100%;
		background-attachment:fixed;
		color:white;
	}
	table
	{
		font-size:23px;
	}
	</style>
</head>
<%@ page import="java.sql.*" %>
<%
	String user=request.getParameter("user");
	String sub=request.getParameter("sub");
	String severity=request.getParameter("sev");
	String about=request.getParameter("person");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sri","sri");
		String qry="select * from complaints";
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(qry);
		%>
		<table border="1" cellspacing="0" cellpadding="15" align="center">
		<tr>
			<th colspan="4">YOUR COMPLAINTS</th>
		</tr>
		<tr>
				<th>NAME</th>
				<th>SUBJECT</th>
				<th>SEVERITY</th>
				<th>ABOUT</th>
		</tr>
		<%
		while(rs.next())
		{
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>	
				</tr>
			<%
		}
		%>
		</table>
	</html>
		<%
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>


