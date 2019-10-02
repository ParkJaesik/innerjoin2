package com.best.innerjoin.album.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.best.innerjoin.album.model.vo.Album;
import com.best.innerjoin.album.model.vo.AlbumPhoto;

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

}
