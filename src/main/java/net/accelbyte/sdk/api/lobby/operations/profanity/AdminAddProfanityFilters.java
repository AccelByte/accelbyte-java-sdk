/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.profanity;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelsAdminAddProfanityFiltersRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * adminAddProfanityFilters
 *
 * Required permission : `ADMIN:NAMESPACE:{namespace}:PROFANITY [CREATE]` with scope `social`
 * 
 * add multiple filters into the list
 */
@Getter
@Setter
public class AdminAddProfanityFilters extends Operation {
    /**
     * generated field's value
     */
    private String path = "/lobby/v1/admin/profanity/namespaces/{namespace}/list/{list}/filters/bulk";
    private String method = "POST";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String list;
    private String namespace;
    private ModelsAdminAddProfanityFiltersRequest body;

    /**
    * @param list required
    * @param namespace required
    * @param body required
    */
    @Builder
    public AdminAddProfanityFilters(
            String list,
            String namespace,
            ModelsAdminAddProfanityFiltersRequest body
    )
    {
        this.list = list;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.list != null){
            pathParams.put("list", this.list);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsAdminAddProfanityFiltersRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.list == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public void handleEmptyResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        if(code != 200){
            String json = Helper.convertInputStreamToString(payload);
            throw new HttpResponseException(code, json);
        }
    }

}