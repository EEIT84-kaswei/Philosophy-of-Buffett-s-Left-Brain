package _03_stock_market.model;
/*張秀維 Hsiu Chang, 01-04-2016 */

import java.math.BigDecimal;
import java.util.List;

import org.hibernate.Session;

public interface InstantStockOneDAO {

	Session getSession();

//	InstantStockOneBean select(Integer stock_Code);

	List<InstantStockOneBean> select();

	List<InstantStockOneBean> select(int stock_Code);
	
	List<InstantStockOneBean> select(String stock_Name);
	
	InstantStockOneBean insert(InstantStockOneBean bean);

	InstantStockOneBean update(String stock_TypeCode, String concept_Stock, String stock_Name,
			BigDecimal purchase_Price, BigDecimal selling_Price, BigDecimal final_price, BigDecimal change_Amount,
			BigDecimal change_extent, Integer acc_Trade_Volume, Integer stock_Code);
	
	boolean delete(Integer stock_Code);


}