package com.best.innerjoin.board.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.board.model.dao.BoardDao;
import com.best.innerjoin.board.model.exception.BoardException;
import com.best.innerjoin.board.model.vo.Board;
import com.best.innerjoin.board.model.vo.PageInfo;
import com.best.innerjoin.board.model.vo.Reply;
import com.best.innerjoin.common.Pagination;

@Service("bService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao bDao;

	@Override
	public ArrayList<Board> boardList(int currentPage, int groupNo) {
		// 전체 게시글 수 조회
		int listCount = bDao.boardListCount(groupNo);
		
		// 게시글 목록 조회 (페이징 처리 적용)
		// 1) 페이지 정보 저장
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 2) 목록 조회 후 리턴
		return bDao.boardList(pi, groupNo);
	}

	@Override
	public Board boardDetail(int boardNo) {
		// 조회수 증가
		bDao.addBoardCount(boardNo);
		
		// 게시글 상세 조회
		return bDao.boardDetail(boardNo);
	}

	@Override
	public int boardInsert(Board board, MultipartFile uploadFile, HttpServletRequest request) {
		board.setBoardContent(board.getBoardContent().replace("\n", "<br>"));
		
		String renameFileName = null;
		
		// 업로드 된 파일이 있을 경우 파일명 변경
		if (!uploadFile.getOriginalFilename().equals("")) {
			renameFileName = renameFile(uploadFile);
			
			board.setBoardAttaOrigin(uploadFile.getOriginalFilename());
			board.setBoardAttaRename(renameFileName);
		}
		
		int result = bDao.boardInsert(board);
		
		if (result > 0) {
			bDao.boardAttachInsert(board);
			
			// 서버에 파일 저장
			if (renameFileName != null && result == 1) {
				result = saveFile(renameFileName, uploadFile, request);
			}
		}
		
		return result;
	}

	// 파일명 변경 메소드
	public String renameFile(MultipartFile file) {
		// "년월일시분초.확장자"로 파일명 변경
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date()) + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		return renameFileName;
	}
	
	// 파일 저장 메소드
	public int saveFile(String renameFileName, MultipartFile uploadFile, HttpServletRequest request) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\buploadFiles";
		
		// 저장 폴더 선택
		File folder = new File(savePath);
		
		// 만약 해당 폴더가 없는 경우
		if (!folder.exists()) {
			folder.mkdir(); // 폴더 생성
		}
		
		String filePath = folder + "\\" + renameFileName;
		
		// 파일 저장 성공 여부
		int result = 0;
		
		try {
			uploadFile.transferTo(new File(filePath));
			
			result = 1;
			
		} catch (Exception e) {
			throw new BoardException("파일 전송 에러");
		}
		
		return result;
	}
	
	@Override
	public int boardModify(Board board, MultipartFile reloadFile, HttpServletRequest request) {
		board.setBoardContent(board.getBoardContent().replace("\n", "<br>"));
		
		// 파일 수정 영역
		String beforeFileName = null;
		String renameFileName = null;
		
		// 새로 업로드 된 파일이 있을 경우
		if (!reloadFile.getOriginalFilename().equals("")) {
			// 이전 파일 삭제를 위해 이전 파일명 저장
			beforeFileName = board.getBoardAttaRename();
			
			// 새로 업로드 된 파일의 이름을 변경
			renameFileName = renameFile(reloadFile);
			
			board.setBoardAttaOrigin(reloadFile.getOriginalFilename());
			board.setBoardAttaRename(renameFileName);
		}
		
		int result = bDao.boardModify(board);
		
		if (result > 0) {
			result = bDao.boardAttachModify(board);
		}
		
		// 서버에 파일 저장
		if (renameFileName != null && result == 1) {
			result += saveFile(renameFileName, reloadFile, request);
		}
		
		// 기존 파일 삭제
		if (result == 2) {
			deleteFile(beforeFileName, request);
		}
		
		return result;
	}

	// 파일 삭제 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		// 파일 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		// 삭제할 파일 경로 + 파일명
		File deleteFile = new File(savePath + "\\" + fileName);
		
		// 해당 파일이 존재할 경우 삭제
		if (deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	@Override
	public int boardDelete(int boardNo) {
		return bDao.boardDelete(boardNo);
	}

	@Override
	public ArrayList<Reply> replyList(Reply reply) {
		return bDao.replyList(reply);
	}

	@Override
	public int replyInsert(Reply reply) {
		reply.setReplyContent(reply.getReplyContent().replace("\n", "<br>"));
		
		return bDao.replyInsert(reply);
	}

	@Override
	public String getWriter(int boardNo) {
		return bDao.getWriter(boardNo);
	}

}
