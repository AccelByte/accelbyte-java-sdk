/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.platform.operations.reward;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.RewardInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * getReward_1
 *
 * This API is used to get reward by reward Id.
 * Other detail info:
 * 
 *   * Required permission : resource="NAMESPACE:{namespace}:REWARD", action=2 (READ)
 *   *  Returns : reward instance
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class GetReward1 extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/platform/public/namespaces/{namespace}/rewards/{rewardId}";

    @JsonIgnore
    private String method = "GET";

    @JsonIgnore
    private List<String> consumes = Arrays.asList();

    @JsonIgnore
    private List<String> produces = Arrays.asList("application/json");

    @JsonIgnore
    private String security = "Bearer";

    @JsonIgnore
    private String locationQuery = null;

    /**
     * fields as input parameter
     */
    private String namespace;
    private String rewardId;

    /**
    * @param namespace required
    * @param rewardId required
    */
    public GetReward1(
            String namespace,
            String rewardId
    )
    {
        this.namespace = namespace;
        this.rewardId = rewardId;
    }

    @JsonIgnore
    public GetReward1 createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public String toJson() throws JsonProcessingException {
        return new ObjectMapper().writeValueAsString(this);
    }

    @Override
    @JsonIgnore
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.rewardId != null){
            pathParams.put("rewardId", this.rewardId);
        }
        return pathParams;
    }




    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("namespace","namespace");
        result.put("rewardId","rewardId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "namespace",
            "rewardId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.rewardId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public RewardInfo parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new RewardInfo().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}