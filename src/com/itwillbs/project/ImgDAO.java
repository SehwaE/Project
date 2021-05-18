package com.itwillbs.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ImgDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	private Connection getCon() throws Exception {
		
		Context initCTX = new InitialContext();
		DataSource ds
					= (DataSource)initCTX.lookup("java:comp/env/jdbc/ProjectDB");
		con = ds.getConnection();
		
		System.out.println("DAO : 디비 연결 성공!"+con);

		return con;
	}
	
	public void closeMyDB() {
		System.out.println("DAO : 자원해제!! ");
		
		try {
			if(rs != null) {rs.close(); }
			if(pstmt != null) { pstmt.close(); }
			if(con != null) { con.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	// 글쓰기 메서드
	//insertBoard(bb)
	public void insertBoard(ImgBean ib) {
		
		int bno = 0;
		
		try {
			// 1.2. 디비연결
			con = getCon();
			////////////////////////////////
			// 글번호 num 계산하기
			// 3. sql 쿼리 & pstmt 객체
			// 게시판 글번호(num)계산
			sql = "select max(num) from itwill_img";
			
			pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				// * max(num)의 결과가 없을 경우 sql => null 데이터를 가짐.
				//   rs.getInt(1) => 결과가 sql null일 경우 [0]리턴,
				//                  "             아닐 경우 해당 숫자 리턴
				
				bno = rs.getInt(1) + 1; // 1번째 컬럼의 값 : 인덱스 번호 사용
				//rs.getInt("num"); (x) // 컬럼명이 max(num)으로 되어있기 때문에 사용불가
				//rs.getInt("max(num)"); (o) // 컬럼명을 사용
			}
			
			System.out.println(" 글번호 : "+bno);
			////////////////////////////////
			// 글번호 + 글정보 => 글쓰기
			// 3. sql 쿼리 & pstmt 객체
			sql = "insert into itwill_img (num,id,pass,subject,msg,filename) "
					+ "values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			// ?
			pstmt.setInt(1, bno); // 위에서 계산된 글번호 저장
			pstmt.setString(2, ib.getId());
			pstmt.setString(3, ib.getPass());
			pstmt.setString(4, ib.getSubject());
			pstmt.setString(5, ib.getMsg());
			pstmt.setString(6, ib.getFilename());
			
			// 4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 글쓰기 성공! 글번호 : "+bno);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 예외발생여부와 상관없이 반드시 한번 실행
			closeMyDB();
		}
		
		
	}//insertBoard(bb)
	
	
	//getBoardCount()
	public int getBoardCount() {
		int cnt = 0;
		
		try {
			con = getCon();
			sql = "select count(*) from itwill_img";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			System.out.println("DAO : 글 개수 조회 -> "+cnt);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		
		return cnt;
	}//getBoardCount()
	
	public ArrayList getBoardList() {
		
		ArrayList boardList = new ArrayList();
		
		try {
			con = getCon();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ImgBean ib = new ImgBean();
				
				ib.setPass(rs.getString("pass"));
				ib.setMsg(rs.getString("msg"));
				ib.setFilename(rs.getString("filename"));
				ib.setId(rs.getString("id"));
				ib.setNum(rs.getInt("num"));
				ib.setSubject(rs.getString("subject"));
				
				boardList.add(ib);
			}
			
			System.out.println("DAO : 게시판 글 저장 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}

		return boardList;
	}
	
	//getBoardList(startRow,pageSize)
	public ArrayList getBoardList(int startRow, int pageSize) {
		
		ArrayList boardList = new ArrayList();
		
		try {
			con = getCon();
			
			sql = "select * from itwill_img"
					+ " order by num desc"
					+ " limit ?,?";
			pstmt = con.prepareStatement(sql);
			
			//?
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ImgBean ib = new ImgBean();
				
				ib.setPass(rs.getString("pass"));
				ib.setMsg(rs.getString("msg"));
				ib.setFilename(rs.getString("filename"));
				ib.setId(rs.getString("id"));
				ib.setNum(rs.getInt("num"));
				ib.setSubject(rs.getString("subject"));
				
				// BoardBean객체 -> ArrayList 한칸에 저장
				boardList.add(ib);
			}
			
			System.out.println("DAO : 게시판 글 저장 완료!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return boardList;
	}//getBoardList(startRow,pageSize)
		
	
	//getBoard(num)
	public ImgBean getBoard(int num){
		
		ImgBean ib = null;
		
		try {
			//1.2. 디비연결
			con = getCon();
			//3. sql 쿼리 & pstmt 객체
			sql ="select * from itwill_img where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4. sql 실행
			rs = pstmt.executeQuery();
			//5. 데이터 처리
			if(rs.next()) {
				
				// DB -> BoardBean
				ib = new ImgBean();
				
				ib.setPass(rs.getString("pass"));
				ib.setMsg(rs.getString("msg"));
				ib.setFilename(rs.getString("filename"));
				ib.setId(rs.getString("id"));
				ib.setNum(rs.getInt("num"));
				ib.setSubject(rs.getString("subject"));

			}//if
			
			System.out.println("DAO : 해당 글 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return ib;
	}//getBoard(num)
	
	
	//deleteBoard(bb)
	public int deleteBoard(ImgBean ib) {
		int result = -1;
		
		try {
			//1.2. 디비연결
			con = getCon();
			sql = "select pass from itwill_img where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ib.getNum());
			rs = pstmt.executeQuery();
			
		if(rs.next()) {
			if(ib.getPass().equals(rs.getString("pass"))) {
			//3. sql(select) 구문 & pstmt
				sql = "delete from itwill_img where num=?";
			
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ib.getNum());
					
				//4. sql 실행 // 해당 쿼리가 삭제된 줄 수를 리턴 -> num이 pk이므로 result = 1;
				result = pstmt.executeUpdate();
			}else {
				result = 0;
			}
		}else {
			result = -1;
		}
			System.out.println("DAO : 글삭제 처리 -> "+result);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		
		
		return result;
	}//deleteBoard(bb)

	
	
	
}

