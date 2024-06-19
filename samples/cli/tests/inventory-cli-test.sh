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
echo "1..41"

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

#- 3 AdminListIntegrationConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListIntegrationConfigurations \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '40' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 3 'AdminListIntegrationConfigurations' test.out

#- 4 AdminCreateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateIntegrationConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["UIV0dS6hIH9c4Vfk", "yrwpuXxbaERbfgPm", "i0eHkt1mr9EOIFg0"], "serviceName": "dnWIYN2NVL70Iw15", "targetInventoryCode": "7g00jr9b8MuYmmeK"}' \
    > test.out 2>&1
eval_tap $? 4 'AdminCreateIntegrationConfiguration' test.out

#- 5 AdminUpdateIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId 'TmBNvGYxEQdf3ewo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"mapItemType": ["GGoY7xmFNAmjDDCv", "s78mcMdiS76YApGJ", "9ufwLYkqIgLuZS6h"], "serviceName": "sQryiEtOAbpeUNf2", "targetInventoryCode": "6UqkCfgCUYBn2xaO"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminUpdateIntegrationConfiguration' test.out

#- 6 AdminUpdateStatusIntegrationConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId 'BdPF0JmX8qwU1cTu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INIT"}' \
    > test.out 2>&1
eval_tap $? 6 'AdminUpdateStatusIntegrationConfiguration' test.out

#- 7 AdminListInventories
./ng net.accelbyte.sdk.cli.Main inventory adminListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode 'PB5S3DvPRCzBrVUx' \
    --limit '26' \
    --offset '61' \
    --sortBy 'createdAt:desc' \
    --userId 'Oj3cvRFaTC11W0TG' \
    > test.out 2>&1
eval_tap $? 7 'AdminListInventories' test.out

#- 8 AdminCreateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventory \
    --namespace "$AB_NAMESPACE" \
    --body '{"inventoryConfigurationCode": "TCm4fZWuk6pQxDQp", "userId": "KqxLGeMvr9TsvcMQ"}' \
    > test.out 2>&1
eval_tap $? 8 'AdminCreateInventory' test.out

#- 9 AdminGetInventory
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventory \
    --inventoryId '7dBsaIecRxIsZvD6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetInventory' test.out

#- 10 AdminUpdateInventory
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventory \
    --inventoryId 'rmzVr5XT1Nxw0v1d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"incMaxSlots": 78}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateInventory' test.out

#- 11 DeleteInventory
./ng net.accelbyte.sdk.cli.Main inventory deleteInventory \
    --inventoryId 'UCy0Afgc050XIZRW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"message": "491e94mQjVOOBnIW"}' \
    > test.out 2>&1
eval_tap $? 11 'DeleteInventory' test.out

#- 12 AdminListItems
./ng net.accelbyte.sdk.cli.Main inventory adminListItems \
    --inventoryId 'hunElqZUodp3IhtC' \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '69' \
    --sortBy 'updatedAt:desc' \
    --sourceItemId 'y1ei1fIrPvfHnRN0' \
    --tags '6EjRwEQlNapJRfk4' \
    > test.out 2>&1
eval_tap $? 12 'AdminListItems' test.out

#- 13 AdminGetInventoryItem
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryItem \
    --inventoryId 'f9Zcw1pEHAyNFxcV' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'TKuAQTGh5BxjWOoz' \
    --sourceItemId 'GoDtsUuYo5p8ED5Q' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetInventoryItem' test.out

#- 14 AdminListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory adminListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'ZAufwNa8lzfjv9oY' \
    --limit '79' \
    --offset '7' \
    --sortBy 'code:desc' \
    > test.out 2>&1
eval_tap $? 14 'AdminListInventoryConfigurations' test.out

#- 15 AdminCreateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminCreateInventoryConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "MjlVHY1AHwF3vGoa", "description": "v7MK0PcLnEkcokKw", "initialMaxSlots": 4, "maxInstancesPerUser": 17, "maxUpgradeSlots": 88, "name": "mNhcZsU3VAdMDcb4"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminCreateInventoryConfiguration' test.out

