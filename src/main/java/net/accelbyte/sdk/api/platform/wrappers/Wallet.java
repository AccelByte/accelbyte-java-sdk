package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.wallet.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Wallet {

    private AccelByteSDK sdk;

    public Wallet(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void checkWallet(CheckWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new CheckWallet()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletInfo creditUserWallet(CreditUserWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreditUserWallet()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletInfo payWithUserWallet(PayWithUserWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PayWithUserWallet()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletInfo getUserWallet(GetUserWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserWallet()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletInfo debitUserWallet(DebitUserWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DebitUserWallet()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void disableUserWallet(DisableUserWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DisableUserWallet()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void enableUserWallet(EnableUserWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new EnableUserWallet()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletTransactionPagingSlicedResult listUserWalletTransactions(ListUserWalletTransactions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListUserWalletTransactions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletPagingSlicedResult queryWallets(QueryWallets input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryWallets()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletInfo getWallet(GetWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetWallet()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletInfo publicGetMyWallet(PublicGetMyWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetMyWallet()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletInfo publicGetWallet(PublicGetWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetWallet()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public WalletTransactionPagingSlicedResult publicListUserWalletTransactions(PublicListUserWalletTransactions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicListUserWalletTransactions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
