package com.best.innerjoin.album.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.album.model.vo.Album;
import com.best.innerjoin.group.model.vo.Group;

public interface AlbumService {

	int multiImageUpload(List<MultipartFile> files, String title);

	/** add Album Service
	 * @param files
	 * @param album
	 * @return
	 */
	int insertAlbum(HttpServletRequest request, List<MultipartFile> files, Album album);


}
