package com.mega.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class t_menu {

		// 메뉴 순번
		private int menu_seq;

		// 메뉴 명
		private String menu_name;

		// 메뉴 가격
		private Integer menu_price;

		// 메뉴 설명
		private String menu_desc;

		// 메뉴 이미지
		private String menu_img;

		// 카테고리 순번
		private int category_seq;

}
