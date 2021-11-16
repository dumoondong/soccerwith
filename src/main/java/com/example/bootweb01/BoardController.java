package com.example.bootweb01;

import java.awt.Choice;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDAO dao;	

	@RequestMapping( "/eventlist.do" )
	public ModelAndView eventlist(HttpServletRequest request) {
		System.out.println( "eventlist() 호출" );
		//ArrayList<BoardTO> voguedatas = dao.boardvogue(); //인기게시판을 위한 조회순으로 출력한 데이터
		ArrayList<BoardTO> datas1 = dao.eventList();
		
		ModelAndView modelAndView = new ModelAndView( "event/event_board" );
		//modelAndView.addObject( "voguedatas", voguedatas ); //인기게시판 리스트 출력
		modelAndView.addObject( "datas1", datas1 );
		return modelAndView;
	}
	@RequestMapping( "board.do" )	//리스트
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
		
		String choice = request.getParameter("choice");
		ModelAndView modelAndView = new ModelAndView( "board/board" );
		if(choice != null) {
			if(choice.equals("title")) {
				String title = request.getParameter("search");
				ArrayList<BoardTO> TitleDatas = dao.searchTitle(title); //타이틀 일치 데이터 검색
				modelAndView.addObject( "TitleDatas", TitleDatas );//제목 일치 내용
				
				for(BoardTO to : TitleDatas) {
					String smallcode2 = to.getSmallcode();
					SmallcodeTO to2 = new SmallcodeTO();
					to2.setSmallcode(smallcode2 );
					to2 = dao.infodata( to2 );
					to.setSmallinfo(to2.getSmallinfo());
				}
				
			}else {
				String id = request.getParameter("search");
				ArrayList<BoardTO> idDatas = dao.searchID(id); //타이틀 일치 데이터 검색
				modelAndView.addObject( "idDatas", idDatas );//아이디 일치 내용
				
				for(BoardTO to : idDatas) {
					String smallcode2 = to.getSmallcode();
					SmallcodeTO to2 = new SmallcodeTO();
					to2.setSmallcode(smallcode2 );
					to2 = dao.infodata( to2 );
					to.setSmallinfo(to2.getSmallinfo());
				}
			}
		}
		modelAndView.addObject( "datas", datas );//소코드 리스트
		modelAndView.addObject( "alldatas", alldatas ); //모든 작성 게시판 리스트 출력
		modelAndView.addObject( "voguedatas", voguedatas ); //인기게시판 리스트 출력
		modelAndView.addObject( "codedatas", codedatas );  //선택한 메뉴에 대한 게시판 리스트 출력
		modelAndView.addObject( "code", smallcode ); //넘어온 메뉴 데이터 다시 넘기기
		modelAndView.addObject( "tosc", tosc ); // smallcode에 해당하는 코드정보
		return modelAndView;
	}
	
	@RequestMapping( "board_write.do" )	//작성
	public ModelAndView board_write(HttpServletRequest request) {
		System.out.println( "board_write() 호출" );

		ArrayList<SmallcodeTO> datas = dao.boardcodeList();
		
		//System.out.println(smallcode);	
		ModelAndView modelAndView = new ModelAndView( "board/board_write" );
		modelAndView.addObject( "datas", datas );
		return modelAndView;
	}
	@RequestMapping( "board_write_ok.do" )	//작성확인
	public ModelAndView board_write_ok(HttpServletRequest request) {
		System.out.println( "board_write_ok() 호출" );
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
	@RequestMapping( "board_view.do" )	//뷰페이지
	public ModelAndView board_view(HttpServletRequest request) {
		System.out.println( "board_view() 호출" );
		ArrayList<SmallcodeTO> datas = dao.boardcodeList();	//메뉴리스트
		
		String seq = request.getParameter("seq");
		String id = request.getParameter("id");
		ArrayList<CommentTO> comdatas = dao.comment_list(seq); //댓글 리스트 출력
		ArrayList<CommentTO> likedatas = dao.comment_likelist(seq); //댓글 추천순 리스트 출력
		
		SmallcodeTO tosc = new SmallcodeTO();
		tosc.setSmallcode(request.getParameter("smallcode"));  //선택한 메뉴에 해당하는 small코드
		tosc = dao.search_info( tosc );	//선택한 smallcode에 해당하는 코드 정보 찾기
		
		BoardTO to = new BoardTO();			//seq에 일치하는 리스트 출력
		to.setSeq(request.getParameter( "seq" ) );
		to = dao.board_view( to );
		
		CommentTO countTo = new CommentTO();			//seq에 일치하는 댓글 개수 세기
		countTo.setSeq(request.getParameter( "seq" ) );
		countTo = dao.countComment( countTo );
		
		RecommendTO to2 = new RecommendTO(); 	//로그인id와 시퀸스로 추천 여부 확인
		String logid = request.getParameter("loginUser"); 
		to2 = dao.reco(seq,logid);	
		
		for(CommentTO to3 : comdatas) {			//댓글리스트에 추천여부 확인을 위한 데이터 넣기
			String recoSeq = to3.getPseq();
			String recoPseq = to3.getSeq();
			
			RecommendTO to4 = new RecommendTO();
			to4 = dao.recoCo(recoSeq,logid,recoPseq);
			
			to3.setRecoSeq(to4.getSeq());
			to3.setRecoId(to4.getComid());
			to3.setRecoPseq(to4.getPseq());
		}
		for(CommentTO to3 : likedatas) {		//추천순 댓글리스트에 추천여부 확인을 위한 데이터 넣기
			String recoSeq = to3.getPseq();
			String recoPseq = to3.getSeq();
			
			RecommendTO to4 = new RecommendTO();
			to4 = dao.recoCo(recoSeq,logid,recoPseq);
			
			to3.setRecoSeq(to4.getSeq());
			to3.setRecoId(to4.getComid());
			to3.setRecoPseq(to4.getPseq());
		}
		
		
		
		//ArrayList<RecommendTO> Joindatas = dao.coJoin(seq); 	//댓글리스트,추천리스트
		
		ModelAndView modelAndView = new ModelAndView( "board/board_view" );
		modelAndView.addObject( "datas", datas );			//메뉴리스트
		modelAndView.addObject( "comadatas", comdatas );	//댓글리스트 출력
		modelAndView.addObject( "likedatas", likedatas );	//댓글 추천순 리스트 출력
		modelAndView.addObject( "to", to );					//seq에 일치하는 뷰 출력
		modelAndView.addObject( "to2", to2 );				//게시글 추천여부 확인
		modelAndView.addObject( "countTo", countTo );		//seq에 일치하는 댓글 개수 세기
		//modelAndView.addObject( "Joindatas", Joindatas );	//댓글 리스트, 추천 리스트
		modelAndView.addObject( "tosc", tosc ); 			// smallcode에 해당하는 코드정보
		return modelAndView;
	}
	
	@RequestMapping( "board_Recommend.do" )	//추천
	public ModelAndView board_Recommend(HttpServletRequest request) {
		System.out.println( "board_Recommend() 호출" );
		String id = request.getParameter("id");
		String seq = request.getParameter("seq");
		
		RecommendTO to = new RecommendTO();
		
		to.setSeq(request.getParameter( "seq" ) );
		to.setBoid(request.getParameter("id"));
		int flag = dao.board_Recommend(to);
		
		ModelAndView modelAndView = new ModelAndView( "board/board_Recommend" );
		modelAndView.addObject( "flag", flag );
		modelAndView.addObject( "id", id );
		modelAndView.addObject( "seq", seq );
		return modelAndView;
	}
	
	@RequestMapping( "comment_Recommend.do" )	//댓글추천
	public ModelAndView comment_Recommend(HttpServletRequest request) {
		System.out.println( "comment_Recommend() 호출" );
		String id = request.getParameter("id");
		String seq = request.getParameter("seq");	//댓글 seq
		String pseq = request.getParameter("pseq");	//게시글 seq
		
		RecommendTO to = new RecommendTO();
		to.setSeq(pseq);
		to.setPseq(seq );
		to.setComid(id);

		int flag = dao.comment_Recommend(to);
		
		ModelAndView modelAndView = new ModelAndView( "board/comment_Recommend" );
		modelAndView.addObject( "flag", flag );
		modelAndView.addObject( "id", id );
		modelAndView.addObject( "pseq", pseq );
		modelAndView.addObject( "seq", seq );
		return modelAndView;
	}
	@RequestMapping( "comment_delete.do" )	//댓글삭제
	public ModelAndView comment_delete(HttpServletRequest request) {
		System.out.println( "comment_delete() 호출" );
		String id = request.getParameter("id");
		String seq = request.getParameter("seq");	//댓글 seq
		String pseq = request.getParameter("pseq");	//게시글 seq
		
		CommentTO to = new CommentTO();
		to.setSeq(seq);
		to.setPseq(pseq );
		to.setId(id);

		int flag = dao.comment_delete(to);
		
		ModelAndView modelAndView = new ModelAndView( "board/comment_delete" );
		modelAndView.addObject( "flag", flag );
		modelAndView.addObject( "id", id );
		modelAndView.addObject( "pseq", pseq );
		modelAndView.addObject( "seq", seq );
		return modelAndView;
	}
	@RequestMapping( "board_cancel.do" )	//추천 취소
	public ModelAndView board_cancel(HttpServletRequest request) {
		System.out.println( "board_cancel() 호출" );
		String id = request.getParameter("id");
		String seq = request.getParameter("seq");
		RecommendTO to = new RecommendTO();
		to.setSeq(request.getParameter( "seq" ) );
		to.setBoid(request.getParameter("id"));
		
		int flag = dao.board_cancel(to);
		
		ModelAndView modelAndView = new ModelAndView( "board/board_cancel" );
		modelAndView.addObject( "flag", flag );
		modelAndView.addObject( "id", id );
		modelAndView.addObject( "seq", seq );
		return modelAndView;
	}
	
	@RequestMapping( "comment_cancel.do" )	// 댓글 추천 취소
	public ModelAndView comment_cancel(HttpServletRequest request) {
		System.out.println( "board_cancel() 호출" );
		String id = request.getParameter("id");
		String seq = request.getParameter("seq");
		String pseq = request.getParameter("pseq");
			
		RecommendTO to = new RecommendTO();
		to.setSeq(seq);
		to.setComid(id);
		to.setPseq(pseq);
		
		int flag = dao.comment_cancel(to);
		
		ModelAndView modelAndView = new ModelAndView( "board/comment_cancel" );
		modelAndView.addObject( "flag", flag ); 
		modelAndView.addObject( "id", id );
		modelAndView.addObject( "seq", seq ); 
		modelAndView.addObject( "pseq", pseq ); 
		return modelAndView;
	}
	
	@RequestMapping( "board_modify.do" )	//수정페이지
	public ModelAndView board_modify(HttpServletRequest request) {
		System.out.println( "board_modify() 호출" );
		ArrayList<SmallcodeTO> datas = dao.boardcodeList();
		String smallcode = request.getParameter("smallcode"); //선택한 메뉴 데이터
		SmallcodeTO tosc = new SmallcodeTO();
		tosc.setSmallcode(request.getParameter("smallcode"));  //선택한 메뉴에 해당하는 small코드
		tosc = dao.search_info( tosc );	//선택한 smallcode에 해당하는 코드 정보 찾기
		
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter( "seq" ) );
		to = dao.board_modify( to );
		
		
		ModelAndView modelAndView = new ModelAndView( "board/board_modify" );
		modelAndView.addObject( "datas", datas );
		modelAndView.addObject( "to", to );
		modelAndView.addObject( "tosc", tosc ); // smallcode에 해당하는 코드정보
		return modelAndView;
	}
	@RequestMapping( "board_modify_ok.do" )	//수정확인
	public ModelAndView board_modify_ok(HttpServletRequest request) {
		System.out.println( "board_modify_ok() 호출" );
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));
		to.setTitle(request.getParameter("title"));
		to.setContent(request.getParameter("content"));
		
		String smallcode = request.getParameter("smallcode");
		
		int flag = dao.board_modify_ok(to);
		
		ModelAndView modelAndView = new ModelAndView("board/board_modify_ok");
		modelAndView.addObject( "flag", flag );
		modelAndView.addObject( "seq", request.getParameter("seq") );	// seq에 해당하는 board_view로 이동하기 위함
		modelAndView.addObject( "smallcode", request.getParameter("smallcode") );	//board_view에 seq에 해당하는 smallcode 전송
		return modelAndView;
	}
	
	@RequestMapping( "board_delete_ok.do" )	//삭제
	public ModelAndView board_delete_ok(HttpServletRequest request) {
		System.out.println( "board_delete_ok() 호출" );
		BoardTO to = new BoardTO();
		to.setSeq(request.getParameter("seq"));
		
		int flag = dao.board_delete_ok(to);
		
		ModelAndView modelAndView = new ModelAndView("board/board_delete_ok");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	@RequestMapping( "comment_write_ok.do" )	//댓글작성
	public ModelAndView comment_write_ok(HttpServletRequest request) {
		System.out.println( "comment_write_ok() 호출" );
		
		String seq = request.getParameter("seq");
		CommentTO to = new CommentTO();
		to.setPseq(request.getParameter("seq"));
		to.setId(request.getParameter("id"));
		to.setContent(request.getParameter("content"));
		
		int flag = dao.comment_write_ok(to);
		//System.out.println(smallcode);	
		ModelAndView modelAndView = new ModelAndView( "board/comment_write_ok" );
		modelAndView.addObject( "flag", flag );
		modelAndView.addObject( "seq", seq );
		return modelAndView;
	}
}
