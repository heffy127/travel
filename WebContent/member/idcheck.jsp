<%@page import="member.membershipDTO"%>
<%@page import="member.membershipDAO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<%
				String str = "";
				
				String inputId = request.getParameter("id");
				
				membershipDAO dao = new membershipDAO();
				
				String id = dao.select(inputId);
				
				if(id == null){
					str = "YES";
					out.write(str);
				}else{
					str = "NO";
					out.write(str);
				}
			%>
