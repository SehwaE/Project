package com.itwillbs.project;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.itwillbs.project.BoardBean;

public class BoardDAO {

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
	public void insertBoard(BoardBean bb) {
		
		int bno = 0;
		
		try {
			// 1.2. 디비연결
			con = getCon();
			////////////////////////////////
			// 글번호 num 계산하기
			// 3. sql 쿼리 & pstmt 객체
			// 게시판 글번호(num)계산
			sql = "select max(num) from itwill_project";
			
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
			sql = "insert into itwill_project (num,name,pass,product,postcode,add1,add2,"
					+ "add3,add4,subject,content,readcount,re_ref,re_lev,re_seq,date,ip,file) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			
			// ?
			pstmt.setInt(1, bno); // 위에서 계산된 글번호 저장
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getProduct());
			pstmt.setString(5, bb.getPostcode());
			pstmt.setString(6, bb.getAdd1());
			pstmt.setString(7, bb.getAdd2());
			pstmt.setString(8, bb.getAdd3());
			pstmt.setString(9, bb.getAdd4());
			pstmt.setString(10, bb.getSubject());
			pstmt.setString(11, bb.getContent());
			pstmt.setInt(12, 0); // 글조회수는 항상 0으로 초기화
			pstmt.setInt(13, bno); // re_ref 답변글 그룹 == 일반 글번호 동일
			pstmt.setInt(14, 0); // re_lev 답변글 들여쓰기 -> 일반글 들여쓰기 없음
			pstmt.setInt(15, 0); // re_seq 답변글 순서 -> 일반글은 순서 맨위에 위치
			pstmt.setString(16, bb.getIp());
			pstmt.setString(17, bb.getFile());
			
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
			sql = "select count(*) from itwill_project";
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
				BoardBean bb = new BoardBean();
				
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setProduct(rs.getString("product"));
				bb.setPostcode(rs.getString("postcode"));
				bb.setAdd1(rs.getString("add1"));
				bb.setAdd2(rs.getString("add2"));
				bb.setAdd3(rs.getString("add3"));
				bb.setAdd4(rs.getString("add4"));
			
				boardList.add(bb);
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
			
			sql = "select * from itwill_project"
					+ " order by re_ref desc, re_seq asc"
					+ " limit ?,?";
			pstmt = con.prepareStatement(sql);
			
			//?
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				// DB데이터 -> BoardBean 객체
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setProduct(rs.getString("product"));
				bb.setPostcode(rs.getString("postcode"));
				bb.setAdd1(rs.getString("add1"));
				bb.setAdd2(rs.getString("add2"));
				bb.setAdd3(rs.getString("add3"));
				bb.setAdd4(rs.getString("add4"));
				
				// BoardBean객체 -> ArrayList 한칸에 저장
				boardList.add(bb);
			}
			
