package com.best.innerjoin.album.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.album.model.vo.Album;
import com.best.innerjoin.album.model.vo.AlbumPhoto;
import com.best.innerjoin.group.model.vo.Group;

public interface AlbumService {

	public abstract int multiImageUpload(List<MultipartFile> files, String title);

	/** add Album Service
	 * @param files
	 * @param album
	 * @return
	 */
	public abstract int insertAlbum(HttpServletRequest request, List<MultipartFile> files, Album album);

	/** 앨범 목록 조회  Service
	 * @param currentPage
	 * @return
	 */
	public abstract ArrayList<Album> selectList(String gno, int currentPage);

	/** 앨범 상세 조회 Service
	 * @param albumNo
	 * @return
	 */
	public abstract Album selectAlbum(int albumNo);

	/** 앨범 포토 조회 Service
	 * @param albumNo
	 * @return
	 */
	public abstract ArrayList<AlbumPhoto> selectPhoto(int albumNo);


}
