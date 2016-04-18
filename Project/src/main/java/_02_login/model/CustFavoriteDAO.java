package _02_login.model;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.List;

import _02_login.model.CustFavoriteBean;

public interface CustFavoriteDAO {

	public abstract List<CustFavoriteBean> select();
	public abstract List<CustFavoriteBean> selectByAccount(String account);
	public abstract List<CustFavoriteBean> selectByStock(Integer stock_Code);
	public abstract CustFavoriteBean selectByAccountAndStock(String account, Integer stock_Code);
	public abstract CustFavoriteBean insert(CustFavoriteBean bean);
	public abstract CustFavoriteBean update(String account, Integer stock_Code, Integer new_stock_Code);
	public abstract boolean delete(String account, Integer stock_Code);

}