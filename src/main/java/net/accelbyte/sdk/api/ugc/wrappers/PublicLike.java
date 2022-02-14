package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.public_like.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class PublicLike {

    private AccelByteSDK sdk;

    public PublicLike(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    /**
     * @see GetLikedContent
     */
    public ModelsPaginatedContentDownloadResponse getLikedContent(GetLikedContent input) throws ResponseException, IOException {
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

    /**
     * @see UpdateContentLikeStatus
     */
    public ModelsContentLikeResponse updateContentLikeStatus(UpdateContentLikeStatus input) throws ResponseException, IOException {
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
