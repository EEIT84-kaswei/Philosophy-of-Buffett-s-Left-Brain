package _04_stock.model;


import java.util.Date;
import java.util.List;


/* 黃胤凱 Kevin Huang, 06-04-2016 */
public interface SecuritiesTradeDAO {
	List<SecuritiesTradeBean> select(Date sDate,Integer stock_Code);
	List<SecuritiesTradeBean> select(Integer stock_Code, String securities_Supplier);	
	SecuritiesTradeBean insert(SecuritiesTradeBean bean);
	SecuritiesTradeBean update(SecuritiesTradeBean bean);
	List<SecuritiesTradeBean> selectRange(Date sDateBegin, Date sDateEnd, Integer stock_Code);
}
