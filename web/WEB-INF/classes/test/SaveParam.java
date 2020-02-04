package test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.runqian.report4.usermodel.input.AbstractParamProcessor;

public class SaveParam extends AbstractParamProcessor {

	public void process() throws Exception {
		Connection con = null;
		Statement stmt = null;
		String empID = getParamValue("empID");
		String duty = getParamValue("duty");
		duty = duty==null?"":duty;
		String area = getParamValue("area");
		area = area==null?"":area;
		String saveName = getParamValue("saveName");
		String toSave = getParamValue("toSave");
		String listSave = getParamValue("listSave");

		try {
			// ��ȡȱʡ���ݿ�����
			con = context.getConnectionFactory(context.getDefDataSourceName())
					.getConnection();
			if ("1".equals(toSave) && !"".equals(saveName)) {
				// ������ʷ����
				String saveValue = "empID=" + empID + ";duty=" + duty
						+ ";area=" + area;
				String sql = "INSERT INTO param VALUES ('8.3.raq','" + saveName
						+ "','" + saveValue + "')";
				con.createStatement().execute(sql);
				return;
			}

			if (listSave != null && !"".equals(listSave)) {
				// ֱ��ʹ�����������ʷ��ѯ
				stmt = con.createStatement();
				ResultSet rs = stmt
						.executeQuery("SELECT * from param ��Ա where saveName='"
								+ listSave + "'");
				if (rs.next()) {
					// ȡ������ֵ�������в������ã�ʹ���û�����Ҫ������������Ǵ����ݿ���ȡ
					String saveValueDB = rs.getString("saveValue");
					String[] values = saveValueDB.split(";");
					for (int i = 0; i < values.length; i++) {
						int j = values[i].indexOf("=");
						putParam(values[i].substring(0, j), values[i]
								.substring(j + 1, values[i].length()));
						System.out.println(values[i].substring(0, j)
								+ "��"
								+ values[i]
										.substring(j + 1, values[i].length()));
					}
				}
			}

		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
			}
		}
	}

}
