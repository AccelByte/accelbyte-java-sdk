/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.roles;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.ModelListRoleV4Response;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminGetRolesV4
 *
 * Required permission ADMIN:ROLE [READ]
 * 
 * action code: 10414
 */
@Getter
@Setter
public class AdminGetRolesV4 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v4/admin/roles";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private Boolean adminRole;
    private Boolean isWildcard;
    private Integer limit;
    private Integer offset;

    /**
    */
    @Builder
    public AdminGetRolesV4(
            Boolean adminRole,
            Boolean isWildcard,
            Integer limit,
            Integer offset
    )
    {
        this.adminRole = adminRole;
        this.isWildcard = isWildcard;
        this.limit = limit;
        this.offset = offset;
        
        securities.add("Bearer");
    }


    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("adminRole", this.adminRole == null ? null : Arrays.asList(String.valueOf(this.adminRole)));
        queryParams.put("isWildcard", this.isWildcard == null ? null : Arrays.asList(String.valueOf(this.isWildcard)));
        queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
        queryParams.put("offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
        return queryParams;
    }




    @Override
    public boolean isValid() {
        return true;
    }

    public ModelListRoleV4Response parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelListRoleV4Response().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("adminRole", "None");
        result.put("isWildcard", "None");
        result.put("limit", "None");
        result.put("offset", "None");
        return result;
    }
}