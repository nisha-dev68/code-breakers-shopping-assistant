package com.codebreakers.darkpattern;
import jakarta.servlet.*;import jakarta.servlet.http.*;import jakarta.servlet.annotation.*;import java.io.IOException;
@WebServlet("/analyze")
public class AnalyzeServlet extends HttpServlet {
 protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
  req.setCharacterEncoding("UTF-8"); HttpSession s=req.getSession();
  Integer uid=(Integer)s.getAttribute("userId");
  int used=(Integer)(s.getAttribute("freeAnalysisUsed")==null?0:s.getAttribute("freeAnalysisUsed"));
  if(uid==null&&used>=1){resp.sendRedirect(req.getContextPath()+"/login.jsp?msg=Free%20trial%20used.%20Please%20login%20to%20continue.");return;}
  String url=req.getParameter("productUrl");
  if(url==null||url.isBlank()){resp.sendRedirect(req.getContextPath()+"/index.jsp?msg=Please%20enter%20a%20product%20URL");return;}
  try{
   AnalysisResult a=Analyzer.analyze(url);
   HistoryDAO.save(uid,a);
   if(uid==null)s.setAttribute("freeAnalysisUsed",used+1);
   req.setAttribute("productUrl",a.productUrl);req.setAttribute("productName",a.productName);
   req.setAttribute("score",a.score);req.setAttribute("grade",a.grade);req.setAttribute("riskLevel","risk-"+a.riskLevel);
   req.setAttribute("riskLabel",a.riskLabel);req.setAttribute("scoreDescription",a.scoreDescription);req.setAttribute("patterns",a.patterns);
   req.getRequestDispatcher("/result.jsp").forward(req,resp);
  }catch(IllegalArgumentException e){resp.sendRedirect(req.getContextPath()+"/index.jsp?msg="+java.net.URLEncoder.encode(e.getMessage(),java.nio.charset.StandardCharsets.UTF_8));}
   catch(Exception e){getServletContext().log("Product analysis failed",e);resp.sendRedirect(req.getContextPath()+"/index.jsp?msg=Analysis%20failed.%20Check%20database%20connection%20and%20server%20logs.");}
 }
}
