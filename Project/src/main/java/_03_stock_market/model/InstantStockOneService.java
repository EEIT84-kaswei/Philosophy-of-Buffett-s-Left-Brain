package _03_stock_market.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import _03_stock_market.model.dao.InstantStockOneDAOHibernate;
import misc.HibernateUtil;

public class InstantStockOneService {
	private InstantStockOneDAO InstantStockOneDAO;
	public void setInstantStockOneDAO(InstantStockOneDAO InstantStockOneDAO) {
		this.InstantStockOneDAO = InstantStockOneDAO;
	}
	public static void main(String[] args) {
		try {
			Session session =
					HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction transaction = session.beginTransaction();

			InstantStockOneService service = new InstantStockOneService();
			service.setInstantStockOneDAO(new InstantStockOneDAOHibernate(session));
			List<InstantStockOneBean> beans = service.select(null);
			System.out.println("beans="+beans);
			
			transaction.commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	public List<InstantStockOneBean> select(InstantStockOneBean bean) {
		List<InstantStockOneBean> result = null;
		if(bean!=null && bean.getStock_Code()!=0) {
			InstantStockOneBean temp = InstantStockOneDAO.select(bean.getStock_Code());
			if(temp!=null) {
				result = new ArrayList<InstantStockOneBean>();
				result.add(temp);
			}
		} else {
			result = InstantStockOneDAO.select(); 
		}
		return result;
	}
	public InstantStockOneBean insert(InstantStockOneBean bean) {
		InstantStockOneBean result = null;
		if(bean!=null) {
			result = InstantStockOneDAO.insert(bean);
		}
		return result;
	}
	public InstantStockOneBean update(InstantStockOneBean bean) {
		InstantStockOneBean result = null;
		if(bean!=null) {
			result = InstantStockOneDAO.update(bean.getStock_TypeCode(),bean.getConcept_Stock(),
					bean.getStock_Name(),bean.getPurchase_Price(),bean.getSelling_Price(),
					bean.getFinal_price(),bean.getChange_Amount(),bean.getChange_extent(),
					bean.getAcc_Trade_Volume(),bean.getStock_Code());
		}
		return result;
	}
	public boolean delete(InstantStockOneBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = InstantStockOneDAO.delete(bean.getStock_Code());
		}
		return result;
	}

}
