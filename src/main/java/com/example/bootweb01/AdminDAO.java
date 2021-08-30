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
public class AdminDAO {
	@Autowired
	private DataSource dataSource;
	//대코드 리스트
	public ArrayList<LargecodeTO> LargecodeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<LargecodeTO> datas = new ArrayList<LargecodeTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from largecode";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				LargecodeTO to = new LargecodeTO();
				to.setSeq( rs.getString( "seq" ) );
				to.setLargecode( rs.getString( "largecode" ) );
				to.setLargeinfo( rs.getString( "largeinfo" ) );
				to.setLargeremark(rs.getString( "largeremark" ));
				
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
	//소코드
	public ArrayList<SmallcodeTO> smallcodeList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<SmallcodeTO> datas = new ArrayList<SmallcodeTO>();
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from smallcode";
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
}