#- 16 AdminGetInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId 'qlkiFAamqvZI2Kwj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'AdminGetInventoryConfiguration' test.out

#- 17 AdminUpdateInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId 'qPBiWXade41s3rH3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"code": "4mB2yPlRpWjmHZAA", "description": "vKTH8MuqIg0Czkgu", "initialMaxSlots": 46, "maxInstancesPerUser": 87, "maxUpgradeSlots": 41, "name": "TwiIAvxSvNDlmM5n"}' \
    > test.out 2>&1
eval_tap $? 17 'AdminUpdateInventoryConfiguration' test.out

#- 18 AdminDeleteInventoryConfiguration
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId 'QFMGzs7fzjgyc44m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteInventoryConfiguration' test.out

#- 19 AdminListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory adminListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '4' \
    --sortBy 'createdAt:asc' \
    > test.out 2>&1
eval_tap $? 19 'AdminListItemTypes' test.out

#- 20 AdminCreateItemType
./ng net.accelbyte.sdk.cli.Main inventory adminCreateItemType \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "CFeY5g4XgBsbfzqx"}' \
    > test.out 2>&1
eval_tap $? 20 'AdminCreateItemType' test.out

#- 21 AdminDeleteItemType
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteItemType \
    --itemTypeName 'BPNe8ae1Il4aAtEb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'AdminDeleteItemType' test.out

#- 22 AdminListTags
./ng net.accelbyte.sdk.cli.Main inventory adminListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '49' \
    --owner '4IjGdqthRxTjQ7gk' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 22 'AdminListTags' test.out

#- 23 AdminCreateTag
./ng net.accelbyte.sdk.cli.Main inventory adminCreateTag \
    --namespace "$AB_NAMESPACE" \
    --body '{"name": "EY8rG0q0Q2Qd2JzR", "owner": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 23 'AdminCreateTag' test.out

#- 24 AdminDeleteTag
./ng net.accelbyte.sdk.cli.Main inventory adminDeleteTag \
    --namespace "$AB_NAMESPACE" \
    --tagName 'tKwG3UC6XCnnZxF8' \
    > test.out 2>&1
eval_tap $? 24 'AdminDeleteTag' test.out

#- 25 AdminConsumeUserItem
./ng net.accelbyte.sdk.cli.Main inventory adminConsumeUserItem \
    --inventoryId 'CmQr17W65br34rBB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'N9tU6TDm5GloFSKW' \
    --body '{"qty": 79, "slotId": "t0ldWf7iSGIiKFtW", "sourceItemId": "tn4Yr2svKM6pqLGZ"}' \
    > test.out 2>&1
eval_tap $? 25 'AdminConsumeUserItem' test.out

