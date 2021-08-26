package com.example.babyname.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.babyname.dao.BabyNameDao;
import com.example.babyname.model.BabyNameData;

@Controller
public class HomeController {
	 
	@Autowired
	BabyNameDao babyNameDao;
	
	@GetMapping("/")
	public String showHome(@CookieValue(value = "voted", defaultValue = "") String voted,
			@CookieValue(value = "suggested", defaultValue = "") String suggested){
		if(voted.equals("true")) {
			if(!suggested.equals("true")) {
				return "suggest";
			}else {
				return "result";
			}
		}
		if(suggested.equals("true")) {
			if(!voted.equals("true")) {
				return "vote";
			}else {
				return "result";
			}
		}
		
		return "vote";
	}
	
	@GetMapping("/babynamedata")
	public ResponseEntity<?> getDataForPiechart(){
		List<BabyNameData> piechartData = babyNameDao.findAllByOrderByVotesDesc();
		return new ResponseEntity<>(piechartData, HttpStatus.OK);
	}
		
	@PostMapping("/vote")
	public String voteForBabyName(@RequestBody String name,
		@CookieValue(value = "voted", defaultValue = "") String voted,
		@CookieValue(value = "suggested", defaultValue = "") String suggested,
		HttpServletResponse response) {
		
		// read cookie
		if(voted.equals("true") && suggested.equals("true")) {
			return "result";
		} 
		
		name.trim();
		if(name.length() < 6 || name.length() > 20) {
			if(voted.equals("true")) {
				if(!suggested.equals("true")) {
					return "suggest";
				}else {
					return "result";
				}
			}
			if(suggested.equals("true")) {
				if(!voted.equals("true")) {
					return "vote";
				}else {
					return "result";
				}
			}
		}
		name = name.substring(5).toLowerCase();
	
		BabyNameData bData;
		
		List<BabyNameData> list = babyNameDao.findByName(name); 

		
		if(!(list.isEmpty())) {
			
			bData = list.get(0);
			bData.setVotes(bData.getVotes() + 1);
			
			// set cookie
			Cookie cookie = new Cookie("voted", "true");
			cookie.setMaxAge(7 * 24 * 60 * 60);
			response.addCookie(cookie);
			
			babyNameDao.save(bData);
			
			return "suggest";
		}
		else {
			
			bData = new BabyNameData();
			bData.setId(0);
			bData.setName(name);
			bData.setVotes(1);
			
			// set cookie
			Cookie cookie = new Cookie("suggested", "true");
			cookie.setMaxAge(7 * 24 * 60 * 60);	
			response.addCookie(cookie);
			
			babyNameDao.save(bData);
			
			return "result";			
		}
		
		
		/***********/
		
		/*
		if(voted.equals("true")) {
			if(!suggested.equals("true")) {
				return "suggest";
			}
		}
		if(suggested.equals("true")) {
			if(!voted.equals("true")) {
				return "vote";
			}
		}
		
		return "result";
		*/
	}
	
	@GetMapping("/del/{pass}/{name}")
	public void deleteByName(@PathVariable String pass,@PathVariable String name) {
		if(pass.equals("rb4rb4")) {
			
			List<BabyNameData> list = babyNameDao.findByName(name); 
			if(!(list.isEmpty())) {
				babyNameDao.deleteByName(name);
			}
		}
		
	}
	
	
	
}
