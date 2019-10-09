package com.best.innerjoin.album.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.album.model.vo.Album;
import com.best.innerjoin.album.model.vo.AlbumPhoto;
import com.best.innerjoin.album.model.vo.AlbumReply;
import com.best.innerjoin.common.PageInfo;

@Repository("aDao")
public class AlbumDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** add Album DAO
	 * @param album
	 * @return
	 */
	public int insertAlbum(Album album) {
		return sqlSession.insert("albumMapper.insertAlbum", album);
	}

	/** add photoList DAO
	 * @param photoList
	 * @return
	 */
	public int insertPhoto(AlbumPhoto photo) {
		return sqlSession.insert("albumMapper.insertPhoto", photo);
	}

	/** 앨범 개수 조회 DAO
	 * @param gno
	 * @return
	 */
	public int getListCount(String gno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("albumMapper.selectListCount",gno);
	}

	/** 앨범 목록 조회 DAO
	 * @param pi
	 * @return
	 */
	public ArrayList<Album> selectAlbumList(String gno, PageInfo pi) {
		// 페이징 처리가 적용된 목록 조회
		// -> Mybatis RowBounds 사용
		
		// offset : 몇 개의 게시글을 건너 뛰고 조회를 할 건지에 대한 계산
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("albumMapper.selectAlbumList", gno, rowBounds);
	}

	/** 앨범 상세 조회 DAO
	 * @param albumNo
	 * @return
	 */
	public Album selectAlbum(int albumNo) {
		// TODO Auto-generated method stub
		/*
		 * Album album = sqlSession.selectOne("albumMapper.selectAlbum", albumNo);
		 * System.out.println("dao albumNo 확인 : " +albumNo);
		 * System.out.println("dao album 확인 : " +album.toString());
		 */
		return sqlSession.selectOne("albumMapper.selectAlbum", albumNo);
	}

	/** 앨범 포토 상세 조회 DAO
	 * @param albumNo
	 * @return
	 */
	public ArrayList<AlbumPhoto> selectPhoto(int albumNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("albumMapper.selectPhotoList", albumNo);
	}

	/** 앨범 삭제 DAO
	 * @param albumNo
	 * @return
	 */
	public int deleteAlbum(int albumNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("albumMapper.deleteAlbum", albumNo);
	}

	/** 댓글 등록 DAO
	 * @param aReply
	 * @return
	 */
	public int insertReply(AlbumReply aReply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("albumMapper.insertReply", aReply);
	}

	/** 댓글 출력 DAO
	 * @param albumNo
	 * @return
	 */
	public ArrayList<AlbumReply> selectReply(int albumNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("albumMapper.selectReply", albumNo);
	}

}
