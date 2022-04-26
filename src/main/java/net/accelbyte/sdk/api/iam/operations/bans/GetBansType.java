/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.bans;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonBans;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * GetBansType
 *
 * Required permission 'BAN:ADMIN [READ]' or 'ADMIN:BAN [READ]'
 * 
 * 
 * 
 * 
 * Required Permission 'BAN:ADMIN [READ]' is going to be DEPRECATED for security purpose.
 * It is going to be deprecated on 31 JANUARY 2019 , please use permission 'ADMIN:BAN [READ]' instead.
 */
@Getter
@Setter
public class GetBansType extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/bans";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */

    /**
    */
    @Builder
    public GetBansType(
    )
    {
        
        securities.add("Bearer");
    }






    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    public AccountcommonBans parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new AccountcommonBans().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}