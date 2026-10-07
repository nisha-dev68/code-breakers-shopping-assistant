<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DarkPattern Assistant | Code Breakers</title>
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
<section class="hero">
<div class="hero-text">
   <h1>Shop smart.<br>Spot dark patterns.</h1>
   <p>Paste any e-commerce product link. We check it for fake urgency, misleading discounts and hidden charges.</p>
   <form class="search-box" action="analyze" method="post">
      <input type="url" name="productUrl" placeholder="Paste product URL here" required>
      <button type="submit" class="btn">Analyze</button>
    </form>
    <p class="hint">🎁 Your first analysis is free. Login for unlimited checks.</p>
</div>
<div class="hero-visual">🛒</div>
</section>

  <section class="section">
    <h2 class="section-title">What we detect</h2>
    <div class="cards">
      <div class="card"><span class="icon">⏰</span><h3>Fake Urgency</h3><p>"Only 2 left!" or countdown timers that are not real.</p></div>
      <div class="card"><span class="icon">🏷️</span><h3>Misleading Discounts</h3><p>Inflated old prices that make a discount look bigger.</p></div>
      <div class="card"><span class="icon">💸</span><h3>Hidden Charges</h3><p>Extra fees that appear only at checkout.</p></div>
      <div class="card"><span class="icon">🙁</span><h3>Confirm-shaming</h3><p>Guilt-trip buttons like "No, I don't want to save money".</p></div>
    </div>
  </section>

  <section class="section alt">
    <h2 class="section-title">How it works</h2>
    <div class="cards">
      <div class="card"><span class="step">1</span><h3>Paste URL</h3><p>Copy a product link from any shopping site.</p></div>
      <div class="card"><span class="step">2</span><h3>We Analyze</h3><p>Our rules scan the page for dark patterns.</p></div>
      <div class="card"><span class="step">3</span><h3>Get Report</h3><p>See a transparency report and a clear recommendation.</p></div>
    </div>
  </section>

  <footer class="footer">
  <p>© 2026 Code Breakers | E-Commerce Transparency Assistant</p>
  <p class="footer-links"><a href="privacy.jsp">Privacy Policy</a></p>
</footer>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
<button class="back-to-top" id="backToTop">↑</button>
</body>
</html>