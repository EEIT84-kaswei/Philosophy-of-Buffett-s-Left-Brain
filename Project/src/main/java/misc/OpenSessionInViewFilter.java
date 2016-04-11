package misc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.hibernate.SessionFactory;

@WebFilter(
		urlPatterns={"/*"}
)
public class OpenSessionInViewFilter implements Filter {
	private FilterConfig config = null;
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}
	@Override
	public void destroy() {

	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		try {
			sessionFactory.getCurrentSession().beginTransaction();
			chain.doFilter(req, resp);
			sessionFactory.getCurrentSession().getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			sessionFactory.getCurrentSession().getTransaction().rollback();
			chain.doFilter(req, resp);
		}
	}
}
