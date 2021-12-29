package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.admin_channel.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class AdminChannel {

    private AccelByteSDK sdk;

    public AdminChannel(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsPaginatedGetChannelResponse singleAdminGetChannel(SingleAdminGetChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SingleAdminGetChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsChannelResponse adminCreateChannel(AdminCreateChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminCreateChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsChannelResponse singleAdminUpdateChannel(SingleAdminUpdateChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SingleAdminUpdateChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void singleAdminDeleteChannel(SingleAdminDeleteChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SingleAdminDeleteChannel()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedGetChannelResponse adminGetChannel(AdminGetChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsChannelResponse adminUpdateChannel(AdminUpdateChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateChannel()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteChannel(AdminDeleteChannel input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteChannel()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
