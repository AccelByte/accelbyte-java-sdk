package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.users_v4.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class UsersV4 {

    private AccelByteSDK sdk;

    public UsersV4(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelUserResponseV3 adminUpdateUserV4(AdminUpdateUserV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateUserV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminUpdateUserEmailAddressV4(AdminUpdateUserEmailAddressV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminUpdateUserEmailAddressV4()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelListUserRolesV4Response adminListUserRolesV4(AdminListUserRolesV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminListUserRolesV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelListUserRolesV4Response adminUpdateUserRoleV4(AdminUpdateUserRoleV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateUserRoleV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelListUserRolesV4Response adminAddUserRoleV4(AdminAddUserRoleV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminAddUserRoleV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminRemoveUserRoleV4(AdminRemoveUserRoleV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminRemoveUserRoleV4()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 adminUpdateMyUserV4(AdminUpdateMyUserV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateMyUserV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelInviteUserResponseV3 adminInviteUserV4(AdminInviteUserV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminInviteUserV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountCreateUserResponseV4 publicCreateTestUserV4(PublicCreateTestUserV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicCreateTestUserV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountCreateUserResponseV4 publicCreateUserV4(PublicCreateUserV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicCreateUserV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountCreateUserResponseV4 createUserFromInvitationV4(CreateUserFromInvitationV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateUserFromInvitationV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 publicUpdateUserV4(PublicUpdateUserV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicUpdateUserV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicUpdateUserEmailAddressV4(PublicUpdateUserEmailAddressV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicUpdateUserEmailAddressV4()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountUserResponseV4 publicUpgradeHeadlessAccountWithVerificationCodeV4(PublicUpgradeHeadlessAccountWithVerificationCodeV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicUpgradeHeadlessAccountWithVerificationCodeV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountUserResponseV4 publicUpgradeHeadlessAccountV4(PublicUpgradeHeadlessAccountV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicUpgradeHeadlessAccountV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
