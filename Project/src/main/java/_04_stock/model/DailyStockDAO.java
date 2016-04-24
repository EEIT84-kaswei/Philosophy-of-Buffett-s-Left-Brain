package _04_stock.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public interface DailyStockDAO {

	public abstract DailyStockBean select(Integer stock_Code, Date trading_Date);
	
	public abstract List<Object[]> selectByStockCode(Integer stock_Code);

	public abstract List<DailyStockBean> select();

	public abstract DailyStockBean insert(DailyStockBean bean);

	public abstract boolean delete(Integer stock_Code, Date trading_Date);

	public abstract DailyStockBean update(BigDecimal opening_Price,
			BigDecimal highest_Price, BigDecimal lowest_Price,
			BigDecimal closing_Price, BigDecimal change_Amount,
			BigDecimal change_Extent, Integer trade_Volume, Integer stock_Code,
			java.util.Date trading_Date);

}