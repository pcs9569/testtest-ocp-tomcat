<html>
  <head>
  <title>Tomcat - MariaDB Connection Test</title>
  </head>
 <body>
<%@ page contentType="text/html" language="java" %>
<%@ page import="java.sql.*" %>

<%
 Connection con = null;
 PreparedStatement PS = null;
 ResultSet RS = null;

 try {

// MariaDB 접속을 위한 정보입력 시작

  String MARIADB_SERVER = "192.168.23.23:3306";
  String MARIADB_SERVER_USERNAME = "root";
  String MARIADB_SERVER_PASSWORD = "opennaru";
  String MARIADB_DATABASE = "pcstest";
  String URL = "jdbc:mysql://" + MARIADB_SERVER + "/" + MARIADB_DATABASE;
  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection(URL, MARIADB_SERVER_USERNAME, MARIADB_SERVER_PASSWORD);

// MariaDB 접속을 위한 정보입력 종료
  %>

  <%

// MariaDB 질의문처리 시작
  String query = "select * from user";
  PS = con.prepareStatement(query);
  RS = PS.executeQuery();


// MariaDB 질의문처리 시작

// 질의문 결과표출 시작

  int count=0;
  while(RS.next()) {
  String name = RS.getString("name");
  %>
  <p>Name : <%=name%></p>
  <%
  count++;
}

// 질의문 결과표출 시작
// 예외처리 시작

 } catch(Exception ErrMsg) {
  ErrMsg.printStackTrace();
  out.println("Unfortunately, Database connection failed");
 }

// 예외처리 시작

%>

 </body>
</html>
