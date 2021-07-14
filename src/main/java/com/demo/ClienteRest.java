package com.demo;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.MediaType;


public class ClienteRest {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "https://pokeapi.co/api";
    private GenericType<Pokemones> genericType = new GenericType<Pokemones>(){};

    public ClienteRest(int num,boolean evolution) {
        client = ClientBuilder.newClient();
        if (!evolution) {
            webTarget = client.target(BASE_URI).path("/v2/pokemon-species")
                    .queryParam("offset", num)
                    .queryParam("limit", 10);
        } else{
            webTarget = client.target(BASE_URI).path("/v2/evolution-chain/"+num);
                    //.path(num + "");
        }
    }

    public <T> Pokemones findAll_JSON() throws ClientErrorException {
        WebTarget resource = webTarget;
        return resource.request(MediaType.APPLICATION_JSON).get(genericType);
    }

    public String findEvolution() throws ClientErrorException {
        WebTarget resource = webTarget;
        return resource.request(MediaType.TEXT_PLAIN).get(String.class);
    }
}
