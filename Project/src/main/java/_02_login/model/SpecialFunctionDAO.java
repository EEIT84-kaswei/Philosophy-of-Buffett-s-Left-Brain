package _02_login.model;

import java.util.Date;
import java.util.List;

import _04_stock.model.DailyStockBean;
import _04_stock.model.SecuritiesTradeBean;

public interface SpecialFunctionDAO {
	List<SecuritiesTradeBean> selectMax(Date sDate, Integer stock_Code);
	List<SecuritiesTradeBean> selectMin(Date sDate, Integer stock_Code);
	List<DailyStockBean> selectTrade_Volume(Date trading_Date,Integer stock_Code);
	List<Integer> selectBuyTop15(Date sDate,Integer stock_Code);
	List<Integer> selectBuyLow15(Date sDate,Integer stock_Code);
	List<Integer> select_FC_Trade(Integer stock_Code);
	List<Integer> select_IT_Trade(Integer stock_Code);
}
