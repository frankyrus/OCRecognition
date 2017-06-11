package org.rsreu.aleksei_kirzhaev.ocr.contollers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.rsreu.aleksei_kirzhaev.ocr.utils.License;
import org.rsreu.aleksei_kirzhaev.ocr.utils.props.LoadProperties;
import org.slf4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class FileUploadHandlerController extends ResponseEntityExceptionHandler {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());

	@ExceptionHandler(MultipartException.class)
	ModelAndView handleFileException(HttpServletRequest request, Throwable ex) throws IOException, SQLException {
		LoadProperties property = new LoadProperties();
		String maxSizeStr = property.getProperty("fileSize");
		double maxSize = Double.parseDouble(maxSizeStr) / 1024 / 1024;
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("types", License.getTypes());
		mv.addObject("error", "<div class='alert alert-danger'>Слишком большой размер файла. Максимальный размер - "
				+ maxSize + "MB!</div>");
		return mv;
	}
}