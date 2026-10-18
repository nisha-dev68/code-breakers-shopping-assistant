<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Privacy Policy | DarkPattern Assistant</title>
  <link rel="icon" href='data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><text y=".9em" font-size="90">🛡️</text></svg>'>
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
  <li><a href="faq.jsp">FAQ</a></li>
  <li><a href="contact.jsp">Contact</a></li>
  <li><a href="blog.jsp">Blog</a></li>
  <li><a href="history.jsp">My History</a></li>
  <c:choose>
  <c:when test="${not empty sessionScope.userId}">
    <li class="profile-chip" id="profileChip">
  <span class="avatar-circle" id="avatarCircle">${fn:substring(sessionScope.fullName, 0, 1)}</span>
  <span class="profile-name">${sessionScope.fullName}</span>
  <div class="profile-dropdown" id="profileDropdown">
    <a href="profile.jsp">👤 My Profile</a>
    <a href="history.jsp">📊 My History</a>
    <a href="logout">🚪 Logout</a>
  </div>
</li>
  </c:when>
  <c:otherwise>
    <li><a href="login.jsp">Login</a></li>
    <li><a href="signup.jsp">Sign Up</a></li>
  </c:otherwise>
</c:choose>
  <button class="theme-toggle" id="themeToggle" aria-label="Toggle dark mode">🌙</button>
 </ul>
</nav>

  <section class="about-hero">
    <h1>Privacy Policy & Terms</h1>
    <p>Last updated: September 2026</p>
  </section>

  <section class="section legal-wrap">

    <h2 class="legal-heading">1. What we collect</h2>
    <p>When you create an account, we collect your name, email address, and password (securely stored). If you use our free trial without an account, we do not collect any personal information.</p>

    <h2 class="legal-heading">2. How we use your data</h2>
    <p>We use your account information to save your analysis history so you can revisit past results. We do not sell or share your personal data with third parties.</p>

    <h2 class="legal-heading">3. Product URLs you analyze</h2>
    <p>URLs you submit for analysis may be temporarily processed to generate a report. Logged-in users' analysis history is stored to their account; guest analyses are not saved.</p>

    <h2 class="legal-heading">4. Cookies</h2>
    <p>We use basic session cookies to keep you logged in. We do not use tracking or advertising cookies.</p>

    <h2 class="legal-heading">5. Your rights</h2>
    <p>You can request deletion of your account and associated data at any time by contacting us through our <a href="contact.jsp">Contact page</a>.</p>

    <h2 class="legal-heading">6. Disclaimer</h2>
    <p>DarkPattern Assistant is an academic project built to raise awareness about manipulative e-commerce design. Our analysis is a helpful guide, not a guarantee — always use your own judgment when shopping online.</p>

    <h2 class="legal-heading">7. Contact</h2>
    <p>Questions about this policy? Reach out via our <a href="contact.jsp">Contact page</a>.</p>

  </section>

  <footer class="footer">
    <p>© 2026 Code Breakers | E-Commerce Transparency Assistant</p>
  </footer>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <button class="back-to-top" id="backToTop">↑</button>
</body>
</html>