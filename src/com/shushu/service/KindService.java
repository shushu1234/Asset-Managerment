package com.shushu.service;

import java.util.List;

import com.shushu.dao.KindDao;
import com.shushu.domain.Kind;

public class KindService {

	public void add(Kind kind) {
		KindDao kindDao = new KindDao();
		kindDao.add(kind);
	}

	public List<Kind> list(int userkindid) {
		KindDao kindDao = new KindDao();
		return kindDao.list(userkindid);
	}

	public Kind findById(int id) {
		KindDao kindDao = new KindDao();
		return kindDao.findById(id);
	}

	public void addChildKind(Kind kind) {
		// TODO Auto-generated method stub
		KindDao kindDao = new KindDao();
		kindDao.addChildKind(kind);
	}

	public void delete(int id) {
		KindDao kindDao = new KindDao();
		kindDao.delete(id);
	}

	public Kind detail(int id) {
		// TODO Auto-generated method stub
		KindDao kindDao = new KindDao();
		return kindDao.findById(id);
	}

	public void update(Kind kind) {
		// TODO Auto-generated method stub
		KindDao kindDao = new KindDao();
		kindDao.update(kind);
	}

	public List<Kind> leaflist() {
		// TODO Auto-generated method stub
		KindDao kindDao = new KindDao();
		return kindDao.leaflist();
	}
}
