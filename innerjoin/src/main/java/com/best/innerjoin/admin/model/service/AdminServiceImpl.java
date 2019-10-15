package com.best.innerjoin.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.admin.model.dao.AdminDao;
import com.best.innerjoin.admin.model.vo.Pagination;
import com.best.innerjoin.common.PageInfo;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;
import com.best.innerjoin.report.model.vo.GroupReport;
import com.best.innerjoin.report.model.vo.MemberReport;

@Service("adService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adDao;

	@Override
	public ArrayList<Member> selectMemList(int currentPage) {
		
		int listCount = adDao.getMemListCount();
		
		// 게시물 목록 조회(페이징 처리 적용)
		// 1) 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		// 2) 로우 바운드 적용한 멤버리스트 리턴
		return adDao.selectMemList(pi);
	}

	@Override
	public Member selectMemDetail(String memberId) {
		Member memInfo = adDao.selectMemBasic(memberId);
		Member memDetail = adDao.selectMemDetail(memberId);
		if(memDetail != null) {
			memInfo.setmemberIntroduce(memDetail.getmemberIntroduce());
			memInfo.setMemberBirthday(memDetail.getMemberBirthday());
			memInfo.setMemberGender(memDetail.getMemberGender());
			memInfo.setMemberOpenStatus(memDetail.getMemberOpenStatus());
		}
		return memInfo;
	}
	
	@Override
	public Map<String, Map> memGroupInfo(String memberId) {
		ArrayList<GroupMember> mgList = adDao.selectMemGroupList(memberId);
		ArrayList<Group> gInfo = adDao.selectJoinGroupList(memberId);
		Map<String, Map> mgInfo = new HashMap<>();

		for(int i = 0; i < gInfo.size(); i++) {
			int gno1 = gInfo.get(i).getgNo();
			
			for(int j = 0; j < mgList.size(); j++) {
			
				int gno2 = mgList.get(j).getGroupNo();
				
				if(gno1 != gno2) break;
				Map info = new HashMap();
				
				info.put("levelCode", mgList.get(i).getLevelCode());
				info.put("gInfo", gInfo.get(i));
				
				mgInfo.put(""+gno1, info);
			}
		}
		System.out.println("mgInfo : " + mgInfo);
		return mgInfo;
	}
	
	@Override
	public ArrayList<MemberReport> selectMrList(String memberId) {
		
		return adDao.selectMrList(memberId);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public ArrayList<GroupReport> selectGroupReptList(int currentPage) {
		int listCount = adDao.getGroupReptListCount();
		
		// 게시물 목록 조회(페이징 처리 적용)
		// 1) 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		return adDao.selectGroupReptList(pi);
	}

	@Override
	public ArrayList<Group> selectGroupList(int currentPage) {
		int listCount = adDao.getGroupListCount();
		
		// 게시물 목록 조회(페이징 처리 적용)
		// 1) 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		return adDao.selectGroupList(pi);
	}

	@Override
	public Group selectGroupDetail(int gNo) {
		
		Group group = adDao.selectGroupDetail(gNo);
		return group;
	}

	@Override
	public int updateGroupStatus(Integer groupReptNo, Group group) {
		
		
		int result = adDao.updateGroupStatus(group);
		
		if(groupReptNo != null) {
			result += adDao.updateReportStatus(groupReptNo);
		}
		
		return result;
	}



}
