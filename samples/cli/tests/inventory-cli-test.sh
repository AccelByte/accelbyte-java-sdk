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
echo "1..35"

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
    --body '{"message": "EAxcVpFrttufHIRd", "operations": [{"consumeItems": [{"inventoryId": "H9UzVRiXbqlAw7r6", "qty": 100, "slotId": "7eHpzSn3ZPUdc0qh", "sourceItemId": "4n8mzZ0m8SAMTwE6"}, {"inventoryId": "I56IaRDBXxyaNoMR", "qty": 87, "slotId": "hkspInrAip6lyzSx", "sourceItemId": "wElFHHdgs21Jub74"}, {"inventoryId": "CUkNmKJfh5pUkHOD", "qty": 32, "slotId": "FcDtgOjchIua5tWE", "sourceItemId": "IC32ogW7olvbTgrh"}], "createItems": [{"customAttributes": {"RTcPiSuL0Sly6XM4": {}, "OI18mAQLnzjMf8GZ": {}, "2WBZqxYG3aREAu2D": {}}, "inventoryConfigurationCode": "6QVKNCWP75TB0i7p", "inventoryId": "KxR8dl0zRVW4EZG9", "qty": 25, "serverCustomAttributes": {"Z4U68su8XfqlqNiT": {}, "vB6SdAdIhUDrwoZ5": {}, "MecdKi5r6QEa1ysL": {}}, "slotId": "Ezth6mXhzkzWkFeZ", "slotUsed": 90, "sourceItemId": "dSpHt0P7MIIR7Cky", "tags": ["F6C7duuyZ0GhDogq", "rhBRd8lDR6qVNPRZ", "YdFLIAjGGJddVCvu"], "toSpecificInventory": true, "type": "vx5KQ7KYnIuMBvaO"}, {"customAttributes": {"35llzQRaT5kPxUfo": {}, "fvnnSuB0y5WUlrMd": {}, "I4sNveabntBSxTeI": {}}, "inventoryConfigurationCode": "v53HGCiljvjKoyD6", "inventoryId": "SCwGrncqmLtjQHAf", "qty": 93, "serverCustomAttributes": {"d67FXGk2s9Q0mPVo": {}, "3twu0MesTCf9x4rt": {}, "69lna7qxNeIxPz6M": {}}, "slotId": "bwL6IY69z1UaLqYS", "slotUsed": 91, "sourceItemId": "WytLPziZMdjxcBZu", "tags": ["fQxGiHPllG4cYEzf", "TD1ZBm3MqHcUmLZZ", "bSqb8RwNmn9HrNQy"], "toSpecificInventory": false, "type": "uZAAiE0mit9RGCCH"}, {"customAttributes": {"YzUOcEdscKHPEqgA": {}, "8yu7Vk6Jt4Ymos9J": {}, "cdos4fYcTVU6RBt0": {}}, "inventoryConfigurationCode": "zYoMcHyCUEXlAvxJ", "inventoryId": "MdalwSyliWMNW5Ny", "qty": 77, "serverCustomAttributes": {"vqtlB2jJCSQT279Z": {}, "ZPYGu0rdlgdWyOtX": {}, "i3choQrpOsDBU5Se": {}}, "slotId": "pjChB3V0v52Dlym6", "slotUsed": 31, "sourceItemId": "KXNB3Gv0IqmF51Tk", "tags": ["hjYnaq6foWvXa3bM", "rXsDr6kILsSSyDdm", "ykmoPYgc2L4jk4Lo"], "toSpecificInventory": true, "type": "LSP0pf4IxjUkl535"}], "removeItems": [{"inventoryId": "X3ateEKDpADz1x3p", "slotId": "oD3Qgb3boLQQ1MzH", "sourceItemId": "7Qm8bwbmXgdAPh1E"}, {"inventoryId": "ThG96gAFKK2WDgCc", "slotId": "xvONZm3EeERmDnye", "sourceItemId": "FoF7VSZ6pf3vneSD"}, {"inventoryId": "2Tb3g7mSQUhAEtrm", "slotId": "jqU6YE3p4lSck0ZH", "sourceItemId": "n5GI39YBHqaTHeKt"}], "targetUserId": "W18iGeUlc9d9sogW", "updateItems": [{"customAttributes": {"a24CKNS0GqVvUfHQ": {}, "vsHXNUNe4mhgo5QB": {}, "65lSAiYnNjkfZrQv": {}}, "inventoryId": "GgbLdLsFzHkBMr1y", "serverCustomAttributes": {"rOMlNFSrUEirnjX9": {}, "fDmIbeZxzfTcyiuA": {}, "Tus9hsfpFDcSDG8a": {}}, "slotId": "MVGLiBNrDjqoxcwg", "sourceItemId": "GLXpUL4pp2ncYAHd", "tags": ["NzDmeIP6rOvDz9KO", "sb392k6YmJFfRByj", "lBiuFM3FIoVk8T3G"], "type": "pAnkCmBUqg2SCnqn"}, {"customAttributes": {"tX9y1aZSWMiVi10s": {}, "G6vxkfUcmqRRbceJ": {}, "5i0EeDxOgBnhhqEl": {}}, "inventoryId": "IaDml48wdNFLTm5T", "serverCustomAttributes": {"50x9WT0GfH2rtOa4": {}, "EXsXzOXQAk4mqrxz": {}, "TtuLl4XlbGL8QOxt": {}}, "slotId": "jzm8y2wNhmwoYZyI", "sourceItemId": "4EFZKBcYrCEAE7WI", "tags": ["sfmx40NLRc6m8heK", "nWhzfe2NubeoKFeI", "aFQCYoDPICpnduEE"], "type": "QlULdJz4mnRBkMNx"}, {"customAttributes": {"vvKgAT8mJrYq6hRk": {}, "loqxM3gpwxcfMy9X": {}, "zjjI5YbsKoADkzJE": {}}, "inventoryId": "N2VHzih3bit0VWn3", "serverCustomAttributes": {"CO39PXDNxtXgeO3F": {}, "gkXhjDzaQY3snn2Z": {}, "kP7cFdP43e5dC9XI": {}}, "slotId": "BudfZgrbHDIDm4hM", "sourceItemId": "zF4TxodenSrUTvfq", "tags": ["U0bfoMm5cTtFWbot", "QyXJRcQWsmqPNs92", "epxk0i8VxsZNereS"], "type": "vf9699mCEHThUJkE"}]}, {"consumeItems": [{"inventoryId": "TAsSp7gh4TeUTkOk", "qty": 53, "slotId": "j0ZwsVC0gL97ZVJS", "sourceItemId": "PqJiwv1qlYB1RSKs"}, {"inventoryId": "6gQxC3Gb7S0o4zGY", "qty": 61, "slotId": "7KQI1AeFgPqaOkvo", "sourceItemId": "1aolB4lkKB4EYOkQ"}, {"inventoryId": "1jMD3cym8xIfkOVW", "qty": 76, "slotId": "grREOLx0KOww3HIC", "sourceItemId": "QLfl7MUBG7qtPu64"}], "createItems": [{"customAttributes": {"yAtURKLRkb738HGS": {}, "6rDgMdIIlhS1fSiM": {}, "9331m7Ta1PsKc50K": {}}, "inventoryConfigurationCode": "v6ecnEevcAx2K2zk", "inventoryId": "RenmPZnGBt4P7Wnb", "qty": 7, "serverCustomAttributes": {"oJeQediogEhhM2rI": {}, "izGdKvOPdq5xrgxS": {}, "my1DN9LFkYW5DQyj": {}}, "slotId": "4bj5Ro2ogaKt2ujQ", "slotUsed": 92, "sourceItemId": "JsEK5QpNhlI2iS5E", "tags": ["pGhhvXYck0upMzUY", "nb76tFkEORV3bu1b", "NCtX7W40V6Do5sYa"], "toSpecificInventory": false, "type": "clxcft2ulIJzPyrV"}, {"customAttributes": {"EiOG4UcqsuGKHhMR": {}, "WLVd3DlhLuIpomM8": {}, "sm1MiaI1mX2tJoAR": {}}, "inventoryConfigurationCode": "tdbBe7udsMrok0Wv", "inventoryId": "GYYnx4V709xbnGez", "qty": 75, "serverCustomAttributes": {"J6fH24T805tVg8Jq": {}, "U0jZpjvsugAOS7u8": {}, "RiWyerCSa8SRgwsA": {}}, "slotId": "j1ik1jglaDXTvKCW", "slotUsed": 46, "sourceItemId": "RulpqpymDkQhtrHW", "tags": ["wRVnwVBOqOHi8pWG", "d1juYhiqjRJOqB5F", "93zFQbJndUDpdONn"], "toSpecificInventory": false, "type": "9zVrjfGXZnqAQUoY"}, {"customAttributes": {"1GjlIIk0iKoTTS1j": {}, "02o7JjTXAQN0qdsk": {}, "dQV0TqI8EFnmDbxI": {}}, "inventoryConfigurationCode": "xi4YKlONk2Q5Y4Jv", "inventoryId": "aizwiilatuUjjt9l", "qty": 70, "serverCustomAttributes": {"NqF7Bl0LcghVHfPE": {}, "spxwhRON0bc1eMbE": {}, "IjowLqc3ecjXJbZD": {}}, "slotId": "KKoxLE1Y3Dymtj3g", "slotUsed": 16, "sourceItemId": "rYaT5hOPjaf3H0tY", "tags": ["ighU0VUfcYHJbBfA", "KSiPW3VgsZXiR1DJ", "7HVWqMkNSawQUWDF"], "toSpecificInventory": true, "type": "vJBWic7UkBeIXuqD"}], "removeItems": [{"inventoryId": "uAXI66bQ71w0deoV", "slotId": "9Lx5RDA1l2XcrciY", "sourceItemId": "NEzvSZIPkhSgORcz"}, {"inventoryId": "5S5BvmgBLxh4ijFn", "slotId": "E3Tam69qSZ7PC6f6", "sourceItemId": "QkmZXElW9YfRSse6"}, {"inventoryId": "AAz3S4czz0QKFlAV", "slotId": "mVLu4AOec0z8eBee", "sourceItemId": "oip68J1nsv4W2OJh"}], "targetUserId": "tafxMSJlHeb34sZK", "updateItems": [{"customAttributes": {"Hcl5LLLOexL4fZvW": {}, "tND2tcBFpX8lNtFE": {}, "J7tnkY6Mca5afj12": {}}, "inventoryId": "K2IzrBvvWm4udE0O", "serverCustomAttributes": {"XudXgNne8kJATwlc": {}, "6esUp6Sw1I98jeZQ": {}, "7hfxnhLd3Knaknoe": {}}, "slotId": "d9DHhLOqQGhCUr6i", "sourceItemId": "TrjyEgarAdNJOIG3", "tags": ["6I6tRbRcrEveMdAd", "iPKDUVSC00PYeDca", "gginxnFIna3yddcb"], "type": "sPheTH26IUJNvYuG"}, {"customAttributes": {"RUvpZaHCuESOiIZs": {}, "MfB4ZH3mtgWgU4pC": {}, "AKxeE70CaunQNxot": {}}, "inventoryId": "371W9G4AvQkqsGnm", "serverCustomAttributes": {"yo5JJTUVmb8GEXFT": {}, "lEMEsFzYqwgK1Np5": {}, "nodqpLm7FhJBNXzA": {}}, "slotId": "FdO0Khqf6kiTdSGv", "sourceItemId": "2LFjAKY7CbgsWqFW", "tags": ["ZX7kPBom8F9GLLTG", "8phc3n4iLoIllKlp", "O2pqiXJF3WGRaoQo"], "type": "mSJC4DdrKF7SUQPL"}, {"customAttributes": {"G59e0k5ZtX6wK7Pp": {}, "UlcIW32iK7MGt1ix": {}, "Y5rA1WoVeJIePF8Z": {}}, "inventoryId": "rQzP4zvtdxdbZUpd", "serverCustomAttributes": {"6FJtHJ1pyVwyKQLY": {}, "6FEO65Rb3z7CYLM8": {}, "IlsHqffnrfsGlfPa": {}}, "slotId": "ZKBwa3Ddb60ufPpz", "sourceItemId": "wj1QGIFmlVf4jvap", "tags": ["seE9LN9bvhOrHflI", "Od6X3viLvtEk4mTI", "pUA9gxo8SV38nEho"], "type": "XmM2W7l6jHMA2rG3"}]}, {"consumeItems": [{"inventoryId": "nakopAywelu01nry", "qty": 62, "slotId": "samANkZlOX9Sfo95", "sourceItemId": "HgXqKhTPkwfLM9uS"}, {"inventoryId": "ybRzWek2gZvRrvr0", "qty": 28, "slotId": "bSc6bWvgpVyW9dD1", "sourceItemId": "kOmvrAejcq2LgkQu"}, {"inventoryId": "aS7RBx3vim02jBOx", "qty": 36, "slotId": "YhWV1qx8CzPML52f", "sourceItemId": "aXUr9Sk4lq2faBcA"}], "createItems": [{"customAttributes": {"XXKlhvyH8paOJtxq": {}, "MPpcVfRwNj547fH0": {}, "XrKEDpEY8VnocGAj": {}}, "inventoryConfigurationCode": "ci0V3tBf2jnHGKXp", "inventoryId": "hn50c9tNLDljhZ2j", "qty": 48, "serverCustomAttributes": {"fAacR0LgB5BUXvjc": {}, "u2s6w3VifnKqmTSo": {}, "GH1XEfY6QAYn6WQ5": {}}, "slotId": "UBEU1QAOHfZiGhxO", "slotUsed": 6, "sourceItemId": "VxYheR3j5mNZ6vwv", "tags": ["7K8Asvt1j1Rx59he", "sNWy2NvZ85DDKDAF", "8KDsBZOuYQJ03BAH"], "toSpecificInventory": true, "type": "7c53q7akMpcmnnx6"}, {"customAttributes": {"RVBrop9v7aZK3h65": {}, "hbN15zfQSfQrtfF3": {}, "TQN0OcNDLr36vzoh": {}}, "inventoryConfigurationCode": "ZyjMQAg5mPYhrLTy", "inventoryId": "U8OhgfY9JQYGF4bY", "qty": 68, "serverCustomAttributes": {"EcENx9xZlAchob44": {}, "lONDDwMvgI0HlyPR": {}, "7wZNiVsF6xG2mXEQ": {}}, "slotId": "dbzIVy8alncV7vWg", "slotUsed": 91, "sourceItemId": "4vZFTYnPkmSu4PWa", "tags": ["m1jxR7SETWjteoc8", "fgvZDDhoO05oKqym", "xLD1Lcvw6T6mZEiw"], "toSpecificInventory": true, "type": "FRZ3ZprZ60zMjhTH"}, {"customAttributes": {"eh94TSenE5hCFkIf": {}, "5weqZ18MH57l2Zsr": {}, "h90ETtYmGukz3Mnl": {}}, "inventoryConfigurationCode": "rjcHp6B8Vj7rXFgD", "inventoryId": "nDkdZ9bpjb1tdA3Q", "qty": 15, "serverCustomAttributes": {"ctvrK2jhsYpKPlXn": {}, "77AtYoFzLAATPY8P": {}, "8P3cfoivvQxevecW": {}}, "slotId": "w7Rry0KK5rgAGO0d", "slotUsed": 100, "sourceItemId": "Ev3aevq6iohU1cg4", "tags": ["W1IS3Uv1BpWoJBaq", "dg2FHcunsS1lnaO2", "m9vqjhbeK2qN8g6x"], "toSpecificInventory": true, "type": "vRyd9UuL02Le8HSC"}], "removeItems": [{"inventoryId": "slsDd4M1F5qRIblS", "slotId": "7Nz81GRazPAANjfB", "sourceItemId": "oldFOyqA2clJ5gEO"}, {"inventoryId": "aCgM6Yn6RugbNEIp", "slotId": "GBFUjOn5mM7k8nbL", "sourceItemId": "zvtCIW5ynMKquUic"}, {"inventoryId": "AeIVXtoWAXhMlW4t", "slotId": "LqX7OICf5oD1e6oI", "sourceItemId": "9FmYel0kOw72o8Zk"}], "targetUserId": "gk0jS6rDWUwfhKvr", "updateItems": [{"customAttributes": {"f2AaH4yCWrHSppnI": {}, "ZkNnTn3rzH5NvAtc": {}, "vNedgS1fUfKmihDb": {}}, "inventoryId": "mu8ePWlQMVDXEHei", "serverCustomAttributes": {"GTnwyEw6hIWDZrpP": {}, "7rz3ISW510kHr4is": {}, "TKWjmv67nuHCXWfw": {}}, "slotId": "nwGioVwVzmmBVVFf", "sourceItemId": "pqx1AeLtzcPJ3jtD", "tags": ["YBo4FUTH7CGfKSyx", "gRR1DiCqSMzpqIFG", "LkDs7ACC1RgBfoNr"], "type": "HlFi2qJLgmBLE35Y"}, {"customAttributes": {"hyiDV90SeI5yppBH": {}, "oytVznCgNyx9fbT6": {}, "3ShEh8PbGikLjgjc": {}}, "inventoryId": "j34uulU6FYBZsWFb", "serverCustomAttributes": {"r3RSP0W9nBhvhf8Q": {}, "0DtJMcYQdN66bswA": {}, "gt65X4N1LQZmB61J": {}}, "slotId": "MdtwCVUrYQue84dw", "sourceItemId": "mbwFEnAZaWsQJtRY", "tags": ["oagRJK5PX9UcOvhP", "yE11TRT2SKseoe8V", "Lie0LBa36KNzjf00"], "type": "5CXNGehQ2aTjTDfK"}, {"customAttributes": {"FDXC7eGL5YhJDWh9": {}, "YWqc0qgV6d9yOfIM": {}, "Lds2DbPcaoMdtRLT": {}}, "inventoryId": "mSvTkQQgB7exYvmH", "serverCustomAttributes": {"Mxr5hPCJJztJBg0t": {}, "TJg46IewOXE2AkCh": {}, "3QIZsUf8lGFXcmwT": {}}, "slotId": "ERHclOdxIwqejxe1", "sourceItemId": "8rNdb8Otq6j1mqUa", "tags": ["v7k05HAQltnSojV4", "jT65yclX2FtAz0vJ", "jFIYWOaNdsimmkW2"], "type": "miH3xRHAKy4QxZka"}]}], "requestId": "XZ7vmiEd0JPxVyQp"}' \
    > test.out 2>&1
