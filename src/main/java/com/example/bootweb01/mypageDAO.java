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
public class mypageDAO {
	@Autowired
	private DataSource dataSource;

	public MemberTO mypageView(MemberTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from member where id=? ";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getId() );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to.setId( rs.getString( "id" ) );
				to.setGrade( rs.getString( "grade" ) );
				to.setPhone( rs.getString( "phone" ) );
				to.setEmail( rs.getString( "email" ) );
				to.setName( rs.getString( "name" ) );
				to.setWriteboa( rs.getString( "writeboa" ) );
				to.setWritecom( rs.getString( "writecom" ) );
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return to;
	}
	public int checkpw(MemberTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = -2;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from member where id=? ";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getId() );
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("password").equals(to.getPassword())) {
					if(rs.getString("grade").equals("관리자")) {
						flag = 2;
					}else {
						flag = 0;
					}
				}else {
					flag = 1;
				}
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return flag;
	}
	
	public int changepw(MemberTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "update member set password=? where id=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getPassword() );
			pstmt.setString( 2, to.getId() );
			
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
