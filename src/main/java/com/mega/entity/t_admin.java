package com.mega.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class t_admin {

		// 관리자 아이디
		private String admin_id;

		// 관리자 비밀번호
		private Integer admin_pw;

}
