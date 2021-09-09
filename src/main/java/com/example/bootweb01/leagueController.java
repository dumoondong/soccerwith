package com.example.bootweb01;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class leagueController {
	
	@Autowired
	private leagueDAO dao;
	@Autowired
	private RankDAO dao1;
	@Autowired
	private RecordDAO dao2;
	
	@RequestMapping( "league.do" )
	public ModelAndView leauge(HttpServletRequest request) {
		System.out.println( "league()호출" );
		
		ArrayList<leagueTO> datas = dao.leagueView();
		
		ModelAndView modelAndView = new ModelAndView("leaguecup/league");
		modelAndView.addObject( "datas", datas );
		return modelAndView;
	}
	
	
	@RequestMapping( "leaguelaliga.do" )
	public ModelAndView leaugelaliga(HttpServletRequest request) {
		return new ModelAndView("leaguecup/leaguelaliga");
	}
	@RequestMapping( "leaguebundesliga.do" )
	public ModelAndView leaguebundesliga(HttpServletRequest request) {
		return new ModelAndView("leaguecup/leaguebundesliga");
	}
	@RequestMapping( "leagueserieA.do" )
	public ModelAndView leagueserieA(HttpServletRequest request) {
		return new ModelAndView("leaguecup/leagueserieA");
	}
	
	/*EPL*/
	@RequestMapping( "club.do" )
	public ModelAndView club(HttpServletRequest request) {
		System.out.println( "club() 호출" );
		leagueTO to = new leagueTO();
		
		
		to.setTeamname(request.getParameter("team"));
		
		to = dao.club( to );
		ModelAndView modelAndView = new ModelAndView( "EPL/club" );
		modelAndView.addObject( "to", to );
		return modelAndView;	
	}
	
	@RequestMapping( "Arsenal.do" )
	public ModelAndView Arsenal(HttpServletRequest request) {
		return new ModelAndView("EPL/Arsenal");
	}
	@RequestMapping( "Mancity.do" )
	public ModelAndView Mancity(HttpServletRequest request) {
		return new ModelAndView("EPL/Mancity");
	}
	@RequestMapping( "Liverpool.do" )
	public ModelAndView Liverpool(HttpServletRequest request) {
		return new ModelAndView("EPL/Liverpool");
	}
	
	//leaguerank
	@RequestMapping( "Rank.do" )
	public ModelAndView Rank(HttpServletRequest request) {
		System.out.println( "Rank()호출" );
		
		ArrayList<RankTO> datas = dao1.rankView();
		
		ModelAndView modelAndView = new ModelAndView("leaguerank/Rank");
		modelAndView.addObject( "datas", datas );
		return modelAndView;
	}
	
	//record
	@RequestMapping( "Record.do" )
	public ModelAndView Record(HttpServletRequest request) {
		System.out.println( "Record()호출" );
		
		ArrayList<RecordTO> datas = dao2.recordView();
		
		ModelAndView modelAndView = new ModelAndView("Record/Record");
		modelAndView.addObject( "datas", datas );
		return modelAndView;
	}
	
}
