<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	String username = request.getParameter("user");
	String password = request.getParameter("passwd");
	String email = request.getParameter("email");
	String admin = "0";
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";
		
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();
	String sql = "select * from user where Name = '" + username + "' OR EmailAdd='"+email+"'";
	ResultSet rs = statement.executeQuery(sql);
	
	if(rs.next()) {
		out.println("0");
		return;
	}
	
	else {
		String fmt = "insert into user(Name,EmailAdd, Password, Admin) values('%s','%s','%s','%s')";
		sql = "";
		sql = String.format(fmt,username,email, password, admin);
		int cnt = statement.executeUpdate(sql);
		String fmt2 = "insert into userprofile(Name) values('%s')";
		sql = String.format(fmt2,username);
		int cnt2 = statement.executeUpdate(sql);
		//session.setAttribute("username", username);
		out.println("1");
	}
%>