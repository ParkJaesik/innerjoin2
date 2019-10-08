package com.best.innerjoin.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.best.innerjoin.admin.model.dao.AdminDao;

@Service("adService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adDao;
}
