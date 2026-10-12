<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FAQ | DarkPattern Assistant</title>
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
      <li><a href="history.jsp">My History</a></li>
      <li><a href="login.jsp">Login</a></li>
      <li><a href="signup.jsp">Sign Up</a></li>
      <button class="theme-toggle" id="themeToggle" aria-label="Toggle dark mode">🌙</button>
    </ul>
  </nav>

  <section class="about-hero">
    <h1>Frequently Asked Questions</h1>
    <p>Everything you need to know about how DarkPattern Assistant works.</p>
  </section>

  <section class="section faq-wrap">

    <div class="faq-item">
      <button class="faq-question">
        Is DarkPattern Assistant free to use?
        <span class="faq-toggle">+</span>
      </button>
      <div class="faq-answer">
        <p>Yes! Your first product analysis is completely free. After that, you'll need to create a free account to keep using it.</p>
      </div>
    </div>

    <div class="faq-item">
      <button class="faq-question">
        Which e-commerce sites are supported?
        <span class="faq-toggle">+</span>
      </button>
      <div class="faq-answer">
        <p>We're working on supporting major Indian shopping sites. Coverage is expanding as we add more sites to our detection system.</p>
      </div>
    </div>

    <div class="faq-item">
      <button class="faq-question">
        Do you store the products I analyze?
        <span class="faq-toggle">+</span>
      </button>
      <div class="faq-answer">
        <p>If you're logged in, we save your analysis history so you can revisit it later. If you're using the free trial without an account, nothing is saved.</p>
      </div>
    </div>

    <div class="faq-item">
      <button class="faq-question">
        What exactly is a "dark pattern"?
        <span class="faq-toggle">+</span>
      </button>
      <div class="faq-answer">
        <p>A dark pattern is a design trick used to manipulate you into doing something you didn't intend to — like buying faster, spending more, or agreeing to something you'd otherwise decline.</p>
      </div>
    </div>

    <div class="faq-item">
      <button class="faq-question">
        How accurate is the analysis?
        <span class="faq-toggle">+</span>
      </button>
      <div class="faq-answer">
        <p>Our system checks for well-known dark pattern signals. It's a helpful guide, not a perfect guarantee — always use your own judgment too.</p>
      </div>
    </div>

  </section>

  <div class="result-actions">
    <a href="index.jsp" class="btn">Try It Now</a>
  </div>

  <footer class="footer">
    <p>© 2026 Code Breakers | E-Commerce Transparency Assistant</p>
  </footer>

  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <button class="back-to-top" id="backToTop">↑</button>
</body>
</html>