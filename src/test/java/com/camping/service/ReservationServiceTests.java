package com.camping.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.camping.domain.ReservationVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReservationServiceTests {

	@Autowired
    private ReservationService service;
	
   @Test
   public void testRegister() {
	    ReservationVO reservation = new ReservationVO();
	    reservation.setCno(3);
	    reservation.setUsername("test@naver.com");
	    reservation.setMoney(50000);
	    reservation.setPeople(5);
	    service.register(reservation);
	    log.info("생성된 게시물:" + reservation.getRno());
	    
	    
   }
   
   @Test
   public void testGetLst() {
	      service.getList().forEach(reservation ->log.info(reservation));
   }
   
   @Test
   public void testGet() {
	      log.info(service.get(""));
   }
   
   @Test
   public void testDelete() {
	      log.info("REMOVE RESULT :" + service.remove(21L));
   }
   
   @Test
   public void testUpdate() {
	     ReservationVO reservation = service.get("");
	     
	     if(reservation == null) {
	    	      return;
	     }
	     
	     reservation.setPeople(6);
	     log.info("MODIFY RESULT:" + service.modify(reservation));
   }

}
