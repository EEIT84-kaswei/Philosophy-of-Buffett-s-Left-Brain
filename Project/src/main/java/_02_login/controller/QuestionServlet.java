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


@WebServlet("/_02_login.controller/QuestionServlet")
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

		// 接收HTML Form資料
		String q1 = request.getParameter("question1");
		String q2 = request.getParameter("question2");
		String q3 = request.getParameter("question3");
		String q4 = request.getParameter("question4");
		String q5 = request.getParameter("question5");
		String q6 = request.getParameter("question6");
		// 轉換HTML Form資料
		int Q1 = 0, Q2 = 0, Q3 = 0, Q4 = 0, Q5 = 0, Q6 = 0;
		Integer id = 4;
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
		// 驗證HTML Form資料	
		if(q1==null){
			error.put("question1", "請回答第一題");
			RequestDispatcher rd = request
					.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
			rd.forward(request, response);
			return;
		}
		if(q2==null){
			error.put("question2", "請回答第二題");
			RequestDispatcher rd = request
					.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
			rd.forward(request, response);
			return;
		}
		if(q3==null){
			error.put("question3", "請回答第三題");
			RequestDispatcher rd = request
					.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
			rd.forward(request, response);
			return;
		}
		if(q4==null){
			error.put("question4", "請回答第四題");
			RequestDispatcher rd = request
					.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
			rd.forward(request, response);
			return;
		}
		if(q5==null){
			error.put("question5", "請回答第五題");
			RequestDispatcher rd = request
					.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
			rd.forward(request, response);
			return;
		}
		if(q6==null){
			error.put("question6", "請回答第六題");
			RequestDispatcher rd = request
					.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
			rd.forward(request, response);
			return;
		}
//		if(q1==null||q2==null||q3==null||q4==null||q5==null||q6==null){
//			
//			RequestDispatcher rd = request
//					.getRequestDispatcher("/secure/register/question.jsp");
//			rd.forward(request, response);
//			
//			return;
//		}
		

		// Integer scores = Q1+Q2+Q3+Q4+Q5+Q6;
		// if(scores <= 11){
		// Risk_Tolerance = 1;
		// }else if(scores>11 && scores<=21){
		// Risk_Tolerance = 2;
		// }else Risk_Tolerance = 3;
		
		if (!error.isEmpty()) {
			RequestDispatcher rd = request
					.getRequestDispatcher("/secure/_01_register/questionnaire/question.jsp");
			rd.forward(request, response);
			return;
		}
		if (Q4 > 4) {
			Q4 = 5;
		} else if (Q4 > 3) {
			Q4 = 4;
		} else if (Q4 > 2) {
			Q4 = 3;
		} else if (Q4 > 1) {
			Q4 = 2;
		} else
			Q4 = 1;
		//呼叫Model
		Integer scores = service.scores(Q1, Q2, Q3, Q4, Q5, Q6);
		Risk_Tolerance = service.risk(scores);
		QuestionBean bean = new QuestionBean();
		try {
			bean.setId(id);
			bean.setQDate(QDate);
			bean.setRisk_Tolerance(Risk_Tolerance);
			bean.setScores(scores);

			service.insert(bean);
			// request.setAttribute("AnswerBean", bean);
			RequestDispatcher rd = request
					.getRequestDispatcher("/secure/_01_register/questionnaire/types.jsp");
			rd.forward(request, response);
			return;
			// if(Risk_Tolerance == 1){
			// rd =
			// request.getRequestDispatcher("/secure/register/questionnaire.jsp");
			// rd.forward(request, response);
			// }else if(Risk_Tolerance == 2){
			// rd =
			// request.getRequestDispatcher("/secure/register/questionnaire.jsp");
			// rd.forward(request, response);
			// }else if(Risk_Tolerance == 3){
			// rd =
			// request.getRequestDispatcher("/secure/register/questionnaire.jsp");
			// rd.forward(request, response);
			// }

		} catch (Exception e) {			
			e.printStackTrace();			
			return;
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
