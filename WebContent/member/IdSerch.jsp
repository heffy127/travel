<%@page import="java.util.ArrayList"%>
<%@page import="member.membershipDAO"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String str = "";

	String inputName = request.getParameter("name");
	String inputTel = request.getParameter("tel");
	String inputTel2 = request.getParameter("tel2");
	String inputTel3 = request.getParameter("tel3");
	
	membershipDAO dao = new membershipDAO();
	
	ArrayList list = dao.IdSerch(inputName, inputTel, inputTel2, inputTel3);
	String name = (String)list.get(0);
	String tel = (String)list.get(1);
	String tel2 = (String)list.get(2);
	String tel3 = (String)list.get(3);
	
	if(name == null && tel == null && tel2 == null && tel3 == null){
		str = "YES";
		out.write(str);
	}else if(name.equals(inputName) && tel.equals(tel) && tel2.equals(inputTel2) && tel3.equals(inputTel3)){
		str = "NO";
		out.write(str);
	}
	
%>