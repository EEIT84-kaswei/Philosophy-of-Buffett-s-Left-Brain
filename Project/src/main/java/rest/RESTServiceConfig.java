package rest;

import javax.ws.rs.ApplicationPath;
import org.glassfish.jersey.server.ResourceConfig;

//Annotation註冊宣告REST的資料夾
@ApplicationPath("/services")
public class RESTServiceConfig extends ResourceConfig {
	
	public RESTServiceConfig(){
		this.packages("rest.restfulService");
	}
}
