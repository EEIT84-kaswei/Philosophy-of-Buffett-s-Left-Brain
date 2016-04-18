package rest.restfulService;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

@Path("/helloworld")
public class HelloWorldResouece {

	@GET
	@Produces("text/plain")
	public String getWelcomeMessage(){
		return "Hello,World";
	}
	
	@GET
	@Path("/{name}")
	@Produces("text/plain")
	public String getWelcomeMessage(@PathParam("name") String name){
		
		return "Hello,"+name+"!";
	}
}
