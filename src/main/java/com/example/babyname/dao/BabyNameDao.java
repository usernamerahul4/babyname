package com.example.babyname.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.babyname.model.BabyNameData;

@Repository
public interface BabyNameDao extends JpaRepository<BabyNameData, Integer>{

	public List<BabyNameData> findByName(String name);
	
	public List<BabyNameData> findAllByOrderByVotesDesc();
	
	@Transactional
	public Long deleteByName(String name);
}
