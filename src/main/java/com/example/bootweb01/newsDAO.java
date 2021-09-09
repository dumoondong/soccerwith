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
	
	   public ArrayList<newsTO> newstemplate() {
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      
		      ArrayList<newsTO> datas = new ArrayList<newsTO>();
		      
		      try {
		         conn = this.dataSource.getConnection();
		         
		         String sql = "select * from news ";
		         pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
		         
		         rs = pstmt.executeQuery();
		         
		         while( rs.next() ) {
		            newsTO to = new newsTO();
		            to.setSeq( rs.getString( "seq" ) );
		            to.setNewstitle(rs.getString("newstitle"));
		            to.setNewswdate(rs.getString("newswdate") );
		            to.setNewscontent(rs.getString("newscontent") );
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
		}