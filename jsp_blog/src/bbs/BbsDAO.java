package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class BbsDAO {

	
	public boolean create(BbsDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into bbs (bbsno, wname, title, content, passwd, wdate, grpno,  ");
		sql.append(" filename, filesize)  ");
		sql.append(" values ((select nvl(max(bbsno),0)+1 as max from bbs),   ");
		sql.append(" ?, ?, ?, ?, sysdate,  ");
		sql.append(" (select nvl(max(grpno),0)+1 from bbs), ?, ?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFilename());
			pstmt.setInt(6, dto.getFilesize());
		
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {flag = true;}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
			
		}
		
		
		return flag;
	}
	
	public BbsDTO read(int bbsno) {
		BbsDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select bbsno, wname, title, content, viewcnt, wdate, filename, filesize  ");
		sql.append(" from bbs where bbsno = ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				//dto.setPasswd(rs.getString("passwd"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
			
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getInt("filesize"));
				
				//dto.setGrpno(rs.getInt("grpno"));
				//dto.setIndent(rs.getInt("indent"));
				//dto.setAnsnum(rs.getInt("ansnum"));
					
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	}
	
	public boolean update(BbsDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update bbs  ");
		sql.append(" set  ");
		sql.append(" wname=?,  ");
		sql.append(" title=?,  ");
		sql.append(" content=?  ");
		
		
		if(dto.getFilesize()>0) {
			sql.append(" , filename=?,  ");
			sql.append(" filesize=?     ");
			
		}
		
		sql.append(" where bbsno = ?  ");
		
		try {
			int i =0;
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++i, dto.getWname());
			pstmt.setString(++i, dto.getTitle());
			pstmt.setString(++i, dto.getContent());
			
			if(dto.getFilesize()>0) {
				pstmt.setString(++i, dto.getFilename());
				pstmt.setInt(++i, dto.getFilesize());
			}
			pstmt.setInt(++i, dto.getBbsno());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) {flag=true;}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
			
		}
		
		return flag;
	}
	
	public boolean delete(int bbsno) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from bbs ");
		sql.append(" where bbsno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setInt(1, bbsno);
			int cnt = pstmt.executeUpdate();
			if (cnt>0) {flag = true;}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			DBClose.close(con, pstmt);
		}
		
		
		return flag;
	}
	
	
	public List<BbsDTO> list(Map map) {
		List<BbsDTO> list = new ArrayList<>();
		
		Connection con= DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select bbsno, wname, title,  ");
		sql.append(" viewcnt, wdate, indent, filename, r ");
		sql.append(" from( ");
		sql.append(" 	select bbsno, wname, title,  ");
		sql.append(" 	viewcnt, wdate, indent, filename, rownum r ");
		sql.append(" 	from( ");
		
		sql.append(" 		select bbsno, wname, title,    ");
		sql.append(" 		viewcnt, indent, filename,  ");
		sql.append(" 		to_char(wdate, 'yyyy-mm-dd') wdate  ");
		sql.append(" 		from bbs  ");
		
		if(word.trim().length() > 0)  //trim(): 빈 공간을 줄여주는 메소드
			sql.append("	 where " +col+ " like '%'||?||'%' ");

			sql.append(" 	 order by grpno desc, ansnum   ");
			
			sql.append(" 	) ");
			sql.append(" ) ");
			sql.append(" where r >= ? and r <= ?  ");
		
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			
			int i = 0;
		
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
				
			}
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BbsDTO dto = new BbsDTO();
				
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				
				dto.setViewcnt(rs.getInt("viewcnt"));
				
				dto.setWdate(rs.getString("wdate"));
				dto.setIndent(rs.getInt("indent"));
				dto.setFilename(rs.getString("filename"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return list;
	}


	public void upViewcnt(int bbsno) {
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update bbs ");
		sql.append(" set ");
		sql.append(" viewcnt = viewcnt +1 ");
		sql.append(" where bbsno =? ");
		
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
			
		}
	}
		
	
	
	public boolean passCheck(Map map) {
		boolean flag = false;
		int bbsno = (Integer) map.get("bbsno"); //언박싱
		String passwd = (String) map.get("passwd"); 
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(bbsno) as cnt ");
		sql.append(" from bbs ");
		sql.append(" where bbsno=? and passwd=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int aa = rs.getInt(1);   //() key값의 table index나  컬럼명 둘다 넣을 수 있음.
				if(aa > 0 )flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		
		return flag;
		
	}
	
	public BbsDTO readReply(int bbsno) {
		BbsDTO dto = null;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select bbsno, grpno, indent, ansnum, title ");
		sql.append(" from bbs ");
		sql.append(" where bbsno= ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setTitle(rs.getString("title"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		
		
		
		return dto;
		
	}


	public void upAnsnum(Map map) {
		
		int grpno = (Integer) map.get("grpno");     //캐스팅 후 언박싱
		int ansnum =  (Integer) map.get("ansnum");  //캐스팅 후 언박싱
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update bbs set ansnum = ansnum + 1  ");
		sql.append(" where grpno = ? and ansnum > ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			DBClose.close(con, pstmt);
		}
		
		
	}
	
	public boolean createReply(BbsDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into bbs ");
		sql.append(" (bbsno, wname, title, content, passwd, wdate,   ");
		sql.append(" grpno, indent, ansnum, refnum, filename, filesize)  ");
		sql.append(" values ((select nvl(max(bbsno),0)+1 from bbs), ");
		sql.append(" ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ? ) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno()); 		// ★ 부모의 grpno
			pstmt.setInt(6, dto.getIndent()+1); 	// ★부모의 indent +1
			pstmt.setInt(7, dto.getAnsnum()+1);		// ★부모의 ansnum +1
			pstmt.setInt(8, dto.getBbsno());        // ★ 부모의 글번호
			pstmt.setString(9, dto.getFilename());
			pstmt.setInt(10, dto.getFilesize());
			
			int cnt = pstmt.executeUpdate();
			
			if (cnt > 0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		
		return flag;
	}

	
	public int total(Map map) {
		int total = 0;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String) map.get("col");
		String word= (String) map.get("word");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" select count(*) as cnt from bbs ");
			if(word.trim().length() >0 ) {
				sql.append(" where " +col+ " like '%'||?||'%' ");
			}
		
		try {
			pstmt = con.prepareStatement(sql.toString());
				if(word.trim().length()>0) {
					pstmt.setString(1, word);
				}
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				total = rs.getInt("cnt");  // 쿼리문에서 as 쓰지 않았다면  '1'입력, as 썼다면 쓴 변수명 입력
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return total;
		
	}
	
	public boolean checkRefnum(int bbsno) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refnum) from bbs ");
		sql.append(" where refnum = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int cnt = rs.getInt("count(refnum)");
				if (cnt > 0) {
					flag = true; //부모글.
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		
		return flag;
	}
}

