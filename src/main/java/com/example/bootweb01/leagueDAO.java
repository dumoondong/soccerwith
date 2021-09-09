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
				to.setClubimg( rs.getString( "clubimg" ) );
				to.setWri( rs.getString( "wri" ) );
				to.setImg(rs.getString("img"));
				to.setList(rs.getString( "list" ) );
				
				System.out.println(rs.getString("list"));
				
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
			}
		} catch( SQLException e ) {
			System.out.println("[에러] " + e.getMessage() );
		} finally {
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		return to;
	}
}



