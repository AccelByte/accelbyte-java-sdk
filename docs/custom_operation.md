# Add Custom Operation into AccelByte SDK

## Background

Majority of Java Extend SDK codes are generated from [specification files](../spec) using codegen tools.
Any attemp to customize Java Extend SDK must avoid editing files that are marked as `DO NOT EDIT`.
Also, it is best practice to extend the functionality of Java Extend SDK by inherit the base classes or add new
implementation for partial classes to ensure fewer complications when upgrading Java Extend SDK.

## How to Create a Custom Operation

In this guide, we will explain on how to create a custom operation for a custom endpoint and integrate it with
the SDK core.

### Goal

Create an operation class and along it the response model,
let's use this [endpoint](https://developers.google.com/custom-search/v1/reference/rest/v1/cse/list)
`GET https://www.googleapis.com/customsearch/v1` as an example for a custom endpoint.

Let's use these query parameters:

* `cx` - The Programmable Search Engine ID to use for this request.
* `key` - An API key is a unique string that lets you access an API.
* `num` - Number of search results to return.
    * Valid values are integers between 1 and 10, inclusive.
* `q` - Query
* `safe` - Search safety level. Acceptable values are:
    * `active`: Enables SafeSearch filtering.
    * `off`: Disables SafeSearch filtering. (default)

### Create the Model Classes

Here's a simplified example output of the endpoint.

```json
{
  "items": [
    {
      "title": "foobar2000",
      "link": "https://www.foobar2000.org/"
    }
  ]
}
```

Please refer to these models in the directory, 
[../models](../samples/custom-operation/src/main/java/net/accelbyte/sdk/api/customsearch/models)


### Create the Operation Class

Please refer to these operation class in the directory, 
[../operations](../samples/custom-operation/src/main/java/net/accelbyte/sdk/api/customsearch/operations)

### Customize URL configuration in ConfigurationRepository if needed

Please refer to the implementation in this directory 
[../repository](../samples/custom-operation/src/main/java/net/accelbyte/sdk/api/customsearch/repository)

### Using the Custom Operation

After you create the necessary classes, you can now use it with the AccelByte SDK. 
Please refer to this implementation 
[here](../samples/custom-operation/src/main/java/net/accelbyte/sdk/api/customsearch/Main.java)

## References

Please see the [/api](../src) directory for mroe examples on how to create custom models and
operations from generated code.

The working code for this example is found [here](../samples/custom-operation).
