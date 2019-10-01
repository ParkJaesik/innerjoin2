package com.best.innerjoin.group.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.group.model.vo.Group;

public interface GroupService {

	int insertGroup(Group group, MultipartFile uploadFile, HttpServletRequest request);

}
