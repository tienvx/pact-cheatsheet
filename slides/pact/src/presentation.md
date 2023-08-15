[comment]: # (Introduce to Pact - a contract testing tool)

[comment]: # (THEME = white)
[comment]: # (CODE_THEME = base16/zenburn)

Tien Vo | Developer | August 13, 2023

# Pact

[comment]: # (!!!)

## What is Pact?

- Code-first  <!-- .element: class="fragment" -->
- Consumer-driven  <!-- .element: class="fragment" -->
- Contract  <!-- .element: class="fragment" -->
- Testing tool  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Code-first vs Design-first

- Code-first: contract is generated from (contract test) code  <!-- .element: class="fragment" -->
- Design-first: contract is generated from api design  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Consumer-driven vs Provider-driven

- Consumer-driven: consumer write contract, provider test implementation against it  <!-- .element: class="fragment" -->
- Provider-driven: provider write contract, consumer test implementation against it  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Code-first + Consumer-driven

![code-first consumer-driven](https://miro.medium.com/v2/resize:fit:720/format:webp/1*aSzw1aA8Ef8ruCbcNjA2Lg.png)

[comment]: # (Image source: https://medium.com/coderbyte/design-first-contract-testing-for-micro-services-baf929e29f6c)

[comment]: # (!!!)

## Design-first

![design-first](https://miro.medium.com/v2/resize:fit:720/format:webp/1*LV9FwYBT8WSDAD0O9yG1QQ.png)

[comment]: # (Image source: https://medium.com/coderbyte/design-first-contract-testing-for-micro-services-baf929e29f6c)

[comment]: # (!!!)

## Schema vs Contract

- Schema: Abstract  <!-- .element: class="fragment" -->
- Contract: Concrete  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: All possible states of api  <!-- .element: class="fragment" -->
- Contract: Single state of api  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: Define once, use multiple times  <!-- .element: class="fragment" -->
- Contract: Define once, use once  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

```js [1|2,10|3|4|5|6|7|8|9]
GET /users/1
{
    "uuid": "string", // regex ^[0-9a-f]{8}(-[0-9a-f]{4}){3}-[0-9a-f]{12}$
    "first": "string",
    "last": "string",
    "full": "string",
    "gender": "string", // ["male", "female", "other"]
    "age": "number",
    "email": "string" | null,
}
```

[comment]: # (!!!)

## Schema vs Contract

| User   | Admin      | Admin      | Notification    |
| ------ | ------     | ------     | ------          |
| uuid   | /edit-user | /show-user |                 |
| first  | /edit-user |            |                 |
| last   | /edit-user |            | birth-day-email |
| full   |            | /show-user |                 |
| gender | /edit-user | /show-user |                 |
| age    | /edit-user | /show-user | birth-day-email |
| email  | /edit-user | /show-user | birth-day-email |

[comment]: # (!!!)

## Schema vs Contract

| User   | Admin      | Admin      | Notification    |
| ------ | ------     | ------     | ------          |
| uuid   | /edit-user | /show-user |                 |
| first  | /edit-user | /show-user |                 |
| last   | /edit-user | /show-user | birth-day-email |
| full   |            |            |                 |
| gender | /edit-user | /show-user |                 |
| age    | /edit-user | /show-user | birth-day-email |
| email  | /edit-user | /show-user | birth-day-email |

[comment]: # (!!!)

## Schema vs Contract

- Schema: Allow optional field  <!-- .element: class="fragment" -->
- Contract: Don't allow optional field  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: Allow empty array  <!-- .element: class="fragment" -->
- Contract: Don't allow empty array  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Optional Field

```patch
GET /users/1
{
-    "email": "string" | null,
+    "emailAddress": "string" | null,
}
```

[comment]: # (!!!)

## Empty Array

```patch
GET /users/1
{
-    "related": "User[]",
+    "children": "User[]",
}
```

[comment]: # (!!!)

## Why Pact?

- Save development time  <!-- .element: class="fragment" -->
    - Provide fast feedback loop  <!-- .element: class="fragment" -->
    - Show exactly where is the problem  <!-- .element: class="fragment" -->
    - Debug problem locally  <!-- .element: class="fragment" -->
    - Ensure only required API are developed  <!-- .element: class="fragment" -->
    - Spend time focus on environmental related bug rather than integration bug  <!-- .element: class="fragment" -->
- Save deployment time  <!-- .element: class="fragment" -->
    - Replace and run faster than integration tests  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Pyramid without Contract

![pyramid-without-contract](https://s3-ap-southeast-2.amazonaws.com/content-prod-529546285894/2022/09/Unbalanced-Test-Pyramid---Without-Contract-Testing.png)

[comment]: # (Image source: https://pactflow.io/blog/contract-testing-vs-integration-testing/)

[comment]: # (!!!)

## Pyramid with Contract

![pyramid-with-contract](https://s3-ap-southeast-2.amazonaws.com/content-prod-529546285894/2022/09/Rebalanced-Pyramid---With-Contract-Testing-compact.png)

[comment]: # (Image source: https://pactflow.io/blog/contract-testing-vs-integration-testing/)

[comment]: # (!!!)

## Unit vs Contract vs Integration vs E2E

[Comparation](https://pactflow.io/blog/contract-testing-vs-integration-testing/) of different testing techniques

[comment]: # (!!!)

## Testing Techniques Scope

| Technique    | Service CI/CD | Test Environment |
| ------       | ------        | ------           |
| unit         | x             |                  |
| contract     | x             |                  |
| integration  | x             |                  |
| application  | x             |                  |
| integration? |               | x                |
| e2e api      |               | x                |
| e2e ui       |               | x                |

[comment]: # (!!!)

## Contract vs E2E

| Attribute    | Contract          | E2E              |
| ------       | ------            | ------           |
| when         | before deployment | after deployment |
| speed        | fast              | slow             |
| coordination | easy              | hard             |
| complexity   | linear            | non-linear       |

[comment]: # (!!!)

## Contract vs E2E Complexity

![contract-vs-e2e-complexity](media/contract-vs-e2e-complexity.svg)

[comment]: # (Image source: https://docs.pact.io/faq/convinceme)

[comment]: # (!!!)

## When Pact?

* Team control both consumer and provider  <!-- .element: class="fragment" -->

[comment]: # (!!!)

## When Not Pact?

- Team does not control either consumer or provider  <!-- .element: class="fragment" -->
- Public API  <!-- .element: class="fragment" -->
- Performance and load tests  <!-- .element: class="fragment" -->
- Functional testing of the provider  <!-- .element: class="fragment" -->
- Testing "pass through" APIs  <!-- .element: class="fragment" -->
- Pact is not a good mocking or stubbing tool for E2E tests  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## How Pact?

- Terms  <!-- .element: class="fragment" -->
- Diagrams  <!-- .element: class="fragment" -->
- Best Practices  <!-- .element: class="fragment" -->
- Demo  <!-- .element: class="fragment" -->

[comment]: # (!!!)

## Terms

- Pacticipant  <!-- .element: class="strike fragment" -->
- Consumer  <!-- .element: class="fragment" -->
- Provider  <!-- .element: class="fragment" -->
- Broker  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Integration  <!-- .element: class="fragment" -->
    - Pact  <!-- .element: class="fragment" -->
        - Interaction  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Specification  <!-- .element: class="fragment" -->
    - 1  <!-- .element: class="fragment" -->
    - 1.1  <!-- .element: class="fragment" -->
    - 2  <!-- .element: class="fragment" -->
    - 3  <!-- .element: class="fragment" -->
    - 4  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Matcher  <!-- .element: class="fragment" -->
    - equality  <!-- .element: class="fragment" -->
    - regex  <!-- .element: class="fragment" -->
    - type  <!-- .element: class="fragment" -->
    - include  <!-- .element: class="fragment" -->
    - integer  <!-- .element: class="fragment" -->
    - decimal  <!-- .element: class="fragment" -->
    - number  <!-- .element: class="fragment" -->
    - datetime  <!-- .element: class="fragment" -->
    - ...  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Generator  <!-- .element: class="fragment" -->
    - RandomInt  <!-- .element: class="fragment" -->
    - RandomDecimal  <!-- .element: class="fragment" -->
    - RandomHexadecimal  <!-- .element: class="fragment" -->
    - RandomString  <!-- .element: class="fragment" -->
    - Regex  <!-- .element: class="fragment" -->
    - Uuid  <!-- .element: class="fragment" -->
    - Date  <!-- .element: class="fragment" -->
    - Time  <!-- .element: class="fragment" -->
    - ...  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Provider Verification  <!-- .element: class="fragment" -->
- Consumer Version Selectors  <!-- .element: class="fragment" -->
    - { "mainBranch": true }  <!-- .element: class="fragment highlight" -->
    - { "branch": "\<branch\>" }  <!-- .element: class="fragment highlight" -->
    - { "deployedOrReleased": true }  <!-- .element: class="fragment highlight" -->
    - { "matchingBranch": true }  <!-- .element: class="fragment highlight" -->
- Provider States  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Tag  <!-- .element: class="strike fragment" -->
- Version (git sha)   <!-- .element: class="fragment" -->
- Branch  <!-- .element: class="fragment" -->
- Environment  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Deployment  <!-- .element: class="fragment" -->
    - Application Instance  <!-- .element: class="fragment" -->
- Release  <!-- .element: class="fragment" -->
- "Can I Deploy?" Tool  <!-- .element: class="fragment" -->
- Webhook  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Interaction Types  <!-- .element: class="fragment" -->
    - Synchronous/HTTP -> REST (JSON/HTTP), SOAP (XML/HTTP), JSON-RPC, GraphQL  <!-- .element: class="fragment" -->
    - Asynchronous/Messages -> RabbitMQ, Kafka, Fire and Forget, Server Push  <!-- .element: class="fragment" -->
    - Synchronous/Messages -> gRPC/protobufs, Websockets, MQTT, Data Pipelines, AWS Lambda  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Protocols  <!-- .element: class="fragment" -->
    - HTTP  <!-- .element: class="fragment" -->
    - Message  <!-- .element: class="fragment" -->
    - Protobuf  <!-- .element: class="fragment" -->
    - GraphQL  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Transports  <!-- .element: class="fragment" -->
    - gRPC  <!-- .element: class="fragment" -->
    - Websockets  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Terms

- Plugins  <!-- .element: class="fragment" -->
    - CSV  <!-- .element: class="fragment" -->
    - Protobuf  <!-- .element: class="fragment" -->

[comment]: # (!!! data-auto-animate)

## Diagrams

TBD

[comment]: # (!!!)

## Best Practices

- How to write consumer test?
- Consumer version selectors
- No optional attributes
- Versioning
- Local development (read-only token)
- CI flow
- Webhook

[comment]: # (Introduce to pact: https://docs.pact.io/#consumer-driven-contracts)
[comment]: # (Compare schema to contract: https://pactflow.io/blog/schemas-are-not-contracts/)
[comment]: # (Introduce to design-first contract testing: https://medium.com/coderbyte/design-first-contract-testing-for-micro-services-baf929e29f6c)
[comment]: # (Explain why no support for optional attribute: https://docs.pact.io/faq#why-is-there-no-support-for-specifying-optional-attributes)
[comment]: # (Convince to use Pact: https://docs.pact.io/faq/convinceme)
[comment]: # (List of situations when to use or not to use Pact: https://docs.pact.io/getting_started/what_is_pact_good_for)
[comment]: # (List of terms: https://docs.pact.io/getting_started/terminology)
