package com.shushu.dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.shushu.domain.Kind;
import com.shushu.domain.UploadFile;
import com.shushu.utils.JDBCUtils;

public class UploadFileDao {
	private QueryRunner queryRunner = new QueryRunner(JDBCUtils.getDataSource());

	/**
	 * 用户文件上传
	 * 
	 * @param uploadFile
	 */
	@InputConfig(resultName = "uploadINPUT")
	public void upload(UploadFile uploadFile) {
		// TODO Auto-generated method stub
		String sql = "insert into file (name,kindid,kind,remark,filesize,authorname1,authorname2,authorname3,authorname4,authorname5,open,userid,uploaddate,filepath,downcount,privatefile) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:dd:ss");
		String nowtime = simpleDateFormat.format(nowDate);
		Kind kind = new KindDao().findById(uploadFile.getKindid());
		Object[] params = { uploadFile.getName(), uploadFile.getKindid(),
				kind.getName(), uploadFile.getRemark(),
				uploadFile.getFilesize(), uploadFile.getAuthorname1(),
				uploadFile.getAuthorname2(), uploadFile.getAuthorname3(),
				uploadFile.getAuthorname4(), uploadFile.getAuthorname5(), 1,
				uploadFile.getUserid(), nowtime, uploadFile.getFilepath(), 0,
				uploadFile.getPrivatefile() };
		try {
			queryRunner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public List<UploadFile> findByCondition(UploadFile uploadFile) {
		// TODO Auto-generated method stub
		// 根据文件id，文件名称，用户id，状态，类别组合查询
		String sql = "select * from file where 1=1 ";
		List<String> params = new ArrayList<String>();
		if (uploadFile.getId() != 0) {
			sql += " and id =" + uploadFile.getId() + " ";
			// params.add("%" + uploadFile.getId() + "%");
		}
		if (uploadFile.getName() != null
				&& uploadFile.getName().trim().length() > 0) {
			sql += " and name like ?";
			params.add("%" + uploadFile.getName() + "%");
		}
		if (uploadFile.getUserid() != null
				&& uploadFile.getUserid().trim().length() > 0) {
			sql += " and userid = ?";
			params.add(uploadFile.getUserid());
		}
		if (uploadFile.getOpen() != 0) {
			sql += " and open = " + uploadFile.getOpen() + " ";
			// params.add(String.valueOf(uploadFile.getOpen()));
		}
		if (uploadFile.getPrivatefile() != 0) {
			sql += " and privatefile = " + uploadFile.getPrivatefile() + " ";
			// params.add(String.valueOf(uploadFile.getOpen()));
		}
		if (uploadFile.getKindid() != 0) {
			String kindname = new KindDao().findById(uploadFile.getKindid())
					.getName();
			System.out.println(kindname);
			sql += " and kind = ? ";
			params.add(kindname);
		}
		try {
			List<UploadFile> uploadFiles = queryRunner.query(sql,
					new BeanListHandler<UploadFile>(UploadFile.class),
					params.toArray());
			return uploadFiles;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public UploadFile findById(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from file where id = ?";
		try {
			UploadFile uploadFile = queryRunner.query(sql,
					new BeanHandler<UploadFile>(UploadFile.class), id);
			return uploadFile;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 下载次数统计
	 * 
	 * @param id
	 * @param downcount
	 */
	public void addDowncount(int id, int downcount) {
		// TODO Auto-generated method stub
		String sql = "update file set downcount = ? where id = ?";
		try {
			queryRunner.update(sql, downcount + 1, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 文件修改
	 * 
	 * @param uploadFile
	 */
	public void edit(UploadFile uploadFile) {
		// TODO Auto-generated method stub
		String sql = "update file set kindid = ?,kind=?,remark = ?,authorname1 = ?,authorname2 = ?,authorname3 = ?,authorname4 = ?,authorname5 = ? where id = ?";
		Kind kind = new KindDao().findById(uploadFile.getKindid());
		Object[] params = { uploadFile.getKindid(), kind.getName(),
				uploadFile.getRemark(), uploadFile.getAuthorname1(),
				uploadFile.getAuthorname2(), uploadFile.getAuthorname3(),
				uploadFile.getAuthorname4(), uploadFile.getAuthorname5(),
				uploadFile.getId() };
		try {
			queryRunner.update(sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		String sql = "delete from file where id = ?";
		try {
			queryRunner.update(sql, id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	public List<UploadFile> listuserfiles(String userid) {
		// TODO Auto-generated method stub
		String sql = "select * from file where userid = ? order by id desc";
		try {
			List<UploadFile> userfiles = queryRunner.query(sql,
					new BeanListHandler<UploadFile>(UploadFile.class), userid);
			return userfiles;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 修改开放下载
	 * 
	 * @param fileid
	 */
	public void filepass(int fileid) {
		// TODO Auto-generated method stub
		String sql = "update file set open = 2 where id = ?";
		try {
			queryRunner.update(sql, fileid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	/**
	 * 取出下载前三个
	 * 
	 * @return
	 */
	public List<UploadFile> topfiles() {
		// TODO Auto-generated method stub
		String sql = "select * from file order by downcount desc limit 3";
		try {
			List<UploadFile> topfilelist = queryRunner.query(sql,
					new BeanListHandler<UploadFile>(UploadFile.class));
			return topfilelist;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

}
