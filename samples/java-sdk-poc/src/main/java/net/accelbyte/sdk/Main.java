/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk;

import net.accelbyte.sdk.api.social.models.UserStatItemPagingSlicedResult;
import net.accelbyte.sdk.api.social.operations.user_statistic.GetUserStatItems;
import net.accelbyte.sdk.api.social.wrappers.UserStatistic;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;

import java.io.IOException;

public class Main {
    public static void main(String[] args) {

        // custom configuration
        HttpClient httpClient = new OkhttpClient();  // we can use another http implementation
        TokenRepository tokenRepository = DefaultTokenRepository.getInstance();  // can be customized
        ConfigRepository configRepository = new DefaultConfigRepository();
        AccelByteConfig sdkConfiguration = new AccelByteConfig(httpClient, tokenRepository, configRepository);
        AccelByteSDK customSDK = new AccelByteSDK(sdkConfiguration);

        // default configuration
        AccelByteSDK sdk = new AccelByteSDK(
                new OkhttpClient(),
                DefaultTokenRepository.getInstance(),
                new DefaultConfigRepository()
        );

        // hardcode token here to test
        // (will be implemented this on login inside core SDK class -> something like: sdk.login(username, password))
        DefaultTokenRepository.getInstance().storeToken("");

        //define sdk class and input parameter
        UserStatistic userStatistic = new UserStatistic(sdk);
        GetUserStatItems input = new GetUserStatItems(
                "accelbyte",
                "132",
                null,
                null,
                "testme",
                null);

        // http call
        try {
            UserStatItemPagingSlicedResult userStatItems = userStatistic.getUserStatItems(input);
            System.out.println("User ID is: " + userStatItems.getData().get(0).getUserId());
            System.out.println("Statistics value is: " + userStatItems.getData().get(0).getValue());
        } catch (ResponseException e) {
            System.out.println("Response Unsuccessful");
            System.out.println(e.getHttpCode());
            System.out.println(e.getErrorMessage());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
