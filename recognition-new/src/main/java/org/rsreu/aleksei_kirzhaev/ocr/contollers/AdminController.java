package org.rsreu.aleksei_kirzhaev.ocr.contollers;

import java.io.IOException;
import java.sql.SQLException;

import org.rsreu.aleksei_kirzhaev.ocr.utils.License;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@RequestMapping(value = { "/", "/welcome" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() throws SQLException, IOException {
		ModelAndView mv = new ModelAndView();
		mv.addObject("types", License.getTypes());
		mv.setViewName("main");
		return mv;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin");
		return mv;
	}

	@RequestMapping(value = "/updateToken", method = RequestMethod.POST)
	public ModelAndView updateToken(@RequestParam(value = "token") String key) throws SQLException {
		ModelAndView mv = new ModelAndView("admin");
		mv.addObject("token", key);
		if (License.setLicense(key)) {
			mv.addObject("result", "<div style='text-align:center' class='alert alert-success'>Лицензия успешно обновлена</div>");
		} else {
			mv.addObject("result", "<div style='text-align:center' class='alert alert-warning'>Ошибка при обновлении лицензии. Возможно, неправильно указан ключ</div>");
		}
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView mv = new ModelAndView();
		if (error != null) {
			mv.addObject("error", "Некорректный пользователь и пароль!");
		}

		if (logout != null) {
			mv.addObject("msg", "Вы успешно вышли.");
		}
		mv.setViewName("login");

		return mv;
	}
}