package com.best.innerjoin.mgSearch.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.mgSearch.model.service.MgSearchService;
import com.best.innerjoin.mgSearch.model.vo.MgSearch;
import com.best.innerjoin.mgSearch.model.vo.Pagination;

@Controller
public class MgSearchController {
	
	@Autowired
	private MgSearchService mgService;
	@Autowired
	private GroupService gServeice;
	
	
	
	@RequestMapping("mgSearchForm.ij")
	public ModelAndView mgSearchForm(HttpServletRequest request,ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		ArrayList<Member> list = mgService.selectList(currentPage);
		
		Member loginUser =  (Member)request.getSession().getAttribute("loginUser");
		
		ArrayList<Group> hostGroup = null;
		if(loginUser !=null) {
			
			hostGroup = gServeice.getHostGroup(loginUser.getMemberName());
			
			
		}
		
		
		
		if(list != null) {
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).addObject("hostGroup", hostGroup).setViewName("common/memberSearch");
			
		} else {
			mv.addObject("msg", "게시물 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
}
