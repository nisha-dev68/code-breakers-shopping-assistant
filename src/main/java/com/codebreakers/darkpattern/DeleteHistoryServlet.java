package com.codebreakers.darkpattern;

import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/delete-history")
public class DeleteHistoryServlet extends HttpServlet {
 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
  HttpSession s = req.getSession(false);
  Object uid = s == null ? null : s.getAttribute("userId");
  if (!(uid instanceof Integer)) {
   resp.sendRedirect(req.getContextPath() + "/login.jsp?msg=Please%20login%20first");
   return;
  }
  try {
   long id = Long.parseLong(req.getParameter("id"));
   boolean ok = HistoryDAO.deleteOwn(id, (Integer) uid);
   resp.sendRedirect(req.getContextPath() + "/history?msg=" + (ok ? "Entry%20deleted" : "Entry%20not%20found"));
  } catch (Exception e) {
   getServletContext().log("Delete failed", e);
   resp.sendRedirect(req.getContextPath() + "/history?msg=Could%20not%20delete");
  }
 }
}