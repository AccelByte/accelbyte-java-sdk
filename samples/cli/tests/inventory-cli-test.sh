#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 256
# - template file: cli_test.j2

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..44"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminCreateChainingOperations
./ng net.accelbyte.sdk.cli.Main inventory adminCreateChainingOperations \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "EAxcVpFrttufHIRd", "operations": [{"consumeItems": [{"dateRangeValidation": true, "inventoryId": "9UzVRiXbqlAw7r6W", "options": ["2ktQG0h5JAav5kRa", "62WopBJHPtcDs8bB", "ZLCXLx8bbgorQeFb"], "qty": 87, "slotId": "hkspInrAip6lyzSx", "sourceItemId": "wElFHHdgs21Jub74"}, {"dateRangeValidation": true, "inventoryId": "qGj6oDLjWjkY1aXl", "options": ["FcDtgOjchIua5tWE", "IC32ogW7olvbTgrh", "RTcPiSuL0Sly6XM4"], "qty": 83, "slotId": "E3cwyALczNIicXm7", "sourceItemId": "agSrjJW2OQNOs1PX"}, {"dateRangeValidation": false, "inventoryId": "QVKNCWP75TB0i7pK", "options": ["xR8dl0zRVW4EZG9m", "0XcgGVbMqSszE8GH", "avj7AorKsxwkosAV"], "qty": 10, "slotId": "ecdKi5r6QEa1ysLE", "sourceItemId": "zth6mXhzkzWkFeZS"}], "createItems": [{"customAttributes": {"oEAcBdW19m4eu6d5": {}, "tA5jUmiTqpyhPFdx": {}, "LzFQN05MYzYiKWe5": {}}, "inventoryConfigurationCode": "dNRljv7IPrDQQRga", "inventoryId": "t0SevkLGMS0lyuI9", "qty": 0, "serverCustomAttributes": {"35llzQRaT5kPxUfo": {}, "fvnnSuB0y5WUlrMd": {}, "I4sNveabntBSxTeI": {}}, "slotId": "v53HGCiljvjKoyD6", "slotUsed": 92, "source": "OTHER", "sourceItemId": "okahFjkQsfCaTmt1", "tags": ["d67FXGk2s9Q0mPVo", "3twu0MesTCf9x4rt", "69lna7qxNeIxPz6M"], "toSpecificInventory": false, "type": "CTqGkE7wcWfDslpJ"}, {"customAttributes": {"SqGAXQ0yYoNRKd3I": {}, "L5TAQ6iiPlSC2uE4": {}, "o5Vwdo3fePqIJA8I": {}}, "inventoryConfigurationCode": "Htrkmu0hpDDWVAla", "inventoryId": "2l5BYNtIuS5S5XUd", "qty": 20, "serverCustomAttributes": {"HYzUOcEdscKHPEqg": {}, "A8yu7Vk6Jt4Ymos9": {}, "Jcdos4fYcTVU6RBt": {}}, "slotId": "0zYoMcHyCUEXlAvx", "slotUsed": 73, "source": "OTHER", "sourceItemId": "MdalwSyliWMNW5Ny", "tags": ["Lu0M3VHh2EI8JlDb", "PWbQ6Q9lNmqRBaAk", "LnvxkT1X68cmDc3f"], "toSpecificInventory": true, "type": "pjChB3V0v52Dlym6"}, {"customAttributes": {"puQ23xoJ8aeCnaLp": {}, "UKp44YUDjasWIPUv": {}, "mEejtGeoyIPa8ZRr": {}}, "inventoryConfigurationCode": "vjj7il35MXbN9oCM", "inventoryId": "Nqq98SjTvhZNkSQ7", "qty": 60, "serverCustomAttributes": {"X3ateEKDpADz1x3p": {}, "oD3Qgb3boLQQ1MzH": {}, "7Qm8bwbmXgdAPh1E": {}}, "slotId": "ThG96gAFKK2WDgCc", "slotUsed": 49, "source": "OTHER", "sourceItemId": "rvqAThuwjRHpKKTl", "tags": ["mVr9XuoJbRFQSKVP", "Hbn4Xxtu7LQRENjE", "Eztx1WsYSiZqan0n"], "toSpecificInventory": true, "type": "I39YBHqaTHeKtW18"}], "removeItems": [{"inventoryId": "iGeUlc9d9sogWa24", "slotId": "CKNS0GqVvUfHQvsH", "sourceItemId": "XNUNe4mhgo5QB65l"}, {"inventoryId": "SAiYnNjkfZrQvGgb", "slotId": "LdLsFzHkBMr1yrOM", "sourceItemId": "lNFSrUEirnjX9fDm"}, {"inventoryId": "IbeZxzfTcyiuATus", "slotId": "9hsfpFDcSDG8aMVG", "sourceItemId": "LiBNrDjqoxcwgGLX"}], "targetUserId": "pUL4pp2ncYAHdNzD", "updateItems": [{"customAttributes": {"meIP6rOvDz9KOsb3": {}, "92k6YmJFfRByjlBi": {}, "uFM3FIoVk8T3GpAn": {}}, "inventoryId": "kCmBUqg2SCnqntX9", "serverCustomAttributes": {"y1aZSWMiVi10sG6v": {}, "xkfUcmqRRbceJ5i0": {}, "EeDxOgBnhhqElIaD": {}}, "slotId": "ml48wdNFLTm5T50x", "sourceItemId": "9WT0GfH2rtOa4EXs", "tags": ["XzOXQAk4mqrxzTtu", "Ll4XlbGL8QOxtjzm", "8y2wNhmwoYZyI4EF"], "type": "ZKBcYrCEAE7WIsfm"}, {"customAttributes": {"x40NLRc6m8heKnWh": {}, "zfe2NubeoKFeIaFQ": {}, "CYoDPICpnduEEQlU": {}}, "inventoryId": "LdJz4mnRBkMNxvvK", "serverCustomAttributes": {"gAT8mJrYq6hRkloq": {}, "xM3gpwxcfMy9Xzjj": {}, "I5YbsKoADkzJEN2V": {}}, "slotId": "Hzih3bit0VWn3CO3", "sourceItemId": "9PXDNxtXgeO3FgkX", "tags": ["hjDzaQY3snn2ZkP7", "cFdP43e5dC9XIBud", "fZgrbHDIDm4hMzF4"], "type": "TxodenSrUTvfqU0b"}, {"customAttributes": {"foMm5cTtFWbotQyX": {}, "JRcQWsmqPNs92epx": {}, "k0i8VxsZNereSvf9": {}}, "inventoryId": "699mCEHThUJkETAs", "serverCustomAttributes": {"Sp7gh4TeUTkOkAYf": {}, "JB8AT9t4Tv207Y2Q": {}, "D3oD5fLCr3OOlXVv": {}}, "slotId": "8ZGF7uYnGzpipNDi", "sourceItemId": "gNJma1MbqqZtfNWq", "tags": ["l4nmwAft4gqkNNlW", "kD9eOziYRFOn0jJL", "HC9LxhvNXTwGBCto"], "type": "hLtl9Zuhytm5UDrT"}]}, {"consumeItems": [{"dateRangeValidation": true, "inventoryId": "QXCs5SPBbRPZTF6o", "options": ["QAXVG7tnsZg5QgXj", "vyGJPN4eXbJE5Vs2", "GcyomQoIXimBJehy"], "qty": 48, "slotId": "nmPZnGBt4P7WnbdS", "sourceItemId": "JtjX7ZshZyZl5x4b"}, {"dateRangeValidation": false, "inventoryId": "BHUTrDzZSKscfOcY", "options": ["u3dpCROYqUiGKXVF", "Cmpo6sPwVOEDSJsE", "K5QpNhlI2iS5EpGh"], "qty": 16, "slotId": "IKUkmkk9QM0NBMA9", "sourceItemId": "ORxpzwLR2AK6eXUG"}, {"dateRangeValidation": true, "inventoryId": "40V6Do5sYadCCFrH", "options": ["HC3DpZxkrQDXuNFv", "iMarv8mnfHK8CCmE", "2lPnsbD3SGEdlwuU"], "qty": 4, "slotId": "I1mX2tJoARtdbBe7", "sourceItemId": "udsMrok0WvGYYnx4"}], "createItems": [{"customAttributes": {"V709xbnGezKsDwG2": {}, "omOR2nvYI9TVqJdv": {}, "zcWbfUpaXp5JMl5L": {}}, "inventoryConfigurationCode": "L4bTxBmZjdrrIxsB", "inventoryId": "0NRsB1fPqqRRulpq", "qty": 31, "serverCustomAttributes": {"2wrS0uPdjhdinpng": {}, "5BLy8wbhMssAHjap": {}, "IkY9Rf4wP57dBZNR": {}}, "slotId": "88YbCtmKy8M9zVrj", "slotUsed": 11, "source": "ECOMMERCE", "sourceItemId": "GXZnqAQUoY1GjlII", "tags": ["k0iKoTTS1j02o7Jj", "TXAQN0qdskdQV0Tq", "I8EFnmDbxIxi4YKl"], "toSpecificInventory": true, "type": "Nk2Q5Y4Jvaizwiil"}, {"customAttributes": {"atuUjjt9lIMGql5E": {}, "lEa9EIIlGcHB3CfR": {}, "3ncDlwi3v3MFFJ1K": {}}, "inventoryConfigurationCode": "esKoELCpobBEG8X6", "inventoryId": "45xpdXpai0rYaT5h", "qty": 83, "serverCustomAttributes": {"iPX6ues1Hhhkg1yL": {}, "VbLFzHEP8cM4NTwr": {}, "0KHaAsmTej52WKi6": {}}, "slotId": "tArAURt9plCSVq8P", "slotUsed": 7, "source": "ECOMMERCE", "sourceItemId": "hJPUAc0RVwXgAgnt", "tags": ["LMCuaXBWQi6BqPg4", "xr0lCancUZGCHsZY", "oLfR1KtOv7Zy0b65"], "toSpecificInventory": true, "type": "xh4ijFnE3Tam69qS"}, {"customAttributes": {"Z7PC6f6QkmZXElW9": {}, "YfRSse6AAz3S4czz": {}, "0QKFlAVmVLu4AOec": {}}, "inventoryConfigurationCode": "0z8eBeeoip68J1ns", "inventoryId": "v4W2OJhtafxMSJlH", "qty": 9, "serverCustomAttributes": {"GlLKWUtDQs61OQAo": {}, "xyyQpRWCiiPDGQhN": {}, "PEwiJCf2XJVrlzqQ": {}}, "slotId": "ls1ozhLVA3kE8jKv", "slotUsed": 12, "source": "ECOMMERCE", "sourceItemId": "udE0OXudXgNne8kJ", "tags": ["ATwlc6esUp6Sw1I9", "8jeZQ7hfxnhLd3Kn", "aknoed9DHhLOqQGh"], "toSpecificInventory": true, "type": "nN7kAa7j0riFc5HT"}], "removeItems": [{"inventoryId": "HQIoVsGo7dwV9DBq", "slotId": "FKHQkETJyTlUrwDT", "sourceItemId": "noujQD4IEiH9Z5qX"}, {"inventoryId": "n3aoRtlqOECohViH", "slotId": "A5CzgFSy8X1A3PrI", "sourceItemId": "fapq5AAeMe4L3mDW"}, {"inventoryId": "ORBVXTIIJM9XsYII", "slotId": "ZxiXNMR9BgaWcFX3", "sourceItemId": "SUBhyoTsMWPAxUMk"}], "targetUserId": "awaGpAyrIwMif3BO", "updateItems": [{"customAttributes": {"dkocVTd4BxqGWV6m": {}, "TJ0sQs6XNbjvqhnU": {}, "VLWu8olKdxL6ozRm": {}}, "inventoryId": "DD0jJvlfV5OemPYd", "serverCustomAttributes": {"YT7DROCjtuzFMbAG": {}, "9YI89hmguB8FOTjM": {}, "Lo4b9rIzqYkEpsty": {}}, "slotId": "VTBcrM8rG0rH0zcs", "sourceItemId": "wwVeMK6MbGIVIu8v", "tags": ["vwLc7KY3uVoJXTIM", "tpgkieDyF97lGdMi", "HKxbWCYzo8yO2KTK"], "type": "9tmmOnYnOpas6ghP"}, {"customAttributes": {"1y4Zi7s7QBlk44Z4": {}, "4B1GZgKg4uKxaCgc": {}, "GLuC3brWdTYCfHkI": {}}, "inventoryId": "ySok5DiXZtLW87rG", "serverCustomAttributes": {"ysryod3dNQrmsApR": {}, "A6HX3RwrKt2ecozL": {}, "0TOg54vCE48L5oLF": {}}, "slotId": "6M4lNa4JUMSHNgqR", "sourceItemId": "qCV7usamANkZlOX9", "tags": ["Sfo95HgXqKhTPkwf", "LM9uSybRzWek2gZv", "Rrvr0n9d9lvccKML"], "type": "hrTrcBE2ItBS3KtK"}, {"customAttributes": {"ZWe8aoFzAyBME74H": {}, "UtipUWYhWV1qx8Cz": {}, "PML52faXUr9Sk4lq": {}}, "inventoryId": "2faBcAXXKlhvyH8p", "serverCustomAttributes": {"aOJtxqMPpcVfRwNj": {}, "547fH0XrKEDpEY8V": {}, "nocGAjci0V3tBf2j": {}}, "slotId": "nHGKXphn50c9tNLD", "sourceItemId": "ljhZ2jxLRX3z46OC", "tags": ["aGBeMfPlNos4yBRj", "rERHEonAZR8GmEu0", "q1p6QCyY6vSkVFWd"], "type": "sbYuVEGVxYheR3j5"}]}, {"consumeItems": [{"dateRangeValidation": false, "inventoryId": "aZPV87pna08gxefT", "options": ["YKhuxaEc7M4P7Uck", "SC6ePeN8i4GrFES9", "z7xueHpATHccee9G"], "qty": 31, "slotId": "hKcjmSEwdrkEnnqK", "sourceItemId": "zFsLfYalUlfwEQKj"}, {"dateRangeValidation": true, "inventoryId": "eHGebSVu0LQ40kep", "options": ["EaC4dfiOMZfEhHr3", "9pysFO3Zvc1BZG99", "LyvfvHEsJKQQewVL"], "qty": 78, "slotId": "hob44lONDDwMvgI0", "sourceItemId": "HlyPR7wZNiVsF6xG"}, {"dateRangeValidation": false, "inventoryId": "mXEQdbzIVy8alncV", "options": ["7vWgSHdfo07UctPE", "rqxyMyOK06MqQBEr", "xgjVBycvU4PbmRDc"], "qty": 36, "slotId": "KqymxLD1Lcvw6T6m", "sourceItemId": "ZEiwxxElpMYSWIeV"}], "createItems": [{"customAttributes": {"zm7z9noowmlTIKVo": {}, "wi0RY2VN4ZONJREd": {}, "UQ3z9F1BxNNgnke4": {}}, "inventoryConfigurationCode": "akncw7wu9TmXfJWB", "inventoryId": "Prx9Ns8eLzYEvwSW", "qty": 94, "serverCustomAttributes": {"dA3QhjCMW64f4XhI": {}, "jSoTB2NMKtezapPr": {}, "2QEPx3zTxBGtEJIY": {}}, "slotId": "ppuUSsKoHw2hyd12", "slotUsed": 41, "source": "OTHER", "sourceItemId": "0dW8rX2MVUGKSZ4G", "tags": ["cLkt4pK32sJxlZcC", "TpTdRtCHvuk6B6XT", "mSLyn50sigBVZxiK"], "toSpecificInventory": false, "type": "6x2PyYDo5R3hLiD5"}, {"customAttributes": {"sf5y1JsxJNGmyt0S": {}, "QDUDoWBZVGLlkUet": {}, "zCAWc9x1aMjgGim5": {}}, "inventoryConfigurationCode": "1T107XIZRZ7tZdIs", "inventoryId": "0xf4czdt7zqmSKxO", "qty": 62, "serverCustomAttributes": {"8nbLzvtCIW5ynMKq": {}, "uUicAeIVXtoWAXhM": {}, "lW4tLqX7OICf5oD1": {}}, "slotId": "e6oI9FmYel0kOw72", "slotUsed": 30, "source": "OTHER", "sourceItemId": "8Zkgk0jS6rDWUwfh", "tags": ["Kvrf2AaH4yCWrHSp", "pnIZkNnTn3rzH5Nv", "AtcvNedgS1fUfKmi"], "toSpecificInventory": false, "type": "a0sZoFS6xCOWMpyh"}, {"customAttributes": {"9pMsQgb64ELbzDMw": {}, "yo4nIRysQdbufXjY": {}, "nSoIFeouC2m38kXr": {}}, "inventoryConfigurationCode": "DZWlGVE9sJ4NpUtK", "inventoryId": "p6M9I6nEwnZhsjwJ", "qty": 9, "serverCustomAttributes": {"tDYBo4FUTH7CGfKS": {}, "yxgRR1DiCqSMzpqI": {}, "FGLkDs7ACC1RgBfo": {}}, "slotId": "NrHlFi2qJLgmBLE3", "slotUsed": 91, "source": "ECOMMERCE", "sourceItemId": "evO0TQNEI3kfabxJ", "tags": ["WWSI1ECUo1NPpeFh", "UztXDgB7n4C97uAP", "P8PATLpUpxeJlsBJ"], "toSpecificInventory": false, "type": "P0W9nBhvhf8Q0DtJ"}], "removeItems": [{"inventoryId": "McYQdN66bswAgt65", "slotId": "X4N1LQZmB61JMdtw", "sourceItemId": "CVUrYQue84dwmbwF"}, {"inventoryId": "EnAZaWsQJtRYoagR", "slotId": "JK5PX9UcOvhPyE11", "sourceItemId": "TRT2SKseoe8VLie0"}, {"inventoryId": "LBa36KNzjf005CXN", "slotId": "GehQ2aTjTDfKFDXC", "sourceItemId": "7eGL5YhJDWh9YWqc"}], "targetUserId": "0qgV6d9yOfIMLds2", "updateItems": [{"customAttributes": {"DbPcaoMdtRLTmSvT": {}, "kQQgB7exYvmHMxr5": {}, "hPCJJztJBg0tTJg4": {}}, "inventoryId": "6IewOXE2AkCh3QIZ", "serverCustomAttributes": {"sUf8lGFXcmwTERHc": {}, "lOdxIwqejxe18rNd": {}, "b8Otq6j1mqUav7k0": {}}, "slotId": "5HAQltnSojV4jT65", "sourceItemId": "yclX2FtAz0vJjFIY", "tags": ["WOaNdsimmkW2miH3", "xRHAKy4QxZkaXZ7v", "miEd0JPxVyQpshaD"], "type": "wNqTbbFMXAMfVXe0"}, {"customAttributes": {"GZeMgsRsmH1EQrYm": {}, "kPKTPOlhTtSiZNCx": {}, "uogFteTHJe4BhSSQ": {}}, "inventoryId": "kQD6WmOt6D7ufFVT", "serverCustomAttributes": {"OhvQpfbBke8aEdd3": {}, "6xj6wySoltDxsbzx": {}, "rlaKEfkoYjY2o6ou": {}}, "slotId": "RW9UtNquwC3Wgumr", "sourceItemId": "Iz4NhGztZpr4U4fw", "tags": ["QIiLXgmRasvjO4lj", "8m3XEwP2b4gd3xOe", "ii8Jnmssep2xD2NY"], "type": "0kABeGs9yxahld1p"}, {"customAttributes": {"O0Gyf5PO3COyMvcz": {}, "gEpzZ3FbtxfhcRC7": {}, "IVYa6iZ5uFRYNn3S": {}}, "inventoryId": "HiWxF0YbuU5ar5qT", "serverCustomAttributes": {"LWUCy0Afgc050XIZ": {}, "RW491e94mQjVOOBn": {}, "IWhunElqZUodp3Ih": {}}, "slotId": "tCSHy1ei1fIrPvfH", "sourceItemId": "nRN06EjRwEQlNapJ", "tags": ["Rfk4f9Zcw1pEHAyN", "FxcVTKuAQTGh5Bxj", "WOozGoDtsUuYo5p8"], "type": "ED5QZAufwNa8lzfj"}]}], "requestId": "v9oYMXMjlVHY1AHw"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '98' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["vGoav7MK0PcLnEkc", "okKwcQ0baDT9OyJ2", "h23GUS2amU7syGlE"], "serviceName": "lXdEAOrVSnLocLVV", "targetInventoryCode": "YamQc4wcG5nDBLJo"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'JHbiQ5duE5p4cfs2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["E41cK8QTwiIAvxSv", "NDlmM5nQFMGzs7fz", "jgyc44mEh9tRk8kn"], "serviceName": "YSV30lnroQehMDli", "targetInventoryCode": "6t9unQLYXxm09wpG"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'AbpEmDY9vLh3u6ED' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'q0Q2Qd2JzRbkF2I0' \
    --limit '58' \
    --offset '7' \
    --sortBy 'updatedAt:desc' \
    --userId 'XCnnZxF8CmQr17W6' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "5br34rBBN9tU6TDm", "userId": "5GloFSKWM1eym5yd"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'C6p25xCWTqUOYZEN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'J1QHZQxPRXH7uxBJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 63}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'UK6mQ5iZgbwwm5iG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "zXtcknrgidKupvXO"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId '6aj4hCmTC34jxW4p' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '54' \
    --sortBy 'updatedAt' \
    --sourceItemId 'z4VzW0CpoBCbyJsF' \
    --tags '5IjF1c0W338HS6CB' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'gVRyihYNZ84CVhzi' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'XV8HwSmvcvcDKF19' \
    --sourceItemId 'yVRafCjOuSYht83A' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'dvBaagTiRJ8daGTV' \
    --limit '98' \
    --offset '55' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "b7jlz5IfHgKjI9mw", "description": "JSrN8jkIykR2zbaI", "initialMaxSlots": 95, "maxInstancesPerUser": 84, "maxUpgradeSlots": 10, "name": "D7fEscShnGUGUtV9"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'GJ279GDbLNwjm3FK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '0nnX2poMfZ1hDHtb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "h4HtMlFgvh2Dp2So", "description": "iIPp1yvfAHS0VgLu", "initialMaxSlots": 61, "maxInstancesPerUser": 8, "maxUpgradeSlots": 53, "name": "RnVfPUa6xVVBcq3w"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'ZpFIYeAg79HcLJXJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '25' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "pVI6eTYAjdPlCiQQ"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'C35cj4KyOVgvnWbf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '12' \
    --owner 'JtsB7cUQZ2QUAxJr' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "fYL8Avt70ZUT2fSk", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'LL0calqxEewuGS46' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId '9k2hG0WKt4sUmanY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xM0UHZVNYzGMNIpW' \
    --dateRangeValidation 'oSLkUrfuf4U3WeYe' \
    --body '{"options": ["A9t2ENKKWrFtHIi1", "CMgKAOG5iDcCR5Pb", "CvDLil8wj9cKM3Ar"], "qty": 3, "slotId": "MF35hCER4nGmWGgT", "sourceItemId": "JfHlJl4tHGa4XfZc"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'd9CVnGqMX9FieeEs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWEUl07bhwntCVqi' \
    --body '[{"customAttributes": {"YOJf5KwMZQjzvjSo": {}, "zv6CTRDl0zp9CzHF": {}, "winkBNi4gvqgl6TZ": {}}, "serverCustomAttributes": {"9TGVPmv34h6T7Esu": {}, "fmfxKYB4LM6H6QXm": {}, "pZ9X3fUSR1l9xLPB": {}}, "slotId": "smAUrD9L1IiD6Mlc", "sourceItemId": "EPhMDFzjHZ3sIhzO", "tags": ["x2CXKlvIomU3pIxM", "9n8D2eLMe3lt9qfx", "2UDcgVE7L9FK6e0M"], "type": "rPc4vtxk9hVKlG56"}, {"customAttributes": {"HlzGr7XjdyRJunZP": {}, "kp6ccIBnWyPw8mj7": {}, "gyQ7XdIszGRj46CO": {}}, "serverCustomAttributes": {"PipH1MWVTHG0qHJC": {}, "WEfOJpZm9yEYWNGM": {}, "y2pgSGSUOK68eqGJ": {}}, "slotId": "tWf1Ybgg8rdwY9bm", "sourceItemId": "rvHmO07KNqX9LM2I", "tags": ["wEsdOGBXBwnzDX8v", "3xgC1Ge9PdbTTAJ2", "Gp1r0sVZ6LJAOddI"], "type": "L2l3hPjNDKv2LWfX"}, {"customAttributes": {"qjr8fS79En3wYowB": {}, "dkaZ3y6i38XQjLDR": {}, "qkpiFK5BtiQ272Uo": {}}, "serverCustomAttributes": {"9UBJWodpdwsX1jor": {}, "cyR0x3YiHF8ITGPR": {}, "QBCgIs1Q2lzxl0yF": {}}, "slotId": "5m77TTh4gUoj8u2W", "sourceItemId": "RcLiEtzVlnkflfn7", "tags": ["pHY48F1dl1q92m3i", "RlfnBAk0CwiAsR65", "yQ9ssuHdGmxncCEr"], "type": "0KcgeqzGbruNB72H"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'HMkjzyBB4UFKiaoV' \
    --namespace "$AB_NAMESPACE" \
    --userId '0VOem2yqPsMFxKyb' \
    --body '{"customAttributes": {"PkbuS6x9cLJ1APnN": {}, "lsa2bRBr27fVMWuA": {}, "fDqLMR919IZPKOKi": {}}, "qty": 54, "serverCustomAttributes": {"JrhQW41q2OspCZbt": {}, "3Uta5I0uGcL1koyH": {}, "jCH5olYLETRpABAm": {}}, "slotId": "O2EGvJ4UMS93yOxN", "slotUsed": 71, "source": "OTHER", "sourceItemId": "nDByhnoluO6ti0QP", "tags": ["2ssiJ66OzOj84O6t", "gohjtC7bzjPpucdd", "XJ5zifF8y959anrN"], "type": "SleywHbHig6IKWVZ"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId '77KeRWdECaFGzfZ2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hxcJ2Fnemn7M23Sz' \
    --body '[{"slotId": "Uo4hNBDh9ZFP1OW0", "sourceItemId": "nXOErQPS4VsRoYIK"}, {"slotId": "69yg9ADCGiXaLs2x", "sourceItemId": "jHkinOD975nARHCm"}, {"slotId": "hNHSXuqIHsxvaUoX", "sourceItemId": "DmwWsukxncuD3QxC"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'XMd00YBWCaVVmM45' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mfIZsWhkS476dGGJ' \
    --body '[{"customAttributes": {"wJ00UH197MJ6zU7J": {}, "LMQyMWzYQCAaPJgo": {}, "xGJoJaSzUtY4ZD0X": {}}, "qty": 39, "serverCustomAttributes": {"aUq3stUh5J5Z9GiB": {}, "iSAylX5cS0IeHpWC": {}, "ugmfOL0QQpxsuD8P": {}}, "slotId": "Gqku59eFJrOXyDYz", "slotUsed": 13, "source": "OTHER", "sourceItemId": "JUbUJRMbkcTglbU8", "tags": ["6FyOjApNHBVfNOUR", "cjY3YYT9oTynmfIu", "BWgJTNFfM8M0IW4o"], "type": "e8KDgy0xZfAcNg14"}, {"customAttributes": {"Ws8TIP1LKiFQoLDv": {}, "umfqrgSfnx2h61X9": {}, "dN1MGRXBJ6mVV7JS": {}}, "qty": 67, "serverCustomAttributes": {"qjNLwvI8JdiY3RRi": {}, "LilmOGF6dLLIeIVI": {}, "jMcdlbdRXTGIrdNL": {}}, "slotId": "5gJPqTAjgqaTHf1A", "slotUsed": 81, "source": "ECOMMERCE", "sourceItemId": "J9Yk997XkGOdC6It", "tags": ["xDT8p4n4XCFkD1AJ", "LCwszbZxuHSgDOK8", "bjoF7bL2635KbtZT"], "type": "GJpqgl2IzNXGTuQP"}, {"customAttributes": {"IDpor7t1aJLNNz6Q": {}, "IVC9Mfuc8VOsnmnl": {}, "VljdWYmELe74p38v": {}}, "qty": 42, "serverCustomAttributes": {"92B4vEgj3HOmhcWm": {}, "428XejRF94NIY9nM": {}, "rBZo0lNUBDShHD32": {}}, "slotId": "vvL28FPwTiXfLcxD", "slotUsed": 59, "source": "ECOMMERCE", "sourceItemId": "nd02mECIQhfIhHtA", "tags": ["DUQ9zimQTQT95pFJ", "UAJsyAfeKOufV4f1", "5NohXu6opxQGRt6P"], "type": "qlkL0diRhLC10ih2"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'EQfY3XCv4hdOa6Fd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZhNMd1onFjGRbxtA' \
    --body '{"incMaxSlots": 57}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'mMhAbUWmFhdYLWzM' \
    --body '{"customAttributes": {"uv3zkUY0n0BAZkwb": {}, "YkBLyO6A0FqfhnaB": {}, "3YxKNdOTacCcJfIf": {}}, "inventoryConfigurationCode": "XshuLUk5WdpxjZx5", "qty": 27, "serverCustomAttributes": {"6RpmKDebNkylbynk": {}, "gT9vayLLiizac7Ge": {}, "6zKJdlt7rjF5RaJw": {}}, "slotId": "vkWVco2LTo5ijlvD", "slotUsed": 65, "source": "OTHER", "sourceItemId": "9XlYJ8BzP6EUmUXG", "tags": ["M5anIloyj9lhbvuQ", "dW2jwKUckc794ryY", "91lX8DD4MYXlrJ81"], "type": "lHvv9rqvEoM8YmVj"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'AkO3HKsEp6KlqwW4' \
    --body '[{"customAttributes": {"djrexcbHdEtoQvpV": {}, "344RctmTozCi8HeV": {}, "6jbalHmqBBfi7sSF": {}}, "inventoryConfigurationCode": "5BoGiTCVsXsygWbj", "qty": 62, "serverCustomAttributes": {"dl8jHz9x7XZIjU4I": {}, "K9lOLaZaMphKCqTq": {}, "3EVheJjoEEXBLIxG": {}}, "slotId": "nNuhoJM3WWPvvCiC", "slotUsed": 11, "source": "ECOMMERCE", "sourceItemId": "ViEdqQpoGkUWNizk", "tags": ["5UcPAGv6c1ESC6hZ", "YTYZbzf5aANNNs5k", "gSZZNUHbIT9szApm"], "type": "WJO5vzzXZj08a6K1"}, {"customAttributes": {"XRVfriSpPFnZBJZk": {}, "DnEiyfa2LrnpZxNn": {}, "LRH36bqS2oFY76PU": {}}, "inventoryConfigurationCode": "1AziBOHEAj1cT3u6", "qty": 5, "serverCustomAttributes": {"uVJ0BJfZ0jvA54CS": {}, "qZFDsO1skRjOU1SM": {}, "fQVQa6blj9Rdd85b": {}}, "slotId": "dYUumPKVSZCg3XTc", "slotUsed": 44, "source": "OTHER", "sourceItemId": "Qe0dHJfF6KIuvnRC", "tags": ["a9JktyBdxkZKrEWF", "w9GYxjiiOQAD77ci", "0vfWVZoRRMPi57Hy"], "type": "KKz5nyI6ulKNKoXa"}, {"customAttributes": {"0dgx1JgjC56pda3Y": {}, "htQxpCYME6x21pdX": {}, "2QSPAd9sxoLnWGP1": {}}, "inventoryConfigurationCode": "PafIjLX8ce0KbNN7", "qty": 75, "serverCustomAttributes": {"cl2JfmQplvGjVQ4a": {}, "ebjfgGu472oWJlfg": {}, "lLM4xjfkNL4lU6ja": {}}, "slotId": "GfsD1cfswmeFpvtD", "slotUsed": 40, "source": "ECOMMERCE", "sourceItemId": "ZPkv90lyKSTWLxSF", "tags": ["Z0LpupEi5DbkVs3q", "FTi1t530Wj1WfzIv", "c3VlSXrA3XUGud4t"], "type": "VjmxEf4XvVhFJTxF"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId 'HITBg9x4unq3eOMH' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'IKeTyBG5dCUoExnK' \
    --body '{"entitlementType": "fV3869IN4V1OdhH4", "inventoryConfig": {"slotUsed": 66}, "itemId": "6JXDpA1tIC45C0oa", "itemType": "GouFu4hXONgUwJnU", "items": [{"bundledQty": 32, "entitlementType": "n6xBhrciryLm67rk", "inventoryConfig": {"slotUsed": 0}, "itemId": "1uuokpaIjL0Vxe5n", "itemType": "9Lx3QcFo9gxOgvDc", "sku": "7xMrRKvw8ISP2WKm", "stackable": true, "useCount": 53}, {"bundledQty": 89, "entitlementType": "W1QqxnWR5sheLgsA", "inventoryConfig": {"slotUsed": 65}, "itemId": "S8fLWoQ5nuJhatQP", "itemType": "xR7dvBVC5zgOKLTD", "sku": "mHe8c1eJ9sde7Ryt", "stackable": true, "useCount": 42}, {"bundledQty": 73, "entitlementType": "dIv22M18uux9xBom", "inventoryConfig": {"slotUsed": 88}, "itemId": "R3UbJc1ZYapx7C47", "itemType": "7etqgfOJDUT0uKAP", "sku": "rARya2IMlNiXpF4q", "stackable": true, "useCount": 2}], "quantity": 38, "sku": "CZixe2cQ6O30lpzc", "stackable": true, "useCount": 20}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'QMAEcNcJqrKxnMzS' \
    --limit '65' \
    --offset '30' \
    --sortBy 'code' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '10' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '63' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'KZUTz3GvCAZ5j24a' \
    --limit '4' \
    --offset '60' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'HbrryHB6GO9zP3Fa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"options": ["epA3b3YJ9nJM6vtT", "27xv85K5MU2qmbeq", "aVemINdClpF7OvlB"], "qty": 71, "slotId": "2jJepUnEEgja2mIE", "sourceItemId": "2kLTnJwc5XmkCuL5"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'W4tKt6G3j9LYdG7x' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '99' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId '02PWsHiKYArAxnKB' \
    --tags 'fBfDlrQQuAc10Djj' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'wMv4vrIPRtvhQIyL' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"arjaLOKnX51yAB8P": {}, "a3uNGKhaLlJzJMSn": {}, "JIIgsAVmaGYxUX1B": {}}, "slotId": "9oVuzG2CnYX2YBF2", "sourceItemId": "g7TVtzYEHUodh3iU", "tags": ["fBthbepUCTWiZ1uq", "h7GAi4FEIu44u83Z", "LRxYlYqlpq03BGdI"]}, {"customAttributes": {"k4oEogFVGR71rJOB": {}, "y6lsj1AKGBjnHmaA": {}, "u4YK87DYAWWcbcbG": {}}, "slotId": "WmKgE8CZ4AELr5lr", "sourceItemId": "aa5v5P5Cj8hgFsqH", "tags": ["C9h5JPiMEtgKuiGT", "YgwWv5XldL6rOVGc", "RAn51rVAQSxp4qTB"]}, {"customAttributes": {"54mKA3V9DKlCeZ7m": {}, "LYsHooOIaxIpb1cI": {}, "OJPS3lJ80YJ41U4o": {}}, "slotId": "oQ980ywmg1pWpWit", "sourceItemId": "1QC7FKe0fnHUlmU1", "tags": ["unGKM0tgfeWy47bb", "wMI4gGmvK9gW596F", "wBNrFXt3TAuKBwBc"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'D12ae6r3hHwya4Np' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "dOzg3hr6ucHf7dbh", "sourceItemId": "2iKNUl0qJqzoKMRM"}, {"slotId": "G541PAiNjULsx4Sn", "sourceItemId": "KNXLMUaDSwwQlnNR"}, {"slotId": "ZJHBSB4fZWEFIZs2", "sourceItemId": "8Ff1kZp1Zktx3N7W"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'NMYIfcDKbLu8pnK3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 58, "slotId": "oA1keYXJvtggDdXj", "sourceItemId": "bdjMBahFZZGMTcqn"}, {"qty": 99, "slotId": "jfZpfcFBUsnnDJlm", "sourceItemId": "D1iEokbUiYzCQh2i"}, {"qty": 80, "slotId": "9PutLf6IrvZoBGQb", "sourceItemId": "O4S3rURGWUzPAE6S"}], "srcInventoryId": "dV4D5jftRl9rZmtQ"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'Uvro8TWwXWsz9TVm' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'dMKEohKzuMYDUTLB' \
    --sourceItemId 'eCidXjuGgx8ncXej' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE