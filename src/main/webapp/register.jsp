<%@ page import="java.sql.*"%>
<%
Connection con=null;
Statement s=null;
Statement s1=null;
Statement ss1=null;

String name=request.getParameter("name");
String phone=request.getParameter("phone");
String email=request.getParameter("email");
String password=request.getParameter("password");


try
{
ResultSet r=null;
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/realdb","root","root");

}
catch(Exception e)
{
e.printStackTrace();
}

%>
<html><body bgcolor='wheat'><center><h1>
<%

s=con.createStatement();
s1=con.createStatement();
ss1=con.createStatement();
ResultSet res=s.executeQuery("select *from reg541 where email='"+email+"'");
if(res.next())
{
out.print(name+", you are already registered");
}

else{


int res1=ss1.executeUpdate("insert into reg541 values('"+name+"','"+phone+"','"+email+"','"+password+"')");
out.print(name+", you are registered successfully");

}

%>
</h1></center></body></html>
