/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.category.CreateCategory;
import net.accelbyte.sdk.api.platform.operations.item.CreateItem;
import net.accelbyte.sdk.api.platform.operations.store.CreateStore;
import net.accelbyte.sdk.api.platform.operations.store.DeleteStore;
import net.accelbyte.sdk.api.platform.operations.store.ListStores;
import net.accelbyte.sdk.api.platform.wrappers.Category;
import net.accelbyte.sdk.api.platform.wrappers.Item;
import net.accelbyte.sdk.api.platform.wrappers.Store;
import net.accelbyte.sdk.api.seasonpass.models.SeasonCreate;
import net.accelbyte.sdk.api.seasonpass.models.SeasonInfo;
import net.accelbyte.sdk.api.seasonpass.models.SeasonUpdate;
import net.accelbyte.sdk.api.seasonpass.operations.season.CreateSeason;
import net.accelbyte.sdk.api.seasonpass.operations.season.DeleteSeason;
import net.accelbyte.sdk.api.seasonpass.operations.season.GetSeason;
import net.accelbyte.sdk.api.seasonpass.operations.season.UpdateSeason;
import net.accelbyte.sdk.api.seasonpass.wrappers.Season;
import org.junit.jupiter.api.*;
import org.junit.jupiter.api.Order;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class TestIntegrationServiceSeasonPass extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {

    final String storeTitle = "Java Server SDK Season Store";
    final String categoryPath = "/" + java.util.UUID.randomUUID().toString().replaceAll("-", "");
    final String itemName = "Item_SEASON_Tier1";
    final String seasonName = "JavaServerSDKTestSeason";
    final String seasonNameUpdated = "JavaServerSDKTestSeasonUpdated";

    final Store platformStoreWrapper = new Store(sdk);
    final Category platformCategoryWrapper = new Category(sdk);
    final Item platformItemWrapper = new Item(sdk);
    final Season seasonWrapper = new Season(sdk);

    // Get or create store

    final List<StoreInfo> storeListResp =
        platformStoreWrapper.listStores(ListStores.builder().namespace(this.namespace).build());
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
              CreateStore.builder().body(storeCreate).namespace(this.namespace).build());
    }

    // Create category

    Map<String, String> lDisplayNames = new HashMap<>();
    lDisplayNames.put("en-US", categoryPath);

    final CategoryCreate createCategoryBody =
        CategoryCreate.builder()
            .categoryPath(categoryPath)
            .localizationDisplayNames(lDisplayNames)
            .build();

    platformCategoryWrapper.createCategory(
        CreateCategory.builder()
            .namespace(this.namespace)
            .storeId(selectedStore.getStoreId())
            .body(createCategoryBody)
            .build());

    // Create item

    final net.accelbyte.sdk.api.platform.models.Localization usLocalName =
        net.accelbyte.sdk.api.platform.models.Localization.builder().title(itemName).build();
    final Map<String, net.accelbyte.sdk.api.platform.models.Localization> mapLocalizations =
        new HashMap<>();
    mapLocalizations.put("en-US", usLocalName);

    final RegionDataItemDTO regionDataItem =
        RegionDataItemDTO.builder()
            .currencyCode("USD")
            .currencyNamespace("accelbyte")
            .currencyTypeFromEnum(RegionDataItemDTO.CurrencyType.REAL)
            .price(10)
            .build();
    final Map<String, List<RegionDataItemDTO>> mapRegions = new HashMap<>();
    final List<RegionDataItemDTO> regionsList = new ArrayList<>();
    regionsList.add(regionDataItem);
    mapRegions.put("US", regionsList);

    final ItemCreate createItemBody =
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

    final FullItemInfo createItemResult =
        platformItemWrapper.createItem(
            CreateItem.builder()
                .namespace(this.namespace)
                .storeId(selectedStore.getStoreId())
                .body(createItemBody)
                .build());

    assertNotNull(createItemResult);

    // CASE Create season

    final net.accelbyte.sdk.api.seasonpass.models.Localization englishSPLocalName =
        net.accelbyte.sdk.api.seasonpass.models.Localization.builder()
            .title("English")
            .description("English")
            .build();

    Map<String, net.accelbyte.sdk.api.seasonpass.models.Localization> mapSeasonLocals =
        new HashMap<>();

    mapSeasonLocals.put("en", englishSPLocalName);

    final LocalDateTime now = LocalDateTime.now();
    final String seasonStart =
        now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));
    final String seasonEnd =
        now.plusDays(7).format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));

    final SeasonCreate createSeasonBody =
        SeasonCreate.builder()
            .name(seasonName)
            .start(seasonStart)
            .end(seasonEnd)
            .defaultRequiredExp(100)
            .draftStoreId(selectedStore.getStoreId())
            .tierItemId(createItemResult.getItemId())
            .localizations(mapSeasonLocals)
            .defaultLanguage("en")
            .build();

    final SeasonInfo createSeasonResult =
        seasonWrapper.createSeason(
            CreateSeason.builder().namespace(this.namespace).body(createSeasonBody).build());

    // ESAC

    assertNotNull(createSeasonResult);

    // CASE Get Season

    final SeasonInfo getSeasonResult =
        seasonWrapper.getSeason(
            GetSeason.builder()
                .namespace(this.namespace)
                .seasonId(createSeasonResult.getId())
                .build());

    // ESAC

    assertNotNull(getSeasonResult);

    // CASE Update season

    final SeasonUpdate updateSeasonBody = SeasonUpdate.builder().name(seasonNameUpdated).build();

    final SeasonInfo updateSeasonResult =
        seasonWrapper.updateSeason(
            UpdateSeason.builder()
                .namespace(this.namespace)
                .seasonId(createSeasonResult.getId())
                .body(updateSeasonBody)
                .build());

    // ESAC

    assertNotNull(updateSeasonResult);

    // CASE Delete Sseason

    seasonWrapper.deleteSeason(
        DeleteSeason.builder()
            .namespace(this.namespace)
            .seasonId(createSeasonResult.getId())
            .build());

    // ESAC

    // Clean up store

    final StoreInfo deleteStoreResult =
        platformStoreWrapper.deleteStore(
            DeleteStore.builder()
                .namespace(this.namespace)
                .storeId(selectedStore.getStoreId())
                .build());

    assertNotNull(deleteStoreResult);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
