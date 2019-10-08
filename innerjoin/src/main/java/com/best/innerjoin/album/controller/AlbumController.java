package com.best.innerjoin.album.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.best.innerjoin.album.model.service.AlbumService;
import com.best.innerjoin.album.model.vo.Album;
import com.best.innerjoin.album.model.vo.AlbumPhoto;
import com.best.innerjoin.album.model.vo.Pagination;

@Controller
public class AlbumController {

	@Autowired
	private AlbumService aService;
	/** 앨범 등록 뷰 컨트롤러
	 * @return
	 */
	@RequestMapping("addAlbumForm.ij")
	public ModelAndView addPhotoForm(String groupNo, ModelAndView mv, Integer page) {
		// page == null -> 1page
		// page != null -> 모든 page 중 하나
		int currentPage = page == null ? 1 : page;
		System.out.println("addAlbumForm groupNo : "+ groupNo);
		
		mv.addObject("currentPage", currentPage).addObject("groupNo", groupNo).setViewName("album/groupIndex+addAlbumForm");
		
		return mv;
	}

	/** 앨범 등록 컨트롤러
	 * @param request
	 * @param files
	 * @param title
	 * @return
	 */
	@ResponseBody
    @RequestMapping(value="addPhoto.ij", method=RequestMethod.POST)
    public int addPhoto(HttpServletRequest request, @RequestParam("files")List<MultipartFile> files,Album album) {
		
		System.out.println("==============================");
		System.out.println("title : " + album.getAlbumTitle());
		System.out.println("gno : " + album.getGroupNo());
		System.out.println("memberId : " + album.getMemberId());
		System.out.println("files : " + files.size());
	    for (MultipartFile mf : files) {
	            String originFileName = mf.getOriginalFilename(); // ���� ���� ��
	            long fileSize = mf.getSize(); // ���� ������

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);
	    }
	    
		/* int result = aService.multiImageUpload(files,title); */
	
	    int result = aService.insertAlbum(request,files,album);
	    
	    
		return 1;
	}
	
	/** 앨범 리스트 이동 컨트롤러
	 * @return
	 */
	@RequestMapping("albumListView.ij")
	public ModelAndView albumListView(String groupNo, ModelAndView mv, Integer page) {
		// 커맨드 객체 사용 시 해당  파라미터가 없을 경우 커맨드 객체에 null 값이 저장됨. int(원시타입)로 커맨드 객체 선언시 null값을 저장할 수 없어 type mismatch exception이 발생하게 되므로 Integer wrapper class로 커맨드 객체를 선언
		
		// page == null -> 1page
		// page != null -> 모든 page 중 하나
		int currentPage = page == null ? 1 : page;
		ArrayList<Album> list = aService.selectList(groupNo,currentPage);
		
		if(list != null) {
			// 메소드 체이닝 (Method Chaining)
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).addObject("groupNo", groupNo).setViewName("album/groupIndex+albumListView");
		}else {
			mv.addObject("msg", "게시물 목록 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	/** 앨범 상세 컨트롤러
	 * @return
	 */
	@RequestMapping("albumDetailView.ij")
	public ModelAndView albumDetailView(int albumNo, ModelAndView mv, Integer page) {
		int currentPage = page == null ? 1 : page;
		
		Album album = aService.selectAlbum(albumNo); 
		ArrayList<AlbumPhoto> photoList = aService.selectPhoto(albumNo);
		/* System.out.println(albumNo); */
		System.out.println("포토 리스트 : "+photoList.size());
		System.out.println(album.toString());
		if(album != null) {
			mv.addObject("album", album).addObject("list", photoList).addObject("currentPage", currentPage).setViewName("album/groupIndex+albumDetailView");
		} else {
			mv.addObject("msg", "앨범 상세 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/** 앨범 수정 폼
	 * @param albumNo
	 * @param groupNo
	 * @param mv
	 * @param page
	 * @return
	 */
	@RequestMapping("updateAlbumForm.ij")
	public ModelAndView updateAlbumForm(int albumNo, int groupNo, ModelAndView mv, Integer page) {
		int currentPage = page == null ? 1 : page;
		
		Album album = aService.selectAlbum(albumNo); 
		ArrayList<AlbumPhoto> photoList = aService.selectPhoto(albumNo);
		
		if(album !=null) {
		mv.addObject("album", album).addObject("photoList", photoList).addObject("currentPage", currentPage).setViewName("album/updateAlbumForm");
		}else {
			mv.addObject("msg", "앨범 상세 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("deleteAlbum.ij")
	public String deleteAlbum(int albumNo, int groupNo, ModelAndView mv) {
		int result = aService.deleteAlbum(albumNo);
		
		return null;
	}
	
}
