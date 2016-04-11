package _04_stock.model;
/* 廖千慧 Lara Liao, 01-04-2016 */

import java.util.List;

import _04_stock.model.StockTypeBean;

public interface StockTypeDAO {

	public abstract List<StockTypeBean> select();

	public abstract StockTypeBean selectByCode(String stock_TypeCode);

	public abstract StockTypeBean selectByName(String stock_TypeName);

}