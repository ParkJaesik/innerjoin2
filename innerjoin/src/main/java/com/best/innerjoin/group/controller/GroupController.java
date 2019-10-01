package com.best.innerjoin.group.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.group.model.vo.Group;

@Controller
public class GroupController {
	
	@Autowired
	private GroupService gService;
	
	@RequestMapping("ginsert.ij")
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
	
	
	

}
