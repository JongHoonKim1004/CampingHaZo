package com.camping.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.ReservationVO;
import com.camping.mapper.ReservationMapper;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReservationMapperTests {

	@Autowired
	private ReservationMapper mapper;
	
	@Test
	public void testGetList() {
		 mapper.getList().forEach(reservation ->log.info(reservation));
	}
	
	@Test
	public void testInsert() {
		   ReservationVO reservation = new ReservationVO();
		   reservation.setCno(3);
		   reservation.setUsername("@naver.com");
		   reservation.setMoney(15000);
		   reservation.setPeople(3);
		   
		   mapper.insert(reservation);
		   log.info(reservation);
	}
	
	@Test
	public void testInsertSelectKey() {
		 ReservationVO reservation = new ReservationVO();
		 reservation.setCno(5);
		 reservation.setUsername("zee0542@naver.com");
		 reservation.setMoney(1000);
		 reservation.setPeople(9);
		 
		 mapper.insertSelectKey(reservation);
		 log.info(reservation);
	}
	
	@Test
	public void testRead() {
		   ReservationVO reservation = mapper.read("");
		   log.info(reservation);
	}
	
	@Test
	public void testDelete() {
		   log.info("DELETE COUNT :" + mapper.delete(22L));
	}
	
	@Test
	public void testupdate() {
		  ReservationVO reservation = new ReservationVO();
		  
		  reservation.setRno(21L);
		  reservation.setCno(2);
		  reservation.setUsername("t@naver.com");
		  reservation.setMoney(10000);
		  reservation.setPeople(5);
		  
		  int count = mapper.update(reservation);
		  log.info("UPDATE COUNT:" + count);
	}
	
	

}
