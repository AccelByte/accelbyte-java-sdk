package net.accelbyte.sdk.api.matchmaking.wrappers;

import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.api.matchmaking.operations.social_matchmaking.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class SocialMatchmaking {

    private AccelByteSDK sdk;

    public SocialMatchmaking(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsUpdatePlayerPlaytimeWeightResponse updatePlayTimeWeight(UpdatePlayTimeWeight input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

}
