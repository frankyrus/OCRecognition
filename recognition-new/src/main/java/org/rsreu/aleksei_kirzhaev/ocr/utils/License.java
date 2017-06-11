package org.rsreu.aleksei_kirzhaev.ocr.utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.rsreu.aleksei_kirzhaev.ocr.utils.props.LoadProperties;

public class License {

	public static Boolean setLicense(String key) throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		CallableStatement cs = null;
		Boolean isOk = false;
		try {
			LoadProperties property = new LoadProperties();
			final String user = property.getProperty("dbuser");
			final String password = property.getProperty("dbpassword");
			final String url = property.getProperty("dbconnection");
			connection = DriverManager.getConnection(url, user, password);
			cs = connection.prepareCall("{call common_pkg.set_access(pKey => ?, pResult => ?)}");
			cs.setString(1, key);
			cs.registerOutParameter(2, java.sql.Types.INTEGER);
			cs.executeUpdate();
			isOk = cs.getInt(2) == 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (cs != null) {
				cs.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return isOk;
	}

	public static String getTypes() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		CallableStatement cs = null;
		String types = null;
		try {
			LoadProperties property = new LoadProperties();
			final String user = property.getProperty("dbuser");
			final String password = property.getProperty("dbpassword");
			final String url = property.getProperty("dbconnection");
			connection = DriverManager.getConnection(url, user, password);
			cs = connection.prepareCall("{call common_pkg.get_access(pTypes => ?)}");
			cs.registerOutParameter(1, java.sql.Types.VARCHAR);
			cs.executeUpdate();
			types = cs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (cs != null) {
				cs.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return types;
	}
}