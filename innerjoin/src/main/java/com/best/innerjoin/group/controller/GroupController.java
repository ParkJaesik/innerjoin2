package com.best.innerjoin.group.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.group.model.vo.Group;


@Controller
public class GroupController {
	
	@Autowired
	private GroupService gService;
	
	@RequestMapping("ginsertForm.ij")
	public String groupInsertForm() {
		return "group/groupInsert";
		
	}
	
	// 그룹 만들기
	@RequestMapping(value="ginsert.ij", method=RequestMethod.POST)
	public String groupInsert(Group group, HttpServletRequest request, MultipartFile uploadFile, Model model) {
		
		int result = gService.insertGroup(group, uploadFile, request);
		
		String path= null;
		if(result>0) {
			path="redirect:myPageForm.ij";
		}else {
			model.addAttribute("msg", "모임 생성 실패");
			path = "common/errorPage";
		}
		return path;
		
		
		
	}
	
	@RequestMapping("tempGoGroup.ij")
	public String tempGoGroup(HttpServletRequest request) {
		 request.getSession().setAttribute("groupName", "가나다");
		return "group/groupIndex";
	}
	
	@RequestMapping("tempGoGroup2.ij")
	public String tempGoGroup2(HttpServletRequest request) {
		 request.getSession().setAttribute("groupName", "라라라라");
		return "group/groupIndex";
	}
	
	
//	클릭한 그룹 페이지로 이동하는 메소드
	@RequestMapping("goGroupPage.ij")
	public String goGroupPage(HttpServletRequest request,Group group,Model model) {
		
		int gNo = group.getgNo();
		
		Group tempGroup = gService.goGroupPage(gNo);
		
		model.addAttribute("group", tempGroup);
		request.getSession().setAttribute("group", tempGroup);
		request.getSession().setAttribute("gName", tempGroup.getgName());
		return "group/groupIndex";
	}
	
	

}
