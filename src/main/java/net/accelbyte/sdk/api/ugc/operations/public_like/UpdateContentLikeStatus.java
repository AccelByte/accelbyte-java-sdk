/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_like;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsContentLikeResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsContentLikeRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * UpdateContentLikeStatus
 *
 * Requires valid user token
 */
@Getter
@Setter
public class UpdateContentLikeStatus extends Operation {
    /**
     * generated field's value
     */
    private String path = "/ugc/v1/public/namespaces/{namespace}/contents/{contentId}/like";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json","application/octet-stream");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String contentId;
    private String namespace;
    private ModelsContentLikeRequest body;

    /**
    * @param contentId required
    * @param namespace required
    * @param body required
    */
    @Builder
    public UpdateContentLikeStatus(
            String contentId,
            String namespace,
            ModelsContentLikeRequest body
    )
    {
        this.contentId = contentId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.contentId != null){
            pathParams.put("contentId", this.contentId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public ModelsContentLikeRequest getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.contentId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public ModelsContentLikeResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsContentLikeResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}