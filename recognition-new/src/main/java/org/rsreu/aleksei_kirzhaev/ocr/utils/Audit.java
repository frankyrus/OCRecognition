package org.rsreu.aleksei_kirzhaev.ocr.utils;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.UUID;

import org.rsreu.aleksei_kirzhaev.ocr.utils.props.LoadProperties;
import org.springframework.web.multipart.MultipartFile;

import oracle.jdbc.internal.OracleTypes;

public class Audit {

	private StringBuilder fullPath = new StringBuilder("");

	public void setFullPath(StringBuilder fullPath) {
		this.fullPath = fullPath;
	}

	public String getFullPath() {
		return fullPath.toString();
	}

	public void logFile(MultipartFile file) throws IOException {
		byte[] bytes = file.getBytes();
		StringBuilder filePath = new StringBuilder("");
		LoadProperties properies = new LoadProperties();
		final String splitter = properies.getProperty("splitter");
		final String folder = properies.getProperty("folder");
		String fileName = file.getOriginalFilename();
		final LocalDate date = LocalDate.now();
		final LocalTime time = LocalTime.now();
		final String datePattern = properies.getProperty("dateFormatPattern");
		final String timePattern = properies.getProperty("timeFormatPattern");
		DateTimeFormatter dateFormatted = DateTimeFormatter.ofPattern(datePattern);
		DateTimeFormatter timeFormatted = DateTimeFormatter.ofPattern(timePattern);
		filePath.append("image_").append(time.format(timeFormatted)).append("_").append(UUID.randomUUID()).append(".")
				.append(fileName.split(splitter)[1]);
		final String folderPath = folder + File.separator + date.format(dateFormatted);
		File image = new File(folderPath + File.separator + filePath.toString());
		setFullPath(new StringBuilder(folderPath.concat(File.separator).concat(filePath.toString())));
		image.getParentFile().mkdirs();
		try {
			image.createNewFile();
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(image));
			stream.write(bytes);
			stream.close();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void logDB(String result, String lang, String ip) throws SQLException, IOException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		LoadProperties property = new LoadProperties();
		final String user = property.getProperty("dbuser");
		final String password = property.getProperty("dbpassword");
		final String url = property.getProperty("dbconnection");
		Connection connection = null;
		CallableStatement cs = null;
		try {
			connection = DriverManager.getConnection(url, user, password);
			Clob clob = connection.createClob();
			clob.setString(1, result);
			cs = connection
					.prepareCall("{call common_pkg.set_audit(pPath => ?, pText => ?, pLang =>?, pAddress => ?)}");
			cs.setString(1, this.getFullPath());
			cs.setClob(2, clob);
			cs.setString(3, lang);
			cs.setString(4, ip);
			cs.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (cs != null) {
				cs.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}

	public ArrayList<String> getHistory() throws SQLException, IOException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		LoadProperties property = new LoadProperties();
		final String user = property.getProperty("dbuser");
		final String password = property.getProperty("dbpassword");
		final String url = property.getProperty("dbconnection");
		Connection connection = null;
		CallableStatement cs = null;
		ArrayList<String> result = new ArrayList<String>();
		try {
			connection = DriverManager.getConnection(url, user, password);
			cs = connection.prepareCall("{call common_pkg.get_history(pCur => ?)}");
			cs.registerOutParameter(1, OracleTypes.CURSOR);
			cs.executeUpdate();
			ResultSet rs = (ResultSet) cs.getObject(1);
			final String resultSplitter = property.getProperty("resultSplitter");
			while (rs.next()) {
				String item = rs.getString("CODE") + resultSplitter;
				item += rs.getString("TEXT") + resultSplitter;
				item += rs.getString("LANG") + resultSplitter;
				item += rs.getString("ADDRESS");
				result.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (cs != null) {
				cs.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
		return result;
	}
}