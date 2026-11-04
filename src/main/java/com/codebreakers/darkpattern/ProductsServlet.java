package com.codebreakers.darkpattern;
import jakarta.servlet.*;import jakarta.servlet.http.*;import jakarta.servlet.annotation.*;import java.io.*;
@WebServlet("/products")
public class ProductsServlet extends HttpServlet {
 protected void doGet(HttpServletRequest q,HttpServletResponse p)throws ServletException,IOException{
  try{q.setAttribute("recentProducts",HistoryDAO.recent());q.getRequestDispatcher("/products.jsp").forward(q,p);}
  catch(Exception e){getServletContext().log("Products query failed",e);q.setAttribute("recentProducts",java.util.List.of());q.getRequestDispatcher("/products.jsp").forward(q,p);}
 }
}
