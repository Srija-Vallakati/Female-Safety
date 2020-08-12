<%@ page import="java.sql.*" %>
<%
	String name=request.getParameter("user");
	String sub=request.getParameter("sub");
	String severity=request.getParameter("sev");
	String about=request.getParameter("person");
	try
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sri","sri");
		String qry="insert into complaints values(?,?,?,?)";
		PreparedStatement pst=con.prepareStatement(qry);
		pst.setString(1,name);
		pst.setString(2,sub);
		pst.setString(3,severity);
		pst.setString(4,about);
		int i=pst.executeUpdate();
		%>
			<jsp:include page="mycomplaint.html"/>
		<%
	}
	catch(SQLException e)
	{
		out.println(e);
	}
%>