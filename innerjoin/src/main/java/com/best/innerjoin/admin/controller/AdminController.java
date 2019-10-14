package com.best.innerjoin.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.admin.model.service.AdminService;
import com.best.innerjoin.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adService;
	
	//임시 관리자 페이지로 이동
	@RequestMapping("admin.ij")
	public String adminView() {
		return "admin/admin";
	}  

	/** 회원관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageMember.ij")
	public String manageMemberView(Integer page, ModelAndView mv) {
		page = (page == null)? 1 : page;
		
		//회원 정보 리스트 가져오기
		ArrayList<Member> mList = adService.memberList(page);
		return "admin/manageMember";
	}
	
	/** 모임관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageGroup.ij")
	public String manageGroupView() {
		return "admin/manageGroup";
	}
	
	/** 회원신고관리페이지 이동
	 * @return
	 */
	@RequestMapping("memberReport.ij")
	public String memberReportView() {
		return "admin/memberReport";
	}
	
	/** 그룹회원신고관리페이지 이동
	 * @return
	 */
	@RequestMapping("groupMemberReport.ij")
	public String groupMemberReportView() {
		return "admin/groupMemberReport";
	}
	
	/** 그룹신고관리페이지 이동
	 * @return
	 */
	@RequestMapping("groupReport.ij")
	public String groupReportView() {
		return "admin/groupReport";
	}

	/** 카테고리관리페이지 이동
	 * @return
	 */
	@RequestMapping("manageCategory.ij")
	public String manageCategoryView() {
		return "admin/manageCategory";
	}

	
	//============================================================================
	
	

}
