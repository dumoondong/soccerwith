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
public class RecordDAO {
	@Autowired
	private DataSource dataSource;
	//내정보
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
}



