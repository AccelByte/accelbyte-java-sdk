/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_tag;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateTagResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateTagRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminUpdateTag
 *
 * Required permission ADMIN:NAMESPACE:{namespace}:UGCCONFIG [UPDATE]
 * updates a tag
 */
@Getter
@Setter
public class AdminUpdateTag extends Operation {
    /**
     * generated field's value
     */
    private String path = "/ugc/v1/admin/namespaces/{namespace}/tags/{tagId}";
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
    private String tagId;
    private ModelsCreateTagRequest body;

    /**
    * @param namespace required
    * @param tagId required
    * @param body required
    */
    @Builder
    public AdminUpdateTag(
            String namespace,
            String tagId,
            ModelsCreateTagRequest body
    )
    {
        this.namespace = namespace;
        this.tagId = tagId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.tagId != null){
            pathParams.put("tagId", this.tagId);
        }
        return pathParams;
    }



    @Override
    public ModelsCreateTagRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.tagId == null) {
            return false;
        }
        return true;
    }

    public ModelsCreateTagResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsCreateTagResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}