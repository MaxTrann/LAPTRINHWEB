package vn.maxtrann.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
	private static EntityManagerFactory factory;
	
	static {
		try {
			factory = Persistence.createEntityManagerFactory("dataSource");
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException("Failed to create EntityManagerFactory", ex);
		}
	}
	
	public static EntityManager getEntityManager() {
		if (factory == null || !factory.isOpen()) {
			factory = Persistence.createEntityManagerFactory("dataSource");
		}
		return factory.createEntityManager();
	}
	
	public static void closeEntityManagerFactory() {
		if (factory != null && factory.isOpen()) {
			factory.close();
		}
	}
	
}
