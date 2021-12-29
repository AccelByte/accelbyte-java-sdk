package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.ticket.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Ticket {

    private AccelByteSDK sdk;

    public Ticket(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public TicketDynamicInfo getTicketDynamic(GetTicketDynamic input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetTicketDynamic()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void decreaseTicketSale(DecreaseTicketSale input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DecreaseTicketSale()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TicketBoothID getTicketBoothID(GetTicketBoothID input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetTicketBoothID()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TicketSaleIncrementResult increaseTicketSale(IncreaseTicketSale input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new IncreaseTicketSale()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TicketAcquireResult acquireUserTicket(AcquireUserTicket input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AcquireUserTicket()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
