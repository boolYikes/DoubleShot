package com.mega.entity;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class t_order {
	
	private int order_seq;
	private String order_at;
	private int order_total_amount;
	private char pay_method;
	private int order_age;
	private String order_status;

}
