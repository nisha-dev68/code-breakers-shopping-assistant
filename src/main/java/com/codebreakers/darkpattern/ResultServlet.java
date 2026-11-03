package com.codebreakers.darkpattern;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/result")
public class ResultServlet extends HttpServlet {
 protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  long id;
  try { id = Long.parseLong(req.getParameter("id")); }
  catch (Exception e) { resp.sendError(404); return; }

  String sql = "SELECT p.name, p.url, h.score, h.risk_level, h.risk_label "
             + "FROM analysis_history h JOIN products p ON p.id = h.product_id WHERE h.id = ?";
  try (Connection c = DB.get(); PreparedStatement ps = c.prepareStatement(sql)) {
   ps.setLong(1, id);
   try (ResultSet r = ps.executeQuery()) {
    if (!r.next()) { resp.sendError(404); return; }
    String url = r.getString("url");
    int score = r.getInt("score");
    req.setAttribute("productUrl", url);
    req.setAttribute("productName", r.getString("name"));
    req.setAttribute("score", score);
    req.setAttribute("grade", score >= 90 ? "A" : score >= 80 ? "B" : score >= 60 ? "C" : "D");
    req.setAttribute("riskLevel", "risk-" + r.getString("risk_level"));
    req.setAttribute("riskLabel", r.getString("risk_label"));
    req.setAttribute("scoreDescription", "Saved result from an earlier check. Pattern details are re-checked live from the same link.");
    try { req.setAttribute("patterns", Analyzer.analyze(url).patterns); } catch (Exception ignored) { }
   }
  } catch (Exception e) {
   getServletContext().log("Result lookup failed", e);
   resp.sendRedirect(req.getContextPath() + "/history");
   return;
  }
  req.getRequestDispatcher("/result.jsp").forward(req, resp);
 }
}