eval_tap $? 2 'AdminCreateChainingOperations' test.out

#- 3 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'shaDwNqTbbFMXAMf' \
    --limit '98' \
    --offset '20' \
    --sortBy 'updatedAt' \
    --userId 'e0GZeMgsRsmH1EQr' \
    > test.out 2>&1
eval_tap $? 3 'AdminListInventories' test.out

#- 4 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "YmkPKTPOlhTtSiZN", "userId": "CxuogFteTHJe4BhS"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateInventory' test.out

#- 5 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId 'SQkQD6WmOt6D7ufF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetInventory' test.out

#- 6 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'VTOhvQpfbBke8aEd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 8}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateInventory' test.out

#- 7 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'GoY7xmFNAmjDDCvs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "78mcMdiS76YApGJ9"}' \
    > test.out 2>&1
eval_tap $? 7 'DeleteInventory' test.out

#- 8 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'ufwLYkqIgLuZS6hs' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '35' \
    --qtyGte '35' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'yiEtOAbpeUNf26Uq' \
    --tags 'kCfgCUYBn2xaOBdP' \
    > test.out 2>&1
eval_tap $? 8 'AdminListItems' test.out

#- 9 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'F0JmX8qwU1cTuHHP' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'B5S3DvPRCzBrVUxm' \
    --sourceItemId 'DOj3cvRFaTC11W0T' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventoryItem' test.out

