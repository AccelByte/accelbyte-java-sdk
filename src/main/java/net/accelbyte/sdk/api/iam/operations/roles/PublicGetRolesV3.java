/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelRoleNamesResponseV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * PublicGetRolesV3
 *
 * 
 * This endpoint is used to get all non-admin role.
 * 
 * 
 * action code: 10418
 */
@Getter
@Setter
public class PublicGetRolesV3 extends Operation {
    /**
     * generated field's value
     */
    private String url = "/iam/v3/public/roles";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String after;
    private String before;
    private Boolean isWildcard;
    private Integer limit;

    /**
    */
    @Builder
    public PublicGetRolesV3(
            String after,
            String before,
            Boolean isWildcard,
            Integer limit
    )
    {
        this.after = after;
        this.before = before;
        this.isWildcard = isWildcard;
        this.limit = limit;
        
        securities.add("Bearer");
    }

    public PublicGetRolesV3 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("after", this.after == null ? null : Arrays.asList(this.after));
        queryParams.put("before", this.before == null ? null : Arrays.asList(this.before));
        queryParams.put("isWildcard", this.isWildcard == null ? null : Arrays.asList(String.valueOf(this.isWildcard)));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        return queryParams;
    }




    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }


    @Override
    public ModelRoleNamesResponseV3 parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelRoleNamesResponseV3().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("after", "None");
        result.put("before", "None");
        result.put("isWildcard", "None");
        result.put("limit", "None");
        return result;
    }
}