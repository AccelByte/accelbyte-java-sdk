package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.users.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Users {

    private AccelByteSDK sdk;

    public Users(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelUserCreateResponse createUser(CreateUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateUser()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetAdminUsersResponse getAdminUsersByRoleID(GetAdminUsersByRoleID input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAdminUsersByRoleID()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelPublicUserResponse getUserByLoginID(GetUserByLoginID input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserByLoginID()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelPublicUserResponse getUserByPlatformUserID(GetUserByPlatformUserID input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserByPlatformUserID()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void forgotPassword(ForgotPassword input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ForgotPassword()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelPublicUsersResponse getUsersByLoginIds(GetUsersByLoginIds input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUsersByLoginIds()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void resetPassword(ResetPassword input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ResetPassword()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelSearchUsersResponse searchUser(SearchUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SearchUser()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponse getUserByUserID(GetUserByUserID input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserByUserID()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponse updateUser(UpdateUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateUser()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteUser(DeleteUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteUser()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserBanResponse banUser(BanUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BanUser()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelUserBanResponse> getUserBanHistory(GetUserBanHistory input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserBanHistory()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserBanResponse disableUserBan(DisableUserBan input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DisableUserBan()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserBanResponse enableUserBan(EnableUserBan input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new EnableUserBan()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void listCrossNamespaceAccountLink(ListCrossNamespaceAccountLink input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ListCrossNamespaceAccountLink()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void disableUser(DisableUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DisableUser()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void enableUser(EnableUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new EnableUser()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserInformation getUserInformation(GetUserInformation input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserInformation()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteUserInformation(DeleteUserInformation input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteUserInformation()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelLoginHistoriesResponse getUserLoginHistories(GetUserLoginHistories input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserLoginHistories()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void updatePassword(UpdatePassword input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdatePassword()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void saveUserPermission(SaveUserPermission input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SaveUserPermission()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void addUserPermission(AddUserPermission input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AddUserPermission()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteUserPermission(DeleteUserPermission input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteUserPermission()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<AccountcommonUserLinkedPlatform> getUserPlatformAccounts(GetUserPlatformAccounts input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserPlatformAccounts()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetUserMapping getUserMapping(GetUserMapping input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserMapping()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetUserJusticePlatformAccountResponse getUserJusticePlatformAccount(GetUserJusticePlatformAccount input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserJusticePlatformAccount()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void platformLink(PlatformLink input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PlatformLink()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void platformUnlink(PlatformUnlink input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PlatformUnlink()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetPublisherUserResponse getPublisherUser(GetPublisherUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetPublisherUser()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void saveUserRoles(SaveUserRoles input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SaveUserRoles()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void addUserRole(AddUserRole input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AddUserRole()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteUserRole(DeleteUserRole input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteUserRole()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponse upgradeHeadlessAccount(UpgradeHeadlessAccount input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpgradeHeadlessAccount()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponse upgradeHeadlessAccountWithVerificationCode(UpgradeHeadlessAccountWithVerificationCode input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpgradeHeadlessAccountWithVerificationCode()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void userVerification(UserVerification input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UserVerification()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void sendVerificationCode(SendVerificationCode input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SendVerificationCode()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelAgeRestrictionResponse adminGetAgeRestrictionStatusV2(AdminGetAgeRestrictionStatusV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetAgeRestrictionStatusV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelAgeRestrictionResponse adminUpdateAgeRestrictionConfigV2(AdminUpdateAgeRestrictionConfigV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateAgeRestrictionConfigV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<AccountcommonCountryAgeRestriction> getListCountryAgeRestriction(GetListCountryAgeRestriction input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetListCountryAgeRestriction()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelCountry updateCountryAgeRestriction(UpdateCountryAgeRestriction input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateCountryAgeRestriction()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelSearchUsersByPlatformIDResponse adminSearchUsersV2(AdminSearchUsersV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminSearchUsersV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponse adminGetUserByUserIdV2(AdminGetUserByUserIdV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserByUserIdV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponse adminUpdateUserV2(AdminUpdateUserV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateUserV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserBanResponse adminBanUserV2(AdminBanUserV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminBanUserV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelUserBanResponse> adminGetUserBanV2(AdminGetUserBanV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserBanV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDisableUserV2(AdminDisableUserV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDisableUserV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminEnableUserV2(AdminEnableUserV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminEnableUserV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminResetPasswordV2(AdminResetPasswordV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminResetPasswordV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeletePlatformLinkV2(AdminDeletePlatformLinkV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeletePlatformLinkV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminPutUserRolesV2(AdminPutUserRolesV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminPutUserRolesV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminCreateUserRolesV2(AdminCreateUserRolesV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminCreateUserRolesV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserCreateResponse publicCreateUserV2(PublicCreateUserV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicCreateUserV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicForgotPasswordV2(PublicForgotPasswordV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicForgotPasswordV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicResetPasswordV2(PublicResetPasswordV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicResetPasswordV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponse publicGetUserByUserIDV2(PublicGetUserByUserIDV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserByUserIDV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelUserResponse> publicUpdateUserV2(PublicUpdateUserV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicUpdateUserV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelUserBanResponse> publicGetUserBan(PublicGetUserBan input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserBan()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicUpdatePasswordV2(PublicUpdatePasswordV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicUpdatePasswordV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelGetUserMapping> getListJusticePlatformAccounts(GetListJusticePlatformAccounts input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetListJusticePlatformAccounts()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicPlatformLinkV2(PublicPlatformLinkV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicPlatformLinkV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicDeletePlatformLinkV2(PublicDeletePlatformLinkV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicDeletePlatformLinkV2()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetUsersResponseWithPaginationV3 listAdminsV3(ListAdminsV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListAdminsV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelAgeRestrictionResponseV3 adminGetAgeRestrictionStatusV3(AdminGetAgeRestrictionStatusV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetAgeRestrictionStatusV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelAgeRestrictionResponseV3 adminUpdateAgeRestrictionConfigV3(AdminUpdateAgeRestrictionConfigV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateAgeRestrictionConfigV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelCountryV3Response> adminGetListCountryAgeRestrictionV3(AdminGetListCountryAgeRestrictionV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetListCountryAgeRestrictionV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelCountryV3Response adminUpdateCountryAgeRestrictionV3(AdminUpdateCountryAgeRestrictionV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateCountryAgeRestrictionV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 adminGetUserByPlatformUserIDV3(AdminGetUserByPlatformUserIDV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserByPlatformUserIDV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetUsersResponseWithPaginationV3 getAdminUsersByRoleIdV3(GetAdminUsersByRoleIdV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAdminUsersByRoleIdV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 adminGetUserByEmailAddressV3(AdminGetUserByEmailAddressV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserByEmailAddressV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelInviteUserResponseV3 adminInviteUserV3(AdminInviteUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminInviteUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountcommonListUsersWithPlatformAccountsResponse adminListUsersV3(AdminListUsersV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminListUsersV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelSearchUsersResponseWithPaginationV3 adminSearchUserV3(AdminSearchUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminSearchUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelListUserResponseV3 adminGetBulkUserByEmailAddressV3(AdminGetBulkUserByEmailAddressV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetBulkUserByEmailAddressV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 adminGetUserByUserIdV3(AdminGetUserByUserIdV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserByUserIdV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 adminUpdateUserV3(AdminUpdateUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetUserBanV3Response adminGetUserBanV3(AdminGetUserBanV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserBanV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserBanResponseV3 adminBanUserV3(AdminBanUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminBanUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserBanResponseV3 adminUpdateUserBanV3(AdminUpdateUserBanV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateUserBanV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminSendVerificationCodeV3(AdminSendVerificationCodeV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminSendVerificationCodeV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminVerifyAccountV3(AdminVerifyAccountV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminVerifyAccountV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelVerificationCodeResponse getUserVerificationCode(GetUserVerificationCode input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserVerificationCode()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserDeletionStatusResponse adminGetUserDeletionStatusV3(AdminGetUserDeletionStatusV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserDeletionStatusV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminUpdateUserDeletionStatusV3(AdminUpdateUserDeletionStatusV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminUpdateUserDeletionStatusV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 adminUpgradeHeadlessAccountV3(AdminUpgradeHeadlessAccountV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpgradeHeadlessAccountV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteUserInformationV3(AdminDeleteUserInformationV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteUserInformationV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelLoginHistoriesResponse adminGetUserLoginHistoriesV3(AdminGetUserLoginHistoriesV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserLoginHistoriesV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminUpdateUserPermissionV3(AdminUpdateUserPermissionV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminUpdateUserPermissionV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminAddUserPermissionsV3(AdminAddUserPermissionsV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminAddUserPermissionsV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteUserPermissionBulkV3(AdminDeleteUserPermissionBulkV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteUserPermissionBulkV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteUserPermissionV3(AdminDeleteUserPermissionV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteUserPermissionV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountcommonUserLinkedPlatformsResponseV3 adminGetUserPlatformAccountsV3(AdminGetUserPlatformAccountsV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserPlatformAccountsV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelGetUserMapping> adminGetListJusticePlatformAccounts(AdminGetListJusticePlatformAccounts input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetListJusticePlatformAccounts()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelCreateJusticeUserResponse adminCreateJusticeUser(AdminCreateJusticeUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminCreateJusticeUser()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminLinkPlatformAccount(AdminLinkPlatformAccount input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminLinkPlatformAccount()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminPlatformUnlinkV3(AdminPlatformUnlinkV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminPlatformUnlinkV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminPlatformLinkV3(AdminPlatformLinkV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminPlatformLinkV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteUserRolesV3(AdminDeleteUserRolesV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteUserRolesV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminSaveUserRoleV3(AdminSaveUserRoleV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminSaveUserRoleV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminAddUserRoleV3(AdminAddUserRoleV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminAddUserRoleV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteUserRoleV3(AdminDeleteUserRoleV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteUserRoleV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminUpdateUserStatusV3(AdminUpdateUserStatusV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminUpdateUserStatusV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminVerifyUserWithoutVerificationCodeV3(AdminVerifyUserWithoutVerificationCodeV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminVerifyUserWithoutVerificationCodeV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 adminGetMyUserV3(AdminGetMyUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetMyUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountcommonUserPlatforms publicListUserIDByPlatformUserIDsV3(PublicListUserIDByPlatformUserIDsV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicListUserIDByPlatformUserIDsV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 publicGetUserByPlatformUserIDV3(PublicGetUserByPlatformUserIDV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserByPlatformUserIDV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelLinkRequest publicGetAsyncStatus(PublicGetAsyncStatus input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetAsyncStatus()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelPublicUserInformationResponseV3 publicSearchUserV3(PublicSearchUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicSearchUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserCreateResponseV3 publicCreateUserV3(PublicCreateUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicCreateUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelListBulkUserGameResponse publicBulkGetUsers(PublicBulkGetUsers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicBulkGetUsers()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicForgotPasswordV3(PublicForgotPasswordV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicForgotPasswordV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserInvitationV3 getAdminInvitationV3(GetAdminInvitationV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAdminInvitationV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserCreateResponseV3 createUserFromInvitationV3(CreateUserFromInvitationV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateUserFromInvitationV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelUserResponseV3> updateUserV3(UpdateUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelUserResponseV3> publicUpdateUserV3(PublicUpdateUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicUpdateUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicSendVerificationCodeV3(PublicSendVerificationCodeV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicSendVerificationCodeV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicUserVerificationV3(PublicUserVerificationV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicUserVerificationV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 publicUpgradeHeadlessAccountV3(PublicUpgradeHeadlessAccountV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicUpgradeHeadlessAccountV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 publicVerifyHeadlessAccountV3(PublicVerifyHeadlessAccountV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicVerifyHeadlessAccountV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicUpdatePasswordV3(PublicUpdatePasswordV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicUpdatePasswordV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelCreateJusticeUserResponse publicCreateJusticeUser(PublicCreateJusticeUser input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicCreateJusticeUser()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicPlatformLinkV3(PublicPlatformLinkV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicPlatformLinkV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicPlatformUnlinkV3(PublicPlatformUnlinkV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicPlatformUnlinkV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelWebLinkingResponse publicWebLinkPlatform(PublicWebLinkPlatform input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicWebLinkPlatform()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public String publicWebLinkPlatformEstablish(PublicWebLinkPlatformEstablish input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicWebLinkPlatformEstablish()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void resetPasswordV3(ResetPasswordV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ResetPasswordV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelPublicUserResponseV3 publicGetUserByUserIdV3(PublicGetUserByUserIdV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserByUserIdV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelGetUserBanV3Response publicGetUserBanHistoryV3(PublicGetUserBanHistoryV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserBanHistoryV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelLoginHistoriesResponse publicGetUserLoginHistoriesV3(PublicGetUserLoginHistoriesV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserLoginHistoriesV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountcommonUserLinkedPlatformsResponseV3 publicGetUserPlatformAccountsV3(PublicGetUserPlatformAccountsV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserPlatformAccountsV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicLinkPlatformAccount(PublicLinkPlatformAccount input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicLinkPlatformAccount()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicValidateUserByUserIDAndPasswordV3(PublicValidateUserByUserIDAndPasswordV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicValidateUserByUserIDAndPasswordV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelUserResponseV3 publicGetMyUserV3(PublicGetMyUserV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetMyUserV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
