package com.best.innerjoin.album.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.best.innerjoin.album.model.service.AlbumService;
import com.best.innerjoin.album.model.vo.Album;

@Controller
public class AlbumController {

	@Autowired
	private AlbumService aService;
	/** 앨범 등록 뷰 컨트롤러
	 * @return
	 */
	@RequestMapping("addAlbumForm.ij")
	public String addPhotoForm() {
		return "album/addAlbumForm";
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
	public String albumListView(String gno) {
		
		return "album/albumListView";
	}
	
	/** 앨범 상세 컨트롤러
	 * @return
	 */
	@RequestMapping("albumDetailView.ij")
	public String albumDetailView() {
		return "album/albumDetailView";
	}
}
