package com.itwillbs.project.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

public class MemberDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
	//private 접근지정자 : 외부에서 사용불가, 자신의 클래스 안에서만 사용가능.
	
	// 디비연결 처리 메서드
	private Connection getCon() {
		//커넥션풀 사용
		try {
			// Context 객체 생성
			Context initCTX = new InitialContext();
			// Context 사용해서 디비정보를 가져오기
			javax.sql.DataSource ds
			= (javax.sql.DataSource)initCTX.lookup("java:comp/env/jdbc/ProjectDB");
			// 연결정보를 사용해서 연결
			con = ds.getConnection();
			
			System.out.println("DAO : 디비연결성공!!!");
			System.out.println("DAO : "+con);
			
		} catch (Exception e) {
			System.out.println("디비 연결 오류발생!");
			e.printStackTrace();
		}
		
		return con;
	}
	
	
	public void closeDB() {
		try {
			if(rs != null) { rs.close(); }
			if(pstmt != null) { pstmt.close(); }
			if(con != null) { con.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	}
	
	// InsertMember(mb)
	public void InsertMember(MemberBean mb) {
		// 회원가입처리
		
		// 1. 드라이버로드
		// 2. 디비연결
		con = getCon();
		
		try {
		// 3. sql 쿼리 & pstmt 객체
		sql="insert into itwill_member2(id,pw,name,email,phone,reg_date) "
				+ "values(?,?,?,?,?,?)";
		
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getEmail());
			pstmt.setString(5,mb.getPhone());
			pstmt.setTimestamp(6, mb.getReg_date());
			
			// 4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : sql 실행완료! 회원가입 완료!");
		} catch (SQLException e) {
			System.out.println("DAO : sql 구문 실행 에러(회원가입 실패)");
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		
	}
	// InsertMember(mb)
	
	//idCheck(id,pw)
	public int idCheck(String id, String pw) {
			int result = -1;
		try {
			// 1.2 	디비 연결
			con = getCon();
			// 3. sql 쿼리 & pstmt 객체 생성
			sql = "select pw from itwill_member2 where id=?";
			pstmt =con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			// 4. sql 실행
			ResultSet rs =pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				// 아이디 있음
				if(pw.equals(rs.getString("pw"))) {
					result = 1;
					// 아이디 O, 비밀번호 O
				}else {
					// 아이디 O, 비밀번호 X
					result = 0;
				}
			}else {
				// 아이디 없음
				result = -1;
			}
			System.out.println("DAO : sql 구문 실행 성공");
			System.out.println("DAO : 로그인 체크 완료 => "+result);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeDB();
			
		}
		return result;
	}//idCheck(id,pw)

	
	
	//getMember(id) (회원정보를 하나만 가져와가 return타입은 MemberBean)
	public MemberBean getMember(String id) {
		// 회원정보를 저장하는 변수 
		MemberBean mb = null;
		
		
			// 1.2. 디비연결
			con = getCon();
			
			try {
			// 3. sql 구문 & pstmt 객체
			sql = "select * from itwill_member2 where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			// DB 정보 -> MemberBean 객체 지정
			if(rs.next()) {
					mb= new MemberBean();
					
					mb.setEmail(rs.getString("email"));
					mb.setId(rs.getString("id"));
					mb.setName(rs.getString("name"));
					mb.setPw(rs.getString("pw"));
					mb.setReg_date(rs.getTimestamp("reg_date"));
					mb.setPhone(rs.getString("phone"));
					
				}
			
				System.out.println("DAO: 회원 정보 조회 완료!");
				System.out.println("DAO: "+mb);
	
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return mb;
	}//getMember(id)

	
	// updateMember(수정할 정보객체)
	public int updateMember(MemberBean umb) {
		int result = -1;

		try {
			// 1.2 디비 연결
			con = getCon();
			
			// 3. sql 쿼리(select) & pstmt 객체
			sql = "select pw from itwill_member2 where id=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, umb.getId());
			
			// 4. sql 쿼리 실행
			ResultSet rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				// 회원
				if(umb.getPw().equals(rs.getString("pw"))) {
					// 3. sql 쿼리(update) & psmtm 객체
					sql = "update itwill_member2 "
							+ "set name=?,email=?,phone=? where id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, umb.getName());
					pstmt.setString(2, umb.getEmail());
					pstmt.setString(3, umb.getPhone());
					pstmt.setString(4, umb.getId());
					
					// 4. sql 쿼리 실행
					pstmt.executeUpdate();
					result = 1;
				}else {
					// 비밀번호 오류
					result = 0;
				}
				}else {
					//비회원
					result = -1;
				}
				
			System.out.println("DAO : 회원정보 수정완료 => "+result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		
		return result;
	} // updateMember(수정할 정보객체)

	
	// deleteMember
	public int deleteMember(String id, String pw) {
		int result = -1;
		try {
			// 1.2 디비 연결
			con = getCon();
			// 3. sql 쿼리(select) & pstmt 객체
			sql = "select pw from itwill_member2 where id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. sql 실행
			ResultSet rs =  pstmt.executeQuery();
			// 5. 데이터 처리
			if(rs.next()) {
				if(pw.equals(rs.getString("pw"))) {
					// 3. sql쿼리(delete) & pstmt 객체
					sql = "delete from itwill_member2 where id=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					// 4. sql 실행
					pstmt.executeUpdate();
					
					result = 1;
				}else {
					// 비밀번호 오류
					result=0;
				}
			}else {
				// 비회원
				result = -1;

			}
			
			System.out.println("DAO : 회원 삭제 처리 완료 => "+result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}// deleteMember
	
	
	// ArrayList => 가변길이 배열, 데이터를 순차적으로 저장
	// => 크기를 지정하지 않아도 알아서 필요할때 공간을 자동으로 생성
	// getMemberList
	public ArrayList getMemberList(){
		ArrayList memberList = new ArrayList();
		try {
			// 1.2. 디비 연결
			con = getCon();
			// 3. sql & pstmt
			sql = "select * from itwill_member2";
			pstmt = con.prepareStatement(sql);

			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				// 회원정보를 가변길이 배열에 저장
				// 회원정보 -> MemberBean -> ArrayList 한칸
				MemberBean mb = new MemberBean();
				
				mb.setId(rs.getString("id"));
				mb.setEmail(rs.getString("email"));
				mb.setName(rs.getString("name"));
				mb.setPw(rs.getString("pw"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
				mb.setPhone(rs.getString("phone"));
				
				//ArrayList memberList = new ArrayList();
				// 한명의 정보를 배열 한칸에 저장 -> 업캐스팅
				// Object o = mb;
				memberList.add(mb);
				
			}
			
			System.out.println("DAO : 회원목록 저장완료");
			System.out.println("DAO : "+memberList);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		// 5. 데이터 처리
		
		return memberList;
	}// getMemberList
	
	//아이디중복체크 메서드
	public int joinIdCheck(String id){
		int result = -1;
		try {
			//1. DB연결
			con = getCon();
			//2. sql 구문 & pstmt생성
			sql = "select id from itwill_member2 where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			//3. 실행 -> select -> rs저장
			rs = pstmt.executeQuery();

			//4. 데이터처리

			if(rs.next()){	
				result = 0;
			}else{
				result = 1;
			}

			System.out.println("아이디 중복체크결과 : "+result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//idCheck
	
	
	

	
}