			System.out.println("DAO : 게시판 글 저장 완료!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return boardList;
	}//getBoardList(startRow,pageSize)
	
	
	//updateReadCount(num)
	public void updateReadCount(int num){
		
		try {
			//1.2 디비연결
			con = getCon();
			//3. sql 쿼리 & pstmt 객체
			// 기존의 조회수를 1증가
			sql = "update itwill_project set readcount=readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			//4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 조회수 1증가!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		
	}//updateReadCount(num)
	
	
	//getBoard(num)
	public BoardBean getBoard(int num){
		
		BoardBean bb = null;
		
		try {
			//1.2. 디비연결
			con = getCon();
			//3. sql 쿼리 & pstmt 객체
			sql ="select * from itwill_project where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			//4. sql 실행
			rs = pstmt.executeQuery();
			//5. 데이터 처리
			if(rs.next()) {
				
				// DB -> BoardBean
				bb = new BoardBean();
				
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setProduct(rs.getString("product"));
				bb.setPostcode(rs.getString("postcode"));
				bb.setAdd1(rs.getString("add1"));
				bb.setAdd2(rs.getString("add2"));
				bb.setAdd3(rs.getString("add3"));
				bb.setAdd4(rs.getString("add4"));

			}//if
			
			System.out.println("DAO : 해당 글 저장완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return bb;
	}//getBoard(num)

	
	//updateBoard()
	public int updateBoard(BoardBean bb) {
		int result = -1;
		// -1 : 아이디가 없음, 0 : 비밀번호 오류, 1 : 정상처리
		
		try {
			//1.2. 디비연결'
			con = getCon();
			//3. sql 쿼리(select - 글이 있는지 판단) & pstmt 객체
			sql = "select pass from itwill_project where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			//4. sql 실행
			rs = pstmt.executeQuery();
			//5. 데이터 처리
			if(rs.next()){
				if(bb.getPass().equals(rs.getString("pass"))){
				//3.sql	쿼리(update - 해당글 수정) & pstmt 객체
				sql = "update itwill_project set name=?, product=?, postcode=?, add1=?, add2=?, add3=?, add4=?, subject=?,"
						+ "content=? where num=?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bb.getName());
				pstmt.setString(2, bb.getProduct());
				pstmt.setString(3, bb.getPostcode());
				pstmt.setString(4, bb.getAdd1());
				pstmt.setString(5, bb.getAdd2());
				pstmt.setString(6, bb.getAdd3());
				pstmt.setString(7, bb.getAdd4());
				pstmt.setString(8, bb.getSubject());
				pstmt.setString(9, bb.getContent());
				pstmt.setInt(10, bb.getNum());
				//4. sql 실행
				result = pstmt.executeUpdate();
				
				//result = 1;
				System.out.println("DAO : 글 수정 - 정상 수정");
				
				}else {
					// 비밀번호 오류
					System.out.println("DAO : 글 수정 - 비밀번호 오류");
					result = 0;
				}
			}else {
				// 글없음
				System.out.println("DAO : 글 수정- 글 없음");
				result = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		return result;
	}//updateBoard()
	
	
	//deleteBoard(bb)
	public int deleteBoard(BoardBean bb) {
		int result = -1;
		
		try {
			//1.2. 디비연결
			con = getCon();
			//3. sql(select) 구문 & pstmt
			sql="select pass from itwill_project where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getNum());
			//4. sql 실행
			rs = pstmt.executeQuery();
			
			//5. 데이터 처리
			if(rs.next()) {
				if(bb.getPass().equals(rs.getString("pass"))) {
					//3. sql 작성(delete) & pstmt 객체 생성
					sql = "delete from itwill_project where num=?";
				
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bb.getNum());
					
					//4. sql 실행 // 해당 쿼리가 삭제된 줄 수를 리턴 -> num이 pk이므로 result = 1;
					result = pstmt.executeUpdate();
				
				}else {
					// 글 비밀번호 오류
					result = 0;
				}
			}else {
				// 글이 없음
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
	
	
	//reInsertBoard(bb)
	public void reInsertBoard(BoardBean bb) {
		int num = 0;
		
		try {
			//1.2. 디비 연결
			con = getCon();
			//3. sql 쿼리 & pstmt 객체
			// -> 답글번호 계산(num)
			sql = "select max(num) from itwill_project";
			pstmt = con.prepareStatement(sql);
			
			//4. sql 실행
			rs = pstmt.executeQuery();
			//5. 데이터 처리
			if(rs.next()) {
				num = rs.getInt(1) + 1;
				
			}
			System.out.println("DAO : 답글번호 확인 -> "+num);
////////////////////////////////////////////////////////////////////////
			// -> 답글 순서 재배치
			// re_ref 값이 같은 그룹, re_seq기존의 값보다 큰값이 있을때 1증가
			sql="update itwill_project set re_seq=re_seq+1 "
					+ "where re_ref=? and re_seq>?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			pstmt.executeUpdate();
			
			System.out.println("DAO : 답글 순서 재배치! ");
////////////////////////////////////////////////////////////////////////
			// -> 답글 작성
			//3. sql 구문 & pstmt 객체
			sql ="insert into itwill_project(num,name,pass,product,postcode,add1,add2,add3,add4,subject,content,"
					+ "readcount,re_ref,re_lev,re_seq,date,ip,file) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)"; //date->now()
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getProduct());
			pstmt.setString(5, bb.getPostcode());
			pstmt.setString(6, bb.getAdd1());
			pstmt.setString(7, bb.getAdd2());
			pstmt.setString(8, bb.getAdd3());
			pstmt.setString(9, bb.getAdd4());
			pstmt.setString(10, bb.getSubject());
			pstmt.setString(11, bb.getContent());
			pstmt.setInt(12, 0); //조회수 0
			pstmt.setInt(13, bb.getRe_ref()); // 답글ref : 일반글(원글)의 ref값 사용
			pstmt.setInt(14, bb.getRe_lev()+1); // 답글lev : 들여쓰기 1 증가 
			pstmt.setInt(15, bb.getRe_seq()+1); // 답글seq : 순서 1 증가
			pstmt.setString(16, bb.getIp());
			pstmt.setString(17, bb.getFile());
			
			
			//4. sql 실행
			pstmt.executeUpdate();
			
			System.out.println("DAO : 답글 작성완료!");
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
	}//reInsertBoard(bb)
	
	
	//getBoardList(startRow,pageSize,search) (overloading)
	public ArrayList getBoardList(int startRow, int pageSize, String search) {
		
		ArrayList boardList = new ArrayList();
		
		try {
			// 1.2 디비연결
			con = getCon();
			// 3. sql 작성 & pstmt 객체
			
			// re_ref(num)기준으로 정렬 내림차순, re_seq 오름차순 정렬
			// limit 시작행-1, 개수
			
			if(search.equals("all")) {
			sql = "select * from itwill_project"
					+ " order by re_ref desc, re_seq asc"
					+ " limit ?,?";
			}else{
				sql = "select * from itwill_project"
						+ " where subject like ?"
						+ " order by re_ref desc, re_seq asc"
						+ " limit ?,?";
			}
			pstmt = con.prepareStatement(sql);
			
			if(search.equals("all")) {
				pstmt.setInt(1, startRow-1);
				pstmt.setInt(2, pageSize);
			}else {
				pstmt.setString(1, "%"+search+"%");
				pstmt.setInt(2, startRow-1);
				pstmt.setInt(3, pageSize);
			}
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리
			
			while(rs.next()) { // 데이터가 있을때마다 처리
				// 게시판 글 저장 -> BoardBean저장 -> ArrayList 저장
				
				BoardBean bb = new BoardBean();
				// DB데이터 -> BoardBean 객체
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				
				// BoardBean객체 -> ArrayList 한칸에 저장
				boardList.add(bb);
				
			}//while
			
			System.out.println("DAO : 게시판 글 저장 완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeMyDB();
		}
		
		return boardList;
		
	} //getBoardList(startRow,pageSize,search)
	
	
	
}
