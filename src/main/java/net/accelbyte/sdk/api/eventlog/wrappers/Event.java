package net.accelbyte.sdk.api.eventlog.wrappers;

import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.operations.event.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Event {

    private AccelByteSDK sdk;

    public Event(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsEventResponse getEventByNamespaceHandler(GetEventByNamespaceHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEventByNamespaceHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void postEventHandler(PostEventHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PostEventHandler()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsEventResponse getEventByEventIDHandler(GetEventByEventIDHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEventByEventIDHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsEventResponse getEventByEventTypeHandler(GetEventByEventTypeHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEventByEventTypeHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsEventResponse getEventByEventTypeAndEventIDHandler(GetEventByEventTypeAndEventIDHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEventByEventTypeAndEventIDHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsEventResponse getEventByUserIDHandler(GetEventByUserIDHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEventByUserIDHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsEventResponse getEventByUserIDAndEventIDHandler(GetEventByUserIDAndEventIDHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEventByUserIDAndEventIDHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsEventResponse getEventByUserIDAndEventTypeHandler(GetEventByUserIDAndEventTypeHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEventByUserIDAndEventTypeHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsEventResponse getEventByUserEventIDAndEventTypeHandler(GetEventByUserEventIDAndEventTypeHandler input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetEventByUserEventIDAndEventTypeHandler()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
