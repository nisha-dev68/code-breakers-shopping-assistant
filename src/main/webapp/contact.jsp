<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us | DarkPattern Assistant</title>
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
      <li><a href="login.jsp">Login</a></li>
      <li><a href="signup.jsp">Sign Up</a></li>
      <button class="theme-toggle" id="themeToggle" aria-label="Toggle dark mode">🌙</button>
    </ul>
  </nav>

  <section class="about-hero">
    <h1>Get in Touch</h1>
    <p>Found a bug, have feedback, or spotted a dark pattern we missed? Let us know.</p>
  </section>

  <div class="auth-wrapper">
    <div class="auth-card contact-card">
      <h2>Send us a message 📩</h2>

      <c:if test="${not empty param.msg}">
        <div class="alert">${param.msg}</div>
      </c:if>

      <form action="contact" method="post">
        <input type="text" name="fullName" placeholder="Your name" required>
        <input type="email" name="email" placeholder="Your email" required>
        <select name="reason" required>
          <option value="" disabled selected>Reason for contact</option>
          <option value="bug">Report a bug</option>
          <option value="feedback">General feedback</option>
          <option value="missed-pattern">Suggest a dark pattern we missed</option>
          <option value="other">Other</option>
        </select>
        <textarea name="message" placeholder="Your message" rows="5" required></textarea>
        <button type="submit" class="btn">Send Message</button>
      </form>
    </div>
  </div>

  <footer class="footer">
    <p>© 2026 Code Breakers | E-Commerce Transparency Assistant</p>
  </footer>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <button class="back-to-top" id="backToTop">↑</button>
</body>
</html>