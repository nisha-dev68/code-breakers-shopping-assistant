package com.codebreakers.darkpattern;
import jakarta.servlet.annotation.*;import jakarta.servlet.http.*;import java.io.*;
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet { protected void doGet(HttpServletRequest q,HttpServletResponse p)throws IOException{HttpSession s=q.getSession(false);if(s!=null)s.invalidate();p.sendRedirect("index.jsp?msg=Logged%20out");} }
