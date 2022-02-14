package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.input_validations.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class InputValidations {

    private AccelByteSDK sdk;

    public InputValidations(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    /**
     * @see AdminGetInputValidations
     */
    public ModelInputValidationsResponse adminGetInputValidations(AdminGetInputValidations input) throws ResponseException, IOException {
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
     * @see AdminUpdateInputValidations
     */
    public void adminUpdateInputValidations(AdminUpdateInputValidations input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          input
              .handleEmptyResponse(
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
     * @see AdminResetInputValidations
     */
    public void adminResetInputValidations(AdminResetInputValidations input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          input
              .handleEmptyResponse(
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
     * @see PublicGetInputValidations
     */
    public ModelInputValidationsPublicResponse publicGetInputValidations(PublicGetInputValidations input) throws ResponseException, IOException {
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