#- 10 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'GTCm4fZWuk6pQxDQ' \
    --limit '31' \
    --offset '63' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 10 'AdminListInventoryConfigurations' test.out

#- 11 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "qxLGeMvr9TsvcMQ7", "description": "dBsaIecRxIsZvD6r", "initialMaxSlots": 25, "maxInstancesPerUser": 49, "maxUpgradeSlots": 52, "name": "F0YbuU5ar5qTLWUC"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminCreateInventoryConfiguration' test.out

#- 12 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'y0Afgc050XIZRW49' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminGetInventoryConfiguration' test.out

#- 13 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId '1e94mQjVOOBnIWhu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "nElqZUodp3IhtCSH", "description": "y1ei1fIrPvfHnRN0", "initialMaxSlots": 32, "maxInstancesPerUser": 63, "maxUpgradeSlots": 19, "name": "jXZedgt5cyNe27HL"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminUpdateInventoryConfiguration' test.out

#- 14 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'twtVOaxgP6Jbct8p' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteInventoryConfiguration' test.out

#- 15 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '54' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 15 'AdminListItemTypes' test.out

#- 16 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "QTGh5BxjWOozGoDt"}' \
    > test.out 2>&1
eval_tap $? 16 'AdminCreateItemType' test.out

#- 17 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'sUuYo5p8ED5QZAuf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'AdminDeleteItemType' test.out

