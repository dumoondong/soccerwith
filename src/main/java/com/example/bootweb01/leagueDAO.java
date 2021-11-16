package com.example.bootweb01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class leagueDAO {
	@Autowired
	private DataSource dataSource;
	
	//내정보
	public ArrayList<leagueTO> leagueView() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<leagueTO> datas = new ArrayList<leagueTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM league1";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				leagueTO to = new leagueTO();
				to.setTeamname( rs.getString( "teamname") );
				//to.setClubimg( rs.getString( "clubimg" ) );
				to.setWri( rs.getString( "wri" ) );
				to.setImg(rs.getString("img"));
				to.setList(rs.getString( "list" ) );
				
				//System.out.println(rs.getString("list"));
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
	
	//list가 무엇이냐에 따른 페이지를 보여줌 
	public ArrayList<leagueTO> leagueView1( String list ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<leagueTO> datas = new ArrayList<leagueTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM league1 where list=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, list );
			//System.out.println( list );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				leagueTO to = new leagueTO();
				to.setTeamname( rs.getString( "teamname") );
				to.setWri( rs.getString( "wri" ) );
				to.setImg(rs.getString("img"));
				to.setList(rs.getString( "list" ) );
				
				//System.out.println(rs.getString("list"));
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
	
	//club view
	public leagueTO club(leagueTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from league1 where teamname=? ";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getTeamname() );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to.setTeamname( rs.getString( "teamname" ) ); 
				to.setWri( rs.getString( "wri" ) );
				to.setFoundation( rs.getString( "foundation" ) );
				to.setHometown( rs.getString( "hometown" ) );
				to.setHomestadium( rs.getString( "homestadium" ) );
				to.setNickname( rs.getString( "nickname" ) );
				to.setPrewin( rs.getString( "prewin" ) );
				to.setFawin( rs.getString( "fawin" ) );
				to.setLeaguewin( rs.getString( "leaguewin" ) );
				to.setChamwin( rs.getString( "chamwin" ) );
				to.setEurowin( rs.getString( "eurowin" ) );
				to.setImg( rs.getString( "img" ) );
				to.setList( rs.getString( "list" ) );
				to.setSeq( rs.getString( "seq" ));
				
				//System.out.println( rs.getString( "teamname" ) );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return to;
	}
	//Rank
	public ArrayList<RankTO> rankView() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<RankTO> datas = new ArrayList<RankTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM rank";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				RankTO to = new RankTO();
				to.setRanking( rs.getString( "ranking" ) );
				to.setTeamname( rs.getString( "teamname" ) );
				to.setWinp( rs.getString( "winp" ) );
				to.setGame( rs.getString( "game" ) );
				to.setWin( rs.getString( "win" ) );
				to.setDraw( rs.getString( "draw" ) );
				to.setDefeat( rs.getString( "defeat" ) );
				to.setScorep( rs.getString( "scorep" ) );
				to.setLosep( rs.getString( "losep" ) );
				to.setGoalp( rs.getString( "goalp" ) );
				to.setList( rs.getString( "list" ) );

				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
	
	public ArrayList<RankTO> rankView1( String list ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<RankTO> datas = new ArrayList<RankTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM rank where list=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, list );
			//System.out.println( list );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				RankTO to = new RankTO();
				to.setRanking( rs.getString( "ranking" ) );
				to.setTeamname( rs.getString( "teamname" ) );
				to.setWinp( rs.getString( "winp" ) );
				to.setGame( rs.getString( "game" ) );
				to.setWin( rs.getString( "win" ) );
				to.setDraw( rs.getString( "draw" ) );
				to.setDefeat( rs.getString( "defeat" ) );
				to.setScorep( rs.getString( "scorep" ) );
				to.setLosep( rs.getString( "losep" ) );
				to.setGoalp( rs.getString( "goalp" ) );
				to.setList( rs.getString( "list" ) );

				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
	
	//record
	public ArrayList<RecordTO> recordView() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<RecordTO> datas = new ArrayList<RecordTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM record";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				RecordTO to = new RecordTO();
				to.setSeason( rs.getString( "season" ) );
				to.setLeaguewin( rs.getString( "leaguewin" ) );
				to.setLeaguecup( rs.getString( "leaguecup" ) );
				to.setList( rs.getString( "list" ) );
				
				//System.out.println( rs.getString( "leaguewin" ) );
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
	
	public ArrayList<RecordTO> recordView1( String list ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<RecordTO> datas = new ArrayList<RecordTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM record where list=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, list );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				RecordTO to = new RecordTO();
				to.setSeason( rs.getString( "season" ) );
				to.setLeaguewin( rs.getString( "leaguewin" ) );
				to.setLeaguecup( rs.getString( "leaguecup" ) );
				to.setList( rs.getString( "list" ) );
				
				//System.out.println( rs.getString( "leaguewin" ) );
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
	
	//Epl리스트
	public ArrayList<leagueTO> EPLlist() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<leagueTO> datas = new ArrayList<leagueTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM league1";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				leagueTO to = new leagueTO();
				to.setSeq(rs.getString("seq"));
				to.setTeamname( rs.getString( "teamname") );
				to.setWri( rs.getString( "wri" ) );
				to.setImg(rs.getString("img"));
				to.setList(rs.getString( "list" ) );
				
				//System.out.println(rs.getString("list"));
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
	//league 추가 확인
	public int leagueWrite_ok(leagueTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "insert into league1 values (0, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getTeamname() );
			pstmt.setString( 2, to.getWri() );
			pstmt.setString( 3, to.getFoundation() );
			pstmt.setString( 4, to.getHometown() );
			pstmt.setString( 5, to.getHomestadium() );
			pstmt.setString( 6, to.getNickname() );
			pstmt.setString( 7, to.getPrewin() );
			pstmt.setString( 8, to.getFawin() );
			pstmt.setString( 9, to.getLeaguewin() );
			pstmt.setString( 10, to.getChamwin() );
			pstmt.setString( 11, to.getEurowin() );
			pstmt.setString( 12, to.getImg() );
			pstmt.setString( 13, to.getList() );
			int result = pstmt.executeUpdate();
			if( result == 0 ) {
				flag = 1;
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}

		return flag;
	}
	
	//league 수정
	public leagueTO leagueEdit(leagueTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from league1 where seq=? ";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to.setTeamname( rs.getString( "teamname" ) );
				to.setWri( rs.getString( "wri" ) );
				to.setFoundation( rs.getString( "foundation" ) );
				to.setHometown( rs.getString( "hometown" ) );
				to.setHomestadium( rs.getString( "homestadium" ) );
				to.setNickname( rs.getString( "nickname" ) );
				to.setPrewin( rs.getString( "prewin" ) );
				to.setFawin( rs.getString( "fawin" ) );
				to.setLeaguewin( rs.getString( "leaguewin" ) );
				to.setChamwin( rs.getString( "chamwin" ) );
				to.setEurowin( rs.getString( "eurowin" ) );
				to.setImg( rs.getString( "img" ) );
				to.setList( rs.getString( "list" ) );
				
				//System.out.println( rs.getString( "list" ) );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return to;
	}
	
	//leagueEdit 수정 확인
		public int leagueEdit_ok(leagueTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			int flag = 0;
			try {
				conn = this.dataSource.getConnection();
				
				String sql = "update league1 set teamname=?, wri=?, foundation=?, hometown=?, homestadium=?, nickname=?, prewin=?, fawin=?, leaguewin=?, chamwin=?, eurowin=?, img=?, list=? where seq=?";
				pstmt = conn.prepareStatement( sql );
				
				pstmt.setString( 1, to.getTeamname() );
				pstmt.setString( 2, to.getWri() );
				pstmt.setString( 3, to.getFoundation() );
				pstmt.setString( 4, to.getHometown() );
				pstmt.setString( 5, to.getHomestadium() );
				pstmt.setString( 6, to.getNickname() );
				pstmt.setString( 7, to.getPrewin() );
				pstmt.setString( 8, to.getFawin() );
				pstmt.setString( 9, to.getLeaguewin() );
				pstmt.setString( 10, to.getChamwin() );
				pstmt.setString( 11, to.getEurowin() );
				pstmt.setString( 12, to.getImg() );
				pstmt.setString( 13, to.getList() );
				pstmt.setString( 14, to.getSeq() );
				
				//System.out.println( to.getSeq() );
				
				int result = pstmt.executeUpdate();
				if( result == 0 ) {
					flag = 1;
				}
				
			} catch( SQLException e ) {
				System.out.println("[에러] " + e.getMessage() );
			} finally {
				if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
				if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
			}	
			return flag;
		}
	
	
	//league 삭제
	public int leagueDelete_ok(leagueTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "delete from league1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			
			//System.out.println("DAO확인" + to.getSeq());
			
			int result = pstmt.executeUpdate();
			if( result == 0 ) {
				flag = 1;
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}

		return flag;
	}
	//admin_clubEdit
	public int admin_clubEdit(leagueTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "update league1 set teamname=?, wri=?, foundation=?, hometown=?, homestadium=?, nickname=?, prewin=?, fawin=?, leaguewin=?, chamwin=?, eurowin=?, img=?, list=? where seq=?";
			pstmt = conn.prepareStatement( sql );
			
			pstmt.setString( 1, to.getTeamname() );
			pstmt.setString( 2, to.getWri() );
			pstmt.setString( 3, to.getFoundation() );
			pstmt.setString( 4, to.getHometown() );
			pstmt.setString( 5, to.getHomestadium() );
			pstmt.setString( 6, to.getNickname() );
			pstmt.setString( 7, to.getPrewin() );
			pstmt.setString( 8, to.getFawin() );
			pstmt.setString( 9, to.getLeaguewin() );
			pstmt.setString( 10, to.getChamwin() );
			pstmt.setString( 11, to.getEurowin() );
			pstmt.setString( 12, to.getImg() );
			pstmt.setString( 13, to.getList() );
			pstmt.setString( 14, to.getSeq() );
			
			//System.out.println( to.getSeq() );
			
			int result = pstmt.executeUpdate();
			if( result == 0 ) {
				flag = 1;
			}
			
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return flag;
	}
	
	//리그정보 일치 리스트
	public ArrayList<leagueTO> search_lea(String list) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		ArrayList<leagueTO> datas = new ArrayList<leagueTO>();
			
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from league1 where list like ?";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			pstmt.setString( 1, "%"+list+"%" );
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				leagueTO to = new leagueTO();
				
				to.setSeq( rs.getString( "seq" ) );
				to.setTeamname( rs.getString( "teamname" ) );
				to.setWri( rs.getString( "wri" ) );
				to.setFoundation( rs.getString( "foundation" ) );
				to.setHometown( rs.getString( "hometown" ) );
				to.setHomestadium( rs.getString( "homestadium" ) );
				to.setNickname( rs.getString( "nickname" ) );
				to.setPrewin( rs.getString( "prewin" ) );
				to.setFawin( rs.getString( "fawin" ) );
				to.setLeaguewin( rs.getString( "leaguewin" ) );
				to.setChamwin( rs.getString( "chamwin" ) );
				to.setEurowin( rs.getString( "eurowin" ) );
				to.setImg( rs.getString( "img" ) );
				to.setList( rs.getString( "list" ) );
				
				
					
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return datas;
	}
	
	//리그 메뉴 소코드 리스트
	public ArrayList<SmallcodeTO> boardcodeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<SmallcodeTO> datas = new ArrayList<SmallcodeTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from smallcode where smallcode like 'LE%' order by smallcode asc";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				SmallcodeTO to = new SmallcodeTO();
				to.setSeq( rs.getString( "seq" ) );
				to.setSmallcode( rs.getString( "smallcode" ) );
				to.setSmallinfo( rs.getString( "smallinfo" ) );
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return datas;
	}
	
	//선택한 메뉴에 따른 리스트
	public ArrayList<leagueTO> leagueList( String smallcode ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<leagueTO> datas = new ArrayList<leagueTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM league1 where list=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, smallcode );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				leagueTO to = new leagueTO();
				to.setTeamname( rs.getString( "teamname") );
				to.setWri( rs.getString( "wri" ) );
				to.setImg(rs.getString("img"));
				to.setList(rs.getString( "list" ) );
				
				//System.out.println(rs.getString("list"));
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
	
	//수정 리그 선택 구분
	public ArrayList<SmallcodeTO> smallcodeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<SmallcodeTO> datas = new ArrayList<SmallcodeTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from smallcode where smallcode like 'LE%'";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				SmallcodeTO to = new SmallcodeTO();
				to.setSeq( rs.getString( "seq" ) );
				to.setSmallcode( rs.getString( "smallcode" ) );
				to.setSmallinfo( rs.getString( "smallinfo" ) );
				to.setSmallremark(rs.getString( "smallremark" ));
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return datas;
	}
	
	//메인화면 클럽 리스트
	public ArrayList<leagueTO> mainleague() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<leagueTO> datas = new ArrayList<leagueTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM league1 limit 5";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				leagueTO to = new leagueTO();
				to.setTeamname( rs.getString( "teamname") );
				//to.setClubimg( rs.getString( "clubimg" ) );
				to.setWri( rs.getString( "wri" ) );
				to.setImg(rs.getString("img"));
				to.setList(rs.getString( "list" ) );
				
				//System.out.println(rs.getString("list"));
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
	public ArrayList<ScorerankTO> scorerankView() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ScorerankTO> scorerankdata = new ArrayList<ScorerankTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM scorerank";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				ScorerankTO to = new ScorerankTO();
				to.setRanking( rs.getString( "ranking" ) );
				to.setPlayer( rs.getString( "player" ) );
				to.setTeamname( rs.getString( "teamname" ) );
				to.setPlay( rs.getString( "play" ) );
				to.setGoal( rs.getString( "goal" ) );
				to.setList( rs.getString( "list" ) );
				
				//System.out.println( rs.getString( "player" ) );
				
				scorerankdata.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return scorerankdata;
	}

	public ArrayList<ScorerankTO> scorerankView1( String list ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ScorerankTO> datas = new ArrayList<ScorerankTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql =  "SELECT * FROM scorerank where list=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, list );
			
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				ScorerankTO to = new ScorerankTO();
				to.setRanking( rs.getString( "ranking" ) );
				to.setPlayer( rs.getString( "player" ) );
				to.setTeamname( rs.getString( "teamname" ) );
				to.setPlay( rs.getString( "play" ) );
				to.setGoal( rs.getString( "goal" ) );
				to.setList( rs.getString( "list" ) );
				
				//System.out.println( rs.getString( "leaguewin" ) );
				
				datas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return datas;
	}
}



