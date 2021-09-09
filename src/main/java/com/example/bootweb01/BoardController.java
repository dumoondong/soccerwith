package com.example.bootweb01;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDAO dao;	

	@RequestMapping( "main.do" )
	public ModelAndView main(HttpServletRequest request) {
		return new ModelAndView("menu/main");
	}
	@RequestMapping( "/eventlist.do" )
	public ModelAndView eventlist(HttpServletRequest request) {
		System.out.println( "list() 호출" );
		
		ArrayList<BoardTO> datas1 = dao.eventList();
		
		ModelAndView modelAndView = new ModelAndView( "event/event_board" );
		modelAndView.addObject( "datas1", datas1 );
		return modelAndView;
	}
	@RequestMapping( "board.do" )
	public ModelAndView board(HttpServletRequest request) {
		System.out.println( "board() 호출" );
		ArrayList<SmallcodeTO> datas = dao.boardcodeList();//소코드 리스트
		ArrayList<BoardTO> alldatas = dao.boardAll(); //게시판 모든 데이터
		ArrayList<BoardTO> voguedatas = dao.boardvogue(); //인기게시판을 위한 조회순으로 출력한 데이터
		String smallcode = request.getParameter("smallcode"); //선택한 메뉴 데이터
		
		SmallcodeTO tosc = new SmallcodeTO();
		tosc.setSmallcode(request.getParameter("smallcode"));  //선택한 메뉴에 해당하는 small코드
		tosc = dao.search_info( tosc );	//선택한 smallcode에 해당하는 코드 정보 찾기
		
		ArrayList<BoardTO> codedatas = dao.board(smallcode); //dao에서 선택한 게시판 메뉴에 따른 리스트 검색
		
		for(BoardTO to : alldatas) {	//전체게시판에서 smallcode에 해당하는 smallinfo를 to에 넣기
			String smallcode2 = to.getSmallcode();
			SmallcodeTO to2 = new SmallcodeTO();
			to2.setSmallcode(smallcode2 );
			to2 = dao.infodata( to2 );
			to.setSmallinfo(to2.getSmallinfo());
		}
		for(BoardTO to : voguedatas) {	//인기게시판에서 smallcode에 해당하는 smallinfo를 to에 넣기
			String smallcode2 = to.getSmallcode();
			SmallcodeTO to2 = new SmallcodeTO();
			to2.setSmallcode(smallcode2 );
			to2 = dao.infodata( to2 );
			to.setSmallinfo(to2.getSmallinfo());
		}
		
		ModelAndView modelAndView = new ModelAndView( "board/board" );
		modelAndView.addObject( "datas", datas );//소코드 리스트
		modelAndView.addObject( "alldatas", alldatas ); //모든 작성 게시판 리스트 출력
		modelAndView.addObject( "voguedatas", voguedatas ); //인기게시판 리스트 출력
		modelAndView.addObject( "codedatas", codedatas );  //선택한 메뉴에 대한 게시판 리스트 출력
		modelAndView.addObject( "code", smallcode ); //넘어온 메뉴 데이터 다시 넘기기
		modelAndView.addObject( "tosc", tosc ); // smallcode에 해당하는 코드정보
		return modelAndView;
	}
	@RequestMapping( "board_write.do" )
	public ModelAndView board_write(HttpServletRequest request) {
		System.out.println( "board_write() 호출" );

		ArrayList<SmallcodeTO> datas = dao.boardcodeList();
		
		//System.out.println(smallcode);	
		ModelAndView modelAndView = new ModelAndView( "board/board_write" );
		modelAndView.addObject( "datas", datas );
		return modelAndView;
	}
	@RequestMapping( "board_write_ok.do" )
	public ModelAndView board_write_ok(HttpServletRequest request) {
		BoardTO to = new BoardTO();
		to.setSmallcode(request.getParameter("smallcode"));
		to.setTitle(request.getParameter("title"));
		to.setId(request.getParameter("id"));
		to.setContent(request.getParameter("content"));
		
		SmallcodeTO tosc = new SmallcodeTO();
		tosc.setSmallcode(request.getParameter("smallcode"));  //선택한 분류에 따른 정보를 찾기
		
		tosc = dao.search_info( tosc );	//선택한 smallcode에 해당하는 코드 정보 찾기
		
		
		int flag = dao.boardWriteOk(to);
		
		ModelAndView modelAndView = new ModelAndView("board/board_write_ok");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	@RequestMapping( "board_view.do" )
	public ModelAndView board_view(HttpServletRequest request) {
		ArrayList<SmallcodeTO> datas = dao.boardcodeList();
		
		SmallcodeTO tosc = new SmallcodeTO();
		tosc.setSmallcode(request.getParameter("smallcode"));  //선택한 메뉴에 해당하는 small코드
		tosc = dao.search_info( tosc );	//선택한 smallcode에 해당하는 코드 정보 찾기
		
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter( "seq" ) );
		to = dao.board_view( to );
		
		ModelAndView modelAndView = new ModelAndView( "board/board_view" );
		modelAndView.addObject( "datas", datas );
		modelAndView.addObject( "to", to );
		modelAndView.addObject( "tosc", tosc ); // smallcode에 해당하는 코드정보
		return modelAndView;
	}
}
