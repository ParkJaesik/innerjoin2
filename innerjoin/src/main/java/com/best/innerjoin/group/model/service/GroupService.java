
package com.best.innerjoin.group.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;

public interface GroupService {

	int insertGroup(Group group, MultipartFile uploadFile, HttpServletRequest request);

	
//	클릭한 그룹 페이지로 이동하는 메소드
	Group goGroupPage(int gNo);


	Integer selectCode(String memberId, int gNo);


	int applyInsertGroup(String memberId, int gNo);




	int insertAlarm(String memberId, String host);


	/** 그룹 회원 목록 조회 Service
	 * @param groupNo
	 * @return list
	 */
	ArrayList<GroupMember> groupMemberList(int groupNo);


	/** 그룹 대기 회원 목록 조회 Service
	 * @param groupNo
	 * @return list
	 */
	ArrayList<GroupMember> waitingGroupMemberList(int groupNo);

}

