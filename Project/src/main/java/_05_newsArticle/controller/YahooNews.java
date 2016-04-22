package _05_newsArticle.controller;

import java.io.IOException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;

import misc.HibernateUtil;

import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import _05_newsArticle.model.NewsBean;
import _05_newsArticle.model.NewsService;
import _05_newsArticle.model.dao.NewsDAOHibernate;

public class YahooNews {

	private static NewsService service;

	public static void main(String[] args) throws IOException {
		NewsDAOHibernate dao = new NewsDAOHibernate();
		dao.setSessionFactory(HibernateUtil.getSessionFactory());
		service = new NewsService();
		service.setDao(dao);
		// URL 以yahoo股票為測試
		for (int i = 1; i <= 60; i++) {

			URL url = new URL(
					"https://tw.stock.yahoo.com/news_list/url/d/e/N1.html?q=&pg="
							+ i);
			/*
			 * 向網頁伺服發出請求，並將回應分析成document。 第一個參數是：請求位置與QueryString。
			 * 第二個參數是：連線時間(毫秒)，在指定時間內若無回應則會丟出IOException
			 */
			Document doc = Jsoup.parse(url, 10000);

			Elements as = doc.select("a.mbody");
			// int size = as.size();
			Iterator iterator;
			Iterator it = as.iterator();

			while (it.hasNext()) {
				Element a = (Element) it.next();
				// System.out.println(a);
				if (a != null) {
					String href = a.attr("href");
					if (!href.equals("#")) {
						URL news = new URL(href);
						// System.out.println(news);
						Document doc2 = Jsoup.parse(news, 10000);
						Element title = doc2.select("span.style12").first();
						Element time = doc2.select("span.t1").first();
						Element table = doc2.select("table#aritcletable")
								.first();
						if (title != null) {
							NewsBean bean = new NewsBean();
							// System.out.println("title = " + title.text());

							// 1. title
							bean.setNtitle(title.text());

							if (time != null) {
								// System.out.println("time = " + time.text());
								String dateString = time.text();
								SimpleDateFormat sdf = new SimpleDateFormat(
										"yyyy/MM/dd HH:mm");
								java.util.Date ntime = null;
								try {
									ntime = sdf.parse(dateString);
								} catch (ParseException e) {
									e.printStackTrace();
								}

								// 2. time
								bean.setNtime(ntime);

								if (table != null) {
									Elements ps = table.select("p");
									if (ps != null) {
										if (ps.toString().contains("股")) {
											if (ps.toString().contains("新聞")) {

												// 3. content
												bean.setNcontext(ps.toString());

												NewsBean result = null;
												Transaction tx = null;
												try {
													tx = HibernateUtil
															.getSessionFactory()
															.getCurrentSession()
															.beginTransaction();
													result = service
															.insert(bean);
													tx.commit();
												} catch (HibernateException e) {
													tx.rollback();
													e.printStackTrace();
												}
												System.out
														.println("----------------------------------------------------------------------");
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
