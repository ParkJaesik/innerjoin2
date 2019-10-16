
package com.best.innerjoin.group.model.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupCat;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;

public interface GroupService {

	public abstract int insertGroup(Group group);
	
//	클릭한 그룹 페이지로 이동하는 메소드
	public abstract Group goGroupPage(int gNo);

	public abstract Integer selectCode(String memberId, int gNo);

	public abstract int applyInsertGroup(String memberId, int gNo);

	public abstract int insertAlarm(String memberId, String host, String msg);

	//  회원 등급 조정
	public abstract int updateLevel(HttpServletRequest request, GroupMember gMember);

	/** 그룹 회원 목록 조회 Service
	 * @param groupNo
	 * @return list
	 */
	public abstract ArrayList<GroupMember> groupMemberList(int groupNo);

	/** 그룹 대기 회원 목록 조회 Service
	 * @param groupNo
	 * @return list
	 */
	public abstract ArrayList<GroupMember> waitingGroupMemberList(int groupNo);

	public abstract int insertGroupMemberAdmin(Member loginUser);

	public abstract int acceptGroup(String memberId, int gNo);

	public abstract int rejectGroup(String memberId, int gNo);

	public abstract int updateGroupCount(int gNo);

	public abstract String selectReceiverId(String reciverName);

	public abstract ArrayList<Group> getHostGroup(String memberName);

	public abstract int inviteGroupMember(Map<String, String> alarmMap);

	public abstract int withdraw(Map<String, String> map);

	public abstract int decreaseCount(String gNo);

	public abstract int selectIsGroupMember(String memberId, int gNo);

	public abstract int rejoinApplyGroupMember(String memberId, int gNo);


	/** 메인 페이지 그룹 목록 조회 Service
	 * @return list
	 */
	public abstract ArrayList<Group> mainGroupList();


	public abstract ArrayList<GroupCat> selectGroupCat();

	public abstract int getGno();

	/** 그룹 수정
	 * @param group
	 * @return
	 */
	public abstract int updateNotice(Group group);

}