#- 26 AdminBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkUpdateMyItems \
    --inventoryId '0TBujELAUK6mQ5iZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gbwwm5iGzXtcknrg' \
    --body '[{"customAttributes": {"idKupvXO6aj4hCmT": {}, "C34jxW4pIDwdqXpm": {}, "Rmut9H9XyWI8bp8f": {}}, "serverCustomAttributes": {"QxRuX91uYmtrHJbE": {}, "GTUj7YjERL1rEQG0": {}, "2zccA8wvLsWUNd6l": {}}, "slotId": "PKvqDejvqklTSvDw", "sourceItemId": "uOrP9lzpiX0VuFpZ", "tags": ["um7izxe7NPzjOa8E", "7wY76PxLv9HBEUe8", "9AwEw1HO4FnKtx4X"], "type": "LKAmlDr19uJ3nq6V"}, {"customAttributes": {"erzVCcI8y3Cz0YqC": {}, "KUh5RD9vNAp4jinF": {}, "pnQ5xF9wwbvMZyeD": {}}, "serverCustomAttributes": {"eRnVfPUa6xVVBcq3": {}, "wZpFIYeAg79HcLJX": {}, "J7mpVI6eTYAjdPlC": {}}, "slotId": "iQQC35cj4KyOVgvn", "sourceItemId": "WbfRJtsB7cUQZ2QU", "tags": ["AxJrINPXppPNO3Af", "mXcgwC3IN6tvKgLB", "9QmJIOq9dP5szG71"], "type": "utjsQ4CrRb9gUCeV"}, {"customAttributes": {"z7fWbZIdhevfZvyV": {}, "7AcodcZwKjYDdmJO": {}, "lzwm9Su4FnS98Qqf": {}}, "serverCustomAttributes": {"tSjq7sn8yreciPLf": {}, "kVyyJsbGpO6JgehD": {}, "JxEN7JlZc8LMq1o2": {}}, "slotId": "jZWu4yA3r0u4q1bT", "sourceItemId": "HXIjfJKyFlM0u1uu", "tags": ["oVdn9yVoSlKNchPH", "NL4X3LLaGPGdqLE8", "SohhhuiTnJarYYkH"], "type": "BDdSzBXdxapwhd5I"}]' \
    > test.out 2>&1
eval_tap $? 26 'AdminBulkUpdateMyItems' test.out

#- 27 AdminSaveItemToInventory
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItemToInventory \
    --inventoryId 'QYBQuxLvPuWYvE3f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sNy9Z9OhxXvCp9y7' \
    --body '{"customAttributes": {"fLD2qfCXnlUnqxT1": {}, "WsRNMZcA92hzC7MN": {}, "a8vVe4MHX6AgMep9": {}}, "qty": 96, "serverCustomAttributes": {"AyyUJyAK5PRMRMwd": {}, "vl0hv6g62GxBW2tQ": {}, "F5tkTjgJaMYvNQOs": {}}, "slotId": "Da4bkcgepqtxjbrz", "slotUsed": 40, "source": "ECOMMERCE", "sourceItemId": "unZPkp6ccIBnWyPw", "tags": ["8mj7gyQ7XdIszGRj", "46COPipH1MWVTHG0", "qHJCWEfOJpZm9yEY"], "type": "WNGMy2pgSGSUOK68"}' \
    > test.out 2>&1
eval_tap $? 27 'AdminSaveItemToInventory' test.out

#- 28 AdminBulkRemoveItems
./ng net.accelbyte.sdk.cli.Main inventory adminBulkRemoveItems \
    --inventoryId 'eqGJtWf1Ybgg8rdw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y9bmrvHmO07KNqX9' \
    --body '[{"slotId": "LM2IwEsdOGBXBwnz", "sourceItemId": "DX8v3xgC1Ge9PdbT"}, {"slotId": "TAJ2Gp1r0sVZ6LJA", "sourceItemId": "OddIL2l3hPjNDKv2"}, {"slotId": "LWfXqjr8fS79En3w", "sourceItemId": "YowBdkaZ3y6i38XQ"}]' \
    > test.out 2>&1
eval_tap $? 28 'AdminBulkRemoveItems' test.out

#- 29 AdminSaveItem
./ng net.accelbyte.sdk.cli.Main inventory adminSaveItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'jLDRqkpiFK5BtiQ2' \
    --body '{"customAttributes": {"72Uo9UBJWodpdwsX": {}, "1jorcyR0x3YiHF8I": {}, "TGPRQBCgIs1Q2lzx": {}}, "inventoryConfigurationCode": "l0yF5m77TTh4gUoj", "qty": 45, "serverCustomAttributes": {"u2WRcLiEtzVlnkfl": {}, "fn7pHY48F1dl1q92": {}, "m3iRlfnBAk0CwiAs": {}}, "slotId": "R65yQ9ssuHdGmxnc", "slotUsed": 59, "source": "OTHER", "sourceItemId": "dqnQGbqiqOkNeATj", "tags": ["7eGjodd7CcJUrI6M", "AugK5kypNrp2nFe9", "FmN86sK5LOq4ft5j"], "type": "GcMICPUYnfG6jl9U"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminSaveItem' test.out