#- 18 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '46' \
    --offset '66' \
    --owner 'Na8lzfjv9oYMXMjl' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 18 'AdminListTags' test.out

#- 19 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "FTFVGUVhvKhJCmei", "owner": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 19 'AdminCreateTag' test.out

#- 20 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'PcLnEkcokKwcQ0ba' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeleteTag' test.out

#- 21 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'DT9OyJ2h23GUS2am' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U7syGlElXdEAOrVS' \
    --body '{"qty": 27, "slotId": "WXade41s3rH34mB2", "sourceItemId": "yPlRpWjmHZAAvKTH"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminConsumeUserItem' test.out

#- 22 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId '8MuqIg0CzkguwuJC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'W7EEFB67AODbi9Bz' \
    --body '[{"customAttributes": {"upBsFpYc77GtRUcC": {}, "FeY5g4XgBsbfzqxB": {}, "PNe8ae1Il4aAtEbu": {}}, "serverCustomAttributes": {"4IjGdqthRxTjQ7gk": {}, "ZEY8rG0q0Q2Qd2Jz": {}, "RbkF2I03dIjvBbA6": {}}, "slotId": "bfbYaJCJjfk2TUvn", "sourceItemId": "95FhO7VW3mbDVMDu", "tags": ["87t0ldWf7iSGIiKF", "tWtn4Yr2svKM6pqL", "GZ0TBujELAUK6mQ5"], "type": "iZgbwwm5iGzXtckn"}, {"customAttributes": {"rgidKupvXO6aj4hC": {}, "mTC34jxW4pIDwdqX": {}, "pmRmut9H9XyWI8bp": {}}, "serverCustomAttributes": {"8fQxRuX91uYmtrHJ": {}, "bEGTUj7YjERL1rEQ": {}, "G02zccA8wvLsWUNd": {}}, "slotId": "6lPKvqDejvqklTSv", "sourceItemId": "DwuOrP9lzpiX0VuF", "tags": ["pZum7izxe7NPzjOa", "8E7wY76PxLv9HBEU", "e89AwEw1HO4FnKtx"], "type": "4XLKAmlDr19uJ3nq"}, {"customAttributes": {"6VerzVCcI8y3Cz0Y": {}, "qCKUh5RD9vNAp4ji": {}, "nFpnQ5xF9wwbvMZy": {}}, "serverCustomAttributes": {"eDeRnVfPUa6xVVBc": {}, "q3wZpFIYeAg79HcL": {}, "JXJ7mpVI6eTYAjdP": {}}, "slotId": "lCiQQC35cj4KyOVg", "sourceItemId": "vnWbfRJtsB7cUQZ2", "tags": ["QUAxJrINPXppPNO3", "AfmXcgwC3IN6tvKg", "LB9QmJIOq9dP5szG"], "type": "71utjsQ4CrRb9gUC"}]' \
    > test.out 2>&1
