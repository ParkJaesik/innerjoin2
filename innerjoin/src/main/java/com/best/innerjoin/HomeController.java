package com.best.innerjoin;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.group.model.vo.Group;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private GroupService gService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/")
	public String home(Locale locale, Model model) {
		
		ArrayList<Group> list = gService.mainGroupList();
		
		model.addAttribute("list", list);
		
		return "index";
	}
	
	@RequestMapping("gohome.ij")
	public String goHome(HttpServletRequest request, Model model){
		
		if(request.getSession().getAttribute("group")!=null) {
			request.getSession().removeAttribute("group");
			request.getSession().removeAttribute("gName");
			request.getSession().removeAttribute("groupMemberCode");
		}
		ArrayList<Group> list = gService.mainGroupList();
		
		model.addAttribute("list", list);
		System.out.println("list: " + list);
		return "/index";
	}
	
}
