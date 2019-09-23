package com.best.innerjoin.album.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

@Controller
public class AlbumController {

	@RequestMapping("addPhotoForm.ij")
	public String addPhotoForm() {
		return "album/addPhotoForm";
	}

	@ResponseBody
	@RequestMapping(value="addPhoto.ij", method=RequestMethod.POST)
	public String addPhoto(@RequestParam("files")List<MultipartFile> images) {
		

		System.out.println("==============================");
	    for (MultipartFile mf : images) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);

	    }

	    int result = 0;
	    if(images != null) {
	    	result = 1;
	    }
		return new Gson().toJson(result);
	}
}
