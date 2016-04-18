package _01_register.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import _01_register.model.AccountRoleService;
import _01_register.model.AccountRoleBean;
import _01_register.model.dao.AccountRoleDAOHibernate;
import _05_newsArticle.model.ArticleBean;
import misc.HibernateUtil;


@WebServlet("/member.do")
public class AccountAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AccountRoleService accountRoleService;

	@Override
	public void init() throws ServletException {
		AccountRoleDAOHibernate dao = new AccountRoleDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		accountRoleService = new AccountRoleService();
		accountRoleService.setaccountRoleDAO(dao);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 接收資料
		String role = request.getParameter("role");
		System.out.println("role權限=" + role);
		String accountName = request.getParameter("accountName");
		System.out.println("accountName帳號名稱=" + accountName);
		String revise = request.getParameter("revise");
		System.out.println("revise=" + revise);
		
		
		// 呼叫Model
		AccountRoleBean bean = new AccountRoleBean();
		bean.setaccount_Role(role);
		bean.setaccount(accountName);
		System.out.println(bean);
		
//		accountRoleService.update(account);
		
		if (revise == null) {
			System.out.println("revise==null");
			List<AccountRoleBean> result = accountRoleService.selectAll();
			HttpSession session = request.getSession();
			session.setAttribute("yeah", result);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/admin/memberAdmin.jsp");
		}
		
		else if ("update".equals(revise)){
				System.out.println("修改-------------");
				AccountRoleBean result = accountRoleService.update(bean);
				System.out.println("bean=" + result);
//				HttpSession session = request.getSession();
//				session.setAttribute("yeah", result);
				System.out.println("yeahhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
//				String path = request.getContextPath();
				List<AccountRoleBean> result2 = accountRoleService.selectAll();
				HttpSession session = request.getSession();
				session.setAttribute("yeah", result2);
				String path = request.getContextPath();
				response.sendRedirect(path + "/secure/admin/memberAdmin.jsp");
//				response.sendRedirect(path + "/secure/admin/memberAdmin.jsp");
			}

	         
		else if ("delete".equals(revise)){
			System.out.println("刪除--------");
			boolean result = accountRoleService.delete(bean);
			System.out.println("delete");
//			if(!result) {
//				request.setAttribute("delete", 0);
//			} else {
//				request.setAttribute("delete", 1);
//			}
//			String path = request.getContextPath();
//			request.getRequestDispatcher(path + "/secure/admin/memberAdmin.jsp").forward(request, response);
//			request.getRequestDispatcher("/member.do");
			List<AccountRoleBean> result3 = accountRoleService.selectAll();
			HttpSession session = request.getSession();
			session.setAttribute("yeah", result3);
			String path = request.getContextPath();
			response.sendRedirect(path + "/secure/admin/memberAdmin.jsp");
			
		}
	
			
			
		
//		if ("修改".equals(revise)){
//			AccountRoleBean result = AccountRoleService.selectByAccount(account);
//			HttpSession session = request.getSession();
//			session.setAttribute("", result);
//			String path = request.getContextPath();
//			response.sendRedirect(path + "/secure/admin/memberAdmin.jsp");
//		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
