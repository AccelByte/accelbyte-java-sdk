/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.operations.file_upload;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.models.FileUploadUrlInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * generatedUserUploadContentUrl
 *
 * Generate an upload URL for user content. It's valid for 10 minutes.
 * There are 2 kinds of storage limitation per user : maximum file count and maximum file size.
 * Other detail info:
 * 
 *   * Required permission : resource = "ADMIN:NAMESPACE:{namespace}:USER:{userId}:FILEUPLOAD" , action=1 (CREATE)
 *   *  Action code : 11102
 *   *  Default maximum file count per user : 10 files
 *   *  Default maximum file size per user : 104857600 bytes
 *   *  Returns : URL data
 */
@Getter
@Setter
public class GeneratedUserUploadContentUrl extends Operation {
    /**
     * generated field's value
     */
    private String url = "/basic/v1/admin/namespaces/{namespace}/users/{userId}/files";
    private String method = "POST";
    private List<String> consumes = Arrays.asList();
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String userId;
    private String fileType;

    /**
    * @param namespace required
    * @param userId required
    * @param fileType required
    */
    @Builder
    public GeneratedUserUploadContentUrl(
            String namespace,
            String userId,
            String fileType
    )
    {
        this.namespace = namespace;
        this.userId = userId;
        this.fileType = fileType;
        
        securities.add("Bearer");
    }

    public GeneratedUserUploadContentUrl createFromJson(String json) throws JsonProcessingException {
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
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("fileType", this.fileType == null ? null : Arrays.asList(this.fileType));
        return queryParams;
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
        if(this.fileType == null) {
            return false;
        }
        return true;
    }

    @Override
    public FileUploadUrlInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new FileUploadUrlInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("fileType", "None");
        return result;
    }
}