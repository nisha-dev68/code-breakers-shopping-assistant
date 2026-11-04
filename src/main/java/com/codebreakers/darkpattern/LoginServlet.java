package com.codebreakers.darkpattern;
import jakarta.servlet.*;import jakarta.servlet.http.*;import jakarta.servlet.annotation.*;import java.io.*;import java.sql.*;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
 protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws IOException{
  req.setCharacterEncoding("UTF-8");String email=req.getParameter("email"),password=req.getParameter("password");
  if(email==null||password==null||email.isBlank()||password.isBlank()){resp.sendRedirect("login.jsp?msg=Email%20and%20password%20are%20required");return;}
  try(Connection c=DB.get();PreparedStatement p=c.prepareStatement("SELECT id,full_name,email,password_hash FROM users WHERE email=?")){
   p.setString(1,email.trim().toLowerCase());try(ResultSet r=p.executeQuery()){
    if(!r.next()||!PasswordUtil.verify(password,r.getString("password_hash"))){resp.sendRedirect("login.jsp?msg=Invalid%20email%20or%20password");return;}
    HttpSession old=req.getSession(false);if(old!=null)old.invalidate();HttpSession s=req.getSession(true);
    s.setAttribute("userId",r.getInt("id"));s.setAttribute("fullName",r.getString("full_name"));s.setAttribute("email",r.getString("email"));
    resp.sendRedirect("index.jsp?msg=Login%20successful");
   }
  }catch(Exception e){getServletContext().log("Login error",e);resp.sendRedirect("login.jsp?msg=Login%20service%20unavailable.%20Check%20database%20setup");}
 }
}
