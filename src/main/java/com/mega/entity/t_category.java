package com.mega.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class t_category {
	 // 카테고리 순번 
    private int category_seq;

    // 카테고리 명 
    private String category_name;

}
