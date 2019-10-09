package com.best.innerjoin.group.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.portable.RemarshalException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.group.model.dao.GroupDao;
import com.best.innerjoin.group.model.exception.GroupException;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;

@Service("gService")
public class GroupServiceImpl implements GroupService{
	
	@Autowired
	private GroupDao gDao;
	

	// 새로운 모임 생성
	@Override
	public int insertGroup(Group group, MultipartFile uploadFile, HttpServletRequest request) {
	
		group.setgInfo(group.getgInfo().replace("\n", "<br>"));
		
		
		
		String gRenameFileName = null;
		
		if(!!uploadFile.getOriginalFilename().equals("")) {
			gRenameFileName = renameFile(uploadFile);
			
			group.setgOriginFileName(uploadFile.getOriginalFilename());
			group.setgRenameFileName(gRenameFileName);
			
			
		}
		
		int result = gDao.insertGroup(group);
		
		if(gRenameFileName != null && result ==1) {
			result = saveFile(gRenameFileName, uploadFile, request);
		}
		
		
		return result ;

	}

	// 파일 저장 메소드
	private int saveFile(String gRenameFileName, MultipartFile uploadFile, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\guploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		String filePath = folder + "\\" + gRenameFileName;
		
		int result = 0;
		
		try {
			uploadFile.transferTo(new File(filePath));
			
			result = 0;
			
		}catch(Exception e) {
			throw new GroupException("파일 전송 에러");
			
		}
		
		return result;
	}

	// 파일 변경 메소드
	private String renameFile(MultipartFile file) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String gOriginFileName = file.getOriginalFilename();
		
		String gRenameFileName = sdf.format(new Date())+ "." + gOriginFileName.substring(gOriginFileName.lastIndexOf(".")+1);
		
		return gOriginFileName;
	}

	
//	클릭한 그룹 페이지로 이동하는 메소드
	@Override
	public Group goGroupPage(int gNo) {
		
		Group temp = gDao.goGroupPage(gNo);
		
		return temp;
	}

	@Override
	public Integer selectCode(String memberId, int gNo) {
		
		Map codeMap = new HashMap<>();
		codeMap.put("memberId", memberId);
		codeMap.put("gNo", gNo);
		
		return gDao.selectCode(codeMap);
	}

	@Override
	public int applyInsertGroup(String memberId, int gNo) {
		Map codeMap = new HashMap<>();
		codeMap.put("memberId", memberId);
		codeMap.put("gNo", gNo);
		return gDao.applyInsertGroup(codeMap);
	}

	@Override
	public ArrayList<GroupMember> groupMemberList(int groupNo) {
		return gDao.groupMemberList(groupNo);
	}
	
	@Override
	public int insertAlarm(String memberId, String host) {
		
		
		return gDao.insertAlarm(memberId,host);

	}

	
	
}
