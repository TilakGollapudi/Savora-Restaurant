package com.rms.utility;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryptor {

	private PasswordEncryptor() {
		// Prevent object creation
	}

	public static String encryptPassword(String password) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			byte[] hashedBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));

			StringBuilder sb = new StringBuilder();
			for (byte b : hashedBytes) {
				sb.append(String.format("%02x", b));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("Error while encrypting password", e);
		}
	}

	public static boolean matchPassword(String rawPassword, String encryptedPassword) {
		return encryptPassword(rawPassword).equals(encryptedPassword);
	}
}