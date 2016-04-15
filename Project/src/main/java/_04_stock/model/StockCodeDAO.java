package _04_stock.model;
/* 黃胤凱 Kevin Huang, 01-04-2016 */

import java.util.List;

public interface StockCodeDAO {
	
	List<StockCodeBean> selectBycs_Code(String cs_Code);
	List<StockCodeBean> selectByTypeCode(String stock_TypeCode);
	StockCodeBean select(Integer stock_Code);
	List<StockCodeBean> selectAll();
	StockCodeBean insert(StockCodeBean bean);
	StockCodeBean update(Integer stock_Code,String stock_Name,String stock_TypeCode,String cs_Code,String commend);
	boolean delete(Integer stock_Code);
}
