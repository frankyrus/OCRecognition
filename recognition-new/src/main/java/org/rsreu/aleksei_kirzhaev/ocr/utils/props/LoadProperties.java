package org.rsreu.aleksei_kirzhaev.ocr.utils.props;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class LoadProperties {
	String value = "";
	InputStream fis;

	public String getProperty(String name) throws IOException {
		try {
			Properties property = new Properties();
			fis = getClass().getResourceAsStream("config.properties");
			property.load(fis);
			value = property.getProperty(name);
		} catch (IOException e) {
			System.out.println("Exception: " + e);
		} finally {
			fis.close();
		}
		return value;
	}
}
