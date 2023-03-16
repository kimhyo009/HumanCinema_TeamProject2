package com.spring.ex01.emp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.ex01.emp.dao.StoreDAO;
import com.spring.ex01.emp.dto.StoreDTO;
import com.spring.ex01.emp.service.StoreService;




@Controller("Store_managerController")
@RequestMapping("/StoreManager")
public class Store_managerController {

	private static final Logger logger = LoggerFactory.getLogger(Store_managerController.class);
	
	@Autowired
	private StoreService storeService;
	
	@Autowired
	private StoreDTO storeDTO;
	
	@Autowired
	private StoreDAO storeDAO;
	
	
	// 메뉴 목록
	@RequestMapping(value = "/list.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String StoreList(Model model) {
		List StoreList = storeService.getList();
		
		model.addAttribute("StoreList", StoreList);
		logger.warn("Store_managerController > getList : StoreList.size = " + StoreList.size());
		
		return "storeManager/list";
	}
	
	// 메뉴 추가 페이지
	
	@RequestMapping(value = "/StoreAddView.do",method= {RequestMethod.GET, RequestMethod.POST} )
	public String StoreAddView() {
		
		return "storeManager/add";
	}
	
	
	
	// 메뉴 추가 기능

	@RequestMapping(value = "/StoreAdd.do",method= {RequestMethod.GET, RequestMethod.POST} )
	public String StoreAdd(
			
			HttpServletRequest request,
			@ModelAttribute StoreDTO storeDTO
		
//			Model model,
//			@RequestParam(value = "menu_id" , required = false) String menu_id,
//			@RequestParam(value = "name" , required = false) String name,
//			@RequestParam(value = "price" , required = false) Integer price,
//			@RequestParam(value = "image" , required = false) String image,
//			@RequestParam(value = "menu_type" , required = false ) Integer menu_type
			
			) {
		
		System.out.println("menu_id : " + storeDTO.getMenu_id());

			
//			 storeDTO.setMenu_id(menu_id);
//			 storeDTO.setName(name);
//			 storeDTO.setPrice(price);
//			 storeDTO.setImage(image);
//			 storeDTO.setMenu_type(menu_type);
			 
			int count = storeService.StoreAdd(storeDTO);
			 System.out.println("insert결과 : " + count);
			 
			 request.setAttribute("msg", "addMenu");
			 
			 return "redirect:/StoreManager/list.do";
			
		} 
			 
	@RequestMapping("/detail.do")
	public String detail(
	
			@RequestParam("menu_id") String menu_id, Model model) {
		
//		List selectStore = null;
		
		// DB에서 조회한
		StoreDTO storeDTO = storeService.selectStore(menu_id);
	
		// DTO를 메모리에 넣어서 jsp로 전달
		model.addAttribute("storeDTO", storeDTO);
		
		
		return "storeManager/update";
	}
	
	
	// 메뉴 수정
	@RequestMapping(value = "/StoreUpdate.do",method= {RequestMethod.PUT, RequestMethod.POST} )
	public String StoreUpdate(
			HttpServletRequest request,
			@ModelAttribute StoreDTO storeDTO) {
		
		System.out.println("들어왔는지 확인" + storeDTO);
		
		int count = storeService.StoreUpdate(storeDTO);
		 System.out.println("insert결과 : " + count);
		 
		 request.setAttribute("msg", "modified");
		 
		 return "redirect:/StoreManager/list.do";
		
	}
	
	// 메뉴 삭제
	
	@RequestMapping(value = "DeleteStore.do", method= {RequestMethod.GET, RequestMethod.POST})
		
	public String DeleteStore(
			HttpServletRequest request,
			@RequestParam("menu_id") String menu_id, Model model) {
		
	
		StoreDTO storeDTO = storeService.DeleteStore(menu_id);
	
		// DTO를 메모리에 넣어서 jsp로 전달
		model.addAttribute("storeDTO", storeDTO);
		
		request.setAttribute("msg", "deleted");
		
		return "redirect:/StoreManager/list.do";
	}
			
}
	
	
	

	

