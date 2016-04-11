package _03_stock_market.model;
/* 廖千慧 Lara Liao, 01-04-2016 */

import java.util.List;

import _03_stock_market.model.TaiexBean;

public interface TaiexDAO {

	public abstract List<TaiexBean> select();

	public abstract TaiexBean select(java.util.Date tDateTime);

	public abstract List<TaiexBean> selectByDate(java.util.Date tDate);

	public abstract TaiexBean insert(TaiexBean bean);

	public abstract TaiexBean update(TaiexBean bean);

	public abstract boolean delete(java.util.Date tDateTime);

}