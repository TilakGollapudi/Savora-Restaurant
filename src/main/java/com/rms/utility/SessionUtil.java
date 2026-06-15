package com.rms.utility;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class SessionUtil {

	private static final Map<String, String> sessions = new HashMap<>();

	private SessionUtil() {
		// Prevent object creation
	}

	// Create Session
	public static String createSession(String username) {
		String sessionId = UUID.randomUUID().toString();
		sessions.put(sessionId, username);
		return sessionId;
	}

	// Validate Session
	public static boolean isSessionValid(String sessionId) {
		return sessions.containsKey(sessionId);
	}

	// Get Username using Session ID
	public static String getUsername(String sessionId) {
		return sessions.get(sessionId);
	}

	// Remove Session
	public static void invalidateSession(String sessionId) {
		sessions.remove(sessionId);
	}
}