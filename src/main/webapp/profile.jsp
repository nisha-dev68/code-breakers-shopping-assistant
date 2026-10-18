<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile | DarkPattern Assistant</title>
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

  <c:if test="${empty sessionScope.userId}">
    <c:redirect url="login.jsp?msg=Please login to view your profile" />
  </c:if>

  <div class="auth-wrapper">
    <div class="auth-card profile-page-card">
  <span class="avatar-circle" id="bigAvatar" style="width:90px; height:90px; font-size:2.2rem; margin:0 auto 16px; display:flex;">
    ${fn:substring(sessionScope.fullName, 0, 1)}
  </span>
  <h2>${sessionScope.fullName}</h2>
  <p style="color: var(--muted); margin-bottom: 24px;">${sessionScope.email}</p>

  <div class="profile-info-row">
    <span class="profile-info-label">👤 Account Type:<span> </span> </span>
    <span class="profile-info-value">Registered User</span>
  </div>
  <div class="profile-info-row">
    <span class="profile-info-label">📧 Email:<span> </span> </span>
    <span class="profile-info-value">${sessionScope.email}</span>
  </div>
  <div class="profile-info-row">
    <span class="profile-info-label">🔓 Access: <span> </span> </span>
    <span class="profile-info-value">Unlimited Analysis</span>
  </div>

  <p style="font-weight:600; margin: 20px 0 8px; text-align:left;">Avatar color</p>
  <div class="avatar-picker" style="justify-content:center;">
    <div class="avatar-color-dot" style="background:#2563eb;" data-color="#2563eb"></div>
    <div class="avatar-color-dot" style="background:#16a34a;" data-color="#16a34a"></div>
    <div class="avatar-color-dot" style="background:#d97706;" data-color="#d97706"></div>
    <div class="avatar-color-dot" style="background:#dc2626;" data-color="#dc2626"></div>
    <div class="avatar-color-dot" style="background:#9333ea;" data-color="#9333ea"></div>
    <div class="avatar-color-dot" style="background:#0f172a;" data-color="#0f172a"></div>
    <div class="avatar-color-dot" style="background:#ec4899;" data-color="#ec4899"></div>
    <div class="avatar-color-dot" style="background:#14b8a6;" data-color="#14b8a6"></div>
  </div>

  <a href="history.jsp" class="btn" style="width:100%; margin-top:16px;">View My History</a>
</div>
  </div>
<footer class="footer">
    <p>© 2026 Code Breakers | E-Commerce Transparency Assistant</p>
  </footer>
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <button class="back-to-top" id="backToTop">↑</button>
</body>
</html>