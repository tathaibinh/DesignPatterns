<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("queryString");
try {
String connectionURL = "jdbc:mysql://localhost/ElectronicMarket";
Connection con;
Class.forName("com.mysql.jdbc.Driver");
// Get a Connection to the database
con = DriverManager.getConnection(connectionURL, "naresh", "mydream"); 
//Add the data into the database
String sql = "SELECT firstname FROM ElectronicMarket.customer WHERE firstname LIKE '"+str+"%' LIMIT 10";
Statement stm = con.createStatement();
stm.executeQuery(sql);
ResultSet rs= stm.getResultSet();
while (rs.next ()){
out.println("<li onclick='fill("+rs.getString("firstname")+");'>"+rs.getString("firstname")+"</li>");
}}catch(Exception e){
out.println("Exception is ;"+e);
}
%>
