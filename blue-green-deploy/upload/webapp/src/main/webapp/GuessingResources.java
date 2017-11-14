package main.webapp;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

@Path("/")
public class GuessingResources {
	@Inject
	private GuessingService guessingService;
	
	@GET
	@Path("/")
	public String test() {
		return "Welcome!";
	}
	
	@GET
	@Path("{number}")
	public String guess(@PathParam("number") int number) {
		return guessingService.guess(number);
	}
}