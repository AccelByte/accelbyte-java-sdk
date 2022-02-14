package net.accelbyte.sdk.api.iam.operations.bans;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonBans;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetBansType
 *
 * Required permission 'BAN:ADMIN [READ]' or 'ADMIN:BAN [READ]'
 * 
 * Required Permission 'BAN:ADMIN [READ]' is going to be DEPRECATED for security
 * purpose. It is going to be deprecated on 31 JANUARY 2019 , please use
 * permission 'ADMIN:BAN [READ]' instead.
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetBansType extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/bans";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */

    /**
    */
    public GetBansType(
    )
    {
    }

    @JsonIgnore
    public GetBansType createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }





    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }



    @Override
    @JsonIgnore
    public AccountcommonBans parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new AccountcommonBans().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}