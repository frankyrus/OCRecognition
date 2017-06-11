package org.rsreu.aleksei_kirzhaev.ocr.contollers;

import java.io.File;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.rsreu.aleksei_kirzhaev.ocr.utils.Audit;
import org.rsreu.aleksei_kirzhaev.ocr.utils.License;
import org.rsreu.aleksei_kirzhaev.ocr.utils.Recognition;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.sourceforge.tess4j.TesseractException;

@Controller
public class RecognitionController {

	private static final Logger logger = LoggerFactory.getLogger(RecognitionController.class);

	private HttpServletRequest request;

	@Autowired
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	@RequestMapping(value = "/recognition", method = RequestMethod.POST)
	public ModelAndView uploadFileHandler(@RequestParam("file") MultipartFile file, @RequestParam("lang") String lang,
			@RequestParam("test") String test) throws SQLException {
		logger.info(test);
		ModelAndView mv = new ModelAndView("main");
		if (!file.isEmpty()) {
			try {
				Audit audit = new Audit();
				audit.logFile(file);
				StringBuilder result = new StringBuilder("");
				Recognition recognition = new Recognition();
				result.append(recognition.recognize(new File(audit.getFullPath()), lang)).append("\n");
				logger.info("Server File Location=" + audit.getFullPath());
				logger.info(result.toString());
				mv.addObject("result", result);
				if (result.length() != 0) {
					audit.logDB(result.toString(), lang, request.getRemoteAddr());
				}
			} catch (TesseractException ee) {
				mv.addObject("types", License.getTypes());
				mv.addObject("error", "<div style='text-align:center' class='alert alert-danger'>Ошибка при обработке файла!</div>");
			} catch (Exception e) {
				mv.addObject("types", License.getTypes());
				mv.addObject("error", "<div style='text-align:center' class='alert alert-danger'>Ошибка при обработке файла!</div>");
			}
		} else {
			mv.addObject("types", License.getTypes());
			mv.addObject("error", "<div style='text-align:center' class='alert alert-danger'>Невозможно распознать пустой файл!</div>");
		}
		return mv;
	}
}