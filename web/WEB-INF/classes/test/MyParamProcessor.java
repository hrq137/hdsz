package test;
import java.sql.*;
import com.runqian.report4.usermodel.input.*;
public class MyParamProcessor extends AbstractParamProcessor {
	public void process() throws Exception {
		
		boolean canEdit = false;
		Connection con = null;
		Statement stmt = null;
		try {
			// ��ȡȱʡ���ݿ�����
			con = context.getConnectionFactory(context.getDefDataSourceName())
					.getConnection();
			String empID = getParamValue("empID");
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * from ��Ա where ��ԱID='"+empID+"'");
			if(rs.next()){
				//�жϱ��û��Ƿ��Ѿ��������
				String isMODITY = rs.getString("ISMODITY");
				if("1".equals( isMODITY ))
					canEdit = false;
				
			}
		} finally {
			try {
				System.out.println("canEdit=========>"+canEdit);
				if(stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
			}
		}
		if (!canEdit) {
			throw new Exception("������Ѿ�������ˣ������޸�!");
		}
	}
}
