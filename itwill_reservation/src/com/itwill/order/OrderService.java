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
	private OrderDao od;
	private MemberDaoService mds;
	private ItemService is;
	
	public OrderService() {
		od=OrderDao.getInstance();
		mds=MemberDaoService.getInstance();
		is=ItemService.getInstance();
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
		od.insertOder(order.getM_no(), order.getJ_desc());
		Collection<OrderDetail> col = order.getOdMap().values();
		for (OrderDetail orderDetail : col) {
			int itemPoint = is.getPoint(orderDetail.getI_no(), 0);
			int jd_tot = orderDetail.getJd_quantity()*itemPoint;
			orderDetail.setJd_tot(jd_tot);
			od.insertOD(orderDetail);
		}
		mds.modifyPoint(order.getM_no(), -(order.getJ_tot()));
	}
	
	/*
	 * ȸ��pk�� �Է¹޾Ƽ� �������������� ������ Order��ü ��ȯ
	 */
	public Order getOrder(int m_no) throws Exception{
		return od.selectOrder(m_no);
	}
	/* 
	 * Order pk�޾Ƽ� Order ���(OrderDetail�� �Բ� ���) db���� ����
	 * ȸ���� ����Ʈ �߰�
	 */
	
	public void cancle(int jumun_no) throws Exception{
		Order o = od.selectOrderByJ_no(jumun_no);
		Collection<OrderDetail> col = o.getOdMap().values();
		for (OrderDetail orderDetail : col) {
			od.deleteOD(orderDetail.getJd_no());
		}
		od.deleteOrder(o.getJ_no());
		mds.modifyPoint(o.getM_no(), o.getJ_tot());
	}
	/*
	 * ������ ���� ������ ������ ���� 1����
	 */
	public void quanDecre(int m_no, int item_no) throws Exception{
		Order o = od.selectOrder(m_no);
		OrderDetail ode = o.getOdMap().get(item_no);
		if(ode.getJd_quantity()-1==0){
			od.deleteOD(ode.getJd_no());
			return;
		}
		ode.setJd_quantity(ode.getJd_quantity()-1);
		int itemPoint = is.getPoint(ode.getI_no(), 0);
		int jd_tot = ode.getJd_quantity()*itemPoint;
		ode.setJd_tot(jd_tot);
		od.updateOD(ode);
	}
	
}
