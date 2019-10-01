package com.best.innerjoin.album.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface AlbumService {

	int multiImageUpload(List<MultipartFile> files, String title);

}
