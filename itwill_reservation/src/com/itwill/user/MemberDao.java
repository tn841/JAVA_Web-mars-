package com.itwill.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.itwill.board.RdbmsDao;


public class MemberDao extends RdbmsDao {
	
	private static MemberDao _instance;

	private MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	public static MemberDao getInstance() {
		if(_instance == null) {
			_instance = new MemberDao();
		}
		
		return _instance;
	}

	/*
	 * 회원 추가
	 */
	public int create(Member member) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String insertQuery = "insert into member values(MEMBER_M_NO_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		try {
			con = this.getConnection();
			pstmt = con.prepareStatement(insertQuery);

			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getM_password());
			pstmt.setString(3, member.getM_name());
			pstmt.setString(4, member.getM_phone());
			pstmt.setString(5, member.getM_email());
			pstmt.setString(6, member.getM_birth());
			pstmt.setString(7, member.getM_address());
			pstmt.setString(8, member.getM_class());
			//pstmt.setInt(9, member.getM_point());

			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}

	/*
	 * 회원정보 수정
	 */
	public int update(Member member) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String updateQuery = "update member set m_password = ?, m_name = ?, m_email = ?, m_phone = ?, m_address = ?,m_birth=?,m_class=?, m_point=? where m_id = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(updateQuery);
			pstmt.setString(1, member.getM_password());
			pstmt.setString(2, member.getM_name());
			pstmt.setString(3, member.getM_email());
			pstmt.setString(4, member.getM_phone());
			pstmt.setString(5, member.getM_address());
			pstmt.setString(6, member.getM_birth());
			pstmt.setString(7, member.getM_class());
			pstmt.setInt(8, member.getM_point());
			pstmt.setString(9, member.getM_id());
			
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}

	/*
	 * 아이디로 회원삭제
	 */
	public int remove(String memberId) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		String removeQuery = "delete from member where m_id = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(removeQuery);
			pstmt.setString(1, memberId);
			int rows = pstmt.executeUpdate();
			return rows;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
	}
	
	/*
	 * 아이디로 회원찾기
	 */
	public Member findMember(String memberId) throws Exception {
		Member member = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select m_no, m_id, m_password, m_name, m_phone, m_email, m_birth, m_address, m_class, m_point from member where m_id = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member(rs.getInt("m_no"), rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"), rs.getString("m_phone"), rs.getString("m_email"), rs.getString("m_birth"), rs.getString("m_address"), rs.getString("m_class"), rs.getInt("m_point"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return member;
	}

	/*
	 * 회원번호로 회원찾기
	 */
	public Member findMemberByNo(int memberNo) throws Exception {
		Member member = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select m_no, m_id, m_password, m_name, m_phone, m_email, m_birth, m_address, m_class, m_point from member where m_no = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setInt(1, memberNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member(rs.getInt("m_no"), rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"), rs.getString("m_phone"), rs.getString("m_email"), rs.getString("m_birth"), rs.getString("m_address"), rs.getString("m_class"), rs.getInt("m_point"));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return member;
	}
	
	/*
	 * 생년월일, 전화번호로 회원 찾기
	 */
	public Member findMemberByBP(String birth, String phone) throws Exception{
		Member member = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectQuery = "select m_no, m_id, m_password, m_name, m_phone, m_email, m_birth, m_address, m_class, m_point from member where m_birth = ? and m_phone = ?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, birth);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new Member(rs.getInt("m_no"), rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"), rs.getString("m_phone"), rs.getString("m_email"), rs.getString("m_birth"), rs.getString("m_address"), rs.getString("m_class"), rs.getInt("m_point"));
			}
		}finally{
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return member;
	}
	
	
	
	/*
	 * 회원 전체 리스트
	 */
	public List<Member> findMemberList() throws Exception {
		ArrayList<Member> memberList= new ArrayList<Member>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectAllQuery = "select m_no, m_id, m_password, m_name, m_phone, m_email, m_birth, m_address, m_class, m_point from member";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(selectAllQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				memberList.add(new Member(rs.getInt("m_no"), rs.getString("m_id"), rs.getString("m_password"), rs.getString("m_name"), rs.getString("m_phone"), rs.getString("m_email"), rs.getString("m_birth"), rs.getString("m_address"), rs.getString("m_class"), rs.getInt("m_point")));
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				releaseConnection(con);
		}
		return memberList;
	}
	/*
	 * 아이디 존재 여부 판별
	 */
	public boolean existedId(String memberId) throws Exception{
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String existedQuery="select count(*) cnt from member where m_id = ?";
		try{
			con=getConnection();
			pstmt=con.prepareStatement(existedQuery);
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			int count=0;
			if(rs.next()){
				count=rs.getInt("cnt");
			}
			if(count==1){
				return true;
			}else{
				return false;
			}
		}finally{
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				releaseConnection(con);
		}
		
	}
	
	
}

