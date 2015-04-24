package br.com.demos.restlets;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path(value = "/v1/resposta/")
public interface RespostaRest {

    
    @GET
    @Path("/")
    @Produces(MediaType.APPLICATION_JSON)
    Response listAll();
    
    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    Response getByID(@PathParam("id") Long id);
    
    @POST
    @Path("/")
    @Consumes("application/x-www-form-urlencoded")
    Response create(@FormParam("idpergunta") String idpergunta, @FormParam("resposta") String pergunta);
    
    @DELETE
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    Response remove(@PathParam("id") Long id);
    
}