eval_tap $? 22 'AdminBulkUpdateMyItems' test.out

#- 23 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'eVz7fWbZIdhevfZv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yV7AcodcZwKjYDdm' \
    --body '{"customAttributes": {"JOlzwm9Su4FnS98Q": {}, "qftSjq7sn8yreciP": {}, "LfkVyyJsbGpO6Jge": {}}, "qty": 15, "serverCustomAttributes": {"4nGmWGgTJfHlJl4t": {}, "HGa4XfZcd9CVnGqM": {}, "X9FieeEssWEUl07b": {}}, "slotId": "hwntCVqiYOJf5KwM", "slotUsed": 69, "sourceItemId": "QjzvjSozv6CTRDl0", "tags": ["zp9CzHFwinkBNi4g", "vqgl6TZ9TGVPmv34", "h6T7EsufmfxKYB4L"], "type": "M6H6QXmpZ9X3fUSR"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminSaveItemToInventory' test.out

#- 24 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId '1l9xLPBsmAUrD9L1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IiD6MlcEPhMDFzjH' \
    --body '[{"slotId": "Z3sIhzOx2CXKlvIo", "sourceItemId": "mU3pIxM9n8D2eLMe"}, {"slotId": "3lt9qfx2UDcgVE7L", "sourceItemId": "9FK6e0MrPc4vtxk9"}, {"slotId": "hVKlG56HlzGr7Xjd", "sourceItemId": "yRJunZPkp6ccIBnW"}]' \
    > test.out 2>&1
eval_tap $? 24 'AdminBulkRemoveItems' test.out

#- 25 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yPw8mj7gyQ7XdIsz' \
    --body '{"customAttributes": {"GRj46COPipH1MWVT": {}, "HG0qHJCWEfOJpZm9": {}, "yEYWNGMy2pgSGSUO": {}}, "inventoryConfigurationCode": "K68eqGJtWf1Ybgg8", "qty": 35, "serverCustomAttributes": {"0zaf7CaOSlHXrUSA": {}, "6sMJzA5mtqISQ83T": {}, "TbtefXWznDe4LQdX": {}}, "slotId": "fFBii2RAMEX5RMjB", "slotUsed": 65, "sourceItemId": "JAOddIL2l3hPjNDK", "tags": ["v2LWfXqjr8fS79En", "3wYowBdkaZ3y6i38", "XQjLDRqkpiFK5Bti"], "type": "Q272Uo9UBJWodpdw"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminSaveItem' test.out

#- 26 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'sX1jorcyR0x3YiHF' \
    --limit '21' \
    --offset '70' \
    --sortBy 'updatedAt' \
    > test.out 2>&1
eval_tap $? 26 'PublicListInventoryConfigurations' test.out

#- 27 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '93' \
    --sortBy 'name:desc' \
    > test.out 2>&1
