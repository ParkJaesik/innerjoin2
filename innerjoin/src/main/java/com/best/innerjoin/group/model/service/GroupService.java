
package com.best.innerjoin.group.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;

public interface GroupService {

	public abstract int insertGroup(Group group);

	
//	클릭한 그룹 페이지로 이동하는 메소드
	public abstract Group goGroupPage(int gNo);


	public abstract Integer selectCode(String memberId, int gNo);


	public abstract int applyInsertGroup(String memberId, int gNo);




	public abstract int insertAlarm(String memberId, String host);


	public abstract ArrayList<GroupMember> groupMemberList(int groupNo);

	//  회원 등급 조정
	public abstract int updateLevel(HttpServletRequest request, GroupMember gMember);

}

