/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.wrappers;

import java.util.*;

import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.api.chat.operations.config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Config {

    private AccelByteSDK sdk;

    public Config(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    /**
     * @see AdminGetAllConfigV1
     */
    public ModelsConfigList adminGetAllConfigV1(AdminGetAllConfigV1 input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminGetConfigV1
     */
    public ModelsConfigResponse adminGetConfigV1(AdminGetConfigV1 input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see AdminUpdateConfigV1
     */
    public ModelsConfigResponse adminUpdateConfigV1(AdminUpdateConfigV1 input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see ExportConfig
     */
    public List<ModelsConfigExport> exportConfig(ExportConfig input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

    /**
     * @see ImportConfig
     */
    public ModelsImportConfigResponse importConfig(ImportConfig input) throws Exception {
        final HttpResponse httpResponse = sdk.runRequest(input);
        return input
            .parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
        );
    }

}
