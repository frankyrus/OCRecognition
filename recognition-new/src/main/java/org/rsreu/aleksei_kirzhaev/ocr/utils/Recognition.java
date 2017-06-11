package org.rsreu.aleksei_kirzhaev.ocr.utils;

import java.io.File;
import java.io.IOException;

import org.rsreu.aleksei_kirzhaev.ocr.utils.props.LoadProperties;

import net.sourceforge.tess4j.ITesseract;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;

public class Recognition {

	public StringBuilder recognize(File image, String lang) throws TesseractException, IOException {
		LoadProperties property = new LoadProperties();
		final String tessdataPath = property.getProperty("tessdataPath");
		ITesseract instance = new Tesseract();
		instance.setLanguage(lang);
		instance.setDatapath(tessdataPath);
		StringBuilder result = new StringBuilder("");
		result.append(instance.doOCR(image));
		return result;
	}
}
