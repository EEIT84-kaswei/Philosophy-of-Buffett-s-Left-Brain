package _05_newsArticle.controller;

import java.io.IOException;
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

import misc.HibernateUtil;
import _05_newsArticle.model.ArticleBean;
import _05_newsArticle.model.ArticleService;
import _05_newsArticle.model.dao.ArticleDAOHibernate;

@WebServlet(urlPatterns = { "/view/article.controller" })
public class ArticleServlet extends HttpServlet {
	private ArticleService articleService;

	@Override
	public void init() throws ServletException {
		ArticleDAOHibernate dao = new ArticleDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		articleService = new ArticleService();
		articleService.setArticleDAO(dao);
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hahaha");
		// 接收HTML Form資料
		request.setCharacterEncoding("UTF-8");
		String no = request.getParameter("ano");
		String strId = request.getParameter("id");
		String aname = request.getParameter("aname");
		String atitle = request.getParameter("atitle");
		String acontext = request.getParameter("acontext");
		String prodaction = request.getParameter("prodaction");
		// 轉換HTML Form資料
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);

		int id = 0;
		if (strId != null && strId.trim().length() != 0) {
			try {
				id = Integer.parseInt(strId.trim());
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("id", "Id必須是整數");
			}
		}

		Integer ano = 0;
		if (no != null && no.trim().length() != 0) {
			try {
				ano = Integer.parseInt(no.trim());
			} catch (NumberFormatException e) {
			}
		}
		// 驗證HTML Form資料
		if ("Insert".equals(prodaction)) {
			if (aname == null || aname.trim().length() == 0) {
				error.put("aname", "請輸入名稱以便於執行" + prodaction);
			}
		}

		if (error != null && !error.isEmpty() && "Insert".equals(prodaction)) {
			request.getRequestDispatcher("/test/pages/newAcontext.jsp")
					.forward(request, response);
			return;
		}
		// 呼叫Model
		ArticleBean bean = new ArticleBean();
		bean.setId(131);
		bean.setAno(ano);
		bean.setAname(aname);
		bean.setAtime(new Date());
		bean.setAtitle(atitle);
		bean.setAcontext(acontext);
		System.out.println(bean);
		// 根據Model執行結果顯示View
		if (prodaction==null) {
			System.out.println("Servlet呼叫Service.selectPage方法前");
			List<ArticleBean> result = articleService.select();
			System.out.println("Servlet呼叫Service.selectPage方法後");
			HttpSession session = request.getSession();
			session.setAttribute("select", result);
			System.out.println("setAttribute前");
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
		}
		if ("Insert".equals(prodaction)) {
			ArticleDAOHibernate dao = new ArticleDAOHibernate();
			ArticleBean bano = articleService.selectByAno(bean);
			System.out.println("bano=" + bano);
			if (bano != null && ano.equals(bano.getAno())) {
				System.out.println("update執行前");
				articleService.update(bean);
				System.out.println("update執行後");
				List<ArticleBean> result = articleService.select();
				HttpSession session = request.getSession();
				session.setAttribute("select", result);
				System.out.println("update=setAttribute前");
				String path = request.getContextPath();
				response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
			} else {
				System.out.println("Servlet呼叫Service.selectPage方法前");
				articleService.insert(bean);
				List<ArticleBean> result = articleService.select();
				System.out.println("Servlet呼叫Service.selectPage方法後");
				HttpSession session = request.getSession();
				session.setAttribute("select", result);
				System.out.println("insert=setAttribute前");
				String path = request.getContextPath();
				response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
			}
		}
		if ("刪除".equals(prodaction)) {
			System.out.println("Servlet呼叫Service.selectPage方法前");
			articleService.delete(bean);
			List<ArticleBean> result = articleService.select();
			System.out.println("Servlet呼叫Service.selectPage方法後");
			HttpSession session = request.getSession();
			session.setAttribute("select", result);
			System.out.println("setAttribute前");
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/_05_article/articleIndex.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
