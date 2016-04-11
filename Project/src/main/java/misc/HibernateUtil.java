package misc;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil {
	private static final SessionFactory factory = buildSessionFactory();
	private static SessionFactory buildSessionFactory() {
//Hibernate 5.1
		final StandardServiceRegistry registry =
				new StandardServiceRegistryBuilder().configure().build();
		try {
			return new MetadataSources( registry ).buildMetadata().buildSessionFactory();
		} catch (Exception e) {
			StandardServiceRegistryBuilder.destroy( registry );
			System.err.println("Initial SessionFactory creation failed." + e);
			throw new ExceptionInInitializerError(e);
		}
//Hibernate 4.3		
//		try {
//			Configuration configuration = new Configuration().configure();
//			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
//					.applySettings(configuration.getProperties()).build();
//			return configuration.buildSessionFactory(serviceRegistry);
//		} catch (Throwable e) {
//			System.err.println("Initial SessionFactory creation failed." + e);
//			throw new ExceptionInInitializerError(e);
//		}
	}

	public static SessionFactory getSessionFactory() {
		return factory;
	}

	public static void closeSessionFactory() {
		if (factory != null) {
			factory.close();
		}
	}
}
