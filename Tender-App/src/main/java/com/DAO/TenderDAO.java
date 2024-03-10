package com.DAO;

import java.util.List;

import com.entity.Tenderdtls;

public interface TenderDAO {
	public boolean addtenders(Tenderdtls t);
	public List<Tenderdtls> getAllTenders();
	public Tenderdtls getTenderbyId(int id);
	public boolean updateEditTenders(Tenderdtls t);
	public boolean deleteTenders(int id);
	public List<Tenderdtls> getNewTender();
	public List<Tenderdtls> getTenderbydescorder();
	


}
