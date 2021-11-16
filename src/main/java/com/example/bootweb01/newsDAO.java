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
public class newsDAO {
	
	
	@Autowired
	private DataSource dataSource;
	
		// 일반사용자 뉴스 리스트
	   public ArrayList<newsTO> newstemplate() {
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      
		      ArrayList<newsTO> datas = new ArrayList<newsTO>();
		      
		      try {
		         conn = this.dataSource.getConnection();
		         
		         String sql = "select seq, newstitle, newswdate, date_format(newswdate, '%Y-%m-%d') newswdate, newsview, datediff(now(), newswdate) newscontent, newsimage, classify, Id from news order by seq desc";
		         pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
		         
		         rs = pstmt.executeQuery();
		         
		         while( rs.next() ) {
		            newsTO to = new newsTO();
		            to.setSeq( rs.getString( "seq" ) );
		            to.setNewstitle(rs.getString("newstitle"));
		            to.setNewswdate(rs.getString("newswdate") );
		            to.setNewscontent(rs.getString("newscontent") );
		            to.setNewsimage(rs.getString("newsimage"));
		            to.setNewsview(rs.getInt("newsview"));
		            to.setId(rs.getString("Id"));
		            to.setClassify(rs.getString("classify"));
		            datas.add( to );
		            }
		         }catch( SQLException e ) {
		            System.out.println( "[에러] " + e.getMessage() );
		         } finally {
		            if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
		            if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
		            if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		         }
		         return datas;   
		   }
		
	   //일반 사용자 뉴스 리스트 상세내역 출력
		public newsTO newsView(newsTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = this.dataSource.getConnection();
				
				String sql = "update news set newsview = newsview + 1 where seq=?";
				pstmt = conn.prepareStatement( sql );
				pstmt.setString( 1, to.getSeq() );

				pstmt.executeUpdate();
				
				sql = "select newstitle, newswdate, newsimage, newsview, id, classify, newscontent from news where seq=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString( 1, to.getSeq());
				rs = pstmt.executeQuery();
				
				if( rs.next() ) {
					to.setNewstitle( rs.getString( "newstitle" ));
					to.setNewswdate(rs.getString("newswdate") );
					to.setNewsimage(rs.getString("newsimage"));
		            to.setNewsview(rs.getInt("newsview"));
		            to.setId(rs.getString("id"));
		            to.setClassify(rs.getString("classify"));
		            to.setNewscontent(rs.getString("newscontent").replaceAll("\n", "<br />"));
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
			//어드민 뉴스 리스트 출력
		   public ArrayList<newsTO> admnewstemplate() {
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      
			      ArrayList<newsTO> datas3 = new ArrayList<newsTO>();
			      
			      try {
			         conn = this.dataSource.getConnection();
			         
			         String sql = "select seq, newstitle, newswdate, date_format(newswdate, '%Y-%m-%d') newswdate, newsview, datediff(now(), newswdate) newscontent, newsimage, classify, Id from news order by seq desc";
			         pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			         
			         rs = pstmt.executeQuery();
			         
			         while( rs.next() ) {
			            newsTO to = new newsTO();
			            to.setSeq( rs.getString( "seq" ) );
			            to.setNewstitle(rs.getString("newstitle"));
			            to.setNewswdate(rs.getString("newswdate") );
			            to.setNewscontent(rs.getString("newscontent") );
			            to.setNewsimage(rs.getString("newsimage"));
			            to.setNewsview(rs.getInt("newsview"));
			            to.setId(rs.getString("Id"));
			            to.setClassify(rs.getString("classify"));
			            datas3.add( to );
			            }
			         }catch( SQLException e ) {
			            System.out.println( "[에러] " + e.getMessage() );
			         } finally {
			            if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			            if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			            if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
			         }
			         return datas3;   
			   }
		   // list 구별
		   public ArrayList<newsTO> admnewsduplicate( String classify ) {
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      
			      ArrayList<newsTO> datas4 = new ArrayList<newsTO>();
			      
			      try {
			         conn = this.dataSource.getConnection();
			         
			         String sql = "select * from news where classify =?";
			         pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			         pstmt.setString( 1, classify);
			       
			         
			         rs = pstmt.executeQuery();
			         
			         while( rs.next() ) {
			            newsTO to = new newsTO();
			            to.setSeq( rs.getString( "seq" ) );
			            to.setNewstitle(rs.getString("newstitle"));
			            to.setNewswdate(rs.getString("newswdate") );
			            to.setNewscontent(rs.getString("newscontent") );
			            to.setNewsimage(rs.getString("newsimage"));
			            to.setNewsview(rs.getInt("newsview"));
			            to.setId(rs.getString("Id"));
			            to.setClassify(rs.getString("classify"));
			            datas4.add( to );
			            System.out.println(rs.getString("newscontent"));
			            }
			         }catch( SQLException e ) {
			            System.out.println( "[에러] " + e.getMessage() );
			         } finally {
			            if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			            if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			            if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
			         }
			         return datas4;   
			   }
		   // 어드민 뉴스 상세내역 출력
		   public newsTO admnewsView(newsTO to2) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					conn = this.dataSource.getConnection();
					
					String sql = "update news set newsview = newsview + 1 where seq=?";
					pstmt = conn.prepareStatement( sql );
					pstmt.setString( 1, to2.getSeq() );

					pstmt.executeUpdate();
					
					sql = "select newstitle, date_format(newswdate, '%Y-%m-%d') newswdate, newsimage, newsview, id, classify, newscontent from news where seq=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString( 1, to2.getSeq());
					rs = pstmt.executeQuery();
					
					if( rs.next() ) {
						to2.setNewstitle( rs.getString( "newstitle" ));
						to2.setNewswdate(rs.getString("newswdate") );
						to2.setNewsimage(rs.getString("newsimage"));
			            to2.setNewsview(rs.getInt("newsview"));
			            to2.setId(rs.getString("id"));
			            to2.setClassify(rs.getString("classify"));
			            to2.setNewscontent(rs.getString("newscontent").replaceAll("\n", "<br />"));
					}
				} catch( SQLException e ) {
					System.out.println( "[에러] " + e.getMessage() );
				} finally {
					if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
					if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
					if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
				}
				return to2;
			}
		   // 어드민 뉴스 작성
		   public int newsWrite(newsTO to3) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				
				
