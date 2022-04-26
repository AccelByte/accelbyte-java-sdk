/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.FullAppInfo;
import net.accelbyte.sdk.api.platform.models.AppUpdate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * updateApp
 *
 * This API is used to update an app.
 * 
 * An app update example:
 * 
 * 
 *     {
 * 
 *       "developer": "accelbyte",
 * 
 *       "publisher": "accelbyte",
 * 
 *       "websiteUrl": "http://accelbyte.io",
 * 
 *       "forumUrl": "http://accelbyte.io",
 * 
 *       "platforms": ["Windows(allowed values: Windows, MacOS, Linux, IOS, Android)"],
 * 
 *       "platformRequirements": {
 * 
 *         "Windows": [
 * 
 *           {
 * 
 *             "label":"minimum(can be minimum or recommended)",
 * 
 *             "osVersion":"os version",
 * 
 *             "processor":"processor",
 * 
 *             "ram":"RAM",
 * 
 *             "graphics":"graphics",
 * 
 *             "directXVersion":"directXVersion",
 * 
 *             "diskSpace":"diskSpace",
 * 
 *             "soundCard":"soundCard",
 * 
 *             "additionals":"additionals"
 * 
 *           }
 * 
 *          ]
 * 
 *       },
 * 
 *       "carousel": [
 * 
 *         {
 * 
 *           "type":"image(allowed values: image, video)",
 * 
 *           "videoSource":"generic(allowed values:generic, youtube, viemo)",
 * 
 *           "url":"url",
 * 
 *           "alt":"alternative url or text",
 * 
 *           "thumbnailUrl":"thumbnail url",
 * 
 *           "previewUrl":"preview url",
 * 
 *         }
 * 
 *       ],
 * 
 *       "localizations": {
 * 
 *         "en": {
 * 
 *           "slogan":"slogan",
 * 
 *           "announcement":"announcement",
 * 
 *         }
 * 
 *       },
 * 
 *       "primaryGenre": "Action",
 * 
 *       "genres": ["Action", "Adventure"],
 * 
 *       "players": ["Single"],
 * 
 *       "releaseDate": "optional yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
 * 
 *     }
 * 
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:ITEM", action=4 (UPDATE)
 *   *  Returns : updated app data
 */
@Getter
@Setter
public class UpdateApp extends Operation {
    /**
     * generated field's value
     */
    private String url = "/platform/admin/namespaces/{namespace}/items/{itemId}/app";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String itemId;
    private String namespace;
    private String storeId;
    private AppUpdate body;

    /**
    * @param itemId required
    * @param namespace required
    * @param storeId required
    */
    @Builder
    public UpdateApp(
            String itemId,
            String namespace,
            String storeId,
            AppUpdate body
    )
    {
        this.itemId = itemId;
        this.namespace = namespace;
        this.storeId = storeId;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.itemId != null){
            pathParams.put("itemId", this.itemId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }

    @Override
    public Map<String, List<String>> getQueryParams(){
        Map<String, List<String>> queryParams = new HashMap<>();
        queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
        return queryParams;
    }


    @Override
    public AppUpdate getBodyParams(){
        return this.body;
    }


    @Override
    public String getFullUrl(String baseUrl) throws UnsupportedEncodingException {
        return createFullUrl(this.url, baseUrl, this.getPathParams(), this.getQueryParams(), this.getCollectionFormatMap());
    }

    @Override
    public boolean isValid() {
        if(this.itemId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        if(this.storeId == null) {
            return false;
        }
        return true;
    }

    public FullAppInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = this.convertInputStreamToString(payload);
        if(code == 200){
            return new FullAppInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

    @Override
    protected Map<String, String> getCollectionFormatMap() {
        Map<String, String> result = new HashMap<>();
        result.put("storeId", "None");
        return result;
    }
}