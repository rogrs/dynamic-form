package br.com.demos.restlets.impl;

import java.util.List;

import javax.ws.rs.FormParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import br.com.demos.jpa.service.impl.PropriedadeServiceImpl;
import br.com.demos.restlets.PropriedadeRest;
import br.com.demos.vo.Propriedades;

public class PropriedadesRestlet implements PropriedadeRest {

    private static final Logger logger = Logger.getLogger(PropriedadesRestlet.class);

    public Response listar() {

        PropriedadeServiceImpl impl = null;
        List<Propriedades> entity = null;

        try {
            impl = new PropriedadeServiceImpl();
            entity = impl.findAll();

        } catch (Exception e) {

            logger.error("erro", e);

        } finally {

        }

        return Response.ok(entity, MediaType.APPLICATION_JSON).build();

    }

    public Response create(@FormParam("chave") String chave, @FormParam("valor") String valor) {

        String result = null;
        PropriedadeServiceImpl impl = null;
        Propriedades entity = null;

        try {

            impl = new PropriedadeServiceImpl();

            entity = new Propriedades();
            entity.setChave(chave);
            entity.setValor(valor);
            entity.setEnabled(1);
            impl.persist(entity);

            result = "sucesso";
        } catch (Exception e) {
            logger.error("erro", e);
            result = "Error " + e.getMessage();
        } finally {

        }
        return Response.ok(result).build();

    }

}
