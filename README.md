# DarkPattern Assistant 🛡️

E-commerce transparency tool by **Team Code Breakers**. Paste a product link and the app scans the page for common dark patterns (fake urgency, misleading discounts, hidden charges, confirm-shaming) and gives a transparency score with an explanation.

> The score shows what the tool *observed* in the page text. It is a guide, not proof that a website is lying.

## Features
- Sign up / login with a profile menu
- One free analysis for guests, unlimited after login
- Result page with score, grade and detected patterns
- Personal history (with date and time) and delete option
- Community Products page, FAQ, Contact and About pages
- Dark mode and responsive layout

## Tech stack
Java 17, Jakarta Servlets + JSP/JSTL, JDBC, MySQL 8, Maven, Apache Tomcat 10.1, HTML/CSS/JavaScript

## Run locally
1. Install JDK 17+, Tomcat 10.1 and MySQL 8.
2. In MySQL, run `database/schema.sql` (creates `darkpattern_assistant`).
3. If your MySQL root user has a password, set environment variables `DPA_DB_USER` and `DPA_DB_PASSWORD` (optional: `DPA_DB_URL`).
4. Import as a Maven project in Eclipse and run on Tomcat 10.1.
5. Open `http://localhost:8080/darkpattern-assistant/`

## Team
| Name | Role |
|---|---|
| Nisha Singh | Frontend |
| Pooja Kumari | Backend |
| Mahima Yadav | Database |
| Priya Chaurasiya | Research report and PPT |

## Known limitations
- Detection reads plain page HTML (no JavaScript), so some large stores may show 100% because their discount text loads dynamically.