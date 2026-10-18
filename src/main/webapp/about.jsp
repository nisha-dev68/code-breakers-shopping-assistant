<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About | DarkPattern Assistant</title>
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
    <h1>Shopping should be honest.</h1>
    <p>DarkPattern Assistant helps you spot manipulative design tricks on e-commerce sites, so you can shop with confidence instead of pressure.</p>
  </section>

  <section class="section">
    <h2 class="section-title">Why we built this</h2>
    <p class="about-text">
      Online stores increasingly use "dark patterns" — sneaky design tricks like fake countdown timers, inflated original prices,
      and guilt-tripping buttons — to push people into buying faster or spending more than they intended.
      Most shoppers don't even notice these tricks are working on them. Our goal is simple: give people a quick,
      free way to check any product page before they buy, and understand exactly what design tricks are being used against them.
    </p>
  </section>

  <section class="section alt">
    <h2 class="section-title">How it works</h2>
    <div class="cards">
      <div class="card"><span class="step">1</span><h3>Paste a URL</h3><p>Copy any product link from an e-commerce site.</p></div>
      <div class="card"><span class="step">2</span><h3>We analyze it</h3><p>Our system scans the page for known dark pattern signals.</p></div>
      <div class="card"><span class="step">3</span><h3>Get a report</h3><p>See a transparency score and a full breakdown of what was found.</p></div>
    </div>
  </section>

  <section class="section">
    <h2 class="section-title">What we detect</h2>
    <div class="cards">
      <div class="card"><span class="icon">⏰</span><h3>Fake Urgency</h3><p>Countdown timers or "only X left" claims that aren't real.</p></div>
      <div class="card"><span class="icon">🏷️</span><h3>Misleading Discounts</h3><p>Inflated original prices to make a discount look bigger.</p></div>
      <div class="card"><span class="icon">💸</span><h3>Hidden Charges</h3><p>Extra fees that appear only at checkout.</p></div>
      <div class="card"><span class="icon">🙁</span><h3>Confirm-shaming</h3><p>Guilt-trip buttons designed to shame you into buying.</p></div>
    </div>
  </section>
  
  <section class="section team-section">
  <h2 class="section-title">👥 Meet the Team Behind This Project</h2>
  <p class="section-sub">Four of us, one shared mission — making online shopping more transparent.</p>

  <div class="cards">
  <div class="card team-card">
    <span class="icon">👩‍💻</span>
    <h3>Nisha Singh</h3>
    <p>Frontend</p>
    <div class="team-links">
      <a href="https://www.linkedin.com/in/nisha-singh-370218430?utm_source=share_via&utm_content=profile&utm_medium=member_android" target="_blank" class="link-linkedin">🔗 LinkedIn</a>
      <a href="https://github.com/nisha-dev68" target="_blank" class="link-github">💻 GitHub</a>
    </div>
  </div>

  <div class="card team-card">
    <span class="icon">⚙️</span>
    <h3>Pooja Kumari</h3>
    <p>Backend</p>
    <div class="team-links">
      <a href="https://www.linkedin.com/in/pooja-kumari-1b47873b7?utm_source=share_via&utm_content=profile&utm_medium=member_android" target="_blank" class="link-linkedin">🔗 LinkedIn</a>
      <a href="https://github.com/PoojaKumari2611" target="_blank" class="link-github">💻 GitHub</a>
    </div>
  </div>

  <div class="card team-card">
    <span class="icon">🗄️</span>
    <h3>Mahima Yadav</h3>
    <p>Database</p>
    <div class="team-links">
      <a href="https://www.linkedin.com/in/mahima-yadav-7ab774433?utm_source=share_via&utm_content=profile&utm_medium=member_android" target="_blank" class="link-linkedin">🔗 LinkedIn</a>
      <a href="https://github.com/MAHIMA-USERNAME" target="_blank" class="link-github">💻 GitHub</a>
    </div>
  </div>

  <div class="card team-card">
    <span class="icon">📊</span>
    <h3>Priya Chaurasiya</h3>
    <p>Research</p>
    <div class="team-links">
      <a href="https://www.linkedin.com/in/priya-chaurasiya-200835435?utm_source=share_via&utm_content=profile&utm_medium=member_android" target="_blank" class="link-linkedin">🔗 LinkedIn</a>
      <a href="https://github.com/PRIYA-USERNAME" target="_blank" class="link-github">💻 GitHub</a>
    </div>
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