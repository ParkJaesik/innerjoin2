package com.best.innerjoin.album.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.album.model.dao.AlbumDao;
import com.best.innerjoin.album.model.exception.AlbumException;
import com.best.innerjoin.album.model.vo.Album;
import com.best.innerjoin.album.model.vo.AlbumPhoto;
import com.best.innerjoin.album.model.vo.AlbumReply;
import com.best.innerjoin.album.model.vo.Pagination;
import com.best.innerjoin.common.PageInfo;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;

@Service("aService")
public class AlbumServiceImpl implements AlbumService {

	@Autowired
	private AlbumDao aDao;
	
	private static final int RESULT_EXCEED_SIZE = -2;
	private static final int RESULT_UNACCEPTED_EXTENSION = -1;
	private static final int RESULT_SUCCESS = 1;
	private static final long LIMIT_SIZE = 10 * 1024 * 1024;

	//로직은 언제나 Service에서 짜도록 하자.
	//중간실패시 rollback은 고려하지 않았음.
	    public int multiImageUpload(List<MultipartFile> images, String title) {
	        long sizeSum = 0;
	        for(MultipartFile image : images) {
	            String originalName = image.getOriginalFilename();
	            //확장자 검사
	            if(!isValidExtension(originalName)){
	                return RESULT_UNACCEPTED_EXTENSION;
	            }
	            
	            //용량 검사
	            sizeSum += image.getSize();
	            if(sizeSum >= LIMIT_SIZE) {
	                return RESULT_EXCEED_SIZE;
	            }
	            
	            //TODO 저장..
	        }
	        
	        //실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
	        //특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
	        return RESULT_SUCCESS;
	    }
	    
	    //required above jdk 1.7 - switch(String)
	    private boolean isValidExtension(String originalName) {
	        String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
	        switch(originalNameExtension) {
	        case "jpg":
	        case "png":
	        case "gif":
	            return true;
	        }
	        return false;
	    }

		@Override
		public int insertAlbum(HttpServletRequest request, List<MultipartFile> files, Album album) {
			// 파일의 원본을 저장하지 않고 이름을 변경하여 저장
			String renameFileName = null;
			ArrayList<AlbumPhoto> photoList = new ArrayList<AlbumPhoto>();
		    AlbumPhoto aPhoto = null;
			for (MultipartFile mf : files) {
			/*
			 * String originFileName = mf.getOriginalFilename(); // ���� ���� �� long
			 * fileSize = mf.getSize(); // ���� ������
			 * 
			 * System.out.println("originFileName : " + originFileName);
			 * System.out.println("fileSize : " + fileSize);
			 */
		    
	    		// 업로드 된 파일이 있을 경우 파일명을 변경
	    		if(!mf.getOriginalFilename().equals("")) { // uploadFile이 없을 때 원본 파일 명이 null이 아니라 빈문자열이 넘어오게 됨.
	    			aPhoto = new AlbumPhoto();
	    			renameFileName = renameFile(mf);  // 변경된 파일명
	    			
	    			aPhoto.setPhotoOriginName(mf.getOriginalFilename());
	    			
	    			aPhoto.setPhotoRename(renameFileName);
				/* System.out.println(aPhoto.toString()); */
	    		} 
	    		photoList.add(aPhoto);
		    }
		
			
		/*
		 * System.out.println("photoList.isEmpty() : "+photoList.isEmpty());
		 */			
			int albumResult = 0;
			// 앨범 썸네일 지정 및 앨범 등록
			if(album.getAlbumNo() == 0) {
				album.setAlbumThumbnail(photoList.get(0).getPhotoRename());
				albumResult = aDao.insertAlbum(album);
			}else {
				album.setAlbumThumbnail(photoList.get(0).getPhotoRename());
				for(int i = 0; i < photoList.size();i++) {
					photoList.get(i).setAlbumNo(album.getAlbumNo());
				/*
				 * System.out.println("insert service에서 사진 확인"+photoList.get(i).toString());
				 */					
				}
				albumResult = aDao.updateAlbum(album);
			}
			
			
			int photoResult = 0;
			
			// 앨범 최초 등록이거나 앨범 수정일 때 사진 등록 수행
			if(albumResult == 1) {
				for(int i = 0; i < photoList.size();i++) {
					photoList.get(i).setAlbumNo(album.getAlbumNo());
				/* System.out.println("insert service에서 사진 확인"+photoList.get(i).toString()); */
					photoResult = aDao.insertPhoto(photoList.get(i));
					if(photoResult == 1) {
						for(MultipartFile mf : files) {
							if(mf.getOriginalFilename().equals(photoList.get(i).getPhotoOriginName())) {
								photoResult = saveFile(photoList.get(i).getPhotoRename(), mf, request); 
								// result = 파일 저장 결과(정상 처리 == 1)
								
							}
						}
					}
				}
			}
			
			return photoResult;
		}
	
		
		// 파일 명 변경 메소드
		public String renameFile(MultipartFile file) {
			
			// "년월일시분초.확장자" 로 파일 명 변경
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originFileName = file.getOriginalFilename();
			
			
			int ran = (int)(Math.random()*100000);
			String renameFileName = sdf.format(new Date()) + ran + "."+originFileName.substring(originFileName.lastIndexOf(".")+1);
			
			return renameFileName;
		}
		
		
		// 파일 저장 메소드
		public int saveFile(String renameFileName, MultipartFile uploadFile, HttpServletRequest request) {
			
			// 파일 저장 경로 설정
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\auploadFiles";
			
			// 저장 폴더 선택
			File folder = new File(savePath);
			
			// 만약 해당 폴더가 없는 경우
			if(!folder.exists()) {
				folder.mkdir(); // 폴더 생성
			}
			
			String filePath = folder + "\\" + renameFileName;
			
			// 파일 저장 성공 여부(성공 1, 실패 0)
			int result = 0;
			
			try {
				uploadFile.transferTo(new File(filePath));
				// 업로드 된 파일을 filePath에 지정된 경로  + 파일명으로 저장하겠다.
				// -> IOException 예외 처리 필요 -> 정상실행으로 간주 하여 rollback이 실행되지 않음.
				result = 1;
			} catch(Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
				throw new AlbumException("파일 전송 에러 : "+e.getMessage()); 
				// unchecked Exception을 던져줌으로써 aop에서 예외를 잡아서 rollback가능해짐
			}
			
			return result;
		}

