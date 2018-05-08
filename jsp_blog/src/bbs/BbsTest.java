package bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao = new BbsDAO();

		total(dao);
		//list(dao);
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//upViewcnt(dao);
		//passCheck(dao);
	}

	private static void total(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "선");
		
		int total = dao.total(map);
		
		p("레코드갯수: " +total);
		
	}

	private static void passCheck(BbsDAO dao) {
		Map map = new HashMap<>();
		map.put("bbsno", 4);
		map.put("passwd", "1234");
		
		if (dao.passCheck(map)) {
			p("올바른 비밀번호입니다.");
		}else {
			p("잘못된 비밀번호입니다.");
		}
		
	}

	private static void upViewcnt(BbsDAO dao) {
		BbsDTO dto = dao.read(4);
		p("조회수: " +dto.getViewcnt());
		p("조회수 증가합니다.");
		
		dao.upViewcnt(4);
		dto = dao.read(4);
		p("변경된 조회수: " +dto.getViewcnt());
		
	}

	private static void delete(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		
		
		if(dao.delete(4)) {
			p("삭제 성공하였습니다");
		}else {
			p("삭제 실패하였습니다.");
		}
		
		
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		
		dto.setWname("목캔디");
		dto.setTitle("목캔디제목");
		dto.setContent("목캔디내용");
		dto.setBbsno(5);
		
		if(dao.update(dto)) {
			p("수정성공하였습니다.");
		}else {
			p("수정실패하였습니다.");
		}
		
	
		
	}

	private static void read(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		
		dto = dao.read(2);
		
		p(dto);
		p("---------------");
		
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		
		dto.setBbsno(1);
		dto.setWname("이름이름");
		dto.setTitle("제목제목");
		dto.setContent("내용내용");
		dto.setPasswd("1234");
		dto.setViewcnt(1);
		dto.setWdate("등록날짜");
		dto.setGrpno(5);
		dto.setIndent(4);
		dto.setAnsnum(3);
		
		if(dao.create(dto)) {
			p("등록 성공하였습니다.");
		}else {
			p("등록 실패하였습니다.");
		}
		
	}

	private static void list(BbsDAO dao) {
		Map map = new HashMap();
		map.put("col", "wname");
		map.put("word", "금");
		map.put("sno", 1);
		map.put("eno", 5);
		
		
		List<BbsDTO> list = dao.list(map);
		for (int i = 0; i < list.size(); i++) {
			BbsDTO dto = list.get(i);
			p(dto);
			p("-----------------");
		}

	}

	private static void p(String string) {
		System.out.println(string);

	}

	private static void p(BbsDTO dto) {
		p("번호: " + dto.getBbsno());
		p("작성자: " + dto.getWname());
		p("제목: " + dto.getTitle());
		p("내용: " + dto.getContent());
		p("비밀번호: " + dto.getPasswd());
		p("조회수: " + dto.getViewcnt());
		p("등록날짜: " + dto.getWdate());
		p("grpno: " + dto.getGrpno());
		p("indent: " + dto.getIndent());
		p("ansnum: " + dto.getAnsnum());

	}

}
