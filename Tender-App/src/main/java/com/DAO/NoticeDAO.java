package com.DAO;

import java.util.List;

import com.entity.NoticeDtls;

public interface NoticeDAO {
	public boolean addNotices(NoticeDtls t);
	public List<NoticeDtls >getAllNotices();

}
