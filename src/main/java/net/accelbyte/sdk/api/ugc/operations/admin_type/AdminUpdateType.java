/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_type;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateTypeResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateTypeRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * AdminUpdateType
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:UGCCONFIG [UPDATE]
 * updates a type and subtype
 */
@Getter
@Setter
public class AdminUpdateType extends Operation {
    /**
     * generated field's value
     */
    private String url = "/ugc/v1/admin/namespaces/{namespace}/types/{typeId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String typeId;
    private ModelsCreateTypeRequest body;

    /**
    * @param namespace required
    * @param typeId required
    * @param body required
    */
    @Builder
    public AdminUpdateType(
            String namespace,
            String typeId,
            ModelsCreateTypeRequest body
    )
    {
        this.namespace = namespace;
        this.typeId = typeId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.typeId != null){
            pathParams.put("typeId", this.typeId);
        }
        return pathParams;
    }



    @Override
    public ModelsCreateTypeRequest getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.typeId == null) {
            return false;
        }
        return true;
    }

    public ModelsCreateTypeResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsCreateTypeResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}