<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	//String username1 = request.getParameter("user");
	//if(session.isNew()) {
		
	//	return;
	//}
	//else {
		String user1 = (String)session.getAttribute("username");
		if(!user1.equals(null)) {
	//		out.println(user1);
			out.println("1");
			return;
		}
		out.println("0");
		return;
	//}
%>