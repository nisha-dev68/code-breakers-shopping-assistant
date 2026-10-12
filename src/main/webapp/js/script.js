document.addEventListener("DOMContentLoaded", function () {
	// Mobile menu toggle
	var menuBtn = document.getElementById("menuToggle");
	var navLinks = document.getElementById("navLinks");
	if (menuBtn && navLinks) {
	  menuBtn.addEventListener("click", function () {
	    navLinks.classList.toggle("open");
	  });
	  
	  var searchInput = document.getElementById("searchInput");
	  var riskFilter = document.getElementById("riskFilter");
	  if (searchInput && riskFilter) {
	    function filterProducts() {
	      var term = searchInput.value.toLowerCase();
	      var risk = riskFilter.value;
	      document.querySelectorAll(".product-card").forEach(function (card) {
	        var name = card.querySelector("h3").textContent.toLowerCase();
	        var cardRisk = card.querySelector(".product-score").classList[1];
	        var matchesText = name.includes(term);
	        var matchesRisk = risk === "all" || cardRisk === risk;
	        card.style.display = (matchesText && matchesRisk) ? "" : "none";
	      });
	    }
	    searchInput.addEventListener("input", filterProducts);
	    riskFilter.addEventListener("change", filterProducts);
	  }
	  // Highlight active nav link
	  var currentPage = window.location.pathname.split("/").pop();
	  document.querySelectorAll(".navbar ul a").forEach(function (link) {
	    var linkPage = link.getAttribute("href");
	    if (linkPage === currentPage || (currentPage === "" && linkPage === "index.jsp")) {
	      link.classList.add("active");
	    }
	  });
	  // Small delay so the click animation is visible before navigating
	  document.querySelectorAll(".product-card").forEach(function (card) {
	    card.addEventListener("click", function (e) {
	      e.preventDefault();
	      var href = card.getAttribute("href");
	      card.style.transform = "scale(0.97)";
	      setTimeout(function () {
	        window.location.href = href;
	      }, 120);
	    });
	  });
	  // FAQ accordion
	  document.querySelectorAll(".faq-question").forEach(function (btn) {
	    btn.addEventListener("click", function () {
	      var item = btn.closest(".faq-item");
	      item.classList.toggle("open");
	    });
	  });
	  
	}

	function showMessage(form, text) {
	  var toast = document.createElement("div");
	  toast.className = "toast";
	  toast.textContent = text;
	  document.body.appendChild(toast);
	  setTimeout(function () { toast.classList.add("show"); }, 10);
	  setTimeout(function () {
	    toast.classList.remove("show");
	    setTimeout(function () { toast.remove(); }, 300);
	  }, 3000);
	}

  // Homepage: analyze form
  var analyzeForm = document.querySelector(".search-box");
  if (analyzeForm) {
    analyzeForm.addEventListener("submit", function (e) {
      var url = analyzeForm.querySelector("input[name='productUrl']").value.trim();
      if (!/^https?:\/\/.+\..+/i.test(url)) {
        e.preventDefault();
        showMessage(analyzeForm, "Please enter a valid product link starting with http:// or https://");
        return;
      }
      var btn = analyzeForm.querySelector("button");
      btn.textContent = "Analyzing...";
	  btn.classList.add("loading");
      btn.disabled = true;
    });
  }

  // Signup: passwords must match
  var signupForm = document.querySelector("form[action='signup']");
  if (signupForm) {
    signupForm.addEventListener("submit", function (e) {
      var pw = signupForm.querySelector("input[name='password']").value;
      var cpw = signupForm.querySelector("input[name='confirmPassword']").value;
      if (pw !== cpw) {
        e.preventDefault();
        showMessage(signupForm, "Passwords do not match. Please try again.");
      }
    });
  }
});

// Reset the button if the user comes back with the Back button
window.addEventListener("pageshow", function () {
  var btn = document.querySelector(".search-box button");
  if (btn) { btn.textContent = "Analyze"; btn.disabled = false; }
  
  // Eye button: show / hide password
  document.querySelectorAll(".toggle-eye").forEach(function (btn) {
    btn.addEventListener("click", function () {
      var input = btn.parentNode.querySelector("input");
      var show = input.type === "password";
      input.type = show ? "text" : "password";
      btn.textContent = show ? "🙈" : "👁️";
    });
  });

  // Live "passwords match" message
  var pw1 = document.querySelector("input[name='password']");
  var pw2 = document.querySelector("input[name='confirmPassword']");
  var matchMsg = document.getElementById("matchMsg");
  if (pw1 && pw2 && matchMsg) {
    var checkMatch = function () {
      if (!pw2.value) { matchMsg.textContent = ""; matchMsg.className = "match-msg"; return; }
      if (pw1.value === pw2.value) {
        matchMsg.textContent = "✔ Passwords match";
        matchMsg.className = "match-msg ok";
      } else {
        matchMsg.textContent = "✖ Passwords do not match";
        matchMsg.className = "match-msg bad";
      }
    };
    pw1.addEventListener("input", checkMatch);
    pw2.addEventListener("input", checkMatch);
  }
  
  var backBtn = document.getElementById("backToTop");
  if (backBtn) {
    window.addEventListener("scroll", function () {
      backBtn.classList.toggle("show", window.scrollY > 400);
    });
    backBtn.addEventListener("click", function () {
      window.scrollTo({ top: 0, behavior: "smooth" });
    });
  }
  
  var copyBtn = document.getElementById("copyUrlBtn");
  if (copyBtn) {
    copyBtn.addEventListener("click", function () {
      var text = document.getElementById("resultUrl").textContent;
      navigator.clipboard.writeText(text).then(function () {
        copyBtn.textContent = "Copied!";
        setTimeout(function () { copyBtn.textContent = "Copy"; }, 1500);
      });
    });
  }
  
  var themeBtn = document.getElementById("themeToggle");
  if (themeBtn) {
    if (localStorage.getItem("theme") === "dark") { document.body.classList.add("dark"); themeBtn.textContent = "☀️"; }
    themeBtn.addEventListener("click", function () {
      document.body.classList.toggle("dark");
      var isDark = document.body.classList.contains("dark");
      themeBtn.textContent = isDark ? "☀️" : "🌙";
      localStorage.setItem("theme", isDark ? "dark" : "light");
    });
  }
});