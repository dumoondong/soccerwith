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
public class ServiceDAO {
	@Autowired
	private DataSource dataSource;
	//문의하기
	public int serviceWrite(ServiceTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "insert into memberservice values (0,?,now(), ?,?,'',null,'','','X')";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getId() );
			pstmt.setString( 2, to.getAsktitle() );
			pstmt.setString( 3, to.getAskcontent() );

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
	//문의 리스트
	public ArrayList<ServiceTO> serviceList(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ServiceTO> datas = new ArrayList<ServiceTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select seq,asktitle, date_format(adate, '%Y년 %m월 %d일') adate, delornot from memberservice where id = ? order by seq desc";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, id );
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				ServiceTO to = new ServiceTO();
				to.setSeq(rs.getString("seq"));
				to.setAsktitle(rs.getString("asktitle"));
				to.setAdate(rs.getString("adate"));
				to.setDeleornot(rs.getString("delornot"));
				
				
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
	//문의 내용리스트
	public ServiceTO service_ask(ServiceTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select seq,id, date_format(adate, '%Y년 %m월 %d일 %H시 %S분') adate,asktitle,askcontent ,replyid,date_format(rdate, '%Y년 %m월 %d일 %H시 %S분') rdate,replytitle,replycontent,delornot from memberservice where seq=? ";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to.setSeq(rs.getString("seq"));
				to.setId(rs.getString("id"));
				to.setAdate(rs.getString("adate"));
				to.setAsktitle(rs.getString("asktitle"));
				to.setAskcontent(rs.getString("askcontent"));
				to.setReplyid(rs.getString("replyid"));
				to.setRdate(rs.getString("rdate"));
				to.setReplytitle(rs.getString("replytitle"));
				to.setReplycontent(rs.getString("replycontent"));
				to.setDeleornot(rs.getString("delornot"));
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return to;
	}
	//관리자 고객센터 문의 리스트
	public ArrayList<ServiceTO> adminservice() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<ServiceTO> datas = new ArrayList<ServiceTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select seq,id,asktitle, date_format(adate, '%Y년 %m월 %d일 %H시 %S분') adate,replyid, delornot,date_format(rdate, '%Y년 %m월 %d일 %H시 %S분') rdate  from memberservice order by seq desc";
			pstmt = conn.prepareStatement( sql );
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				ServiceTO to = new ServiceTO();
				to.setSeq(rs.getString("seq"));
				to.setId(rs.getString("id"));
				to.setAsktitle(rs.getString("asktitle"));
				to.setAdate(rs.getString("adate"));
				to.setReplyid(rs.getString("replyid"));
				to.setDeleornot(rs.getString("delornot"));
				to.setRdate(rs.getString("rdate"));
				
				
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
	
	//관리자 고객 문의 답변
	public int adminServiceWrite(ServiceTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "update memberservice set replyid=?, rdate=now(),replytitle=?,replycontent=?,delornot='O' where seq=?";
			pstmt = conn.prepareStatement( sql );
			
			pstmt.setString( 1, to.getReplyid() );
			pstmt.setString( 2, to.getReplytitle() );
			pstmt.setString( 3, to.getReplycontent() );
			pstmt.setString( 4, to.getSeq() );
			
			System.out.println(to.getReplyid());
			System.out.println(to.getReplytitle());
			System.out.println(to.getReplycontent());
			System.out.println(to.getSeq());
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


}
