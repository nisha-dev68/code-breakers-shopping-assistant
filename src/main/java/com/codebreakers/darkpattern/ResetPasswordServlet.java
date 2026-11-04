package com.codebreakers.darkpattern;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Demo password-reset endpoint requested by the project requirements.
 * IMPORTANT: Email-only password reset is not safe for production. A deployed
 * application should send a time-limited, single-use reset token to the email.
 */
@WebServlet("/reset-password")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private void redirectWithMessage(HttpServletResponse resp, String page, String message) throws IOException {
        resp.sendRedirect(page + "?msg=" + URLEncoder.encode(message, StandardCharsets.UTF_8));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String email = req.getParameter("email");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (email == null || email.isBlank() || newPassword == null || confirmPassword == null
                || newPassword.length() < 6) {
            redirectWithMessage(resp, "forgot-password.jsp",
                    "Please enter your email and a password with at least 6 characters");
            return;
        }
        if (!newPassword.equals(confirmPassword)) {
            redirectWithMessage(resp, "forgot-password.jsp", "Passwords do not match");
            return;
        }

        String normalizedEmail = email.trim().toLowerCase(java.util.Locale.ROOT);
        try (Connection connection = DB.get()) {
            // Confirm that the account exists before updating its password.
            try (PreparedStatement find = connection.prepareStatement("SELECT id FROM users WHERE email = ?")) {
                find.setString(1, normalizedEmail);
                try (ResultSet rs = find.executeQuery()) {
                    if (!rs.next()) {
                        redirectWithMessage(resp, "forgot-password.jsp", "No account found with that email");
                        return;
                    }
                }
            }

            String passwordHash = PasswordUtil.hash(newPassword);
            try (PreparedStatement update = connection.prepareStatement(
                    "UPDATE users SET password_hash = ? WHERE email = ?")) {
                update.setString(1, passwordHash);
                update.setString(2, normalizedEmail);
                int updated = update.executeUpdate();
                if (updated == 1) {
                    redirectWithMessage(resp, "login.jsp", "Password reset! Please login with your new password");
                } else {
                    redirectWithMessage(resp, "forgot-password.jsp", "Password reset failed. Please try again");
                }
            }
        } catch (Exception e) {
            getServletContext().log("Password reset failed", e);
            redirectWithMessage(resp, "forgot-password.jsp", "Password reset failed. Please try again later");
        }
    }
}