#- 30 AdminSyncUserEntitlements
./ng net.accelbyte.sdk.cli.Main inventory adminSyncUserEntitlements \
    --namespace "$AB_NAMESPACE" \
    --userId '4jReteIMgzISomCs' \
    > test.out 2>&1
eval_tap $? 30 'AdminSyncUserEntitlements' test.out

#- 31 AdminPurchasable
./ng net.accelbyte.sdk.cli.Main inventory adminPurchasable \
    --namespace "$AB_NAMESPACE" \
    --userId 'odJrhQW41q2OspCZ' \
    --body '{"entitlementType": "bt3Uta5I0uGcL1ko", "inventoryConfig": {"slotUsed": 51}, "itemId": "gMweexsIAP5vHLjB", "itemType": "J9iqMcBL4BzhDUjh", "items": [{"bundledQty": 74, "entitlementType": "NInDByhnoluO6ti0", "inventoryConfig": {"slotUsed": 87}, "itemId": "mPAnOkDiJq4xQye7", "itemType": "HqnVK3YVeOWs9mfV", "sku": "Qh3jLBtn9pxpE7BY", "stackable": true, "useCount": 82}, {"bundledQty": 52, "entitlementType": "SleywHbHig6IKWVZ", "inventoryConfig": {"slotUsed": 48}, "itemId": "7KeRWdECaFGzfZ2h", "itemType": "xcJ2Fnemn7M23SzU", "sku": "o4hNBDh9ZFP1OW0n", "stackable": false, "useCount": 63}, {"bundledQty": 65, "entitlementType": "rQPS4VsRoYIK69yg", "inventoryConfig": {"slotUsed": 86}, "itemId": "ADCGiXaLs2xjHkin", "itemType": "OD975nARHCmhNHSX", "sku": "uqIHsxvaUoXDmwWs", "stackable": true, "useCount": 28}], "quantity": 21, "sku": "jN6wKZGW4y3f0R9s", "stackable": false, "useCount": 57}' \
    > test.out 2>&1
eval_tap $? 31 'AdminPurchasable' test.out

#- 32 PublicListInventoryConfigurations
./ng net.accelbyte.sdk.cli.Main inventory publicListInventoryConfigurations \
    --namespace "$AB_NAMESPACE" \
    --code 'ndhhZhwAiLsZs4pm' \
    --limit '77' \
    --offset '60' \
    --sortBy 'updatedAt:desc' \
    > test.out 2>&1
eval_tap $? 32 'PublicListInventoryConfigurations' test.out

#- 33 PublicListItemTypes
./ng net.accelbyte.sdk.cli.Main inventory publicListItemTypes \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '7' \
    --sortBy 'createdAt' \
    > test.out 2>&1
eval_tap $? 33 'PublicListItemTypes' test.out

#- 34 PublicListTags
./ng net.accelbyte.sdk.cli.Main inventory publicListTags \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '15' \
    --sortBy 'name:asc' \
    > test.out 2>&1
eval_tap $? 34 'PublicListTags' test.out

#- 35 PublicListInventories
./ng net.accelbyte.sdk.cli.Main inventory publicListInventories \
    --namespace "$AB_NAMESPACE" \
    --inventoryConfigurationCode '4IjDq9aT3qZyI0rY' \
    --limit '37' \
    --offset '72' \
    --sortBy 'updatedAt:asc' \
    > test.out 2>&1
eval_tap $? 35 'PublicListInventories' test.out

#- 36 PublicConsumeMyItem
./ng net.accelbyte.sdk.cli.Main inventory publicConsumeMyItem \
    --inventoryId 'ucAkXsVJbXi7eRZa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"qty": 66, "slotId": "WwIc895ImqK6tVsa", "sourceItemId": "Uq3stUh5J5Z9GiBi"}' \
    > test.out 2>&1
eval_tap $? 36 'PublicConsumeMyItem' test.out

