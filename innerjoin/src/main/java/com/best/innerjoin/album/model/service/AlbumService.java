package com.best.innerjoin.album.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.album.model.vo.Album;
import com.best.innerjoin.album.model.vo.AlbumPhoto;
import com.best.innerjoin.album.model.vo.AlbumReply;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;

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

	/** 앨범 삭제 Service
	 * @param albumNo
	 * @return
	 */
	public abstract int deleteAlbum(int albumNo);

	/** 댓글 등록 Service
	 * @param aReply
	 * @return
	 */
	public abstract int insertReply(AlbumReply aReply);

	/** 댓글 출력 Service
	 * @param albumNo
	 * @return
	 */
	public abstract ArrayList<AlbumReply> selectReply(int albumNo);

	/**  댓글 삭제 Service
	 * @param aReply
	 * @return
	 */
	public abstract int deleteReply(AlbumReply aReply);

	/** 댓글 수정 Service
	 * @param aReply
	 * @return
	 */
	public abstract int updateReply(AlbumReply aReply);

	/** 사진 삭제
	 * @param aPhoto
	 * @return
	 */
	public abstract int deletePhoto(AlbumPhoto aPhoto,HttpServletRequest request);

	
	/** 사진등록시 알람테이블에 insert해줄 수신자 구하기
	 * @param gNo
	 * @return
	 */
	public abstract ArrayList<GroupMember> getGroupList(int gNo);


}
