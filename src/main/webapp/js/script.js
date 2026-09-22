document.addEventListener("DOMContentLoaded", function () {
	// Mobile menu toggle
	var menuBtn = document.getElementById("menuToggle");
	var navLinks = document.getElementById("navLinks");
	if (menuBtn && navLinks) {
	  menuBtn.addEventListener("click", function () {
	    navLinks.classList.toggle("open");
	  });
	}

  function showMessage(form, text) {
    var old = form.parentNode.querySelector(".form-error");
    if (old) old.remove();
    var msg = document.createElement("div");
    msg.className = "form-error";
    msg.textContent = text;
    form.insertAdjacentElement("afterend", msg);
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
});