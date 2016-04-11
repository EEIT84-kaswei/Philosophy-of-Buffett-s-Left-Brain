package _03_stock_market.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import _03_stock_market.model.dao.InstantStockDAOHibernate;
import misc.HibernateUtil;

public class InstantStockService {
	private InstantStockDAO InstantStockDAO;
	public void setInstantStockDAO(InstantStockDAO InstantStockDAO) {
		this.InstantStockDAO = InstantStockDAO;
	}
	public static void main(String[] args) {
		try {
			Session session =
					HibernateUtil.getSessionFactory().getCurrentSession();
			Transaction transaction = session.beginTransaction();

			InstantStockService service = new InstantStockService();
			service.setInstantStockDAO(new InstantStockDAOHibernate(session));
			List<InstantStockBean> beans = service.select(null);
			System.out.println("beans="+beans);
			
			transaction.commit();
		} finally {
			HibernateUtil.closeSessionFactory();
		}
	}
	public List<InstantStockBean> select(InstantStockBean bean) {
		List<InstantStockBean> result = null;
		if(bean!=null && bean.getStock_Code()!=0) {
			InstantStockBean temp = InstantStockDAO.select(bean.getStock_Code(),bean.getiDatetime());
			if(temp!=null) {
				result = new ArrayList<InstantStockBean>();
				result.add(temp);
			}
		} else {
			result = InstantStockDAO.select(); 
		}
		return result;
	}
	public InstantStockBean insert(InstantStockBean bean) {
		InstantStockBean result = null;
		if(bean!=null) {
			result = InstantStockDAO.insert(bean);
		}
		return result;
	}
	public InstantStockBean update(InstantStockBean bean) {
		InstantStockBean result = null;
		if(bean!=null) {
			
			result = InstantStockDAO.update(bean.getStock_TypeCode(), bean.getStock_Code(),
						bean.getiDatetime(), bean.getStock_Name(), bean.getPurchase_Price(),
						bean.getSelling_Price(), bean.getFinal_price(), bean.getChange_Amount(),
						bean.getChange_extent(), bean.getAcc_Trade_Volume());
		}
		return result;
	}
	public boolean delete(InstantStockBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = InstantStockDAO.delete(bean.getStock_Code(), bean.getiDatetime());
		}
		return result;
	}

}
