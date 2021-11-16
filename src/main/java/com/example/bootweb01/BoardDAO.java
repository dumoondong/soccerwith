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
	public BoardTO board_modify(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
		
			String sql = "select seq,title,id,content,date_format(wdate, '%Y년 %m월 %d일 %H시 %S분') wdate,hit,datediff(now(), wdate) wgap,smallcode,recommend from board where seq=?";
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
	public int board_modify_ok(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "update board set title=?, content=? where seq=?";
			pstmt = conn.prepareStatement( sql );
			
			pstmt.setString( 1, to.getTitle() );
			pstmt.setString( 2, to.getContent() );
			pstmt.setString( 3, to.getSeq() );
			
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
	
	public int board_delete_ok(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "delete from board where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			
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
	
	public int comment_write_ok(CommentTO to) {	//댓글작성
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "insert into board_comment values (0, ?, ?, now(), ?,'0' )";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getPseq() );
			pstmt.setString( 2, to.getId() );
			pstmt.setString( 3, to.getContent() );

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
	
	public ArrayList<CommentTO> comment_list(String seq) {	//댓글 리스트 출력
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<CommentTO> comdatas = new ArrayList<CommentTO>();
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "select seq,pseq,id,date_format(wdate, '%Y년 %m월 %d일') wdate, content,recommend from board_comment where pseq=? order by seq desc";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			pstmt.setString( 1, seq );
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				CommentTO to = new CommentTO();			
				to.setSeq( rs.getString( "seq" ) );
				to.setPseq(rs.getString("pseq"));
				to.setId(rs.getString("id"));
				to.setWdate(rs.getString("wdate"));
				to.setContent(rs.getString("content"));
				to.setRecommend(rs.getString("recommend"));	
				
				comdatas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return comdatas;
	}
	
	public ArrayList<CommentTO> comment_likelist(String seq) {	//댓글 추천순
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<CommentTO> likedatas = new ArrayList<CommentTO>();
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "select seq,pseq,id,date_format(wdate, '%Y년 %m월 %d일') wdate, content,recommend from board_comment where pseq=? order by recommend desc limit 5";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			pstmt.setString( 1, seq );
			rs = pstmt.executeQuery();
			while( rs.next() ) {
				CommentTO to = new CommentTO();			
				to.setSeq( rs.getString( "seq" ) );
				to.setPseq(rs.getString("pseq"));
				to.setId(rs.getString("id"));
				to.setWdate(rs.getString("wdate"));
				to.setContent(rs.getString("content"));
				to.setRecommend(rs.getString("recommend"));	
				
				likedatas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return likedatas;
	}
	
	//댓글 갯수 세기
	public CommentTO countComment(CommentTO countTo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select COUNT(*) FROM board_comment where pseq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, countTo.getSeq() );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				countTo.setCount(rs.getString("count(*)"));
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return countTo;
	}
	//게시판 제목검색
	public ArrayList<BoardTO> searchTitle(String title) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> TitleDatas = new ArrayList<BoardTO>();
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "select seq,title,id,date_format(wdate, '%Y년 %m월 %d일') wdate,hit,datediff(now(), wdate) wgap,smallcode,recommend from board where title like ? order by seq desc";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			pstmt.setString( 1, "%"+title+"%" );
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
				TitleDatas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return TitleDatas;
	}
	//게시판 아이디검색
	public ArrayList<BoardTO> searchID(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> idDatas = new ArrayList<BoardTO>();
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "select seq,title,id,date_format(wdate, '%Y년 %m월 %d일') wdate,hit,datediff(now(), wdate) wgap,smallcode,recommend from board where id like ? order by seq desc";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			pstmt.setString( 1, "%"+id+"%" );
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
				idDatas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return idDatas;
	}
	//게시글 추천
	public int board_Recommend(RecommendTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
					
			String sql = "insert into board_recommend values (?, ?, '','0' )";
			pstmt = conn.prepareStatement( sql );
			
			pstmt.setString( 1, to.getBoid() );
			pstmt.setString( 2, to.getSeq() );
			
			int result = pstmt.executeUpdate();

			if( result == 0 ) {
				flag = 1;
			}
					
			sql = "update board set recommend = recommend + 1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );

			pstmt.executeUpdate();
								
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return flag;
	}
	//게시글 추천 취소
	public int board_cancel(RecommendTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
					
			String sql = "delete from board_recommend where id=? and seq=?";
			pstmt = conn.prepareStatement( sql );
			
			pstmt.setString( 1, to.getBoid() );
			pstmt.setString( 2, to.getSeq() );
			
			int result = pstmt.executeUpdate();

			if( result == 0 ) {
				flag = 1;
			}
					
			sql = "update board set recommend = recommend - 1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );

			pstmt.executeUpdate();
								
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return flag;
	}
	//댓글 추천 취소
	public int comment_cancel(RecommendTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
					
			String sql = "delete from board_recommend where seq=? and comid=? and pseq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getPseq() );
			pstmt.setString( 2, to.getComid() );
			pstmt.setString( 3, to.getSeq() );
			int result = pstmt.executeUpdate();
			if( result == 0 ) {
				flag = 1;
			}
			sql = "update board_comment set recommend = recommend -1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );

			pstmt.executeUpdate();
								
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return flag;
	}
	//댓글 추천
	public int comment_Recommend(RecommendTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
					
			String sql = "insert into board_recommend values ('', ?, ?,? )";
			pstmt = conn.prepareStatement( sql );
			
			pstmt.setString( 1, to.getSeq() );
			pstmt.setString( 2, to.getComid() );
			pstmt.setString( 3, to.getPseq() );
			
			int result = pstmt.executeUpdate();

			if( result == 0 ) {
				flag = 1;
			}
					
			sql = "update board_comment set recommend = recommend + 1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getPseq() );

			pstmt.executeUpdate();
								
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return flag;
	}
	//댓글 삭제
	public int comment_delete(CommentTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
					
			String sql = "delete from board_comment where seq = ? and id = ? and pseq = ?";
			pstmt = conn.prepareStatement( sql );
			
			pstmt.setString( 1, to.getSeq() );
			pstmt.setString( 2, to.getId() );
			pstmt.setString( 3, to.getPseq() );
			
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
	//일치하는 게시판 추천 데이터 검색
	public RecommendTO reco(String seq, String logid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		RecommendTO to = new RecommendTO();
		
		try {
			conn = this.dataSource.getConnection();
		
			String sql = "select * from board_recommend where seq=? and id=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, seq );
			pstmt.setString( 2, logid );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setBoid(rs.getString("id"));
				to.setSeq(rs.getString("seq"));
				to.setPseq(rs.getString("pseq"));
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
	//일치하는 댓글 추천 데이터 검색
	public RecommendTO recoCo(String recoSeq, String logid,String recoPseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		RecommendTO to = new RecommendTO();
		
		try {
			conn = this.dataSource.getConnection();
		
			String sql = "select * from board_recommend where seq=? and comid=? and pseq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, recoSeq );
			pstmt.setString( 2, logid );
			pstmt.setString( 3, recoPseq );
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setSeq(rs.getString("seq"));
				to.setComid(rs.getString("comid"));
				to.setPseq(rs.getString("pseq"));
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
	
	//
//	public ArrayList<RecommendTO> coAll(String pseq3, String logid) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		ArrayList<RecommendTO> CRdatas = new ArrayList<RecommendTO>();
//		
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "select * from board_recommend where seq=? and comid=?";
//			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
//			pstmt.setString( 1, pseq3 );
//			pstmt.setString( 2, logid );
//			
//			//System.out.println("pseq3넘버  : "+pseq3);
//			//System.out.println("seq넘버  : "+seq3);
//			rs = pstmt.executeQuery();
//			while( rs.next() ) {
//				RecommendTO to = new RecommendTO();			
//				to.setSeq(rs.getString("seq"));
//				to.setComid(rs.getString("comid"));
//				to.setPseq(rs.getString("pseq"));
////				System.out.println("1 seq    : " + rs.getString("seq"));
////				System.out.println("2 id     : " + rs.getString("comid"));
////				System.out.println("3 pseq   : " + rs.getString("pseq"));
//				CRdatas.add( to );
//			}
//		} catch( SQLException e ) {
//			System.out.println( "[에러] " + e.getMessage() );
//		} finally {
//			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
//			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
//			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
//		}
//		return CRdatas;
//	}
	
	
//	public ArrayList<RecommendTO> coJoin(String seq) {	//조인 결과 셋팅 미완
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		ArrayList<RecommendTO> Joindatas = new ArrayList<RecommendTO>();
//		
//		try {
//			conn = this.dataSource.getConnection();
//			String sql = "SELECT board_recommend.comid,board_recommend.pseq,board_recommend.seq,board_comment.pseq,board_comment.id,board_comment.seq,board_comment.wdate,board_comment.content,board_comment.recommend "
//					+ "FROM board_recommend JOIN board_comment ON board_recommend.seq = board_comment.pseq AND board_recommend.pseq = board_comment.seq OR board_comment.recommend ='0' "
//					+ "AND board_recommend.seq = board_comment.pseq WHERE board_comment.pseq=? AND board_recommend.comid != '';";
//			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
//			pstmt.setString( 1, seq );
//
//			rs = pstmt.executeQuery();
//			while( rs.next() ) {
//				RecommendTO to = new RecommendTO();			
//				/*
//				 * System.out.println("2 pseq        : " + rs.getString("pseq"));
//				 * System.out.println("3 seq         : " + rs.getString("seq"));
//				 * System.out.println("3 test         : " + rs.getString("board_comment.seq"));
//				 * System.out.println("4 wdate       : " + rs.getString("wdate"));
//				 * System.out.println("5 content     : " + rs.getString("content"));
//				 * System.out.println("6 recommend   : " + rs.getString("recommend"));
//				 */
//				
//				to.setComid(rs.getString("comid"));
//				to.setWriteid(rs.getString("board_comment.id"));
//				to.setPseq(rs.getString("pseq"));
//				to.setSeq(rs.getString("seq"));
//				to.setTseq(rs.getString("board_comment.seq"));
//				to.setWdate(rs.getString("wdate"));
//				to.setContent(rs.getString("content"));
//				to.setRecommend(rs.getString("recommend"));
//				
//				
//				Joindatas.add( to );
//			}
//		} catch( SQLException e ) {
//			System.out.println( "[에러] " + e.getMessage() );
//		} finally {
//			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
//			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
//			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
//		}
//		return Joindatas;
//	}
	//메인화면 인기게시판 리스트
	public ArrayList<BoardTO> mainlist() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> mainVOdatas = new ArrayList<BoardTO>();
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "select seq,title,id,date_format(wdate, '%Y년 %m월 %d일') wdate,hit,datediff(now(), wdate) wgap,smallcode,recommend from board order by hit desc limit 10";
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
				mainVOdatas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return mainVOdatas;
	}
	//메인화면 축구게시판 리스트
	public ArrayList<BoardTO> mainSClist() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> mainSCdatas = new ArrayList<BoardTO>();
		
		try {
			conn = this.dataSource.getConnection();
			String sql = "select seq,title,id,date_format(wdate, '%Y년 %m월 %d일') wdate,hit,datediff(now(), wdate) wgap,smallcode,recommend from board where smallcode = 'BD003' order by seq desc limit 10";
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
				mainSCdatas.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		return mainSCdatas;
	}
	
}
