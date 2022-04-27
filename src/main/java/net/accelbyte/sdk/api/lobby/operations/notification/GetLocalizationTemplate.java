/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.notification;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelTemplateLocalization;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * getLocalizationTemplate
 *
 * Required permission : `NAMESPACE:{namespace}:TEMPLATE [READ]` with scope `social`
 * 
 * Get a template localization
 */
@Getter
@Setter
public class GetLocalizationTemplate extends Operation {
    /**
     * generated field's value
     */
    private String path = "/notification/namespaces/{namespace}/templates/{templateSlug}/languages/{templateLanguage}";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String namespace;
    private String templateLanguage;
    private String templateSlug;

    /**
    * @param namespace required
    * @param templateLanguage required
    * @param templateSlug required
    */
    @Builder
    public GetLocalizationTemplate(
            String namespace,
            String templateLanguage,
            String templateSlug
    )
    {
        this.namespace = namespace;
        this.templateLanguage = templateLanguage;
        this.templateSlug = templateSlug;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.templateLanguage != null){
            pathParams.put("templateLanguage", this.templateLanguage);
        }
        if (this.templateSlug != null){
            pathParams.put("templateSlug", this.templateSlug);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.templateLanguage == null) {
            return false;
        }
        if(this.templateSlug == null) {
            return false;
        }
        return true;
    }

    public ModelTemplateLocalization parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelTemplateLocalization().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}