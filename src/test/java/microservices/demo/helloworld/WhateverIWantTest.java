package microservices.demo.helloworld;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.Test;

import microservices.demo.helloworld.domain.Team;

public class WhateverIWantTest {
	
	@Test
	public void testHiThere() {
		WhateverIWant service = new WhateverIWant();
		service.init();
		Team team = service.hiThere();
		assertThat(team.getName()).isEqualTo("Peanuts");
		assertThat(team.getPlayers().size()).isEqualTo(2);
		
	}
}
