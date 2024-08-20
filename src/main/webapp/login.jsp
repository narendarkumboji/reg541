<%@ page import="java.sql.*"%>
<%
Connection con=null;
Statement s=null;
Statement ss=null;
ResultSet res=null;
String uname=request.getParameter("username");
String pass=request.getParameter("password");

try
{
Class.forName("com.mysql.cj.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/realdb","root","root");
}
catch(Exception e)
{
e.printStackTrace();
}
s=con.createStatement();
ss=con.createStatement();
out.println("<html><body bgcolor='wheat'><center><h1>");

ResultSet rs=s.executeQuery("select *from reg541 where email='"+uname+"'");
if(rs.next())
{
res=ss.executeQuery("select *from reg541 where email='"+uname+"' and password='"+pass+"'");
if(res.next())
{

out.println(uname+"Welcome to REG541 PORTAL");
}
else
{
out.println(uname+"password entered  is incorrect");
}
}
else
{
out.println(uname+"you rn.t registered");
}
out.println("</h1></center></body></html>");

 %>