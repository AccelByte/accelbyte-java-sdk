/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.clients.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Clients {

  private AccelByteSDK sdk;

  public Clients(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetClients
   * @deprecated
   */
  @Deprecated
  public List<ClientmodelClientResponse> getClients(GetClients input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateClient
   * @deprecated
   */
  @Deprecated
  public ClientmodelClientCreationResponse createClient(CreateClient input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetClient
   * @deprecated
   */
  @Deprecated
  public ClientmodelClientResponse getClient(GetClient input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateClient
   * @deprecated
   */
  @Deprecated
  public ClientmodelClientResponse updateClient(UpdateClient input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteClient
   * @deprecated
   */
  @Deprecated
  public void deleteClient(DeleteClient input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateClientPermission
   * @deprecated
   */
  @Deprecated
  public void updateClientPermission(UpdateClientPermission input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddClientPermission
   * @deprecated
   */
  @Deprecated
  public void addClientPermission(AddClientPermission input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteClientPermission
   * @deprecated
   */
  @Deprecated
  public void deleteClientPermission(DeleteClientPermission input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateClientSecret
   * @deprecated
   */
  @Deprecated
  public void updateClientSecret(UpdateClientSecret input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetClientsbyNamespace
   * @deprecated
   */
  @Deprecated
  public List<ClientmodelClientResponse> getClientsbyNamespace(GetClientsbyNamespace input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateClientByNamespace
   * @deprecated
   */
  @Deprecated
  public ClientmodelClientCreationResponse createClientByNamespace(CreateClientByNamespace input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteClientByNamespace
   * @deprecated
   */
  @Deprecated
  public void deleteClientByNamespace(DeleteClientByNamespace input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetClientsByNamespaceV3
   */
  public ClientmodelClientsV3Response adminGetClientsByNamespaceV3(
      AdminGetClientsByNamespaceV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateClientV3
   */
  public ClientmodelClientV3Response adminCreateClientV3(AdminCreateClientV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetClientsbyNamespacebyIDV3
   */
  public ClientmodelClientV3Response adminGetClientsbyNamespacebyIDV3(
      AdminGetClientsbyNamespacebyIDV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteClientV3
   */
  public void adminDeleteClientV3(AdminDeleteClientV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateClientV3
   */
  public ClientmodelClientV3Response adminUpdateClientV3(AdminUpdateClientV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateClientPermissionV3
   */
  public void adminUpdateClientPermissionV3(AdminUpdateClientPermissionV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddClientPermissionsV3
   */
  public void adminAddClientPermissionsV3(AdminAddClientPermissionsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteClientPermissionV3
   */
  public void adminDeleteClientPermissionV3(AdminDeleteClientPermissionV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateClientSecretV3
   */
  public void adminUpdateClientSecretV3(AdminUpdateClientSecretV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
