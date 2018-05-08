package member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberTest {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		
		//duplicateId(dao);
		//duplicateEmail(dao);
		//create(dao);
		//list(dao);
		//total(dao);
		//read(dao);
		//passwdCheck(dao);
		//update(dao);
		//getfname(dao);
		//delete(dao);
		//loginCheck(dao);
		getGrade(dao);
		
	}

	private static void getGrade(MemberDAO dao) {
		p("등급: " +dao.getGrade("bi"));
		
	}

	private static void loginCheck(MemberDAO dao) {
		Map map = new HashMap<>();
		map.put("id", "bi");
		map.put("passwd", "TEST");
		
		if(dao.loginCheck(map)) {
			p("로그인 성공");
		}else {
			p("로그인 실패. 아이디와 비밀번호를 다시 한 번 확인해주세요.");
		}
		
	}

	private static void delete(MemberDAO dao) {
		if(dao.delete("ㄹㄹ")) {
			p("삭제성공");
		}else {
			p("삭제실패");
		}
		
	}

	private static void getfname(MemberDAO dao) {
		String a = dao.getFname("june");
		p(a);
		
		
	}

	private static void update(MemberDAO dao) {
		MemberDTO dto = dao.read("춤통령");
		
		//변경할 값 임의로 입력
		dto.setPasswd("789");
		dto.setMname("슈퍼스타");
		dto.setTel("000-0000-0000");
		dto.setEmail("super@star.com");
		dto.setZipcode("78787");
		dto.setAddress1("슈퍼");
		dto.setAddress2("스타");
		dto.setJob("A09");
		
		//업데이트 처리
		if(dao.update(dto)) {
			p("수정성공");
			p("-----------------------------");
			p(dto);
		}else {
			p("수정실패");
		}
		
	}

	private static void passwdCheck(MemberDAO dao) {
		Map map = new HashMap();
		map.put("id", "ㅁㅁ");
		map.put("passwd", "aa");
		
		if(dao.passwdCheck(map)){
			p("비밀번호가 일치합니다.");
		}else {
			p("비밀번호가 일치하지 않습니다.");
		}
		
	}

	private static void read(MemberDAO dao) {
		MemberDTO dto = dao.read("user1");
			p(dto);
			p("----------------------");
		
	}

	private static void total(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "선아");
		
		p("레코드 갯수: " +dao.total(map));
		
	}

	private static void list(MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "mname");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<MemberDTO> list = dao.list(map);
		for(int i = 0; i<list.size(); i++) {
			MemberDTO dto = list.get(i);
			p(dto);
			p("-------------------------------");
		}
		
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		
		dto.setId("tj");
		dto.setPasswd("753");
		dto.setMname("태정");
		dto.setTel("010-6666-7878");
		dto.setEmail("tjtj@tj.com");
		dto.setZipcode("45612");
		dto.setAddress1("의정부");
		dto.setAddress2("미아삼거리");
		dto.setJob("A01");
		dto.setFname("suna.jpg");
		
		if(dao.create(dto)) {
			p("회원가입을 성공하였습니다.");
			p(dto);
		}else {
			p("회원가입을 실패하였습니다.");
		}
		
	}

	private static void duplicateEmail(MemberDAO dao) {
		String email = "email1@mail.com";
		
		if(dao.duplicateEmail(email)) {
			p("이미 존재하는 email로 사용할 수 없습니다.");
		}else {
			p("사용 가능한 email입니다.");
		}
		
	}

	private static void duplicateId(MemberDAO dao) {
		String id = "user1";
		
		if(dao.duplicateId(id)) {
			p("이미 존재하는 ID로 사용할 수 없습니다.");
		}else {
			p("사용 가능한 ID입니다.");
		}
		
	}

	private static void p(MemberDTO dto) {
		p("ID: " + dto.getId());
		p("비밀번호: "+ dto.getPasswd());
		p("이름: " +dto.getMname());
		p("전화번호: " +dto.getTel());
		p("Email: " +dto.getEmail());
		p("우편번호: " +dto.getZipcode());
		p("주소: " +dto.getAddress1());
		p("상세주소: "  +dto.getAddress2());
		p("직업: " +dto.getJob());
		p("사진: "+dto.getFname());
	}
	
	private static void p(String string) {
		System.out.println(string);
	}
}
