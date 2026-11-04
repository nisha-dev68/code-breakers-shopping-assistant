package com.codebreakers.darkpattern;
import jakarta.servlet.*;import jakarta.servlet.http.*;import jakarta.servlet.annotation.*;import java.io.*;
@WebServlet("/history")
public class HistoryServlet extends HttpServlet {
 protected void doGet(HttpServletRequest q,HttpServletResponse p)throws ServletException,IOException{
  HttpSession s=q.getSession(false);Object id=s==null?null:s.getAttribute("userId");
  if(!(id instanceof Integer)){p.sendRedirect("login.jsp?msg=Please%20login%20to%20view%20your%20history");return;}
  try{q.setAttribute("recentProducts",HistoryDAO.list((Integer)id));q.getRequestDispatcher("/history.jsp").forward(q,p);}
  catch(Exception e){getServletContext().log("History query failed",e);p.sendRedirect("history.jsp?msg=Could%20not%20load%20history");}
 }
}
