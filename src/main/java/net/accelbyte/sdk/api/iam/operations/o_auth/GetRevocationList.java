package net.accelbyte.sdk.api.iam.operations.o_auth;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthapiRevocationList;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetRevocationList
 *
 * 
 * 
 * This endpoint will return a list of revoked users and revoked tokens. List of
 * revoked tokens in bloom filter format. This endpoint requires all requests to
 * have Authorization header set with Basic access authentication constructed
 * from client id and client secret.
 * 
 * The bloom filter uses MurmurHash3 algorithm for hashing the values
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetRevocationList extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/iam/oauth/revocationlist";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList("");

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
    public GetRevocationList(
    )
    {
    }

    @JsonIgnore
    public GetRevocationList createFromJson(String json) throws JsonProcessingException {
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
    public OauthapiRevocationList parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthapiRevocationList().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}