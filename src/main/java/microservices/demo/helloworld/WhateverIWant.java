package microservices.demo.helloworld;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import microservices.demo.helloworld.domain.Player;
import microservices.demo.helloworld.domain.Team;

@Controller
public class WhateverIWant {
	private Team team;
	
	@PostConstruct
	public void init() {
		Set<Player> players = new HashSet<>();
		players.add(new Player("Charlie Brown", "pitcher"));
		players.add(new Player("Michael Jordan", "shortstop"));
		
		team = new Team("California-feature-MSP-124", "Peanuts", players);
	}
	
	@RequestMapping("/hi")
	public @ResponseBody Team hiThere() {
		return team;
	}
}
