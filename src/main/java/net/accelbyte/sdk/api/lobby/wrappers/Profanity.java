package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.profanity.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Profanity {

    private AccelByteSDK sdk;

    public Profanity(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<ModelsProfanityFilter> adminDebugProfanityFilters(AdminDebugProfanityFilters input) throws ResponseException, IOException {
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

    public ModelsAdminGetProfanityListFiltersV1Response adminGetProfanityListFiltersV1(AdminGetProfanityListFiltersV1 input) throws ResponseException, IOException {
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

    public void adminAddProfanityFilterIntoList(AdminAddProfanityFilterIntoList input) throws ResponseException, IOException {
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

    public void adminAddProfanityFilters(AdminAddProfanityFilters input) throws ResponseException, IOException {
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

    public void adminImportProfanityFiltersFromFile(AdminImportProfanityFiltersFromFile input) throws ResponseException, IOException {
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

    public List<ModelsProfanityFilter> adminDeleteProfanityFilter(AdminDeleteProfanityFilter input) throws ResponseException, IOException {
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

    public List<ModelsAdminGetProfanityListsListResponse> adminGetProfanityLists(AdminGetProfanityLists input) throws ResponseException, IOException {
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

    public void adminCreateProfanityList(AdminCreateProfanityList input) throws ResponseException, IOException {
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

    public void adminUpdateProfanityList(AdminUpdateProfanityList input) throws ResponseException, IOException {
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

    public void adminDeleteProfanityList(AdminDeleteProfanityList input) throws ResponseException, IOException {
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

    public ModelsProfanityRule adminGetProfanityRule(AdminGetProfanityRule input) throws ResponseException, IOException {
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

    public void adminSetProfanityRuleForNamespace(AdminSetProfanityRuleForNamespace input) throws ResponseException, IOException {
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

    public ModelsAdminVerifyMessageProfanityResponse adminVerifyMessageProfanityResponse(AdminVerifyMessageProfanityResponse input) throws ResponseException, IOException {
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
