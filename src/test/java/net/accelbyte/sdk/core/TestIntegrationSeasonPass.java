/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.fasterxml.jackson.databind.json.JsonMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.UUID;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import org.jetbrains.annotations.NotNull;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

import net.accelbyte.sdk.api.platform.models.StoreInfo;
import net.accelbyte.sdk.api.platform.models.StoreCreate;
import net.accelbyte.sdk.api.platform.models.CategoryCreate;
import net.accelbyte.sdk.api.platform.models.FullCategoryInfo;
import net.accelbyte.sdk.api.platform.models.ItemCreate;
import net.accelbyte.sdk.api.platform.models.ItemInfo;
import net.accelbyte.sdk.api.platform.models.FullItemInfo;
import net.accelbyte.sdk.api.platform.models.RegionDataItem;
//import net.accelbyte.sdk.api.platform.models.Localization;
import net.accelbyte.sdk.api.platform.operations.store.ListStores;
import net.accelbyte.sdk.api.platform.operations.store.CreateStore;
import net.accelbyte.sdk.api.platform.operations.store.DeleteStore;
import net.accelbyte.sdk.api.platform.operations.category.CreateCategory;
import net.accelbyte.sdk.api.platform.operations.item.CreateItem;
import net.accelbyte.sdk.api.platform.wrappers.Store;
import net.accelbyte.sdk.api.platform.wrappers.Category;
import net.accelbyte.sdk.api.platform.wrappers.Item;

import net.accelbyte.sdk.api.seasonpass.models.SeasonCreate;
import net.accelbyte.sdk.api.seasonpass.models.SeasonInfo;
import net.accelbyte.sdk.api.seasonpass.models.SeasonUpdate;
import net.accelbyte.sdk.api.seasonpass.operations.season.CreateSeason;
import net.accelbyte.sdk.api.seasonpass.operations.season.GetSeason;
import net.accelbyte.sdk.api.seasonpass.operations.season.UpdateSeason;
import net.accelbyte.sdk.api.seasonpass.operations.season.DeleteSeason;
import net.accelbyte.sdk.api.seasonpass.wrappers.Season;

