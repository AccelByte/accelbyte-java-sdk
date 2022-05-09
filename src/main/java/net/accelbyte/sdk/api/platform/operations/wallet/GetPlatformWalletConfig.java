/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.wallet;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.models.PlatformWalletConfigInfo;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * getPlatformWalletConfig
 *
 * Get platform wallet config list.
 * Other detail info:
 * 
 *   * Required permission : resource="ADMIN:NAMESPACE:{namespace}:WALLET:CONFIG", action=2 (READ)
 *   *  Returns : wallet info
 */
@Getter
@Setter
public class GetPlatformWalletConfig extends Operation {
    /**
     * generated field's value
     */
    private String path = "/platform/admin/namespaces/{namespace}/platforms/{platform}/wallet/config";
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
    private String platform;

    /**
    * @param namespace required
    * @param platform required
    */
    @Builder
    public GetPlatformWalletConfig(
            String namespace,
            String platform
    )
    {
        this.namespace = namespace;
        this.platform = platform;
        
        securities.add("Bearer");
    }

    @Override
    public Map<String, String> getPathParams(){
        Map<String, String> pathParams = new HashMap<>();
        if (this.namespace != null){
            pathParams.put("namespace", this.namespace);
        }
        if (this.platform != null){
            pathParams.put("platform", this.platform);
        }
        return pathParams;
    }





    @Override
    public boolean isValid() {
        if(this.namespace == null) {
            return false;
        }
        if(this.platform == null) {
            return false;
        }
        return true;
    }

    public PlatformWalletConfigInfo parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new PlatformWalletConfigInfo().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}