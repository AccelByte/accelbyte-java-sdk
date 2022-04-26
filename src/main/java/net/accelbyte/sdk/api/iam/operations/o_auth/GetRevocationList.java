/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.o_auth;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.OauthapiRevocationList;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetRevocationList
 *
 * 
 * 
 * This endpoint will return a list of revoked users and revoked tokens. List of revoked tokens in bloom filter format. This endpoint requires all requests to have Authorization header set with Basic access authentication constructed from client id and client secret.
 * 
 * 
 * 
 * 
 * The bloom filter uses MurmurHash3 algorithm for hashing the values
 */
@Getter
@Setter
public class GetRevocationList extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/oauth/revocationlist";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Basic";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */

    /**
    */
    @Builder
    public GetRevocationList(
    )
    {
        
        securities.add("Basic");
    }

    public GetRevocationList createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }






    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    @Override
    public OauthapiRevocationList parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new OauthapiRevocationList().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}