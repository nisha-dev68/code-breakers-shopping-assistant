<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recently Analyzed | DarkPattern Assistant</title>
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
      <li><a href="about.jsp">About</a></li>
      <li><a href="login.jsp">Login</a></li>
      <li><a href="signup.jsp">Sign Up</a></li>
    </ul>
  </nav>

  <section class="section">
    <h2 class="section-title">Recently Analyzed Products</h2>
    <p class="section-sub">See what our community has checked so far.</p>

    <div class="product-grid">
    <c:choose>
    <c:when test="${not empty recentProducts}">
    <c:forEach var="prod" items="${recentProducts}">
    <a href="result.jsp?id=${prod.id}" class="product-card">
    <div class="product-score risk-${prod.riskLevel}"> ${prod.score}% </div>
    <h3>${prod.name}</h3>
              <p class="product-url">${prod.url}</p>
              <span class="product-risk-label">${prod.riskLabel}</span>
            </a>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <a href="result.jsp" class="product-card">
            <div class="product-score risk-high">82%</div>
            <h3>Wireless Earbuds X200</h3>
            <p class="product-url">example-store.com</p>
            <span class="product-risk-label">High Risk</span>
          </a>
          <a href="result.jsp" class="product-card">
            <div class="product-score risk-medium">55%</div>
            <h3>Smart Fitness Band</h3>
            <p class="product-url">shopfast.in</p>
            <span class="product-risk-label">Moderate Risk</span>
          </a>
          <a href="result.jsp" class="product-card">
            <div class="product-score risk-low">18%</div>
            <h3>Ceramic Cookware Set</h3>
            <p class="product-url">homeessentials.com</p>
            <span class="product-risk-label">Low Risk</span>
          </a>
          <a href="result.jsp" class="product-card">
            <div class="product-score risk-high">90%</div>
            <h3>Premium Backpack</h3>
            <p class="product-url">trendybags.co</p>
            <span class="product-risk-label">High Risk</span>
          </a>
        </c:otherwise>
      </c:choose>
    </div>

    <div class="result-actions">
      <a href="index.jsp" class="btn">Analyze Your Own Product</a>
    </div>
  </section>

  <footer class="footer">
    <p>© 2026 Code Breakers | E-Commerce Transparency Assistant</p>
  </footer>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>