package _02_login.model;
/* 陳姵吟 Carley Chen, 01-04-2016 */

import java.util.List;

import _02_login.model.CustFavoriteBean;

public interface CustFavoriteDAO {

	public abstract List<CustFavoriteBean> select();

	public abstract List<CustFavoriteBean> selectById(Integer id);

	public abstract List<CustFavoriteBean> selectByStock(Integer stock_Code);
	
	public abstract CustFavoriteBean selectByIdAndStock(Integer id, Integer stock_Code);

	public abstract CustFavoriteBean insert(CustFavoriteBean bean);
	
	public abstract CustFavoriteBean update(Integer id, Integer stock_Code, Integer new_stock_Code);

	public abstract boolean delete(Integer id, Integer stock_Code);

}