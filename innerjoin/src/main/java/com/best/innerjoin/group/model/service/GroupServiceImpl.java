package com.best.innerjoin.group.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.group.model.dao.GroupDao;
import com.best.innerjoin.group.model.vo.Group;

@Service("gadService")
public class GroupServiceImpl implements GroupService{
	
	private GroupDao gaDao;
	

	// 새로운 모임 생성
	@Override
	public int insertGroup(Group group, MultipartFile uploadFile, HttpServletRequest request) {
	
		group.setGroupInfo(group.getGroupInfo().replace("\n", "<br>"));
		
		
		
		String renameFileName = null;
		
		if(!!uploadFile.getOriginalFilename().equals("")) {
			renameFileName = renameFile(uploadFile);
			
			group.setGroupOriginFileName(uploadFile.getOriginalFilename());
			group.setGroupRenameFileName(renameFileName);
			
			
		}
		
		int result = gaDao.insertGroup(group);
		
		
		return result;
	}


	private String renameFile(MultipartFile uploadFile) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
