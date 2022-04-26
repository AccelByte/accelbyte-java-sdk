/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_content;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.models.ModelsContentDownloadResponse;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * DownloadContentByShareCode
 *
 * Public user can access without token or if token specified, requires valid user token
 */
@Getter
@Setter
public class DownloadContentByShareCode extends Operation {
    /**
     * generated field's value
     */
    private String url = "/ugc/v1/public/namespaces/{namespace}/contents/sharecodes/{shareCode}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json","application/octet-stream");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String shareCode;

    /**
    * @param namespace required
    * @param shareCode required
    */
    @Builder
    public DownloadContentByShareCode(
            String namespace,
            String shareCode
    )
    {
        this.namespace = namespace;
        this.shareCode = shareCode;
        
        securities.add("Bearer");
    }

    public DownloadContentByShareCode createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.shareCode != null){
            pathParams.put("shareCode", this.shareCode);
        }
        return pathParams;
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
        if(this.shareCode == null) {
            return false;
        }
        return true;
    }

    public ModelsContentDownloadResponse parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsContentDownloadResponse().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}