eval_tap $? 27 'PublicListItemTypes' test.out

#- 28 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '89' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 28 'PublicListTags' test.out

#- 29 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'QBCgIs1Q2lzxl0yF' \
    --limit '70' \
    --offset '25' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 29 'PublicListInventories' test.out

#- 30 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId '77TTh4gUoj8u2WRc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 76, "slotId": "L9SkbLlrNXnGanMa", "sourceItemId": "zb8jvRWenURH48aJ"}' \
    > test.out 2>&1
eval_tap $? 30 'PublicConsumeMyItem' test.out

#- 31 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'uALEcSqcE15u6D31' \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '37' \
    --qtyGte '20' \
    --sortBy 'qty:asc' \
    --sourceItemId 'Osrs3CUYATdqnQGb' \
    --tags 'qiqOkNeATj7eGjod' \
    > test.out 2>&1
eval_tap $? 31 'PublicListItems' test.out

#- 32 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'd7CcJUrI6MAugK5k' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"ypNrp2nFe9FmN86s": {}, "K5LOq4ft5jGcMICP": {}, "UYnfG6jl9U4jRete": {}}, "slotId": "IMgzISomCsodJrhQ", "sourceItemId": "W41q2OspCZbt3Uta", "tags": ["5I0uGcL1koyHjCH5", "olYLETRpABAmO2EG", "vJ4UMS93yOxNInDB"]}, {"customAttributes": {"yhnoluO6ti0QP2ss": {}, "iJ66OzOj84O6tgoh": {}, "jtC7bzjPpucddXJ5": {}}, "slotId": "zifF8y959anrNSle", "sourceItemId": "ywHbHig6IKWVZ77K", "tags": ["eRWdECaFGzfZ2hxc", "J2Fnemn7M23SzUo4", "hNBDh9ZFP1OW0nXO"]}, {"customAttributes": {"ErQPS4VsRoYIK69y": {}, "g9ADCGiXaLs2xjHk": {}, "inOD975nARHCmhNH": {}}, "slotId": "SXuqIHsxvaUoXDmw", "sourceItemId": "WsukxncuD3QxCXMd", "tags": ["00YBWCaVVmM45mfI", "ZsWhkS476dGGJwJ0", "0UH197MJ6zU7JLMQ"]}]' \
    > test.out 2>&1
