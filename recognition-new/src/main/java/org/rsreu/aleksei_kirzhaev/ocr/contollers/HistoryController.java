package org.rsreu.aleksei_kirzhaev.ocr.contollers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import org.rsreu.aleksei_kirzhaev.ocr.utils.Audit;
import org.rsreu.aleksei_kirzhaev.ocr.utils.props.LoadProperties;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HistoryController {
	@RequestMapping("/history")
	public ModelAndView getHistory() throws SQLException {
		Audit audit = new Audit();
		ArrayList<String> historyList = null;
		ModelAndView mv = new ModelAndView("history");
		try {
			historyList = audit.getHistory();
			LoadProperties property = new LoadProperties();
			final String resultSplitter = property.getProperty("resultSplitter");
			StringBuilder result = new StringBuilder("");
			historyList.forEach(item -> {
				result.append("<tr>");
				result.append("<td>").append(item.split(resultSplitter)[0]).append("</td>");
				result.append("<td>").append(item.split(resultSplitter)[1].length() > 200
						? item.split(resultSplitter)[1].substring(0, 200) + "..." : item.split(resultSplitter)[1])
						.append("</td>");
				result.append("<td>").append(item.split(resultSplitter)[2]).append("</td>");
				result.append("<td>").append(item.split(resultSplitter)[3]).append("</td>");
				result.append("</td>");
			});
			mv.addObject("result", result);
		} catch (IOException e) {
			mv.addObject("error", "<div class='alert alert-danger'>Ошибка при получении истории!</div>");
		}
		return mv;
	}
}
