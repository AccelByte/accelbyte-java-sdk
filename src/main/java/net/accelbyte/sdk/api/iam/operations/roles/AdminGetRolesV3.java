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
import net.accelbyte.sdk.api.iam.models.ModelRoleResponseWithManagersAndPaginationV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminGetRolesV3
 *
 * Required permission 'ADMIN:ROLE [READ]'
 * 
 * 
 * action code: 10414
 */
@Getter
@Setter
public class AdminGetRolesV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/admin/roles";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
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
    public AdminGetRolesV3(
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
    public boolean isValid() {
        return true;
    }

    public ModelRoleResponseWithManagersAndPaginationV3 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelRoleResponseWithManagersAndPaginationV3().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
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