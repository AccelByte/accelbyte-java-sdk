/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.key_group;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.KeyGroupInfo;
import net.accelbyte.sdk.api.platform.models.KeyGroupUpdate;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * updateKeyGroup
 *
 * Update key group.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:KEYGROUP", action=4 (UPDATE)
 *   *  Returns : updated key group
 */
@Getter
@Setter
public class UpdateKeyGroup extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/keygroups/{keyGroupId}";
    private String method = "PUT";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */
    private String keyGroupId;
    private String namespace;
    private KeyGroupUpdate body;

    /**
    * @param keyGroupId required
    * @param namespace required
    */
    @Builder
    public UpdateKeyGroup(
            String keyGroupId,
            String namespace,
            KeyGroupUpdate body
    )
    {
        this.keyGroupId = keyGroupId;
        this.namespace = namespace;
        this.body = body;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.keyGroupId != null){
            pathParams.put("keyGroupId", this.keyGroupId);
        }
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        return pathParams;
    }



    @Override
    public KeyGroupUpdate getBodyParams(){
        return this.body;
    }


    @Override
    public boolean isValid() {
        if(this.keyGroupId == null) {
            return false;
        }
        if(this.namespace == null) {
            return false;
        }
        return true;
    }

    public KeyGroupInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new KeyGroupInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}