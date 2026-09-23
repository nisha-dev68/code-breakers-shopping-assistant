<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Analysis Result | DarkPattern Assistant</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

  <nav class="navbar">
    <a href="index.jsp" class="logo">🛡️ DarkPattern Assistant</a>
    <button class="menu-toggle" id="menuToggle" aria-label="Menu">
      <span></span><span></span><span></span>
    </button>
    <ul id="navLinks">
      <li><a href="index.jsp">Home</a></li>
      <li><a href="products.jsp">Products</a></li>
      <li><a href="login.jsp">Login</a></li>
      <li><a href="signup.jsp">Sign Up</a></li>
    </ul>
  </nav>

  <section class="result-wrap">

    <div class="result-url-bar">
      <span>🔗</span>
      <p>${empty productUrl ? "https://example-store.com/product/wireless-earbuds-x200" : productUrl}</p>
    </div>

    <c:set var="riskClass" value="${empty riskLevel ? 'risk-medium' : riskLevel}" />

    <div class="score-card">
      <div class="score-badge ${riskClass}">
        <div class="score-circle">
          <span class="score-number">${empty score ? 65 : score}%</span>
        </div>
        <div class="score-info">
          <span class="score-grade">Grade ${empty grade ? "C" : grade}</span>
          <span class="score-label">${empty riskLabel ? "Moderate Risk" : riskLabel}</span>
        </div>
      </div>
      <p class="score-desc">${empty scoreDescription ? "This product listing uses several manipulative design patterns. Shop carefully and double-check prices and stock claims elsewhere." : scoreDescription}</p>
    </div>

    <h2 class="section-title">Patterns detected</h2>

    <div class="pattern-list">
      <c:choose>
        <c:when test="${not empty patterns}">
          <c:forEach var="p" items="${patterns}">
            <div class="pattern-item severity-${p.severity}">
              <span class="icon">${p.icon}</span>
              <div>
                <h3>${p.name}</h3>
                <p>${p.description}</p>
              </div>
              <span class="severity-tag">${fn:toUpperCase(fn:substring(p.severity,0,1))}${fn:substring(p.severity,1,fn:length(p.severity))}</span>
            </div>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <div class="pattern-item severity-high">
            <span class="icon">⏰</span>
            <div>
              <h3>Fake Urgency</h3>
              <p>A countdown timer claims "Offer ends in 04:59" but resets on refresh.</p>
            </div>
            <span class="severity-tag">High</span>
          </div>
          <div class="pattern-item severity-medium">
            <span class="icon">🏷️</span>
            <div>
              <h3>Misleading Discount</h3>
              <p>Original price shown as ₹4,999 but was never sold above ₹2,499 in the last 30 days.</p>
            </div>
            <span class="severity-tag">Medium</span>
          </div>
          <div class="pattern-item severity-low">
            <span class="icon">🙁</span>
            <div>
              <h3>Confirm-shaming</h3>
              <p>Decline button reads "No, I like paying more".</p>
            </div>
            <span class="severity-tag">Low</span>
          </div>
        </c:otherwise>
      </c:choose>
    </div>

    <div class="result-actions">
      <a href="index.jsp" class="btn">Analyze Another Product</a>
    </div>

  </section>

  <footer class="footer">
    <p>© 2026 Code Breakers | E-Commerce Transparency Assistant</p>
  </footer>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>