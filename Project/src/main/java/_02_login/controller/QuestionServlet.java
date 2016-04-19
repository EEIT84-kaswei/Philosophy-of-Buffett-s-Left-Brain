package _02_login.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;
import org.junit.runner.Request;

import _02_login.model.QuestionBean;
import _02_login.model.QuestionService;
import _02_login.model.dao.QuestionDAOHibernate;
import misc.HibernateUtil;


@WebServlet("/secure/_02_login.controller/QuestionServlet")
public class QuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private QuestionService service;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);

		request.setCharacterEncoding("UTF-8");
		System.out.println("接收HTML Form資料");
		// 接收HTML Form資料
		String account = request.getRemoteUser();
		String q1 = request.getParameter("question1");
		String q2 = request.getParameter("question2");
		String q3 = request.getParameter("question3");
		String q4 = request.getParameter("question4");
		String q5 = request.getParameter("question5");
		String q6 = request.getParameter("question6");
		System.out.println("轉換HTML Form資料");
		// 轉換HTML Form資料
		int Q1 = 0, Q2 = 0, Q3 = 0, Q4 = 0, Q5 = 0, Q6 = 0;

		Integer Risk_Tolerance = 0;
		SimpleDateFormat sformat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
		Timestamp QDate = new Timestamp(new Date().getTime());
		if (q1 != null) {
			try {
				Q1 = Integer.parseInt(q1);
			} catch (NumberFormatException e1) {
				error.put("question1", "請回答第一題");
				e1.printStackTrace();
			}
		}
		if (q2 != null) {
			try {
				Q2 = Integer.parseInt(q2);
			} catch (NumberFormatException e1) {
				error.put("question2", "請回答第二題");
				e1.printStackTrace();
			}
		}
		if (q3 != null) {
			try {
				Q3 = Integer.parseInt(q3);
			} catch (NumberFormatException e1) {
				error.put("question3", "請回答第三題");
				e1.printStackTrace();
			}
		}
		if (q4 != null) {
			try {
				Q4 = Integer.parseInt(q4);
			} catch (NumberFormatException e1) {
				error.put("question4", "請回答第四題");
				e1.printStackTrace();
			}
		}

		if (q5 != null) {
			try {
				Q5 = Integer.parseInt(q5);
			} catch (NumberFormatException e1) {
				error.put("question5", "請回答第五題");
				e1.printStackTrace();
			}
		}
		if (q6 != null) {
			try {
				Q6 = Integer.parseInt(q6);
			} catch (NumberFormatException e1) {
				error.put("question6", "請回答第六題");
				e1.printStackTrace();
			}
		}
		System.out.println("驗證HTML Form資料");
		// 驗證HTML Form資料
		QuestionBean beanOne = null;
		if (service.selectLast(account) == null) {
			RequestDispatcher rd = request
					.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
			rd.forward(request, response);
		} else
			beanOne = service.selectLast(account);

		if (account != null && beanOne == null) {
			if (q1 == null) {
				error.put("question1", "請回答第一題");
				RequestDispatcher rd = request
						.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
				rd.forward(request, response);
				return;
			}
			if (q2 == null) {
				error.put("question2", "請回答第二題");
				RequestDispatcher rd = request
						.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
				rd.forward(request, response);
				return;
			}
			if (q3 == null) {
				error.put("question3", "請回答第三題");
				RequestDispatcher rd = request
						.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
				rd.forward(request, response);
				return;
			}
			if (q4 == null) {
				error.put("question4", "請回答第四題");
				RequestDispatcher rd = request
						.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
				rd.forward(request, response);
				return;
			}
			if (q5 == null) {
				error.put("question5", "請回答第五題");
				RequestDispatcher rd = request
						.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
				rd.forward(request, response);
				return;
			}
			if (q6 == null) {
				error.put("question6", "請回答第六題");
				RequestDispatcher rd = request
						.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
				rd.forward(request, response);
				return;
			}
		} else {

			System.out.println("錯誤前");
			System.out.println(error.isEmpty());
			if (!error.isEmpty()) {
				RequestDispatcher rd = request
						.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
				rd.forward(request, response);
				return;
			}
			System.out.println("錯誤後");
			if (Q4 > 4) {
				Q4 = 5;
			} else if (Q4 > 3) {
				Q4 = 4;
			} else if (Q4 > 2) {
				Q4 = 3;
			} else if (Q4 > 1) {
				Q4 = 2;
			} else if(Q4==1)
				Q4 = 1;
			// 呼叫Model
			Integer scores = service.scores(Q1, Q2, Q3, Q4, Q5, Q6);
			Risk_Tolerance = service.risk(scores);
			QuestionBean bean = new QuestionBean();
			if (scores == 0) {
				if (account != null && beanOne != null) {
					if (beanOne.getRisk_Tolerance() == 1) {
						request.setAttribute("oldScores", beanOne.getScores());
						RequestDispatcher rd = request
								.getRequestDispatcher("/secure/_02_login/recommend.jsp");
						rd.forward(request, response);

					} else if (beanOne.getRisk_Tolerance() == 2) {
						request.setAttribute("oldScores", beanOne.getScores());
						RequestDispatcher rd = request
								.getRequestDispatcher("/secure/_02_login/recommend2.jsp");
						rd.forward(request, response);

					} else if (beanOne.getRisk_Tolerance() == 3) {
						request.setAttribute("oldScores", beanOne.getScores());
						RequestDispatcher rd = request
								.getRequestDispatcher("/secure/_02_login/recommend3.jsp");
						rd.forward(request, response);

					}
				}
			} else {
				try {
					bean.setAccount(account);
					bean.setQDate(QDate);
					bean.setRisk_Tolerance(Risk_Tolerance);
					bean.setScores(scores);
					service.insert(bean);
					beanOne = service.selectLast(account);
					if (Risk_Tolerance == 1) {
						request.setAttribute("oldScores", beanOne.getScores());
						RequestDispatcher rd = request
								.getRequestDispatcher("/secure/_02_login/recommend.jsp");
						rd.forward(request, response);
					} else if (Risk_Tolerance == 2) {
						request.setAttribute("oldScores", beanOne.getScores());
						RequestDispatcher rd = request
								.getRequestDispatcher("/secure/_02_login/recommend2.jsp");
						rd.forward(request, response);
					} else {
						request.setAttribute("oldScores", beanOne.getScores());
						RequestDispatcher rd = request
								.getRequestDispatcher("/secure/_02_login/recommend3.jsp");
						rd.forward(request, response);
					}
					return;

				} catch (Exception e) {
					e.printStackTrace();
					return;
				}
			}
		}
	}

	// 在未使用spring前，先使用init方法取得session
	@Override
	public void init() throws ServletException {
		QuestionDAOHibernate dao = new QuestionDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new QuestionService();
		service.setQuestionDAO(dao);
	}

}
