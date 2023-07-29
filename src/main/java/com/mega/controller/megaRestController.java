package com.mega.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mega.entity.t_menu;
import com.mega.entity.t_option;
import com.mega.entity.t_order;
import com.mega.entity.t_order_detail;
import com.mega.mapper.megaMapper;

@RestController
public class megaRestController {

	@Autowired
	megaMapper mapper;

	@RequestMapping("/order")
	public t_order_detail order(@RequestBody t_order_detail orderData) {
		System.out.println("db에 넣을 값 : " + orderData);
		mapper.getOrder(orderData);

		return orderData;
	}

	@RequestMapping("/orderList")
	public List<t_order_detail> orderList() {

		int order_seq = mapper.getOdseq();

		List<t_order_detail> select = mapper.getSelect(order_seq);

		System.out.println("db에서 가져온 값 : " + select);

		return select;
	}

	@RequestMapping("/deleteOrder")
	public String deleteOrder(@RequestParam("od_seq") int od_Seq) {
		System.out.println("삭제할 주문번호 : " + od_Seq);

		mapper.deleteOrder(od_Seq);

		return "주문 메뉴 삭제 완료";
	}
	
	@Transactional
	@RequestMapping("/updateData")
	public String updateData(@RequestBody List<t_order_detail> orderDataArray) {
		System.out.println("수량 조절" + orderDataArray);
		int order_seq = mapper.getOdseq();
		System.out.println("수량조절 seq" + order_seq);
		for (t_order_detail od : orderDataArray) {
			od.setOrder_seq(order_seq);
			mapper.updateData(od);
		}
		
		return "success";
	}
	
	@RequestMapping("/totalOrder")
	public List<t_order_detail> totalOrder() {

		List<t_order_detail> result = orderList();
		
		return result;
	}
	
	
	@RequestMapping("/getOrderseq")
	public int getOrderseq() {
		
		int order_seq = mapper.getOdseq();
		
		mapper.delOption();
		mapper.delRecomm();
		
		return order_seq;
	}
	
	@RequestMapping("/orderCancle")
	public String orderCancle() {
		
		int order_seq = mapper.getOdseq();
		
		mapper.orderCancle(order_seq);
		
		return "success";
	}
	
	
	@RequestMapping("/saveOrder")
	public String saveOrder(@RequestBody List<t_order> saveDataArray) {
	    System.out.println("라스트오더 : " + saveDataArray);
	    int order_seq = mapper.getOdseq();
	    
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	    
	    for (t_order order : saveDataArray) {
	    	
	    	String formattedDate = dateFormat.format(new Date());
	    	order.setOrder_at(formattedDate);
	        order.setOrder_seq(order_seq);
	        
	        mapper.saveOrder(order);
	    }
	    return "success";
	}
	
	@RequestMapping("/sendData")
	public List<t_option> sendData(@RequestParam("menu_seq") int menu_seq) {
	    System.out.println("받은 데이터: " + menu_seq);
	    
	    List<t_option> op = mapper.getOp(menu_seq);
	    
	    return op;
	}
	
	@RequestMapping("/getCorrespOptions")
	public List<t_option> getCorrespOptions(@RequestParam("menu_seq") int menu_seq) {
		System.out.println("받은 데이터: " + menu_seq);
		
		
		List<t_option> op = mapper.getOp(menu_seq);
		
		op.get(0).setOp_size_s("소");
		op.get(0).setOp_size_m("중");
		op.get(0).setOp_size_l("대");
		
		return op;
	}
	
	
	@RequestMapping("/getVoiceOrder")
	public t_menu getVoiceOrder(@RequestParam("menu_name") String menu_name) {
		
		t_menu result = mapper.getVoiceOrder(menu_name);
		
		return result;
	}
	
	@RequestMapping("/getVoiceOptions")
	public List<t_option> getVoiceOptions(@RequestParam("menu_name") String menu_name) {
		System.out.println("음성주문메뉴 : " + menu_name);
		
		List<t_option> op = mapper.getVoiceOptions(menu_name);
		
		op.get(0).setOp_size_s("소");
		op.get(0).setOp_size_m("중");
		op.get(0).setOp_size_l("대");
		
		return op;
	}
	
	// FOR COCOA PAY TESTING
	   @GetMapping("/pay")
	   @ResponseBody
	   public String cocoaPay() {
	      try {
	         URL endpoint = new URL("https://kapi.kakao.com/v1/payment/ready");
	         HttpURLConnection conn = (HttpURLConnection) endpoint.openConnection();
	         conn.setRequestMethod("POST");
	         conn.setRequestProperty("Authorization", "KakaoAK 823b2e11c0729e1d043d79082dda9dbb");
	         conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	         conn.setDoOutput(true);
	         String payload = "cid=TC0ONETIME"
	               + "&partner_order_id=PARTNER_ORDER_ID"
	               + "&partner_user_id=PARTNER_USER_ID"
	               + "&item_name=메가리카노"
	               + "&quantity=99999"
	               + "&total_amount=9999"
	               + "&tax_free_amount=999"
	               + "&approval_url=http://www.localhost:8081/mega"
	               + "&fail_url=http://www.localhost:8081/mega/main?category_seq=2"
	               + "&cancel_url=http://www.localhost:8081/mega/main?category_seq=2";
	         OutputStream stream = conn.getOutputStream();
	         DataOutputStream pipe = new DataOutputStream(stream);
	         pipe.writeBytes(payload);
	         pipe.close();
	         
	         int result = conn.getResponseCode();
	         InputStream receive;
	         
	         if(result == 200) {
	            receive = conn.getInputStream();
	         }else {
	            receive = conn.getErrorStream();
	         }
	         
	         InputStreamReader reader = new InputStreamReader(receive);
	         BufferedReader byteReader = new BufferedReader(reader); // byte reader
	         
	         return byteReader.readLine();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return "";
	   }
	
	
}
