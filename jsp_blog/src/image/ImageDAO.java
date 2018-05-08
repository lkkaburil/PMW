package image;

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

public class ImageDAO {

	public boolean create(ImageDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into image(imgno, name, title, content, passwd, viewcnt, idate, fname) ");
		sql.append(" values ((select nvl(max(imgno), 0) +1 as max from image), ");
		sql.append(" ?, ?, ?, ?, ?, sysdate, ?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getViewcnt());
			pstmt.setString(6, dto.getFname());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public ImageDTO read(int imgno){
		ImageDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select name, title, content, viewcnt, idate, fname  ");
		sql.append(" from image ");
		sql.append(" where imgno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new ImageDTO();
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setIdate(rs.getString("idate"));
				dto.setFname(rs.getString("fname"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return dto;
	}
	
	public List imgRead(int imgno){
		List list = new ArrayList();
		Connection con = DBOpen.open();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(imgno,2)     over (order by imgno) pre_imgno2,    ");
		sql.append("          lag(imgno,1)     over (order by imgno ) pre_imgno1,   ");
		sql.append("          imgno,  ");
		sql.append("          lead(imgno,1)    over (order by imgno) nex_imgno1,    ");
		sql.append("          lead(imgno,2)    over (order by imgno) nex_imgno2,    ");
		sql.append("          lag(fname,2)  over (order by imgno) pre_file2,     ");
		sql.append("          lag(fname,1)  over (order by imgno ) pre_file1,  ");
		sql.append("          fname,   ");
		sql.append("          lead(fname,1) over (order by imgno) nex_file1,  ");
		sql.append("          lead(fname,2) over (order by imgno) nex_file2   ");
		sql.append("          from (  ");
		sql.append("               SELECT imgno, fname   ");
		sql.append("               FROM image ");
		sql.append("               ORDER BY imgno DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE imgno = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int[] noArr = 
					   {
						rs.getInt("pre_imgno2"),
						rs.getInt("pre_imgno1"),
						rs.getInt("imgno"),
						rs.getInt("nex_imgno1"),
						rs.getInt("nex_imgno2")
					    };
				String[] files = 
					    {
						rs.getString("pre_file2"),
						rs.getString("pre_file1"),
						rs.getString("fname"),
						rs.getString("nex_file1"),
						rs.getString("nex_file2")
						};
				
				list.add(files);
				list.add(noArr);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
				
		return list;
	}
	
	public boolean update(ImageDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update image set ");
		sql.append(" name = ?, ");
		sql.append(" title = ?, ");
		sql.append(" content = ?, ");
		sql.append(" fname = ? ");
		sql.append(" where imgno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFname());
			pstmt.setInt(5, dto.getImgno());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public boolean delete(int imgno) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from image ");
		sql.append(" where imgno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		
		return flag;
	}
	
	public List<ImageDTO> list(Map map) {
		List<ImageDTO> list = new ArrayList<ImageDTO>();
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (int) map.get("sno");
		int eno = (int) map.get("eno");
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select imgno, title, name, fname, r ");
		sql.append(" 	from( ");
		sql.append(" 		select imgno, title, name, fname, rownum r ");
		sql.append(" 			from ( ");
		sql.append(" 				select imgno, title, name, fname  ");
		sql.append(" 				from image ");
		
		if(word.trim().length()>0) {
			sql.append(" 				where " +col+  " like '%'||?||'%' ");
			
		}
			sql.append(" 				order by imgno desc ");
			sql.append(" 			) ");
			sql.append(" 			) ");
			sql.append(" where r >=? and r <= ?	 ");
	
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			int i = 0;
			
			if(word.trim().length()>0) {
				pstmt.setString(++i, word);
			}
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ImageDTO dto = new ImageDTO();
				dto.setImgno(rs.getInt("imgno"));
				dto.setTitle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setFname(rs.getString("fname"));
				
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
	
	public boolean pwCheck(Map map) {
		boolean flag = false;
		
		int imgno = (Integer) map.get("imgno");
		String passwd = (String) map.get("passwd");
		System.out.println(passwd);
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(imgno) as cnt from image ");
		sql.append(" where imgno = ? and passwd = ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int check = rs.getInt("cnt");
				System.out.println(check);
				if(check>0) {
					flag = true;
					
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
	
	public int total(Map map) {
		int total = 0;
		
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from image ");
		if(word.trim().length()>0) {
			sql.append(" where " +col+ " like '%'||?||'%' ");
		}

		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0) {
				pstmt.setString(1, word);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt("count(*)");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return total;
	}
	
	public void upviewcnt(int imgno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update image set ");
		sql.append(" viewcnt = viewcnt +1 ");
		sql.append(" where imgno = ? ");
		
		try {
			pstmt  = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
	}
	
}
