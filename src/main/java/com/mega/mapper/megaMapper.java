package com.mega.mapper;

import java.util.List;

import com.mega.entity.t_category;
import com.mega.entity.t_menu;
import com.mega.entity.t_option;
import com.mega.entity.t_order;
import com.mega.entity.t_order_detail;

public interface megaMapper {

	public List<t_category> getCate();

	public List<t_menu> getMenu(int category_seq);
	
	public List<t_menu> getMenus(t_menu menu);
	
	public List<t_menu> getAllMenus();

	public List<t_option> getOp(int menu_seq);

	public void getReady(int order_age);

	public int getOdseq();

	public void getOrder(t_order_detail orderData);

	public List<t_order_detail> getSelect(int order_seq);

	public void deleteOrder(int od_Seq);

	public void updateData(t_order_detail od);

	public void saveOrder(t_order order);

	public void orderCancle(int order_seq);

	public void getRecomm(int order_age);

	public void updateOption();

	public void delRecomm();

	public void delOption();

	public t_menu getVoiceOrder(String menu_name);

	public List<t_option> getVoiceOptions(String menu_name);

}
