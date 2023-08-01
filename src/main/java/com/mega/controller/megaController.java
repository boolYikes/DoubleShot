package com.mega.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mega.entity.t_category;
import com.mega.entity.t_menu;
import com.mega.entity.t_option;
import com.mega.mapper.megaMapper;

@Controller
public class megaController {

	@Autowired
	megaMapper mapper;

	@RequestMapping("/")
	public String index() {

		return "index";
	}

	
	@RequestMapping("/next")
	public String next(Model model , @RequestParam("order_age") int order_age) {
		
		
		  System.out.println("사용자 예측 나이 : " + order_age);
		  
		  mapper.getReady(order_age);
		  
		  mapper.getRecomm(order_age); mapper.updateOption();
		  
		  model.addAttribute("order_age", order_age);
		 
		
		return "register";
	}
	
	
	@RequestMapping("/main")
    public String main(Model model, @RequestParam("category_seq") int category_seq) {
        List<t_category> cate = mapper.getCate();
        List<t_menu> menu = mapper.getMenu(category_seq);
        
        int pageSize = 12;
        int totalMenuCount = menu.size();
        int pageCount = (int) Math.ceil((double) totalMenuCount / pageSize); // 전체 페이지 수

        for (int i = 0; i < pageCount; i++) {
            int startIndex = i * pageSize;
            int endIndex = Math.min(startIndex + pageSize, totalMenuCount);
            List<t_menu> currentPageMenu = menu.subList(startIndex, endIndex);
            model.addAttribute("menu" + (i + 1), currentPageMenu);
        }
        
        model.addAttribute("cate", cate);
        return "test2";
    }
	
	@RequestMapping("/omain")
	public String omain(Model model, t_menu menu) {
		List<t_menu> menus = new ArrayList<t_menu> ();
		List<List<t_menu>> menuGroups = new ArrayList<>();
		List<t_category>cate = mapper.getCate();
		int groupSize = 6;
		if(menu.getCategory_seq()==0) {
			menus = mapper.getAllMenus();
		}else {
			menus = mapper.getMenus(menu);
		}
		int menuSize = menus.size();
		// 6개씩 메뉴를 담을 그룹의 갯수 구하는 구문
		int groupCount = (int)Math.ceil((double)menuSize / groupSize);
		for(int i = 0; i< groupCount;i++) {
			int startIndex = i*groupSize;
			int endIndex = Math.min(startIndex+groupSize,menuSize);
			List<t_menu> menugroup = menus.subList(startIndex, endIndex);
			menuGroups.add(menugroup);
		}
		
		cate.get(1).setCategory_name("따뜻한 커피");
		cate.get(2).setCategory_name("시원한 커피");
		
		model.addAttribute("menuGroups", menuGroups);
		model.addAttribute("cate", cate);
		return "test3";
	}
}
