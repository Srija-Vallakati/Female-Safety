<%@ page import="java.sql.*" %>
<%
	String name=request.getParameter("user");
	String pass=request.getParameter("pwd");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","sri","sri");
		String qry="insert into customer values(?,?)";
		PreparedStatement pst=con.prepareStatement(qry);
		pst.setString(1,name);
		pst.setString(2,pass);
		int i=pst.executeUpdate();
		%>
		<jsp:forward page="success.html"/>
		<%
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
