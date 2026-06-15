package com.rms.listener;

import com.rms.utility.DBConnection;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class AppContextListener implements ServletContextListener {

	// Called when application starts
	@Override
	public void contextInitialized(ServletContextEvent sce) {

		System.out.println("====================================");
		System.out.println("Application Started Successfully");
		System.out.println("Initializing Database Connection...");

		// Initialize DB Connection
		DBConnection.getConnection();

		System.out.println("Database Ready");
		System.out.println("====================================");
	}

	// Called when application stops
	@Override
	public void contextDestroyed(ServletContextEvent sce) {

		System.out.println("====================================");
		System.out.println("Closing Application...");

		// Close DB Connection
		DBConnection.getConnection();

		System.out.println("Resources Released Successfully");
		System.out.println("====================================");
	}
}