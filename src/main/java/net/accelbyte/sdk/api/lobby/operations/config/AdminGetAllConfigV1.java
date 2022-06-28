/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.config;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.models.ModelsConfigList;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * adminGetAllConfigV1
 *
 * Required permission : `ADMIN:NAMESPACE:*:LOBBY:CONFIG [READ]` with scope `social`
 * 
 * get lobby config of all namespaces.
 */
@Getter
@Setter
public class AdminGetAllConfigV1 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/lobby/v1/admin/config";
    private String method = "GET";
    private List<String> consumes = Arrays.asList("application/json");
    private List<String> produces = Arrays.asList("application/json");
    @Deprecated
    private String security = "Bearer";
    private String locationQuery = null;
    /**
     * fields as input parameter
     */

    /**
    */
    @Builder
    public AdminGetAllConfigV1(
    )
    {
        
        securities.add("Bearer");
    }






    @Override
    public boolean isValid() {
        return true;
    }

    public ModelsConfigList parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new ModelsConfigList().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}