package com.mega.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class t_order_detail {
	
	private int od_seq;
	private String menu_name;
	private int menu_cnt;
	private int menu_price;
	private String od_size;
	private String od_ice;
	private String od_shot;
	private String od_cup;
	private int order_seq;
}
