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
    --body '{"message": "EAxcVpFrttufHIRd", "operations": [{"consumeItems": [{"inventoryId": "H9UzVRiXbqlAw7r6", "qty": 100, "slotId": "7eHpzSn3ZPUdc0qh", "sourceItemId": "4n8mzZ0m8SAMTwE6"}, {"inventoryId": "I56IaRDBXxyaNoMR", "qty": 87, "slotId": "hkspInrAip6lyzSx", "sourceItemId": "wElFHHdgs21Jub74"}, {"inventoryId": "CUkNmKJfh5pUkHOD", "qty": 32, "slotId": "FcDtgOjchIua5tWE", "sourceItemId": "IC32ogW7olvbTgrh"}], "createItems": [{"customAttributes": {"RTcPiSuL0Sly6XM4": {}, "OI18mAQLnzjMf8GZ": {}, "2WBZqxYG3aREAu2D": {}}, "inventoryConfigurationCode": "6QVKNCWP75TB0i7p", "inventoryId": "KxR8dl0zRVW4EZG9", "qty": 25, "serverCustomAttributes": {"Z4U68su8XfqlqNiT": {}, "vB6SdAdIhUDrwoZ5": {}, "MecdKi5r6QEa1ysL": {}}, "slotId": "Ezth6mXhzkzWkFeZ", "slotUsed": 90, "source": "ECOMMERCE", "sourceItemId": "oEAcBdW19m4eu6d5", "tags": ["tA5jUmiTqpyhPFdx", "LzFQN05MYzYiKWe5", "dNRljv7IPrDQQRga"], "toSpecificInventory": true, "type": "vx5KQ7KYnIuMBvaO"}, {"customAttributes": {"35llzQRaT5kPxUfo": {}, "fvnnSuB0y5WUlrMd": {}, "I4sNveabntBSxTeI": {}}, "inventoryConfigurationCode": "v53HGCiljvjKoyD6", "inventoryId": "SCwGrncqmLtjQHAf", "qty": 93, "serverCustomAttributes": {"d67FXGk2s9Q0mPVo": {}, "3twu0MesTCf9x4rt": {}, "69lna7qxNeIxPz6M": {}}, "slotId": "bwL6IY69z1UaLqYS", "slotUsed": 91, "source": "OTHER", "sourceItemId": "ytLPziZMdjxcBZuf", "tags": ["QxGiHPllG4cYEzfT", "D1ZBm3MqHcUmLZZb", "Sqb8RwNmn9HrNQy4"], "toSpecificInventory": true, "type": "5BYNtIuS5S5XUdjs"}, {"customAttributes": {"oqwGyzzWi9gwQYv7": {}, "t1o7TTr1DmrhZv15": {}, "T7quIOvBMcaYmvCk": {}}, "inventoryConfigurationCode": "GZ5dAgqxpBFmaLox", "inventoryId": "ozr6wfNPX2bOItRM", "qty": 43, "serverCustomAttributes": {"u0M3VHh2EI8JlDbP": {}, "WbQ6Q9lNmqRBaAkL": {}, "nvxkT1X68cmDc3fx": {}}, "slotId": "U8MyKrQpM4hkkK6K", "slotUsed": 75, "source": "OTHER", "sourceItemId": "XNB3Gv0IqmF51Tkh", "tags": ["jYnaq6foWvXa3bMr", "XsDr6kILsSSyDdmy", "kmoPYgc2L4jk4Lo0"], "toSpecificInventory": true, "type": "SP0pf4IxjUkl535X"}], "removeItems": [{"inventoryId": "3ateEKDpADz1x3po", "slotId": "D3Qgb3boLQQ1MzH7", "sourceItemId": "Qm8bwbmXgdAPh1ET"}, {"inventoryId": "hG96gAFKK2WDgCcx", "slotId": "vONZm3EeERmDnyeF", "sourceItemId": "oF7VSZ6pf3vneSD2"}, {"inventoryId": "Tb3g7mSQUhAEtrmj", "slotId": "qU6YE3p4lSck0ZHn", "sourceItemId": "5GI39YBHqaTHeKtW"}], "targetUserId": "18iGeUlc9d9sogWa", "updateItems": [{"customAttributes": {"24CKNS0GqVvUfHQv": {}, "sHXNUNe4mhgo5QB6": {}, "5lSAiYnNjkfZrQvG": {}}, "inventoryId": "gbLdLsFzHkBMr1yr", "serverCustomAttributes": {"OMlNFSrUEirnjX9f": {}, "DmIbeZxzfTcyiuAT": {}, "us9hsfpFDcSDG8aM": {}}, "slotId": "VGLiBNrDjqoxcwgG", "sourceItemId": "LXpUL4pp2ncYAHdN", "tags": ["zDmeIP6rOvDz9KOs", "b392k6YmJFfRByjl", "BiuFM3FIoVk8T3Gp"], "type": "AnkCmBUqg2SCnqnt"}, {"customAttributes": {"X9y1aZSWMiVi10sG": {}, "6vxkfUcmqRRbceJ5": {}, "i0EeDxOgBnhhqElI": {}}, "inventoryId": "aDml48wdNFLTm5T5", "serverCustomAttributes": {"0x9WT0GfH2rtOa4E": {}, "XsXzOXQAk4mqrxzT": {}, "tuLl4XlbGL8QOxtj": {}}, "slotId": "zm8y2wNhmwoYZyI4", "sourceItemId": "EFZKBcYrCEAE7WIs", "tags": ["fmx40NLRc6m8heKn", "Whzfe2NubeoKFeIa", "FQCYoDPICpnduEEQ"], "type": "lULdJz4mnRBkMNxv"}, {"customAttributes": {"vKgAT8mJrYq6hRkl": {}, "oqxM3gpwxcfMy9Xz": {}, "jjI5YbsKoADkzJEN": {}}, "inventoryId": "2VHzih3bit0VWn3C", "serverCustomAttributes": {"O39PXDNxtXgeO3Fg": {}, "kXhjDzaQY3snn2Zk": {}, "P7cFdP43e5dC9XIB": {}}, "slotId": "udfZgrbHDIDm4hMz", "sourceItemId": "F4TxodenSrUTvfqU", "tags": ["0bfoMm5cTtFWbotQ", "yXJRcQWsmqPNs92e", "pxk0i8VxsZNereSv"], "type": "f9699mCEHThUJkET"}]}, {"consumeItems": [{"inventoryId": "AsSp7gh4TeUTkOkA", "qty": 10, "slotId": "ZwsVC0gL97ZVJSPq", "sourceItemId": "Jiwv1qlYB1RSKs6g"}, {"inventoryId": "QxC3Gb7S0o4zGYY7", "qty": 75, "slotId": "gNJma1MbqqZtfNWq", "sourceItemId": "l4nmwAft4gqkNNlW"}, {"inventoryId": "kD9eOziYRFOn0jJL", "qty": 68, "slotId": "rREOLx0KOww3HICQ", "sourceItemId": "Lfl7MUBG7qtPu64y"}], "createItems": [{"customAttributes": {"AtURKLRkb738HGS6": {}, "rDgMdIIlhS1fSiM9": {}, "331m7Ta1PsKc50Kv": {}}, "inventoryConfigurationCode": "6ecnEevcAx2K2zkR", "inventoryId": "enmPZnGBt4P7Wnbd", "qty": 91, "serverCustomAttributes": {"JeQediogEhhM2rIi": {}, "zGdKvOPdq5xrgxSm": {}, "y1DN9LFkYW5DQyj4": {}}, "slotId": "bj5Ro2ogaKt2ujQS", "slotUsed": 0, "source": "OTHER", "sourceItemId": "3Zdb65UXmy0Zp6iI", "tags": ["aTIKUkmkk9QM0NBM", "A9ORxpzwLR2AK6eX", "UGPJsw1fiP80G9Pc"], "toSpecificInventory": false, "type": "CFrHHC3DpZxkrQDX"}, {"customAttributes": {"uNFviMarv8mnfHK8": {}, "CCmE2lPnsbD3SGEd": {}, "lwuUccE536ugBp3H": {}}, "inventoryConfigurationCode": "BvepnDCjgyJlXe36", "inventoryId": "mgWjLfFmteue9nzJ", "qty": 60, "serverCustomAttributes": {"fH24T805tVg8JqU0": {}, "jZpjvsugAOS7u8Ri": {}, "WyerCSa8SRgwsAj1": {}}, "slotId": "ik1jglaDXTvKCWwN", "slotUsed": 94, "source": "ECOMMERCE", "sourceItemId": "Ahd2wrS0uPdjhdin", "tags": ["png5BLy8wbhMssAH", "japIkY9Rf4wP57dB", "ZNR88YbCtmKy8M9z"], "toSpecificInventory": true, "type": "rjfGXZnqAQUoY1Gj"}, {"customAttributes": {"lIIk0iKoTTS1j02o": {}, "7JjTXAQN0qdskdQV": {}, "0TqI8EFnmDbxIxi4": {}}, "inventoryConfigurationCode": "YKlONk2Q5Y4Jvaiz", "inventoryId": "wiilatuUjjt9lIMG", "qty": 33, "serverCustomAttributes": {"7Bl0LcghVHfPEspx": {}, "whRON0bc1eMbEIjo": {}, "wLqc3ecjXJbZDKKo": {}}, "slotId": "xLE1Y3Dymtj3giPg", "slotUsed": 94, "source": "OTHER", "sourceItemId": "5hOPjaf3H0tYighU", "tags": ["0VUfcYHJbBfAKSiP", "W3VgsZXiR1DJ7HVW", "qMkNSawQUWDFJvJB"], "toSpecificInventory": false, "type": "PdH6hJPUAc0RVwXg"}], "removeItems": [{"inventoryId": "AgntLMCuaXBWQi6B", "slotId": "qPg4xr0lCancUZGC", "sourceItemId": "HsZYoLfR1KtOv7Zy"}, {"inventoryId": "0b65uvuKNuy0ytZQ", "slotId": "7M6Nzy1adnSKOLFK", "sourceItemId": "x1dX4LuWJu3pDMUA"}, {"inventoryId": "eeZ97SBROPYuG6Xq", "slotId": "P6oo7G73zdxTgOfn", "sourceItemId": "wIdlNa29fDLh741I"}], "targetUserId": "slKHzGlLKWUtDQs6", "updateItems": [{"customAttributes": {"1OQAoxyyQpRWCiiP": {}, "DGQhNPEwiJCf2XJV": {}, "rlzqQls1ozhLVA3k": {}}, "inventoryId": "E8jKvgatOEBM70Td", "serverCustomAttributes": {"lNBJYOmpu1VCarzB": {}, "sV6xnZ5Jrzzjrcau": {}, "g6CWVG8SWP3glU6m": {}}, "slotId": "uswVJnNnN7kAa7j0", "sourceItemId": "riFc5HTHQIoVsGo7", "tags": ["dwV9DBqFKHQkETJy", "TlUrwDTnoujQD4IE", "iH9Z5qXn3aoRtlqO"], "type": "ECohViHA5CzgFSy8"}, {"customAttributes": {"X1A3PrIfapq5AAeM": {}, "e4L3mDWORBVXTIIJ": {}, "M9XsYIIZxiXNMR9B": {}}, "inventoryId": "gaWcFX3SUBhyoTsM", "serverCustomAttributes": {"WPAxUMkawaGpAyrI": {}, "wMif3BOdkocVTd4B": {}, "xqGWV6mTJ0sQs6XN": {}}, "slotId": "bjvqhnUVLWu8olKd", "sourceItemId": "xL6ozRmDD0jJvlfV", "tags": ["5OemPYdYT7DROCjt", "uzFMbAG9YI89hmgu", "B8FOTjMLo4b9rIzq"], "type": "YkEpstyVTBcrM8rG"}, {"customAttributes": {"0rH0zcswwVeMK6Mb": {}, "GIVIu8vvwLc7KY3u": {}, "VoJXTIMtpgkieDyF": {}}, "inventoryId": "97lGdMiHKxbWCYzo", "serverCustomAttributes": {"8yO2KTK9tmmOnYnO": {}, "pas6ghP1y4Zi7s7Q": {}, "Blk44Z44B1GZgKg4": {}}, "slotId": "uKxaCgcGLuC3brWd", "sourceItemId": "TYCfHkIySok5DiXZ", "tags": ["tLW87rGysryod3dN", "QrmsApRA6HX3RwrK", "t2ecozL0TOg54vCE"], "type": "48L5oLF6M4lNa4JU"}]}, {"consumeItems": [{"inventoryId": "MSHNgqRqCV7usamA", "qty": 81, "slotId": "oTow0qiOiC4j0ikt", "sourceItemId": "m0ZPLkLOsp0LZ5nj"}, {"inventoryId": "N86Hl8kUXzt6bSc6", "qty": 2, "slotId": "vccKMLhrTrcBE2It", "sourceItemId": "BS3KtKZWe8aoFzAy"}, {"inventoryId": "BME74HUtipUWYhWV", "qty": 32, "slotId": "qx8CzPML52faXUr9", "sourceItemId": "Sk4lq2faBcAXXKlh"}], "createItems": [{"customAttributes": {"vyH8paOJtxqMPpcV": {}, "fRwNj547fH0XrKED": {}, "pEY8VnocGAjci0V3": {}}, "inventoryConfigurationCode": "tBf2jnHGKXphn50c", "inventoryId": "9tNLDljhZ2jxLRX3", "qty": 52, "serverCustomAttributes": {"0LgB5BUXvjcu2s6w": {}, "3VifnKqmTSoGH1XE": {}, "fY6QAYn6WQ5UBEU1": {}}, "slotId": "QAOHfZiGhxOdcuDX", "slotUsed": 92, "source": "OTHER", "sourceItemId": "3j5mNZ6vwv7K8Asv", "tags": ["t1j1Rx59hesNWy2N", "vZ85DDKDAF8KDsBZ", "OuYQJ03BAHZ7c53q"], "toSpecificInventory": false, "type": "akMpcmnnx6RVBrop"}, {"customAttributes": {"9v7aZK3h65hbN15z": {}, "fQSfQrtfF3TQN0Oc": {}, "NDLr36vzohZyjMQA": {}}, "inventoryConfigurationCode": "g5mPYhrLTyU8Ohgf", "inventoryId": "Y9JQYGF4bYXEcENx", "qty": 87, "serverCustomAttributes": {"xZlAchob44lONDDw": {}, "MvgI0HlyPR7wZNiV": {}, "sF6xG2mXEQdbzIVy": {}}, "slotId": "8alncV7vWgSHdfo0", "slotUsed": 27, "source": "ECOMMERCE", "sourceItemId": "kmSu4PWam1jxR7SE", "tags": ["TWjteoc8fgvZDDho", "O05oKqymxLD1Lcvw", "6T6mZEiwxxElpMYS"], "toSpecificInventory": false, "type": "zMjhTHeh94TSenE5"}, {"customAttributes": {"hCFkIf5weqZ18MH5": {}, "7l2Zsrh90ETtYmGu": {}, "kz3MnlrjcHp6B8Vj": {}}, "inventoryConfigurationCode": "7rXFgDnDkdZ9bpjb", "inventoryId": "1tdA3QhjCMW64f4X", "qty": 15, "serverCustomAttributes": {"pKPlXn77AtYoFzLA": {}, "ATPY8P8P3cfoivvQ": {}, "xevecWw7Rry0KK5r": {}}, "slotId": "gAGO0dW8rX2MVUGK", "slotUsed": 91, "source": "ECOMMERCE", "sourceItemId": "Z4GcLkt4pK32sJxl", "tags": ["ZcCTpTdRtCHvuk6B", "6XTmSLyn50sigBVZ", "xiKdV57GvRyd9UuL"], "toSpecificInventory": false, "type": "2Le8HSCslsDd4M1F"}], "removeItems": [{"inventoryId": "5qRIblS7Nz81GRaz", "slotId": "PAANjfBoldFOyqA2", "sourceItemId": "clJ5gEOaCgM6Yn6R"}, {"inventoryId": "ugbNEIpGBFUjOn5m", "slotId": "M7k8nbLzvtCIW5yn", "sourceItemId": "MKquUicAeIVXtoWA"}, {"inventoryId": "XhMlW4tLqX7OICf5", "slotId": "oD1e6oI9FmYel0kO", "sourceItemId": "w72o8Zkgk0jS6rDW"}], "targetUserId": "UwfhKvrf2AaH4yCW", "updateItems": [{"customAttributes": {"rHSppnIZkNnTn3rz": {}, "H5NvAtcvNedgS1fU": {}, "fKmihDbmu8ePWlQM": {}}, "inventoryId": "VDXEHeiGTnwyEw6h", "serverCustomAttributes": {"IWDZrpP7rz3ISW51": {}, "0kHr4isTKWjmv67n": {}, "uHCXWfwnwGioVwVz": {}}, "slotId": "mmBVVFfpqx1AeLtz", "sourceItemId": "cPJ3jtDYBo4FUTH7", "tags": ["CGfKSyxgRR1DiCqS", "MzpqIFGLkDs7ACC1", "RgBfoNrHlFi2qJLg"], "type": "mBLE35YhyiDV90Se"}, {"customAttributes": {"I5yppBHoytVznCgN": {}, "yx9fbT63ShEh8PbG": {}, "ikLjgjcj34uulU6F": {}}, "inventoryId": "YBZsWFbr3RSP0W9n", "serverCustomAttributes": {"Bhvhf8Q0DtJMcYQd": {}, "N66bswAgt65X4N1L": {}, "QZmB61JMdtwCVUrY": {}}, "slotId": "Que84dwmbwFEnAZa", "sourceItemId": "WsQJtRYoagRJK5PX", "tags": ["9UcOvhPyE11TRT2S", "Kseoe8VLie0LBa36", "KNzjf005CXNGehQ2"], "type": "aTjTDfKFDXC7eGL5"}, {"customAttributes": {"YhJDWh9YWqc0qgV6": {}, "d9yOfIMLds2DbPca": {}, "oMdtRLTmSvTkQQgB": {}}, "inventoryId": "7exYvmHMxr5hPCJJ", "serverCustomAttributes": {"ztJBg0tTJg46IewO": {}, "XE2AkCh3QIZsUf8l": {}, "GFXcmwTERHclOdxI": {}}, "slotId": "wqejxe18rNdb8Otq", "sourceItemId": "6j1mqUav7k05HAQl", "tags": ["tnSojV4jT65yclX2", "FtAz0vJjFIYWOaNd", "simmkW2miH3xRHAK"], "type": "y4QxZkaXZ7vmiEd0"}]}], "requestId": "JPxVyQpshaDwNqTb"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '72' \
    --sortBy 'createdAt:desc' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["H9c4VfkyrwpuXxba", "ERbfgPmi0eHkt1mr", "9EOIFg0dnWIYN2NV"], "serviceName": "L70Iw157g00jr9b8", "targetInventoryCode": "MuYmmeKTmBNvGYxE"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'Qdf3ewoGGoY7xmFN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["AmjDDCvs78mcMdiS", "76YApGJ9ufwLYkqI", "gLuZS6hsQryiEtOA"], "serviceName": "bpeUNf26UqkCfgCU", "targetInventoryCode": "YBn2xaOBdPF0JmX8"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'qwU1cTuHHPB5S3Dv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "TIED"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'RCzBrVUxmDOj3cvR' \
    --limit '64' \
    --offset '51' \
    --sortBy 'createdAt' \
    --userId 'xahld1pO0Gyf5PO3' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "COyMvczgEpzZ3Fbt", "userId": "xfhcRC7IVYa6iZ5u"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'FRYNn3SHiWxF0Ybu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'U5ar5qTLWUCy0Afg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 5}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'C2cVWf6ttvbU1PO6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "ApCD2VXidT7w0Oc1"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId '5N8WXBPp17PAewqS' \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '71' \
    --sortBy 'createdAt:desc' \
    --sourceItemId 'x3B4t7WQnp8jXZed' \
    --tags 'gt5cyNe27HLtwtVO' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'axgP6Jbct8puMybY' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'GxD9IPmmsLmu3kaP' \
    --sourceItemId 'j0O4zd8Tb7cUNGPT' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'BxiFFCrn7djjs69F' \
    --limit '94' \
    --offset '65' \
    --sortBy 'updatedAt' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "VGUVhvKhJCmeisql", "description": "14mUHVbMPimNhcZs", "initialMaxSlots": 95, "maxInstancesPerUser": 82, "maxUpgradeSlots": 49, "name": "VAdMDcb4qlkiFAam"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'qvZI2KwjqPBiWXad' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'e41s3rH34mB2yPlR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "pWjmHZAAvKTH8Muq", "description": "Ig0CzkguwuJCW7EE", "initialMaxSlots": 65, "maxInstancesPerUser": 92, "maxUpgradeSlots": 57, "name": "vNDlmM5nQFMGzs7f"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'zjgyc44mEh9tRk8k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '12' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "BsbfzqxBPNe8ae1I"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'l4aAtEbu4IjGdqth' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '31' \
    --owner 'xTjQ7gkZEY8rG0q0' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "rV6kH4OotKwG3UC6", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'CnnZxF8CmQr17W65' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'br34rBBN9tU6TDm5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GloFSKWM1eym5ydC' \
    --body '{"qty": 67, "slotId": "p25xCWTqUOYZENJ1", "sourceItemId": "QHZQxPRXH7uxBJEE"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId 'CQE1li3Bg7Jxc9pU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nZmvhidwCkZwqjYL' \
    --body '[{"customAttributes": {"fTiCO1NDBvQvRPnA": {}, "z4VzW0CpoBCbyJsF": {}, "5IjF1c0W338HS6CB": {}}, "serverCustomAttributes": {"gVRyihYNZ84CVhzi": {}, "XV8HwSmvcvcDKF19": {}, "yVRafCjOuSYht83A": {}}, "slotId": "dvBaagTiRJ8daGTV", "sourceItemId": "X3Bb7jlz5IfHgKjI", "tags": ["9mwJSrN8jkIykR2z", "baI6PD7fEscShnGU", "GUtV9GJ279GDbLNw"], "type": "jm3FK0nnX2poMfZ1"}, {"customAttributes": {"hDHtbh4HtMlFgvh2": {}, "Dp2SoiIPp1yvfAHS": {}, "0VgLu11A3HTovFi4": {}}, "serverCustomAttributes": {"tPAGfleyCA6jEtcq": {}, "snzoVILjkwW61duF": {}, "87aUyrdt4XSpWBAe": {}}, "slotId": "tsanzqP8oxfrtbEC", "sourceItemId": "D1CYPwaiBAxfYL8A", "tags": ["vt70ZUT2fSk3LL0c", "alqxEewuGS469k2h", "G0WKt4sUmanYxM0U"], "type": "HZVNYzGMNIpWoSLk"}, {"customAttributes": {"Urfuf4U3WeYeA9t2": {}, "ENKKWrFtHIi1CMgK": {}, "AOG5iDcCR5PbCvDL": {}}, "serverCustomAttributes": {"il8wj9cKM3Ar6MF3": {}, "5hCER4nGmWGgTJfH": {}, "lJl4tHGa4XfZcd9C": {}}, "slotId": "VnGqMX9FieeEssWE", "sourceItemId": "Ul07bhwntCVqiYOJ", "tags": ["f5KwMZQjzvjSozv6", "CTRDl0zp9CzHFwin", "kBNi4gvqgl6TZ9TG"], "type": "VPmv34h6T7Esufmf"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'xKYB4LM6H6QXmpZ9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'X3fUSR1l9xLPBsmA' \
    --body '{"customAttributes": {"UrD9L1IiD6MlcEPh": {}, "MDFzjHZ3sIhzOx2C": {}, "XKlvIomU3pIxM9n8": {}}, "qty": 60, "serverCustomAttributes": {"PRMRMwdvl0hv6g62": {}, "GxBW2tQF5tkTjgJa": {}, "MYvNQOsDa4bkcgep": {}}, "slotId": "qtxjbrztee7QLTGA", "slotUsed": 1, "source": "ECOMMERCE", "sourceItemId": "k7Kaol01DK97D2xn", "tags": ["ik42miteR5eQAe1r", "zmmgqBPRmd6mO4oI", "8KDqebm83raNBJ5y"], "type": "7axEkvI4oxZEDxGi"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'BnNbn0zaf7CaOSlH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XrUSA6sMJzA5mtqI' \
    --body '[{"slotId": "SQ83TTbtefXWznDe", "sourceItemId": "4LQdXfFBii2RAMEX"}, {"slotId": "5RMjBFVZGYzQqV8d", "sourceItemId": "9mDdUIoiIJFNxuNO"}, {"slotId": "mUSWw18T1IxVWCxd", "sourceItemId": "vPL9e4P01vxP8xj1"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminBulkSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItemToInventory \
    --inventoryId 'LyEirURERnEMzpIm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W6sjAHyCK5tNanGB' \
    --body '[{"customAttributes": {"rkzUvck3xTtmOFMe": {}, "bS4AdlNzwog2IhEr": {}, "kNhNcECWwchW6zL9": {}}, "qty": 92, "serverCustomAttributes": {"tzVlnkflfn7pHY48": {}, "F1dl1q92m3iRlfnB": {}, "Ak0CwiAsR65yQ9ss": {}}, "slotId": "uHdGmxncCEr0Kcge", "slotUsed": 33, "source": "ECOMMERCE", "sourceItemId": "zGbruNB72HHMkjzy", "tags": ["BB4UFKiaoV0VOem2", "yqPsMFxKybPkbuS6", "x9cLJ1APnNlsa2bR"], "type": "Br27fVMWuAfDqLMR"}, {"customAttributes": {"919IZPKOKiAVQXXO": {}, "mqFHLbyXmgCNiXH8": {}, "uenbC5CphgMweexs": {}}, "qty": 72, "serverCustomAttributes": {"YLETRpABAmO2EGvJ": {}, "4UMS93yOxNInDByh": {}, "noluO6ti0QP2ssiJ": {}}, "slotId": "66OzOj84O6tgohjt", "slotUsed": 58, "source": "ECOMMERCE", "sourceItemId": "bzjPpucddXJ5zifF", "tags": ["8y959anrNSleywHb", "Hig6IKWVZ77KeRWd", "ECaFGzfZ2hxcJ2Fn"], "type": "emn7M23SzUo4hNBD"}, {"customAttributes": {"h9ZFP1OW0nXOErQP": {}, "S4VsRoYIK69yg9AD": {}, "CGiXaLs2xjHkinOD": {}}, "qty": 12, "serverCustomAttributes": {"75nARHCmhNHSXuqI": {}, "HsxvaUoXDmwWsukx": {}, "ncuD3QxCXMd00YBW": {}}, "slotId": "CaVVmM45mfIZsWhk", "slotUsed": 91, "source": "OTHER", "sourceItemId": "76dGGJwJ00UH197M", "tags": ["J6zU7JLMQyMWzYQC", "AaPJgoxGJoJaSzUt", "Y4ZD0Xtb0U4pH16N"], "type": "UsVY21NVIs7NRen2"}]' \
    > test.out 2>&1
eval_tap $? 29 'AdminBulkSaveItemToInventory' test.out

#- 30 AdminUpdateUserInventoriesByInventoryCode
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode 'Y3Ns0QJQeaWytPfd' \
    --namespace "$AB_NAMESPACE" \
    --userId 's1BYx0EaURydf8Zy' \
    --body '{"incMaxSlots": 51}' \
    > test.out 2>&1
eval_tap $? 30 'AdminUpdateUserInventoriesByInventoryCode' test.out

#- 31 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'OXyDYz9vMUOPG0iH' \
    --body '{"customAttributes": {"DT8QbF7gHPTPQbvL": {}, "t2NRqJGIKzLyH1y7": {}, "2L13Ornyx34luLdv": {}}, "inventoryConfigurationCode": "tsTKXMjiw6gYPvfn", "qty": 11, "serverCustomAttributes": {"Qt9iyq3Nyk8ncu2Z": {}, "3eDHH9WaVO4iKhDc": {}, "J7TCcNIsQ3PuppUx": {}}, "slotId": "DSK8aOTGMudcxlCV", "slotUsed": 7, "source": "ECOMMERCE", "sourceItemId": "iY3RRiLilmOGF6dL", "tags": ["LIeIVIjMcdlbdRXT", "GIrdNL5gJPqTAjgq", "aTHf1ANTJ9Yk997X"], "type": "kGOdC6ItxDT8p4n4"}' \
    > test.out 2>&1
eval_tap $? 31 'AdminSaveItem' test.out

#- 32 AdminBulkSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminBulkSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'XCFkD1AJLCwszbZx' \
    --body '[{"customAttributes": {"uHSgDOK8bjoF7bL2": {}, "635KbtZTGJpqgl2I": {}, "zNXGTuQPIDpor7t1": {}}, "inventoryConfigurationCode": "aJLNNz6QIVC9Mfuc", "qty": 25, "serverCustomAttributes": {"VOsnmnlVljdWYmEL": {}, "e74p38vumnxAnYBT": {}, "xaTIz0jcgDI8Pkz9": {}}, "slotId": "6vd80msqIm5bufnB", "slotUsed": 33, "source": "OTHER", "sourceItemId": "rpLeqhwVhjnnjKME", "tags": ["mtbiWsAQHbMrKYi0", "Zxs5SWCqZXHLLa31", "oQf7BULnZDhutDM6"], "type": "BqguqD5xxGxBWtnT"}, {"customAttributes": {"KUe2znsqPzPkwCBo": {}, "2SwCUsTag4MLAo3m": {}, "61P2xaNfmn8Onb1a": {}}, "inventoryConfigurationCode": "9gMz0F2UBRmMhAbU", "qty": 100, "serverCustomAttributes": {"EJBhgGq5GIDhNC66": {}, "szbCCf73IFbRkPSS": {}, "ITz4TjCrJHXGXku2": {}}, "slotId": "YVuOzhxHmnrrV9ZG", "slotUsed": 100, "source": "OTHER", "sourceItemId": "WdpxjZx5noXPhPUT", "tags": ["KbonoucNmzwOZOK5", "6sDkci5rZ8iMlOuk", "sQJCiRFiZWwJ7NrT"], "type": "b1XTB9YQzUJ9XlYJ"}, {"customAttributes": {"8BzP6EUmUXGM5anI": {}, "loyj9lhbvuQdW2jw": {}, "KUckc794ryY91lX8": {}}, "inventoryConfigurationCode": "DD4MYXlrJ81lHvv9", "qty": 35, "serverCustomAttributes": {"Jl7PeiMH8z8dVej8": {}, "N2yv6VTnOK7xAvM7": {}, "tuL81lsR7xxSVp3G": {}}, "slotId": "d2TK0HzYviTgYmx8", "slotUsed": 25, "source": "OTHER", "sourceItemId": "VBRLPZ6Iz8tne5db", "tags": ["guBF6Gsvvdl8jHz9", "x7XZIjU4IK9lOLaZ", "aMphKCqTq3EVheJj"], "type": "oEEXBLIxGnNuhoJM"}]' \
    > test.out 2>&1
eval_tap $? 32 'AdminBulkSaveItem' test.out

#- 33 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '3WWPvvCiCf33ViEd' \
    > test.out 2>&1
eval_tap $? 33 'AdminSyncUserEntitlements' test.out

#- 34 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'qQpoGkUWNizk5UcP' \
    --body '{"entitlementType": "AGv6c1ESC6hZYTYZ", "inventoryConfig": {"slotUsed": 2}, "itemId": "beqWBdQuWfgBAKx2", "itemType": "7MSBqabUXOGkkoMU", "items": [{"bundledQty": 52, "entitlementType": "n1YXj5zFZeOCOR9N", "inventoryConfig": {"slotUsed": 44}, "itemId": "SpPFnZBJZkDnEiyf", "itemType": "a2LrnpZxNnLRH36b", "sku": "qS2oFY76PU1AziBO", "stackable": true, "useCount": 62}, {"bundledQty": 38, "entitlementType": "Aj1cT3u6Zc2FbrTF", "inventoryConfig": {"slotUsed": 53}, "itemId": "Z0jvA54CSqZFDsO1", "itemType": "skRjOU1SMfQVQa6b", "sku": "lj9Rdd85bdYUumPK", "stackable": true, "useCount": 99}, {"bundledQty": 59, "entitlementType": "ynp1ck1vT90C6o86", "inventoryConfig": {"slotUsed": 5}, "itemId": "KIuvnRCa9JktyBdx", "itemType": "kZKrEWFw9GYxjiiO", "sku": "QAD77ci0vfWVZoRR", "stackable": true, "useCount": 85}], "quantity": 14, "sku": "i57HyKKz5nyI6ulK", "stackable": false, "useCount": 29}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPurchasable' test.out

#- 35 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'FZXI5nXJ7hLi6Hwe' \
    --limit '45' \
    --offset '8' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventoryConfigurations' test.out

#- 36 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '40' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 36 'PublicListItemTypes' test.out

#- 37 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '29' \
    --sortBy 'name' \
    > test.out 2>&1
eval_tap $? 37 'PublicListTags' test.out

#- 38 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '91dIn7QqXBDXJcrq' \
    --limit '75' \
    --offset '55' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 38 'PublicListInventories' test.out

#- 39 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'd9sxoLnWGP1PafIj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 77, "slotId": "PhuvHuYrGWDK41uM", "sourceItemId": "OC0mRvSoaGk4ktF5"}' \
    > test.out 2>&1
eval_tap $? 39 'PublicConsumeMyItem' test.out

#- 40 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'wnJDg9Q3WXiydCOI' \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '19' \
    --sortBy 'createdAt' \
    --sourceItemId 'olsr6CHmj763vLwt' \
    --tags 'YEJTSiXjcY5ZPkv9' \
    > test.out 2>&1
eval_tap $? 40 'PublicListItems' test.out

#- 41 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId '0lyKSTWLxSFZ0Lpu' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"pEi5DbkVs3qFTi1t": {}, "530Wj1WfzIvc3VlS": {}, "XrA3XUGud4tVjmxE": {}}, "slotId": "f4XvVhFJTxFHITBg", "sourceItemId": "9x4unq3eOMHIKeTy", "tags": ["BG5dCUoExnKfV386", "9IN4V1OdhH4GVU7E", "xlkmc4xYiLjLyZrX"]}, {"customAttributes": {"r9Bhtzn8jAdTn6xB": {}, "hrciryLm67rkadH5": {}, "Y41SLjCPrFa05Xl5": {}}, "slotId": "TPC5GODS44bmm7jP", "sourceItemId": "dKLddfdsUqjXVzW1", "tags": ["QqxnWR5sheLgsAF4", "ctv5guycGiq9j2Ey", "IknfLDpgHnMOn8nc"]}, {"customAttributes": {"3gUZ8ZFyyEr0KBXu": {}, "JBqK4QtEydPWLPBY": {}, "iR3UbJc1ZYapx7C4": {}}, "slotId": "77etqgfOJDUT0uKA", "sourceItemId": "PrARya2IMlNiXpF4", "tags": ["qvsUUpHqi33TcBGk", "c0HjUcnkpU9oVzl2", "kBuLFXIeCEKZUTz3"]}]' \
    > test.out 2>&1
eval_tap $? 41 'PublicBulkUpdateMyItems' test.out

#- 42 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'GvCAZ5j24acYHbrr' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "yHB6GO9zP3FaepA3", "sourceItemId": "b3YJ9nJM6vtT27xv"}, {"slotId": "85K5MU2qmbeqaVem", "sourceItemId": "INdClpF7OvlBIEgj"}, {"slotId": "se5kd6GEDo08yq5E", "sourceItemId": "5HleLoog4me2NBFp"}]' \
    > test.out 2>&1
eval_tap $? 42 'PublicBulkRemoveMyItems' test.out

#- 43 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId '62xlXvVcJerTPW02' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 86, "slotId": "qe9RDQMBSYAFLqp8", "sourceItemId": "PF5hCcoukWpnbz4y"}, {"qty": 37, "slotId": "4vrIPRtvhQIyLarj", "sourceItemId": "aLOKnX51yAB8Pa3u"}, {"qty": 81, "slotId": "mwtYgWGcA0h4G1LZ", "sourceItemId": "1HaX5UBMbsF44VTs"}], "srcInventoryId": "LDRzdq22cbnyK3gg"}' \
    > test.out 2>&1
eval_tap $? 43 'PublicMoveMyItems' test.out

#- 44 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'FDh2kaZP7pnnVfxP' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'wc259HF9ejHaILQr' \
    --sourceItemId 'uAuYyJLYGqMv824o' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE