package com.codebreakers.darkpattern;
import jakarta.servlet.*;import jakarta.servlet.http.*;import jakarta.servlet.annotation.*;import java.io.*;import java.sql.*;
@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
 protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException{
  req.setCharacterEncoding("UTF-8");String name=req.getParameter("fullName"),email=req.getParameter("email"),pw=req.getParameter("password"),confirm=req.getParameter("confirmPassword");
  if(name==null||email==null||pw==null||confirm==null||name.isBlank()||email.isBlank()||pw.length()<6){resp.sendRedirect("signup.jsp?msg=Please%20complete%20all%20fields.%20Password%20must%20be%20at%20least%206%20characters");return;}
  if(!pw.equals(confirm)){resp.sendRedirect("signup.jsp?msg=Passwords%20do%20not%20match");return;}
  try(Connection c=DB.get();PreparedStatement p=c.prepareStatement("INSERT INTO users(full_name,email,password_hash) VALUES(?,?,?)")){
   p.setString(1,name.trim());p.setString(2,email.trim().toLowerCase());p.setString(3,PasswordUtil.hash(pw));p.executeUpdate();
   resp.sendRedirect("login.jsp?msg=Account%20created.%20Please%20login");
  }catch(SQLIntegrityConstraintViolationException e){resp.sendRedirect("signup.jsp?msg=Email%20already%20registered");}
   catch(Exception e){getServletContext().log("Signup error",e);resp.sendRedirect("signup.jsp?msg=Signup%20failed.%20Check%20database%20setup");}
 }
}