		@Override
		public ArrayList<Album> selectList(String gno, int currentPage) {
			// 전체 게시물 수 조회
			int listCount = aDao.getListCount(gno);
			
			// 게시물 목록 조회(페이징 처리)
			// 1) 페이지 정보 저장
			PageInfo pi = Pagination.getPageInfo(currentPage,listCount);
			// 2) 목록 조회 후 리턴
			return aDao.selectAlbumList(gno, pi);
		}

		@Override
		public Album selectAlbum(int albumNo) {
			// 1) 조회수 증가
		/* aDao.addReadCount(albumNo); */
		/* System.out.println("service albumNo 확인 : " +albumNo); */
			// 2) 게시글 상세 데이터 조회
			Album album = aDao.selectAlbum(albumNo);
		/* System.out.println("service album 확인"+album.toString()); */
			return album;
		}

		@Override
		public ArrayList<AlbumPhoto> selectPhoto(int albumNo) {
			return aDao.selectPhoto(albumNo);
		}

		@Override
		public int deleteAlbum(int albumNo) {
			return aDao.deleteAlbum(albumNo);
		}

		@Override
		public int insertReply(AlbumReply aReply) {
			return aDao.insertReply(aReply);
		}

		@Override
		public ArrayList<AlbumReply> selectReply(int albumNo) {
			return aDao.selectReply(albumNo);
		}

		@Override
		public int deleteReply(AlbumReply aReply) {
			return aDao.deleteReply(aReply);
		}

		@Override
		public int updateReply(AlbumReply aReply) {
			return aDao.updateReply(aReply);
		}

		@Override
		public int deletePhoto(AlbumPhoto aPhoto,HttpServletRequest request) {
			
			int result = aDao.deletePhoto(aPhoto);
			if(result > 0) {
				AlbumPhoto photo = aDao.selectPhotoForDelete(aPhoto.getPhotoNo());
				result += deleteFile(photo.getPhotoRename(),request);
				System.out.println("삭제 결과 : " + result);
			}
			
			return result;
		}
		
		// 파일 삭제 메소드
		//  공지글 등록 실패 또는 글 수정으로 업로드 파일이 변한 경우
		//  저장되어있는 기존 파일 삭제
		public int deleteFile(String fileName, 
							HttpServletRequest request) {
			
			int result = 0;
			// 파일 저장 경로 설정
			String root 
				= request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\auploadFiles";
			
			// 삭제할 파일 경로 + 파일명
			File deleteFile = new File(savePath + "\\" + fileName);
			
			// 해당 파일이 존재할 경우 삭제
			if(deleteFile.exists()) {
				deleteFile.delete();
				result = 1;
			}
			return result;
		}

		@Override
		public ArrayList<GroupMember> getGroupList(int gNo) {
			return aDao.getGroupList(gNo);
		}
		
}
