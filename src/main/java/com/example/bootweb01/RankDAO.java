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
public class RankDAO {
	@Autowired
	private DataSource dataSource;
	//내정보
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
}



