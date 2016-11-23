package com.itwill.order;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;

import com.itwill.item.ItemService;
import com.itwill.order.order.Order;
import com.itwill.order.order_detail.OrderDetail;
import com.itwill.user.MemberDaoService;

public class OrderService {
	
	private static OrderService _instance;
	
	
	public OrderService() {

	}
	
	public static  OrderService getInstance(){
		if(_instance==null){
			_instance=new OrderService();
		}
		return _instance;
	}
	
	/*
	 * 구매 버튼 클릭시 입력된 Order객체를 받아서 db에 입력
	 * 회원의 포인트 감소
	 */
	public void buy(Order order) throws Exception{
		OrderDao.getInstance().insertOder(order.getM_no(), order.getJ_desc());
		Order o = OrderDao.getInstance().selectOrderOnlyByM_no(order.getM_no());
		Collection<OrderDetail> col = order.getOdMap().values();
		for (OrderDetail orderDetail : col) {
			int itemPoint = ItemService.getInstance().getPoint(orderDetail.getI_type(), 0);
			int jd_tot = orderDetail.getJd_quantity()*itemPoint;
			orderDetail.setJd_tot(jd_tot);
			orderDetail.setJ_no(o.getJ_no());
			OrderDao.getInstance().insertOD(orderDetail);
		}
		MemberDaoService.getInstance().modifyPoint(order.getM_no(), -(order.getJ_tot()));
	}
	
	/*
	 * 회원pk를 입력받아서 마이페이지에서 보여줄 Order객체 반환
	 */
	public Order getOrder(int m_no) throws Exception{
		return OrderDao.getInstance().selectOrder(m_no);
	}
	/* 
	 * Order pk받아서 Order 취소(OrderDetail도 함께 취소) db에서 삭제
	 * 회원의 포인트 추가
	 */
	
	public void cancle(int jumun_no) throws Exception{
		Order o = OrderDao.getInstance().selectOrderByJ_no(jumun_no);
		Collection<OrderDetail> col = o.getOdMap().values();
		for (OrderDetail orderDetail : col) {
			OrderDao.getInstance().deleteOD(orderDetail.getJd_no());
		}
		OrderDao.getInstance().deleteOrder(o.getJ_no());
		MemberDaoService.getInstance().modifyPoint(o.getM_no(), o.getJ_tot());
	}
	/*
	 * 아이템 사용시 소유한 아이템 수량 1감소
	 */
	public void quanDecre(int m_no, int item_type) throws Exception{
		Order o = OrderDao.getInstance().selectOrder(m_no);
		OrderDetail ode = o.getOdMap().get(item_type);
		if(ode.getJd_quantity()-1==0){
			OrderDao.getInstance().deleteOD(ode.getJd_no());
			return;
		}
		ode.setJd_quantity(ode.getJd_quantity()-1);
		int itemPoint = ItemService.getInstance().getPoint(ode.getI_type(), 0);
		int jd_tot = ode.getJd_quantity()*itemPoint;
		ode.setJd_tot(jd_tot);
		OrderDao.getInstance().updateOD(ode);
	}
	
}
