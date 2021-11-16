package com.example.bootweb01;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class leagueController {
	
	@Autowired
	private leagueDAO dao;
	
	//league 공통페이지
	@RequestMapping( "league.do" )
	public ModelAndView leauge(HttpServletRequest request) {
		System.out.println( "league()호출" );
		
		ArrayList<SmallcodeTO> menudatas = dao.boardcodeList();//메뉴 소코드 리스트
		String smallcode = request.getParameter("smallcode"); //선택한 메뉴 데이터
		ArrayList<leagueTO> listdata = dao.leagueList( smallcode ); //일치하는 데이터리스트
		ArrayList<leagueTO> datas = dao.leagueView();	//전체 리스트

		ModelAndView modelAndView = new ModelAndView("league/league");
		modelAndView.addObject( "menudatas", menudatas );//메뉴 소코드 리스트
		modelAndView.addObject( "datas", datas ); //테이블 전체에 대한 값
		modelAndView.addObject( "code", smallcode );	//넘겼던 메뉴선택값 다시 보내기
		modelAndView.addObject( "listdata", listdata ); //선택한 메뉴에 일치하는 데이터리스트
		return modelAndView;
	}
	
	@RequestMapping( "admin_league.do" )
	public ModelAndView admin_leauge(HttpServletRequest request) {
		System.out.println( "league()호출" );
				
		ArrayList<SmallcodeTO> menudatas = dao.boardcodeList();//메뉴 소코드 리스트
		String smallcode = request.getParameter("smallcode"); //선택한 메뉴 데이터
		ArrayList<leagueTO> listdata = dao.leagueList( smallcode ); //일치하는 데이터리스트
		ArrayList<leagueTO> datas = dao.leagueView();
		
		
		ModelAndView modelAndView = new ModelAndView("admin/leagueAdmin/admin_league");
		modelAndView.addObject( "menudatas", menudatas );//메뉴 소코드 리스트
		modelAndView.addObject( "code", smallcode );	//넘겼던 메뉴선택값 다시 보내기
		modelAndView.addObject( "datas", datas );
		modelAndView.addObject( "listdata", listdata ); //선택한 메뉴에 일치하는 데이터리스트
		return modelAndView;
	}
	/*EPL*/
	@RequestMapping( "club.do" )
	public ModelAndView club(HttpServletRequest request) {
		System.out.println( "club() 호출" );
		leagueTO to = new leagueTO();
		
		ArrayList<SmallcodeTO> menudatas = dao.boardcodeList();//메뉴 소코드 리스트
		
		String list = request.getParameter( "list" );
		to.setTeamname( request.getParameter("teamname") );
		to = dao.club( to );
		ModelAndView modelAndView = new ModelAndView( "league/club" );
		modelAndView.addObject( "menudatas", menudatas );//메뉴 소코드 리스트
		modelAndView.addObject( "list", list );	//넘겼던 메뉴선택값 다시 보내기
		modelAndView.addObject( "to", to );

		return modelAndView;	
	}
	
	@RequestMapping( "admin_club.do" )
	public ModelAndView admin_club(HttpServletRequest request) {
		
		System.out.println( "admin_club() 호출" );
		ArrayList<SmallcodeTO> datas = dao.smallcodeList(); //리그선택 소코드 리스트
		ArrayList<SmallcodeTO> menudatas = dao.boardcodeList();//메뉴 소코드 리스트
		String list = request.getParameter( "list" );
		
		leagueTO to = new leagueTO();
		to.setTeamname(request.getParameter("teamname"));
		to = dao.club( to );
		
		System.out.println("컨트롤러 이미지"+to.getImg());
		

		
		ModelAndView modelAndView = new ModelAndView( "admin/leagueAdmin/admin_club" );
		modelAndView.addObject( "menudatas", menudatas );//메뉴 소코드 리스트
		modelAndView.addObject( "datas", datas ); // 소코드 리스트
		modelAndView.addObject( "list", list );	//넘겼던 메뉴선택값 다시 보내기
		modelAndView.addObject( "to", to );
		return modelAndView;	
	}
	
	//club 수정 클릭확인
	@RequestMapping( "admin_clubEdit.do" )
	public ModelAndView admin_clubEdit(MultipartHttpServletRequest request) {
		System.out.println( "admin_clubEdit() 호출" );
		
		leagueTO to = new leagueTO();
	
		to.setSeq(request.getParameter( "seq" ) );
		to.setTeamname( request.getParameter( "teamname" ) );
		to.setWri( request.getParameter( "wri" ) );
		to.setFoundation( request.getParameter( "foundation" ) );		
		to.setHometown( request.getParameter( "hometown" ) );
		to.setHomestadium( request.getParameter( "homestadium" ) );
		to.setNickname( request.getParameter( "nickname" ) );
		to.setPrewin( request.getParameter( "prewin" ) );
		to.setFawin( request.getParameter( "fawin" ) );
		to.setLeaguewin( request.getParameter( "leaguewin" ) );
		to.setChamwin( request.getParameter( "chamwin" ) );
		to.setEurowin( request.getParameter( "eurowin" ) );
		//to.setImg( request.getParameter( "img" ) );
		to.setList( request.getParameter( "group" ) );
		
		//System.out.println( request.getParameter( "teamname" ) );
		
		MultipartFile img = request.getFile("img");
		
		System.out.println("admin_clubEdit : "+request.getFile("img"));
		
		String path = request.getRealPath("images/league");
		String filename = img.getOriginalFilename();
		File uploadFile = new File (path + "//" + filename);
		try {
			  img.transferTo(uploadFile); // 업로드
		  } catch (IllegalStateException e ) {
			  e.printStackTrace();
		  } catch (IOException e) {
			  e.printStackTrace();
		  }
		  
		to.setImg(filename);
		
		
		
		int flag = dao.admin_clubEdit(to);
		
		ModelAndView modelAndView = new ModelAndView("admin/leagueAdmin/admin_clubEdit");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	//Rank
	@RequestMapping( "Rank.do" )
	public ModelAndView Rank(HttpServletRequest request) {
		System.out.println( "Rank()호출" );
		
		ArrayList<SmallcodeTO> menudatas = dao.boardcodeList();//메뉴 소코드 리스트
		
		ArrayList<RankTO> datas = dao.rankView();
		String list = request.getParameter( "list" );
		
		ArrayList<RankTO> datasrank = dao.rankView1( list );
		
		ModelAndView modelAndView = new ModelAndView("league/Rank");
		modelAndView.addObject( "menudatas", menudatas );//메뉴 소코드 리스트
		modelAndView.addObject( "datas", datas );
		modelAndView.addObject( "datasrank", datasrank );
		modelAndView.addObject( "listrank", list );
		//System.out.println( list );
		return modelAndView;
	}
	
	@RequestMapping( "admin_Rank.do" )
	public ModelAndView admin_Rank(HttpServletRequest request) {
		System.out.println( "admin_Rank()호출" );
		
		ArrayList<SmallcodeTO> menudatas = dao.boardcodeList();//메뉴 소코드 리스트
		
		ArrayList<RankTO> datas = dao.rankView();
		String list = request.getParameter( "list" );
		
		ArrayList<RankTO> datasrank = dao.rankView1( list );
		
		ModelAndView modelAndView = new ModelAndView( "admin/leagueAdmin/admin_Rank" );
		modelAndView.addObject( "menudatas", menudatas );//메뉴 소코드 리스트
		modelAndView.addObject( "datas", datas );
		modelAndView.addObject( "datasrank", datasrank );
		modelAndView.addObject( "listrank", list );
		return modelAndView;
	}
	//record
	   @RequestMapping( "Record.do" )
	   public ModelAndView Record(HttpServletRequest request) {
	      System.out.println( "Record()호출" );
	      
	      ArrayList<SmallcodeTO> menudatas = dao.boardcodeList();//메뉴 소코드 리스트
	      
	      String list = request.getParameter( "list" );
	      
	      ArrayList<RecordTO> datasrecord = dao.recordView1( list );
	      
	      ArrayList<ScorerankTO> scorerankdata = dao.scorerankView1( list ); //득점순위 리스트
	      
	      ModelAndView modelAndView = new ModelAndView("league/Record");
	      modelAndView.addObject( "menudatas", menudatas );//메뉴 소코드 리스트
	      modelAndView.addObject( "datasrecord" , datasrecord );
	      modelAndView.addObject( "listrecord" , list );
	      modelAndView.addObject( "scorerankdata" , scorerankdata );
	      return modelAndView;
	   }
		
	//admin record
	@RequestMapping( "admin_Record.do" )
	public ModelAndView admin_Record(HttpServletRequest request) {
		System.out.println( "admin_Record()호출" );
			
		ArrayList<SmallcodeTO> menudatas = dao.boardcodeList();//메뉴 소코드 리스트
		
		String list = request.getParameter( "list" );
		
		ArrayList<RecordTO> datasrecord = dao.recordView1( list );
			
		ModelAndView modelAndView = new ModelAndView("admin/leagueAdmin/admin_Record");
		modelAndView.addObject( "menudatas", menudatas );//메뉴 소코드 리스트
		modelAndView.addObject( "datasrecord" , datasrecord );
		modelAndView.addObject( "listrecord" , list );
		return modelAndView;
	}
	
	//admin
	@RequestMapping( "leagueAdmin.do" )
	public ModelAndView leagueAdmin(HttpServletRequest request) {
		System.out.println( "leagueAdmin() 호출" );
			
		ArrayList<leagueTO> datas = dao.EPLlist();
		ModelAndView modelAndView = new ModelAndView( "admin/leagueAdmin/leagueAdmin" );
		
		modelAndView.addObject( "datas", datas ); // EPL리스트
		return modelAndView;
	}
	
	//league 추가
	@RequestMapping( "leagueWrite.do" )
	public ModelAndView leagueWrite(HttpServletRequest request) {
		System.out.println( "leagueWrite() 호출" );
		ArrayList<SmallcodeTO> datas = dao.smallcodeList(); //리그선택 소코드 리스트
		ArrayList<SmallcodeTO> menudatas = dao.boardcodeList();//메뉴 소코드 리스트
		String list = request.getParameter( "smallcode" );
		
		ModelAndView modelAndView = new ModelAndView("admin/leagueAdmin/leagueWrite");
		modelAndView.addObject( "menudatas", menudatas );//메뉴 소코드 리스트
		modelAndView.addObject( "datas", datas ); // 소코드 리스트
		modelAndView.addObject( "list", list );	//넘겼던 메뉴선택값 다시 보내기
		return modelAndView;
	}
	
	//league 추가확인
	@RequestMapping( "leagueWrite_ok.do" )
	public ModelAndView leagueWrite_ok(MultipartHttpServletRequest request) {
		System.out.println( "leagueWrite_ok() 호출" );
		
		leagueTO to = new leagueTO();
		//System.out.println(request.getParameter("group"));
		//System.out.println("시퀸스넘버" +request.getParameter( "teamname" ));
		//to.setSeq( request.getParameter( "seq" ) );
		to.setTeamname( request.getParameter( "teamname" ) );
		to.setWri( request.getParameter( "wri" ) );
		to.setFoundation( request.getParameter( "foundation" ) );		
		to.setHometown( request.getParameter( "hometown" ) );
		to.setHomestadium( request.getParameter( "homestadium" ) );
		to.setNickname( request.getParameter( "nickname" ) );
		to.setPrewin( request.getParameter( "prewin" ) );
		to.setFawin( request.getParameter( "fawin" ) );
		to.setLeaguewin( request.getParameter( "leaguewin" ) );
		to.setChamwin( request.getParameter( "chamwin" ) );
		to.setEurowin( request.getParameter( "eurowin" ) );
		//to.setImg( request.getParameter( "img" ) );
		to.setList( request.getParameter( "group" ) );
		
		MultipartFile img = request.getFile("img");
		String path = request.getRealPath("images/league");
		String filename = img.getOriginalFilename();
		File uploadFile = new File (path + "//" + filename);
		try {
			  img.transferTo(uploadFile); // 업로드
		  } catch (IllegalStateException e ) {
			  e.printStackTrace();
		  } catch (IOException e) {
			  e.printStackTrace();
		  }
		  
		to.setImg(filename);
		int flag = dao.leagueWrite_ok( to );
		
		ModelAndView modelAndView = new ModelAndView("admin/leagueAdmin/leagueWrite_ok");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	
	//leagueEdit 수정 페이지
	@RequestMapping( "leagueEdit.do" )
	public ModelAndView commoncodeEdit(HttpServletRequest request) {
		System.out.println( "leagueEdit() 호출" );
		leagueTO to = new leagueTO();
		
		to.setSeq( request.getParameter( "seq" ) );
		
		//System.out.println( request.getParameter( "seq" ) );

		to = dao.leagueEdit( to );
		
		ModelAndView modelAndView = new ModelAndView("admin/leagueAdmin/leagueEdit");
		
		modelAndView.addObject( "to", to );
		return modelAndView;
	}
	
	//leagueEdit 수정 확인
		@RequestMapping( "leagueEdit_ok.do" )
		public ModelAndView leagueEdit_ok(HttpServletRequest request) {
			System.out.println( "leagueEdit_ok() 호출" );
			
			leagueTO to = new leagueTO();
		
			to.setSeq(request.getParameter( "seq" ) );
			to.setTeamname( request.getParameter( "teamname" ) );
			to.setWri( request.getParameter( "wri" ) );
			to.setFoundation( request.getParameter( "foundation" ) );		
			to.setHometown( request.getParameter( "hometown" ) );
			to.setHomestadium( request.getParameter( "homestadium" ) );
			to.setNickname( request.getParameter( "nickname" ) );
			to.setPrewin( request.getParameter( "prewin" ) );
			to.setFawin( request.getParameter( "fawin" ) );
			to.setLeaguewin( request.getParameter( "leaguewin" ) );
			to.setChamwin( request.getParameter( "chamwin" ) );
			to.setEurowin( request.getParameter( "eurowin" ) );
			to.setImg( request.getParameter( "img" ) );
			to.setList( request.getParameter( "list" ) );
			
			//System.out.println( request.getParameter( "seq" ) );
			
			int flag = dao.leagueEdit_ok(to);
			
			ModelAndView modelAndView = new ModelAndView("admin/leagueAdmin/leagueEdit_ok");
			modelAndView.addObject( "flag", flag );
			return modelAndView;
		}
	
	//leagueAdmin 삭제
	@RequestMapping( "leagueDelete_ok.do" )
	public ModelAndView commoncodeDelete_ok(HttpServletRequest request) {
		System.out.println( "leagueDelete_ok() 호출" );
		
		leagueTO to = new leagueTO();
	
		to.setSeq(request.getParameter( "seq" ) );
		
		//System.out.println("시퀸스"  + request.getParameter( "seq" ) );
		int flag = dao.leagueDelete_ok(to);
		
		ModelAndView modelAndView = new ModelAndView("admin/leagueAdmin/leagueDelete_ok");
		modelAndView.addObject( "flag", flag );
		return modelAndView;
	}
	//
	@RequestMapping( "search_lea.do" )
	public ModelAndView search_lea(HttpServletRequest request) {
		System.out.println( "search_lea() 호출" );
		String list = request.getParameter("list");

		ArrayList<leagueTO> datas = dao.search_lea(list);
		
		ModelAndView modelAndView = new ModelAndView( "admin/leagueAdmin/search_lea" );
		modelAndView.addObject( "datas", datas );
		return modelAndView;
	}	

	
}