import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy;
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy.RetryIntervalType;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.client.OkhttpWebSocketClient;
import net.accelbyte.sdk.core.client.ReliableHttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRefreshRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class TestIntegrationSeasonPass {
  private AccelByteSDK sdk;
  private String namespace;
  private String username;
  private String password;

  @BeforeAll
  public void setup() throws Exception {
    final HttpClient<?> httpClient = new OkhttpClient();
    final TokenRepository tokenRepo = DefaultTokenRepository.getInstance();
    final ConfigRepository configRepo = new DefaultConfigRepository();
    final AccelByteConfig sdkConfig = new AccelByteConfig(httpClient, tokenRepo, configRepo);

    final String baseUrl = configRepo.getBaseURL();
    final String clientId = configRepo.getClientId();
    final String clientSecret = configRepo.getClientSecret();
    final String username = System.getenv("AB_USERNAME");
    final String password = System.getenv("AB_PASSWORD");
    final String namespace = System.getenv("AB_NAMESPACE");

    assertTrue(baseUrl != null && !baseUrl.isEmpty());
    assertTrue(clientId != null && !clientId.isEmpty());
    assertTrue(clientSecret != null && !clientSecret.isEmpty());
    assertTrue(username != null && !username.isEmpty());
    assertTrue(password != null && !password.isEmpty());
    assertTrue(namespace != null && !namespace.isEmpty());

    this.sdk = new AccelByteSDK(sdkConfig);
    this.namespace = namespace;
    this.username = username;
    this.password = password;

    final boolean isLoginUserOk = sdk.loginUser(username, password);
    final String token = tokenRepo.getToken();

    assertTrue(isLoginUserOk);
    assertTrue(token != null && !token.isEmpty());
  }

  @Test
  @Order(1)
  public void testSeasonPass() throws Exception {

    final String storeTitle = "Java Server SDK Season Store";
    final String categoryPath = "/" + java.util.UUID.randomUUID().toString().replaceAll("-","");
    final String itemName = "Item_SEASON_Tier1";
    final String seasonName = "JavaServerSDKTestSeason";
    final String seasonNameforUpdate = "JavaServerSDKTestSeasonUpdated";

    final Store platformStoreWrapper = new Store(sdk);
    final Category platformCategoryWrapper = new Category(sdk);
    final Item platformItemWrapper = new Item(sdk);
    final Season seasonWrapper = new Season(sdk);

    // Get or Create Store
    final List<StoreInfo> storeListResp =
      platformStoreWrapper.listStores(
        ListStores.builder()
          .namespace(this.namespace)
          .build());
    assertNotNull(storeListResp);    

    StoreInfo selectedStore = null;
    if (storeListResp.size() > 0) {
        selectedStore = storeListResp.get(0);
    } else {
        final StoreCreate storeCreate =
          StoreCreate.builder()
            .defaultLanguage("en-US")
            .defaultRegion("US")
            .description(storeTitle)
            .title(storeTitle)
            .build();

        selectedStore =
          platformStoreWrapper.createStore(
            CreateStore.builder()
              .body(storeCreate)
              .namespace(this.namespace)
              .build());
    }

    // Create Category
    Map<String, String> lDisplayNames = new HashMap<>();
    lDisplayNames.put("en-US", categoryPath);
    
    final CategoryCreate createCategoryReq =
      CategoryCreate.builder()
        .categoryPath(categoryPath)
        .localizationDisplayNames(lDisplayNames)
        .build();

    final FullCategoryInfo categoryInfo = platformCategoryWrapper.createCategory(
      CreateCategory.builder()
        .namespace(this.namespace)
        .storeId(selectedStore.getStoreId())
        .body(createCategoryReq)
        .build());

    // Create Item
    final net.accelbyte.sdk.api.platform.models.Localization usLocalName =
      net.accelbyte.sdk.api.platform.models.Localization.builder()
        .title(itemName)
        .build();
    final Map<String, net.accelbyte.sdk.api.platform.models.Localization> mapLocalizations = new HashMap<>();
    mapLocalizations.put("en-US",usLocalName);

    final RegionDataItem regionDataItem =
      RegionDataItem.builder()
        .currencyCode("USD")
        .currencyNamespace(this.namespace)
        .currencyTypeFromEnum(RegionDataItem.CurrencyType.REAL)
        .price(10)
        .build();
    final Map<String, List<RegionDataItem>> mapRegions = new HashMap<>();
    final List<RegionDataItem> regionsList = new ArrayList<>();
    regionsList.add(regionDataItem);
    mapRegions.put("US",regionsList);

    final ItemCreate newItemReq = 
      ItemCreate.builder()
        .categoryPath(categoryPath)
        .entitlementTypeFromEnum(ItemCreate.EntitlementType.DURABLE)
        .itemTypeFromEnum(ItemCreate.ItemType.SEASON)
        .localizations(mapLocalizations)
        .name(itemName)
        .regionData(mapRegions)
        .seasonTypeFromEnum(ItemCreate.SeasonType.TIER)
        .statusFromEnum(ItemCreate.Status.ACTIVE)
        .maxCount(1000)
        .maxCountPerUser(1000)
        .useCount(0)
        .listable(true)
        .purchasable(true)
        .build();

    final FullItemInfo itemInfo = platformItemWrapper.createItem(
      CreateItem.builder()
        .namespace(this.namespace)
        .storeId(selectedStore.getStoreId())
        .body(newItemReq).build());
    assertNotNull(itemInfo);

    // Create Season
    final net.accelbyte.sdk.api.seasonpass.models.Localization englishSPLocalName = 
      net.accelbyte.sdk.api.seasonpass.models.Localization.builder()
        .title("English")
        .description("English")
        .build();
    Map<String, net.accelbyte.sdk.api.seasonpass.models.Localization> mapSeasonLocals = new HashMap<>();
    mapSeasonLocals.put("en", englishSPLocalName);

    final LocalDateTime cNow = LocalDateTime.now();
    final LocalDateTime cLater = cNow.plusDays(7);

    final SeasonCreate newSeasonReq =
      SeasonCreate.builder()
        .name(seasonName)
        .start(cNow.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")))
        .end(cLater.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")))
        .defaultRequiredExp(100)
        .draftStoreId(selectedStore.getStoreId())
        .tierItemId(itemInfo.getItemId())
        .localizations(mapSeasonLocals)
        .defaultLanguage("en")
        .build();
    
    final SeasonInfo seasonInfo = seasonWrapper.createSeason(
      CreateSeason.builder()
        .namespace(this.namespace)
        .body(newSeasonReq).build());
    assertNotNull(seasonInfo);

    //Get Season
    final SeasonInfo gSessionData = seasonWrapper.getSeason(
      GetSeason.builder()
        .namespace(this.namespace)
        .seasonId(seasonInfo.getId()).build());
    assertNotNull(gSessionData);

    //Update Season
    final SeasonUpdate updateReq =
      SeasonUpdate.builder()
        .name(seasonNameforUpdate)
        .build();

    final SeasonInfo uSessionData = seasonWrapper.updateSeason(
      UpdateSeason.builder()
        .namespace(this.namespace)
        .seasonId(seasonInfo.getId())
        .body(updateReq).build());
    assertNotNull(uSessionData);

    //Delete Season
    seasonWrapper.deleteSeason(
      DeleteSeason.builder()
        .namespace(this.namespace)
        .seasonId(seasonInfo.getId()).build());

    //CleanUp - Delete Store
    final StoreInfo deleteStoreResult = platformStoreWrapper.deleteStore(
      DeleteStore.builder()
        .namespace(this.namespace)
        .storeId(selectedStore.getStoreId()).build());
    assertNotNull(deleteStoreResult);

  }

  @AfterAll
  public void tear() throws Exception {
    final boolean isLogoutOk = sdk.logout();
    final String token = sdk.getSdkConfiguration().getTokenRepository().getToken();

    assertTrue(isLogoutOk);
    assertTrue(token == null || token.isEmpty());
  }
}