package com.codebreakers.darkpattern;
import jakarta.servlet.annotation.*;import jakarta.servlet.http.*;import java.io.*;import java.sql.*;import java.util.*;
@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
 protected void doPost(HttpServletRequest q,HttpServletResponse p)throws IOException{
  q.setCharacterEncoding("UTF-8");String n=q.getParameter("fullName"),e=q.getParameter("email"),r=q.getParameter("reason"),m=q.getParameter("message");
  Set<String> valid=Set.of("bug","feedback","missed-pattern","other");
  if(n==null||e==null||r==null||m==null||n.isBlank()||e.isBlank()||m.isBlank()||!valid.contains(r)){p.sendRedirect("contact.jsp?msg=Please%20fill%20all%20fields%20correctly");return;}
  try(Connection c=DB.get();PreparedStatement s=c.prepareStatement("INSERT INTO contact_messages(full_name,email,reason,message) VALUES(?,?,?,?)")){s.setString(1,n.trim());s.setString(2,e.trim());s.setString(3,r);s.setString(4,m.trim());s.executeUpdate();p.sendRedirect("contact.jsp?msg=Thanks!%20Your%20message%20was%20sent");}
  catch(Exception ex){getServletContext().log("Contact save failed",ex);p.sendRedirect("contact.jsp?msg=Could%20not%20save%20message.%20Please%20try%20again");}
 }
}
