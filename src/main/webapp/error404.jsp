<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Not Found | DarkPattern Assistant</title>
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
      <li><a href="blog.jsp">Blog</a></li>
      <li><a href="login.jsp">Login</a></li>
      <li><a href="signup.jsp">Sign Up</a></li>
      <button class="theme-toggle" id="themeToggle" aria-label="Toggle dark mode">🌙</button>
    </ul>
  </nav>

  <section class="error-wrap">
    <div class="error-icon">🕵️‍♀️</div>
    <h1>404</h1>
    <h2>This page went shopping and never came back</h2>
    <p>The page you're looking for doesn't exist or may have moved.</p>
    <a href="index.jsp" class="btn">Back to Home</a>
  </section>

  <footer class="footer">
    <p>© 2026 Code Breakers | E-Commerce Transparency Assistant</p>
  </footer>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <button class="back-to-top" id="backToTop">↑</button>
</body>
</html>