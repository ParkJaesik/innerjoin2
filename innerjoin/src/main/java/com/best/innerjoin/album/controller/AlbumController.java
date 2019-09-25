package com.best.innerjoin.album.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AlbumController {

	@RequestMapping("addAlbumForm.ij")
	public String addPhotoForm() {
		return "album/addAlbumForm";
	}

	@RequestMapping("addPhoto.ij")
	public String addPhoto(HttpServletRequest request,@RequestParam("files")List<MultipartFile> files, String title) {
		

		System.out.println("==============================");
		System.out.println("title : " + title);
	    for (MultipartFile mf : files) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	    }
	    
	    

	    int result = 0;
	    if(files != null) {
	    	result = 1;
	    }
		return null;
	}
}
