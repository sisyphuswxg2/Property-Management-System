package com.cissst.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cissst.dao.INoticeDao;
import com.cissst.entity.Notice;
import com.cissst.util.DBUtil;

public class NoticeDaoImpl implements INoticeDao{

	public List<Notice> FindAll() {
		String sql="select id,content,date_format(ndate,'%Y-%m-%d') ndate,"+
	"title,uper from NOTICE  order by ndate desc";
		List<Notice> list=new ArrayList<Notice>();
		Connection conn=DBUtil.getConnection();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			while(rs.next())
			{
				Notice n = new Notice();
				n.setId(rs.getInt("id"));
				n.setContent(rs.getString("content"));
				n.setNdate(rs.getString("ndate"));
				n.setTitle(rs.getString("title"));
				n.setUper(rs.getString("uper"));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(rs);
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		return list;
	}

	public Notice Select(String id) {
		String select="select id,content,date_format(ndate,'%Y-%m-%d') ndate,"
				+"title,uper from Notice where id=?";
		Notice n=new Notice();
		Connection conn=DBUtil.getConnection();
		PreparedStatement stmt=null;
		ResultSet rs=null;
		try {
			stmt=conn.prepareStatement(select);
			stmt.setString(1,id);
			rs=stmt.executeQuery();
			while (rs.next()){
				n=new Notice();
				n.setId(rs.getInt("id"));
				n.setNdate(rs.getString("ndate"));
				n.setTitle(rs.getString("title"));
				n.setUper(rs.getString("uper"));
				n.setContent(rs.getString("content"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{			
			DBUtil.close(rs);
		    DBUtil.close(stmt);
			DBUtil.close(conn);
		}
		return n;
	}
	public void Add(Notice n) {
		String add="insert into Notice(content,ndate,title,uper) "
				+"values(?,str_to_date(?,'%Y-%m-%d'),?,?)";
		Connection conn=DBUtil.getConnection();
		PreparedStatement stmt=null;
		try {
			stmt=conn.prepareStatement(add);
			stmt.setString(1,n.getContent());
			stmt.setString(2, n.getNdate());
			stmt.setString(3,n.getTitle());
			stmt.setString(4,n.getUper());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
	}

	public void Update(Notice n) {
		String update="update notice set content=?,ndate=str_to_date(?,'%Y-%m-%d'),title=?,uper=?"
				+"where id=?";
		Connection conn=DBUtil.getConnection();
		PreparedStatement stmt=null;
		try {
			stmt=conn.prepareStatement(update);
			stmt.setString(1,n.getContent());
			stmt.setString(2,n.getNdate());
			stmt.setString(3,n.getTitle());
			stmt.setString(4,n.getUper());
			stmt.setInt(5, n.getId());
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{			
			DBUtil.close(stmt);
			DBUtil.close(conn);

		}
		
	}

	public void Delete(String id) { 
		String delete="delete from Notice where id=?";
		Connection conn=DBUtil.getConnection();
		PreparedStatement stmt=null;
		try {
			stmt=conn.prepareStatement(delete);
			stmt.setString(1,id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{			
			DBUtil.close(stmt);
			DBUtil.close(conn);
		}
	}

}