#- 37 PublicListItems
./ng net.accelbyte.sdk.cli.Main inventory publicListItems \
    --inventoryId 'SAylX5cS0IeHpWCu' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '9' \
    --sortBy 'createdAt:asc' \
    --sourceItemId 'aWytPfds1BYx0EaU' \
    --tags 'Rydf8ZyyZeHAWGgJ' \
    > test.out 2>&1
eval_tap $? 37 'PublicListItems' test.out

#- 38 PublicBulkUpdateMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkUpdateMyItems \
    --inventoryId 'UbUJRMbkcTglbU86' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"customAttributes": {"FyOjApNHBVfNOURc": {}, "jY3YYT9oTynmfIuB": {}, "WgJTNFfM8M0IW4oe": {}}, "slotId": "8KDgy0xZfAcNg14W", "sourceItemId": "s8TIP1LKiFQoLDvu", "tags": ["mfqrgSfnx2h61X9d", "N1MGRXBJ6mVV7JS9", "qjNLwvI8JdiY3RRi"]}, {"customAttributes": {"LilmOGF6dLLIeIVI": {}, "jMcdlbdRXTGIrdNL": {}, "5gJPqTAjgqaTHf1A": {}}, "slotId": "NTJ9Yk997XkGOdC6", "sourceItemId": "ItxDT8p4n4XCFkD1", "tags": ["AJLCwszbZxuHSgDO", "K8bjoF7bL2635Kbt", "ZTGJpqgl2IzNXGTu"]}, {"customAttributes": {"QPIDpor7t1aJLNNz": {}, "6QIVC9Mfuc8VOsnm": {}, "nlVljdWYmELe74p3": {}}, "slotId": "8vumnxAnYBTxaTIz", "sourceItemId": "0jcgDI8Pkz96vd80", "tags": ["msqIm5bufnBqrpLe", "qhwVhjnnjKMEmtbi", "WsAQHbMrKYi0Zxs5"]}]' \
    > test.out 2>&1
eval_tap $? 38 'PublicBulkUpdateMyItems' test.out

#- 39 PublicBulkRemoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicBulkRemoveMyItems \
    --inventoryId 'SWCqZXHLLa31oQf7' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"slotId": "BULnZDhutDM6Bqgu", "sourceItemId": "qD5xxGxBWtnTKUe2"}, {"slotId": "znsqPzPkwCBo2SwC", "sourceItemId": "UsTag4MLAo3m61P2"}, {"slotId": "xaNfmn8Onb1a9gMz", "sourceItemId": "0F2UBRmMhAbUWmFh"}]' \
    > test.out 2>&1
eval_tap $? 39 'PublicBulkRemoveMyItems' test.out

#- 40 PublicMoveMyItems
./ng net.accelbyte.sdk.cli.Main inventory publicMoveMyItems \
    --inventoryId 'dYLWzMuv3zkUY0n0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"items": [{"qty": 56, "slotId": "Cf73IFbRkPSSITz4", "sourceItemId": "TjCrJHXGXku2YVuO"}, {"qty": 52, "slotId": "cJfIfXshuLUk5Wdp", "sourceItemId": "xjZx5noXPhPUTKbo"}, {"qty": 28, "slotId": "lbynkgT9vayLLiiz", "sourceItemId": "ac7Ge6zKJdlt7rjF"}], "srcInventoryId": "5RaJwvkWVco2LTo5"}' \
    > test.out 2>&1
eval_tap $? 40 'PublicMoveMyItems' test.out

#- 41 PublicGetItem
./ng net.accelbyte.sdk.cli.Main inventory publicGetItem \
    --inventoryId 'ijlvDF8qBWCQ9dLW' \
    --namespace "$AB_NAMESPACE" \
    --slotId 'YyS8zdhMeBXH8x6H' \
    --sourceItemId 'dVfZVDAiU6iJOF7J' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetItem' test.out


rm -f "tmp.dat"

exit $EXIT_CODE