				int flag = 0;
				try {
					conn = this.dataSource.getConnection();
					
					String sql = "insert into news values ('0',?,?,now(),'0',?,?,?)";
					pstmt = conn.prepareStatement( sql );
					pstmt.setString( 1, to3.getNewstitle() );
					pstmt.setString( 2, to3.getNewscontent() );
					pstmt.setString( 3,to3.getId());
					pstmt.setString( 4,to3.getClassify());
					pstmt.setString( 5,to3.getNewsimage());

					//System.out.println(to3.getNewstitle());

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
		   // 어드민 뉴스 수정
		   public newsTO newsedit(newsTO to4) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					conn = this.dataSource.getConnection();
					
					String sql = "select * from news where seq=?";
					pstmt = conn.prepareStatement( sql );
					pstmt.setString( 1, to4.getSeq() );
					rs = pstmt.executeQuery();
					
					if( rs.next() ) {
						to4.setNewstitle(rs.getString("newstitle"));
						to4.setNewscontent( rs.getString( "newscontent").replaceAll("\n", "<br />"));
						to4.setClassify( rs.getString( "classify" ) );
						//System.out.println(rs.getString("classify"));
					}
				} catch( SQLException e ) {
					System.out.println("[에러] " + e.getMessage() );
				} finally {
					if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
					if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
				}	
				return to4;
			}
		   // 어드민 뉴스 수정 확인
		   public int newseditOK(newsTO to5) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				int flag = 0;
				try {
					conn = this.dataSource.getConnection();
					
					String sql = "update news set newstitle=?, newscontent=?, classify=? where seq=?";
					pstmt = conn.prepareStatement( sql );
					
					pstmt.setString( 1, to5.getNewstitle() );
					pstmt.setString( 2, to5.getNewscontent() );
					pstmt.setString( 3, to5.getClassify() );
					pstmt.setString( 4, to5.getSeq() );
					System.out.print(to5.getClassify());
					
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
		   // 어드민 뉴스 삭제
			public int newsDelete_ok(newsTO to ) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				int flag = 0;
				try {
					conn = this.dataSource.getConnection();
					
					String sql = "delete from news where seq=?";
					pstmt = conn.prepareStatement( sql );
					pstmt.setString( 1, to.getSeq() );
					System.out.println(to.getSeq());
					
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
			
			//메인화면 국내뉴스 리스트 출력
			 public ArrayList<newsTO> mainNews( String classify ) {
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      
			      ArrayList<newsTO> datas4 = new ArrayList<newsTO>();
			      
			      try {
			         conn = this.dataSource.getConnection();
			         
			         String sql = "select * from news where classify =? limit 4";
			         pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			         pstmt.setString( 1, classify);
			       
			         
			         rs = pstmt.executeQuery();
			         
			         while( rs.next() ) {
			            newsTO to = new newsTO();
			            to.setSeq( rs.getString( "seq" ) );
			            to.setNewstitle(rs.getString("newstitle"));
			            to.setNewswdate(rs.getString("newswdate") );
			            to.setNewscontent(rs.getString("newscontent") );
			            to.setNewsimage(rs.getString("newsimage"));
			            to.setNewsview(rs.getInt("newsview"));
			            to.setId(rs.getString("Id"));
			            to.setClassify(rs.getString("classify"));
			            datas4.add( to );
			            System.out.println(rs.getString("newscontent"));
			            }
			         }catch( SQLException e ) {
			            System.out.println( "[에러] " + e.getMessage() );
			         } finally {
			            if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			            if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			            if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
			         }
			         return datas4;   
			   }			
	}