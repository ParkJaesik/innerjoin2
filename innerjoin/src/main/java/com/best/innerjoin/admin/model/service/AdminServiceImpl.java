package com.best.innerjoin.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.admin.model.dao.AdminDao;
import com.best.innerjoin.admin.model.vo.Pagination;
import com.best.innerjoin.common.PageInfo;
import com.best.innerjoin.member.model.vo.Member;

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
}
