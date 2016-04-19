package _04_stock.model;
/* 廖千慧 Lara Liao, 01-04-2016 */

import java.util.List;

public interface ConceptStockDAO {

	public abstract List<ConceptStockBean> select();

	public abstract ConceptStockBean select(String cs_Code);

	public abstract List<ConceptStockBean> selectByName(String name);

	public abstract ConceptStockBean insert(ConceptStockBean bean);

	public abstract ConceptStockBean update(ConceptStockBean bean);

	public abstract boolean delete(String cs_Code);

}