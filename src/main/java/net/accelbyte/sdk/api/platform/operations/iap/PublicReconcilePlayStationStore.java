/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.iap;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PlayStationReconcileRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * publicReconcilePlayStationStore
 *
 * Synchronize with entitlements in PSN Store.
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="NAMESPACE:{namespace}:USER:{userId}:IAP", action=4 (UPDATE)
 *   *  Returns : result of synchronization
 */
@Getter
@Setter
public class PublicReconcilePlayStationStore extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/public/namespaces/{namespace}/users/{userId}/iap/psn/sync";
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
    private String userId;
    private PlayStationReconcileRequest body;

    /**
    * @param namespace required
    * @param userId required
    */
    @Builder
    public PublicReconcilePlayStationStore(
            String namespace,
            String userId,
            PlayStationReconcileRequest body
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.body = body;
        
        securities.add("Bearer");
    }

    public PublicReconcilePlayStationStore createFromJson(String json) throws JsonProcessingException {
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
        if (this.userId != null){
            pathParams.put("userId", this.userId);
        }
        return pathParams;
    }



    @Override
    public PlayStationReconcileRequest getBodyParams(){
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
        if(this.userId == null) {
            return false;
        }
        return true;
    }

    @Override
    public List<PlayStationReconcileResult> parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new ObjectMapper().readValue(json, new TypeReference<List<PlayStationReconcileResult>>() {});
        }
        throw new ResponseException(code, json);
    }

}