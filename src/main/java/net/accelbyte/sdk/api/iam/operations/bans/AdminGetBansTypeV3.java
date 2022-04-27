/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.operations.bans;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.models.AccountcommonBansV3;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.HttpResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

/**
 * AdminGetBansTypeV3
 *
 * Required permission 'ADMIN:BAN [READ]'
 * Ban type is the code
 * available for ban assignment. It is applicable globally for any namespace.
 * action code : 10201
 */
@Getter
@Setter
public class AdminGetBansTypeV3 extends Operation {
    /**
     * generated field's value
     */
    private String path = "/iam/v3/admin/bans";
    private String method = "GET";
    private List<String> consumes = Arrays.asList();
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
    public AdminGetBansTypeV3(
    )
    {
        
        securities.add("Bearer");
    }






    @Override
    public boolean isValid() {
        return true;
    }

    public AccountcommonBansV3 parseResponse(int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
        String json = Helper.convertInputStreamToString(payload);
        if(code == 200){
            return new AccountcommonBansV3().createFromJson(json);
        }
        throw new HttpResponseException(code, json);
    }

}