eval_tap $? 32 'PublicBulkUpdateMyItems' test.out

#- 33 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'yMWzYQCAaPJgoxGJ' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "oJaSzUtY4ZD0Xtb0", "sourceItemId": "U4pH16NUsVY21NVI"}, {"slotId": "s7NRen2Y3Ns0QJQe", "sourceItemId": "aWytPfds1BYx0EaU"}, {"slotId": "Rydf8ZyyZeHAWGgJ", "sourceItemId": "UbUJRMbkcTglbU86"}]' \
    > test.out 2>&1
eval_tap $? 33 'PublicBulkRemoveMyItems' test.out

#- 34 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'FyOjApNHBVfNOURc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 18, "slotId": "zLyH1y72L13Ornyx", "sourceItemId": "34luLdvtsTKXMjiw"}, {"qty": 74, "slotId": "gYPvfn2Qt9iyq3Ny", "sourceItemId": "k8ncu2Z3eDHH9WaV"}, {"qty": 82, "slotId": "qrgSfnx2h61X9dN1", "sourceItemId": "MGRXBJ6mVV7JS9qj"}], "srcInventoryId": "NLwvI8JdiY3RRiLi"}' \
    > test.out 2>&1
eval_tap $? 34 'PublicMoveMyItems' test.out

#- 35 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'lmOGF6dLLIeIVIjM' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'cdlbdRXTGIrdNL5g' \
    --sourceItemId 'JPqTAjgqaTHf1ANT' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE