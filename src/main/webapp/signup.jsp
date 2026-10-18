<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up | DarkPattern Assistant</title>
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

  <div class="auth-wrapper">
    <div class="auth-card">
      <h2>Create your account 🚀</h2>

      <c:if test="${not empty param.msg}">
        <div class="alert">${param.msg}</div>
      </c:if>

      <form action="signup" method="post">
        <input type="text" name="fullName" placeholder="Full name" required>
        <input type="email" name="email" placeholder="Email" required>
        <div class="password-wrap">
          <input type="password" name="password" placeholder="Password (min 6 characters)" pattern=".{6,}" title="Minimum 6 characters" required>
          <button type="button" class="toggle-eye" aria-label="Show password">👁️</button>
        </div>
        <div class="password-wrap">
          <input type="password" name="confirmPassword" placeholder="Confirm password" pattern=".{6,}" title="Minimum 6 characters" required>
          <button type="button" class="toggle-eye" aria-label="Show password">👁️</button>
        </div>
        <p class="match-msg" id="matchMsg"></p>
        <button type="submit" class="btn">Sign Up</button>
      </form>

      <p class="switch">Already have an account? <a href="login.jsp">Login</a></p>
    </div>
  </div>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<button class="back-to-top" id="backToTop">↑</button>
</body>
</html>