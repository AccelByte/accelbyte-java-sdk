/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.legal.operations.localized_policy_versions;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.models.UploadLocalizedPolicyVersionAttachmentResponse;
import net.accelbyte.sdk.api.legal.models.UploadPolicyVersionAttachmentRequest;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * requestPresignedURL
 *
 * Request presigned URL for upload attachment for a particular localized version of base policy.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:*:LEGAL", action=1 (CREATE)
 */
@Getter
@Setter
@JsonIgnoreProperties(ignoreUnknown = true)
public class RequestPresignedURL extends Operation {
    /**
     * generated field's value
     */
    @JsonIgnore
    private String url = "/agreement/admin/localized-policy-versions/{localizedPolicyVersionId}/attachments";

    @JsonIgnore
    private String method = "POST";

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
    private String localizedPolicyVersionId;
    private UploadPolicyVersionAttachmentRequest body;

    /**
    * @param localizedPolicyVersionId required
    */
    public RequestPresignedURL(
            String localizedPolicyVersionId,
            UploadPolicyVersionAttachmentRequest body
    )
    {
        this.localizedPolicyVersionId = localizedPolicyVersionId;
        this.body = body;
    }

    @JsonIgnore
    public RequestPresignedURL createFromJson(String json) throws JsonProcessingException {
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
        if (this.localizedPolicyVersionId != null){
            pathParams.put("localizedPolicyVersionId", this.localizedPolicyVersionId);
        }
        return pathParams;
    }


    @Override
    @JsonIgnore
    public UploadPolicyVersionAttachmentRequest getBodyParams(){
        return this.body;
    }


    @Override
    @JsonIgnore
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return Operation.createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("localizedPolicyVersionId","localizedPolicyVersionId");
        return result;
    }

    @JsonIgnore
    public List<String> getAllRequiredFields() {
        return Arrays.asList(
            "localizedPolicyVersionId"
        );
    }

    @Override
    @JsonIgnore
    public boolean isValid() {
        if(this.localizedPolicyVersionId == null) {
            return false;
        }
        return true;
    }

    @Override
    @JsonIgnore
    public UploadLocalizedPolicyVersionAttachmentResponse parseResponse(int code, String contentTpe, InputStream payload) throws ResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 201){
            return new UploadLocalizedPolicyVersionAttachmentResponse().createFromJson(json);
        }
        throw new ResponseException(code, json);
    }

}