package com.best.innerjoin.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Gochat {
	
	@RequestMapping("gochat.ij")
	public String goChat() {
		return "/chat/chat";
	}
}
