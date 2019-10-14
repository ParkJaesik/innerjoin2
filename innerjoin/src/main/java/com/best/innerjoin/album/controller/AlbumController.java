package com.best.innerjoin.album.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.best.innerjoin.alarm.model.service.AlarmService;
import com.best.innerjoin.album.model.service.AlbumService;
import com.best.innerjoin.album.model.vo.Album;
import com.best.innerjoin.album.model.vo.AlbumPhoto;
import com.best.innerjoin.album.model.vo.AlbumReply;
import com.best.innerjoin.album.model.vo.Pagination;
import com.best.innerjoin.group.model.service.GroupService;
import com.best.innerjoin.group.model.vo.Group;
import com.best.innerjoin.group.model.vo.GroupMember;
import com.best.innerjoin.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class AlbumController {

	@Autowired
	private AlarmService alarmService;
	@Autowired
	private AlbumService aService;
	@Autowired
	private GroupService gService;
	
	
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
		
		/*
		 * System.out.println("==============================");
		 * System.out.println("title : " + album.getAlbumTitle());
		 * System.out.println("gno : " + album.getGroupNo());
		 * System.out.println("getAlbumNo : " + album.getAlbumNo());
		 * System.out.println("memberId : " + album.getMemberId());
		 * System.out.println("files : " + files.size());
		 */
		
		
		
		  for (MultipartFile mf : files) { 
			  String originFileName = mf.getOriginalFilename(); // ���� ���� �� long fileSize = mf.getSize(); //
			  long fileSize = mf.getSize();
			  System.out.println("originFileName : " + originFileName);
			  System.out.println("fileSize : " + fileSize); 
		  }
		 
	    
		/* int result = aService.multiImageUpload(files,title); */
	
		int result = aService.insertAlbum(request,files,album);
	    
		
		//앨범 등록 후 알람테이블에 내용 저장
		int result2 = 0;
		int gNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		String gName = ((Group)request.getSession().getAttribute("group")).getgName();
		String senderId = ((Member)request.getSession().getAttribute("loginUser")).getMemberId();
		ArrayList<GroupMember> receiverList = aService.getGroupList(gNo);
		String tmpMsg = "<a href='albumListView.ij?gNo="+gNo+"'>" + gName + "모임에 새 앨범이 등록되었습니다.";
		
		
		
		if(result>0) {
			result2 = alarmService.insertAlbumAlarm(senderId,receiverList,tmpMsg);
		}
	    
		return result;
	}
	
	/** 앨범 리스트 이동 컨트롤러
	 * @return
	 */
	@RequestMapping("albumListView.ij")
	public ModelAndView albumListView(HttpServletRequest request, ModelAndView mv, Integer page,Integer gNo) {
		// 커맨드 객체 사용 시 해당  파라미터가 없을 경우 커맨드 객체에 null 값이 저장됨. int(원시타입)로 커맨드 객체 선언시 null값을 저장할 수 없어 type mismatch exception이 발생하게 되므로 Integer wrapper class로 커맨드 객체를 선언
		
		// page == null -> 1page
		// page != null -> 모든 page 중 하나
		int currentPage = page == null ? 1 : page;
		
		
		//알람을 타고 앨범페이지로 왔을경우
		int groupNo = 0;
		if(request.getSession().getAttribute("group")!=null) {
			groupNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		}else {
			groupNo = gNo;
			Group tempGroup = gService.goGroupPage(groupNo);
			
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			Integer groupMemberCode = -1;  
			if(loginUser!=null) {
			String memberId = loginUser.getMemberId();
			
			
			if(memberId != null) {
				groupMemberCode = gService.selectCode(memberId,gNo);
				if(groupMemberCode ==null) {
					groupMemberCode = 5;
					
				}
			}
			request.getSession().setAttribute("group",tempGroup );
			request.getSession().setAttribute("gName", tempGroup.getgName());
			request.getSession().setAttribute("groupMemberCode", groupMemberCode);
			}
		
		}
		
		/*
		 * 예설이이가 작성한 원본 코드
		 * int groupNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		 * 
		 * */
		
		ArrayList<Album> list = aService.selectList("" + groupNo,currentPage);
		
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
	public ModelAndView albumDetailView(HttpServletRequest request ,int albumNo, ModelAndView mv, Integer page,Integer gNo) {
		
		int groupNo = 0;
		if(request.getSession().getAttribute("group")!=null) {
			groupNo = ((Group)request.getSession().getAttribute("group")).getgNo();
		}else {
			groupNo = gNo;
			Group tempGroup = gService.goGroupPage(groupNo);
			
			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			Integer groupMemberCode = -1;  
			if(loginUser!=null) {
			String memberId = loginUser.getMemberId();
			
			
			if(memberId != null) {
				groupMemberCode = gService.selectCode(memberId,gNo);
				if(groupMemberCode ==null) {
					groupMemberCode = 5;
					
				}
			}
			request.getSession().setAttribute("group",tempGroup );
			request.getSession().setAttribute("gName", tempGroup.getgName());
			request.getSession().setAttribute("groupMemberCode", groupMemberCode);
			}
		
		}
	
		
		int currentPage = page == null ? 1 : page;
		
		Album album = aService.selectAlbum(albumNo); 
		ArrayList<AlbumPhoto> photoList = aService.selectPhoto(albumNo);
		for(AlbumPhoto a : photoList) {
			System.out.println(a.toString());
		}
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
		
		for(AlbumPhoto a : photoList) {
			System.out.println(a.toString());
		}
		
		if(album !=null) {
		mv.addObject("album", album).addObject("photoList", photoList).addObject("currentPage", currentPage).setViewName("album/groupIndex+updateAlbumForm");
		}else {
			mv.addObject("msg", "앨범 상세 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("deleteAlbum.ij")
	public String deleteAlbum(int albumNo, int groupNo,RedirectAttributes redirect,Model model) {
		int result = aService.deleteAlbum(albumNo);
		String path = null;
		if(result > 0) {
			redirect.addAttribute("msg", "앨범 삭제 성공!").addAttribute("groupNo", groupNo);
			path = "redirect:albumListView.ij";
		}else {
			model.addAttribute("msg", "앨범 삭제 실패");
			path = "common/errorPage";
		}
		return path;
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="addReply.ij", method=RequestMethod.POST)
	public String addReply(AlbumReply aReply, HttpSession session,String albumTitle) {

		// 댓글 작성자 정보(ID) 저장
		// String rWriter = ((Member)session.getAttribute("loginUser")).getId();
		aReply.setArWriter(((Member)session.getAttribute("loginUser")).getMemberId());
		int result = aService.insertReply(aReply);
		
		if(result > 0) {
			/* aService.updateRcount(reply.getRefBid()); */
			
			
			//댓글 등록 성공시 알람등록
			int gNo = ((Group)session.getAttribute("group")).getgNo();
			int albumNo = aReply.getAlbumNo();
			String gName = (String) session.getAttribute("gName");
			String senderId = ((Member)session.getAttribute("loginUser")).getMemberId();
			String senderName = ((Member)session.getAttribute("loginUser")).getMemberName();
			ArrayList<GroupMember> receiverList = aService.getGroupList(gNo);
			String tmpMsg = 
			senderName + "님이 " + "<a href='albumDetailView.ij?albumNo="+albumNo + "&gNo=" + gNo +"'>" + gName+"모임의" + albumTitle + " 앨범에  댓글을 달았습니다.."  +"</a>";
			int result2 = alarmService.insertAlbumReplyAlarm(senderId,receiverList,tmpMsg);
			
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 댓글 목록 출력	
	@ResponseBody
	@RequestMapping(value="rList.ij", produces="application/json; charset=utf-8")
	public String getReplyList(int albumNo){
		
		ArrayList<AlbumReply> list = aService.selectReply(albumNo);
		for(AlbumReply r : list) {
			System.out.println(r.toString());
		}
		// gson 생성시 형식 지정
		/*
		 * Gson gson = new
		 * GsonBuilder().setDateFormat("yyyy-MM-dd', 'HH:mm:ss").create();
		 */
		return new Gson().toJson(list);
	}

	// 댓글 삭제
	@ResponseBody
	@RequestMapping("deleteReply.ij")
	public String deleteReply(AlbumReply aReply){
		
		int result = aService.deleteReply(aReply);
		
		if(result > 0) {
			/* aService.updateRcount(reply.getRefBid()); */
			return "success";
		}else {
			return "fail";
		}
	}

	// 댓글 수정
	@ResponseBody
	@RequestMapping("updateReply.ij")
	public String updateReply(AlbumReply aReply){
		
		int result = aService.updateReply(aReply);
		
		if(result > 0) {
			/* aService.updateRcount(reply.getRefBid()); */
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	// 사진 목록 출력	
	@ResponseBody
	@RequestMapping(value="pList.ij", produces="application/json; charset=utf-8")
	public String getPhotoList(int albumNo){
		
		ArrayList<AlbumPhoto> list = aService.selectPhoto(albumNo);
		for(AlbumPhoto p : list) {
			System.out.println(p.toString());
		}
		// gson 생성시 형식 지정
		/*
		 * Gson gson = new
		 * GsonBuilder().setDateFormat("yyyy-MM-dd', 'HH:mm:ss").create();
		 */
		return new Gson().toJson(list);
	}
	
	// 사진 삭제
	@ResponseBody
	@RequestMapping("deletePhoto.ij")
	public String deletePhoto(AlbumPhoto aPhoto, HttpServletRequest request) {

		int result = aService.deletePhoto(aPhoto, request);

		if (result > 1) {
			/* aService.updateRcount(reply.getRefBid()); */
			return "success";
		} else {
			return "fail";
		}
	}
	
}
