package guest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GuestTest {

	public static void main(String[] args) {
		GuestDAO dao = new GuestDAO();
		
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//list(dao);

		
	}

	private static void list(GuestDAO dao) {
		Map map = new HashMap<>();
		
		List<GuestDTO> list = dao.list(map);
		
		
		for(int i=0; i<list.size(); i++) {
			GuestDTO dto = list.get(i);
			p(dto);
			p("-------------------------");
		}
		
	}

	private static void delete(GuestDAO dao) {
		if(dao.delete(5)) {
			p("삭제성공");
		}else {
			p("삭제실패");
		}
		
		
	}

	private static void update(GuestDAO dao) {
		GuestDTO dto = new GuestDTO();
		
		dto.setName("다크모카");
		dto.setContent("에스프레소 칩");
		dto.setNum(2);
		dto.setGdate("2018-02-09 / PM 12:23");
		
		if(dao.update(dto)) {
			p("수정성공");
			p("----------------");
			p(dto);	
		}else {
			p("수정실패");
		}
		
	}

	private static void read(GuestDAO dao) {
		GuestDTO dto = new GuestDTO();
		
		dto = dao.read(4);
		p(dto);
		p("----------------");
		
	}

	private static void create(GuestDAO dao) {
		GuestDTO dto = new GuestDTO();
		
		dto.setNum(1);
		dto.setName("스타벅스");
		dto.setContent("자바칩프라푸치노");
		dto.setGdate("2018-02-09 / PM 12:15");
		
		if(dao.create(dto)) {
			p("등록성공");
			p("----------------------------");
			p(dto);
		}else {
			p("등록실패");
		}
		
	}

	private static void p(GuestDTO dto) {
		p("번호: " +dto.getNum());
		p("이름: " +dto.getName());
		p("내용: " +dto.getContent());
		p("등록날짜: "+dto.getGdate());
	}

	private static void p(String string) {
		System.out.println(string);
	}

}
