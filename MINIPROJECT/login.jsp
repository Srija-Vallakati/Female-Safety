<%@ page import="java.sql.*" %>
<%
	String name=request.getParameter("username");
	String pass=request.getParameter("password");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sri","sri");
		String qry="select * from customer";
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery(qry);
		int flag=0;
		while(rs.next())
		{
			String un=rs.getString(1);
			String ps=rs.getString(2);
			if(un.equals(name) && ps.equals(pass))
			{
				flag=1;
				break;
			}
		}
		if(flag==0)
		{
			
			%>
				<script type="text/javascript">alert("Invalid Password")</script>
				<jsp:include page="index.html"/>
			<%

		}
		else
		{
			response.sendRedirect("home.html");
		}
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>