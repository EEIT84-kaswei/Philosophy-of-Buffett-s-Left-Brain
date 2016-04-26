package _05_newsArticle.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _05_newsArticle.model.NewsBean;
import _05_newsArticle.model.NewsService;
import _05_newsArticle.model.dao.NewsDAOHibernate;
import misc.HibernateUtil;

@WebServlet("/pages/_05_newsArticle/Index.do")
public class IndexNewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	private NewsService service;
	
	@Override
	public void init() throws ServletException {
		NewsDAOHibernate dao = new NewsDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new NewsService();
		service.setDao(dao);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
											
		
			List<NewsBean> bean = service.selectAll();
			HttpSession session = request.getSession();
			session.setAttribute("selectNewsOnly", bean);				
			String path = request.getContextPath();
			response.sendRedirect(path+"/Welcome.jsp");
			return;
			
		
			
	}
}
