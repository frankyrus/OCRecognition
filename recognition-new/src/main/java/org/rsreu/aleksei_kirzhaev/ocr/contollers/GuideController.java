package org.rsreu.aleksei_kirzhaev.ocr.contollers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GuideController {

	@RequestMapping(value = "/guide", method = RequestMethod.GET)
	public ModelAndView getGuide() {
		return new ModelAndView("guide");
	}
}
