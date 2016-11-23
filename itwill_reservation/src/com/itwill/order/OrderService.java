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
	 * ���� ��ư Ŭ���� �Էµ� Order��ü�� �޾Ƽ� db�� �Է�
	 * ȸ���� ����Ʈ ����
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
	 * ȸ��pk�� �Է¹޾Ƽ� �������������� ������ Order��ü ��ȯ
	 */
	public Order getOrder(int m_no) throws Exception{
		return OrderDao.getInstance().selectOrder(m_no);
	}
	/* 
	 * Order pk�޾Ƽ� Order ���(OrderDetail�� �Բ� ���) db���� ����
	 * ȸ���� ����Ʈ �߰�
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
	 * ������ ���� ������ ������ ���� 1����
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
