package com.itwill.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import com.itwill.board.Board;
import com.itwill.order.order.Order;
import com.itwill.order.order_detail.OrderDetail;
import com.itwill.test.ConnectionFactory;

public class OrderDao extends RdbmsDao {

	private static OrderDao _instance;

	public static OrderDao getInstance() {
		if (_instance == null) {
			_instance = new OrderDao();
		}
		return _instance;
	}

	public Order selectOrder(int member_no) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order order = null;
		HashMap<Integer,OrderDetail> odMap = new HashMap<Integer,OrderDetail>();
		try {
			conn = getConnection();
			//conn= ConnectionFactory.getConnection();
			pstmt = conn.prepareStatement(OrderSQL.selectSQL);
			pstmt.setInt(1, member_no);
			rs = pstmt.executeQuery();
			boolean chance = true;
			int j_no = 0;
			int m_no = 0;
			Date j_date = null;
			String j_desc = "";
			while (rs.next()) {
				if (chance) {
					j_no = rs.getInt(1);
					m_no = rs.getInt(2);
					j_date = rs.getDate(3);
					j_desc = rs.getString(4);
					chance = false;
				}
				int jd_no = rs.getInt(5);
				int i_type = rs.getInt(6);
				int jd_quantity = rs.getInt(7);
				int jd_tot = rs.getInt(8);
				odMap.put(i_type, new OrderDetail(jd_no, i_type, jd_quantity, jd_tot, j_no));
			}
			order = new Order(j_no, m_no, j_date, j_desc, odMap);
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				releaseConnection(conn);
		}
		return order;
	}

	public Order selectOrderByJ_no(int jumun_no) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order order = null;
		HashMap<Integer,OrderDetail> odMap = new HashMap<Integer,OrderDetail>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(OrderSQL.selectOrderByJ_noSQL);
			pstmt.setInt(1, jumun_no);
			rs = pstmt.executeQuery();
			boolean chance = true;
			int j_no = 0;
			int m_no = 0;
			Date j_date = null;
			String j_desc = "";
			while (rs.next()) {
				if (chance) {
					j_no = rs.getInt(1);
					m_no = rs.getInt(2);
					j_date = rs.getDate(3);
					j_desc = rs.getString(4);
					chance = false;
				}
				int jd_no = rs.getInt(5);
				int i_type = rs.getInt(6);
				int jd_quantity = rs.getInt(7);
				int jd_tot = rs.getInt(8);
				odMap.put(i_type, new OrderDetail(jd_no, i_type, jd_quantity, jd_tot, j_no));
			}
			order = new Order(j_no, m_no, j_date, j_desc, odMap);
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				releaseConnection(conn);
		}
		return order;
	}
	
	public Order selectOrderByI_type(int item_type) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order order = null;
		HashMap<Integer,OrderDetail> odMap = new HashMap<Integer,OrderDetail>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(OrderSQL.selectOrderByI_noSQL);
			pstmt.setInt(1, item_type);
			rs = pstmt.executeQuery();
			boolean chance = true;
			int j_no = 0;
			int m_no = 0;
			Date j_date = null;
			String j_desc = "";
			while (rs.next()) {
				if (chance) {
					j_no = rs.getInt(1);
					m_no = rs.getInt(2);
					j_date = rs.getDate(3);
					j_desc = rs.getString(4);
					chance = false;
				}
				int jd_no = rs.getInt(5);
				int i_type = rs.getInt(6);
				int jd_quantity = rs.getInt(7);
				int jd_tot = rs.getInt(8);
				odMap.put(i_type, new OrderDetail(jd_no, i_type, jd_quantity, jd_tot, j_no));
			}
			order = new Order(j_no, m_no, j_date, j_desc, odMap);
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				releaseConnection(conn);
		}
		return order;
	}
	
	public int insertOder(int m_no, String j_desc) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(OrderSQL.insertOrderSQL);
			pstmt.setInt(1, m_no);
			pstmt.setString(2, j_desc);
			int result = pstmt.executeUpdate();
			return result;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				releaseConnection(conn);
		}
	}

	public int insertOD(OrderDetail od) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(OrderSQL.insertODSQL);
			pstmt.setInt(1, od.getI_type());
			pstmt.setInt(2, od.getJd_quantity());
			pstmt.setInt(3, od.getJd_tot());
			pstmt.setInt(4, od.getJ_no());
			int result = pstmt.executeUpdate();
			return result;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				releaseConnection(conn);
		}
	}

	public int deleteOD(int jd_no) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(OrderSQL.deleteODSQL);
			pstmt.setInt(1, jd_no);
			count = pstmt.executeUpdate();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return count;
	}

	public int deleteOrder(int j_no) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(OrderSQL.deleteOrderSQL);
			pstmt.setInt(1, j_no);
			count = pstmt.executeUpdate();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return count;
	}

	public int updateOD(OrderDetail od) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(OrderSQL.updateSQL);
			pstmt.setInt(1, od.getJd_quantity());
			pstmt.setInt(2, od.getJd_tot());
			pstmt.setInt(3, od.getJd_no());
			count = pstmt.executeUpdate();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return count;
	}

	public Order selectOrderOnlyByM_no(int member_no) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Order order = null;
		HashMap<Integer,OrderDetail> odMap = new HashMap<Integer,OrderDetail>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(OrderSQL.selectOrderByM_noSQL);
			pstmt.setInt(1, member_no);
			rs = pstmt.executeQuery();
			int j_no = 0;
			int m_no = 0;
			Date j_date = null;
			String j_desc = "";
			if (rs.next()) {
					j_no = rs.getInt(1);
					m_no = rs.getInt(2);
					j_date = rs.getDate(3);
					j_desc = rs.getString(4);
			}
			order = new Order(j_no, m_no, j_date, j_desc, odMap);
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				releaseConnection(conn);
		}
		return order;
	}
	
}
