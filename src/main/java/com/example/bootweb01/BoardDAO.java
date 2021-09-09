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
public class BoardDAO {
	@Autowired
	private DataSource dataSource;
	
	public ArrayList<BoardTO> eventList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> datas1 = new ArrayList<BoardTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select seq, subject, writer, date_format(wdate, '%Y년 %m월 %d일') wdate, hit, datediff(now(), wdate) wgap from board1 where seq between 1 and 30";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				BoardTO to = new BoardTO();
				to.setSeq( rs.getString( "seq" ) );
				to.setSubject( rs.getString( "subject" ) );
				to.setWriter( rs.getString( "writer" ) );
				to.setWdate( rs.getString( "wdate" ) );
				to.setHit( rs.getString( "hit" ) );
				to.setWgap( rs.getInt( "wgap" ) );
				
				datas1.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return datas1;
	}
	
	//게시판 작성 소코드 리스트
	public ArrayList<SmallcodeTO> boardcodeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<SmallcodeTO> datas = new ArrayList<SmallcodeTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from smallcode where smallcode like 'BD%' order by smallcode asc";
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
	
	//소코드에 일치하는 리스트 출력
	public ArrayList<BoardTO> board(String smallcode) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> codedatas = new ArrayList<BoardTO>();
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "select seq,title,id,date_format(wdate, '%Y년 %m월 %d일') wdate,hit,datediff(now(), wdate) wgap,smallcode,recommend from board where smallcode like ? order by seq desc";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			pstmt.setString( 1, "%"+smallcode+"%" );
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				BoardTO to = new BoardTO();			
				to.setSeq( rs.getString( "seq" ) );
				to.setTitle(rs.getString("title"));
				to.setId(rs.getString("id"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setSmallcode(rs.getString("smallcode"));
				to.setRecommend(rs.getString("recommend"));	
				to.setWgap( rs.getInt( "wgap" ) );
				codedatas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return codedatas;
	}
	
	//전체리스트 출력
	public ArrayList<BoardTO> boardAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardTO> alldatas = new ArrayList<BoardTO>();
		try {
			conn = this.dataSource.getConnection();
			String sql = "select seq,title,id,date_format(wdate, '%Y년 %m월 %d일') wdate,hit,datediff(now(), wdate) wgap,smallcode,recommend from board order by seq desc";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				
				BoardTO to = new BoardTO();
				to.setSeq( rs.getString( "seq" ) );
				to.setTitle(rs.getString("title"));
				to.setId(rs.getString("id"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setSmallcode(rs.getString("smallcode"));					
				to.setRecommend(rs.getString("recommend"));
				to.setWgap( rs.getInt( "wgap" ) );
				alldatas.add( to );
			}		
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return alldatas;
	}
	
	//소코드에 해당하는 smallcode 정보 찾기
	public SmallcodeTO search_info(SmallcodeTO tosc) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from smallcode where smallcode=? ";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, tosc.getSmallcode() );
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				tosc.setSmallcode(rs.getString("smallcode"));
				tosc.setSmallinfo(rs.getString("smallinfo"));
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return tosc;
	}
	//게시글 작성
	public int boardWriteOk(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "insert into board values (0, ?, ?, ?,now(), '0', ?,'','0','0' )";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getTitle() );
			pstmt.setString( 2, to.getContent() );
			pstmt.setString( 3, to.getId() );
			pstmt.setString( 4, to.getSmallcode() );
//			pstmt.setString( 5, to.getFilename() );
//			pstmt.setLong( 6, to.getFilesize() );

			int result = pstmt.executeUpdate();
			if( result == 1 ) {
				flag = 0;
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch(SQLException e) {}
			if( conn != null ) try { conn.close(); } catch(SQLException e) {}
		}
		return flag;
	}
	//게시글 보기
	public BoardTO board_view(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "update board set hit = hit + 1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );

			pstmt.executeUpdate();
			sql = "select seq,title,id,content,date_format(wdate, '%Y년 %m월 %d일 %H시 %S분') wdate,hit,datediff(now(), wdate) wgap,smallcode,recommend from board where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setSeq(rs.getString("seq"));
				to.setTitle( rs.getString( "title" ) );
				to.setId( rs.getString( "id" ) );
				to.setContent( rs.getString( "content" ) );
				to.setRecommend(rs.getString("recommend"));
				to.setSmallcode(rs.getString("smallcode"));
				to.setWdate( rs.getString( "wdate" ) );
				to.setHit( rs.getString( "hit" ));
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return to;
	}
	
	//인기게시판 조회순으로 출력
	public ArrayList<BoardTO> boardvogue() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> voguedatas = new ArrayList<BoardTO>();
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "select seq,title,id,date_format(wdate, '%Y년 %m월 %d일') wdate,hit,datediff(now(), wdate) wgap,smallcode,recommend from board order by hit desc";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				BoardTO to = new BoardTO();
				to.setSeq( rs.getString( "seq" ) );
				to.setTitle(rs.getString("title"));
				to.setId(rs.getString("id"));
				to.setWdate(rs.getString("wdate"));
				to.setHit(rs.getString("hit"));
				to.setSmallcode(rs.getString("smallcode"));
				to.setRecommend(rs.getString("recommend"));
				to.setWgap( rs.getInt( "wgap" ) );
				voguedatas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return voguedatas;
	}
	//게시판에 분류를 위해 smallcode에 해당하는 smallinfo 찾기
	public SmallcodeTO infodata(SmallcodeTO to2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from smallcode where smallcode=? ";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to2.getSmallcode() );
			//System.out.println(to2.getSmallcode());
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to2.setSmallinfo(rs.getString("smallinfo"));
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return to2;
	}
}
