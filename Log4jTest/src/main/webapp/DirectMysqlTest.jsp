<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd" > 
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<HTML>
<HEAD>
  <TITLE>insert data using prepared statement </TITLE>
</HEAD>
    <BODY bgcolor="#ffffcc">
  <font size="+3" color="green"><br>Welcome in test from direct mysql in jsp</font>
  <FORM action="DirectMysqlTest.jsp" method="get">
    <TABLE style="background-color: #ECE5B6;" WIDTH="30%" >
         <TR>
              <TH width="50%">Name</TH>
                  <TD width="50%"><INPUT TYPE="text" NAME="name" value=""></TD>
          </tr>
      <TR>
             <TH width="50%">Address</TH>
                 <TD width="50%"><INPUT TYPE="text" NAME="city" value=""></TD>
          </tr>
          <TR>
             <TH width="50%">Phone</TH>
                 <TD width="50%"><INPUT TYPE="text" NAME="phone" value=""></TD>
          </tr>
                  <TR>
              <TH></TH>
                  <TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
          </tr>
   </TABLE>
<%
   String name = request.getParameter("name");
   String city = request.getParameter("city");
   String phone = request.getParameter("phone");
   /* Create string of connection url within specified 
   format with machine name, 
    port number and database name. Here machine name id 
    localhost and database name is student. */
    String connectionURL = "jdbc:mysql://localhost:8889/test";
          // declare a connection by using Connection interface 
    Connection connection = null;
        // declare object of Statement interface that uses for executing sql statements.
    PreparedStatement pstatement = null;
         // Load JBBC driver "com.mysql.jdbc.Driver"
     Class.forName("com.mysql.jdbc.Driver").newInstance();
          int updateQuery = 0;
     
         // check if the text box is empty
         if(name!=null && city!=null && phone!=null){
                         // check if the text box having only blank spaces
             if(name!="" && city!="" && phone!="") {
                         try {
              /* Create a connection by using getConnection()
              method that takes parameters of string type 
              connection url, user name and password to connect 
                to database. */
                //connection = DriverManager.getConnection(connectionURL, "root", "root");
                connection = DriverManager.getConnection(connectionURL, "test", "");
                            // sql query to insert values in the secified table.
              String queryString = "INSERT INTO stu_info(name, address,phone) VALUES (?, ?, ?)";
                      /* createStatement() is used for create statement
              object that is used for 
                sending sql statements to the specified database. */
              pstatement = connection.prepareStatement(queryString);
              pstatement.setString(1, name);
                          pstatement.setString(2, city);
                          pstatement.setString(3, phone);
              updateQuery = pstatement.executeUpdate();
                            if (updateQuery != 0) { %>
                   <br>
                   <TABLE style="background-color: #E3E4FA;" 
                   WIDTH="30%" border="1">
                      <tr><th>Data is inserted successfully 
                    in database.</th></tr>
                   </table>
              <%
              }
            } 
            catch (Exception ex) {
            out.println("Unable to connect to batabase.");
   
               }
            finally {
                // close all the connections.
                pstatement.close();
                connection.close();
            }
          }
        }
%>
  </FORM>
<%

//String connectionURL = "jdbc:mysql://localhost:3306/mydatabase?user=;password=";

//Connection connection = null;

Statement statement = null;

ResultSet rs = null;

%>    
<%
//Class.forName("com.mysql.jdbc.Driver").newInstance();
//connection = DriverManager.getConnection(connectionURL, "", "");
connection = DriverManager.getConnection(connectionURL, "test", "");

statement = connection.createStatement();
rs = statement.executeQuery("SELECT * FROM stu_info");

while (rs.next()) {
	out.println(rs.getString("name")+", ");
	out.println(rs.getString("address")+", ");
	out.println(rs.getString("phone")+"<br>");
}

rs.close(); 
%>  
</BODY>
</html>