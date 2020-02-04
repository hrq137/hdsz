package test;

import com.runqian.report4.usermodel.input.AbstractInputListener;
import com.runqian.report4.usermodel.input.InputSQL;

public class PrintSQLInputListener extends AbstractInputListener {
	
	public void beforeSave()throws Exception {
	}
	
	public void afterSave()throws Exception {
		InputSQL[] abc = this.getInputSql();
		for(int i=0;i<this.getInputSql().length;i++){
			String sql = abc[i].getSql();
			if(sql.matches("insert.*")){
				//������˳���insert��䣬ȡ�õ��������ڱ�����ִ�У�������������
				System.out.println("����insert���"+sql);
				}else{
					System.out.println("����update���"+sql);
				}
		}
	}

}
