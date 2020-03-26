<html>
  <head>
  <title>Tomcat - MariaDB Connection Test</title>
  </head>
 <body>
<%@ page contentType="text/html" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
 Connection con = null;
 PreparedStatement PS = null;
 ResultSet RS = null;

try {

// MariaDB 접속을 위한 정보입력 시작
  Context initContext = new InitialContext();
  Context envContext  = (Context)initContext.lookup("java:/comp/env");
  DataSource ds = (DataSource)envContext.lookup("pcstestDS");
  con = ds.getConnection();
  out.print("con: " + con);


  String query = "select * from user";
  PS = con.prepareStatement(query);
  RS = PS.executeQuery();

  int count=0;
  while(RS.next()) {
  String name = RS.getString("name");
  %>
  <p>Name : <%=name%></p>
  <%
  count++;
}

 } catch(Exception ErrMsg) {
  ErrMsg.printStackTrace();
  out.println("Unfortunately, Database connection failed");
 }

%>

 </body>
</html>
