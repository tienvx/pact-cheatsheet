[comment]: # (Introduce to Pact - a contract testing tool)

[comment]: # (THEME = white)
[comment]: # (CODE_THEME = base16/zenburn)

Tien Vo | Developer | August 13, 2023

# Pact

[comment]: # (!!!)

## What is Pact?

[comment]: # (!!! data-auto-animate)

## What is Pact?

- Code-first

[comment]: # (!!! data-auto-animate)

## What is Pact?

- Code-first
- Consumer-driven

[comment]: # (!!! data-auto-animate)

## What is Pact?

- Code-first
- Consumer-driven
- Contract

[comment]: # (!!! data-auto-animate)

## What is Pact?

- Code-first
- Consumer-driven
- Contract
- Testing tool

[comment]: # (!!! data-auto-animate)

## Code-first vs Design-first

- Code-first: contract is generated from (contract test) code

[comment]: # (!!! data-auto-animate)

## Code-first vs Design-first

- Code-first: contract is generated from (contract test) code
- Design-first: contract is generated from api design

[comment]: # (!!! data-auto-animate)

## Consumer-driven vs Provider-driven

- Consumer-driven: consumer write contract, provider test implementation against it

[comment]: # (!!! data-auto-animate)

## Consumer-driven vs Provider-driven

- Consumer-driven: consumer write contract, provider test implementation against it
- Provider-driven: provider write contract, consumer test implementation against it

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

- Schema: Abstract

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: Abstract
- Contract: Concrete

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: All possible states of api

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: All possible states of api
- Contract: Single state of api

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: Define once, use multiple times

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: Define once, use multiple times
- Contract: Define once, use once

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

- Schema: Allow optional field

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: Allow optional field
- Contract: Don't allow optional field

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: Allow empty array

[comment]: # (!!! data-auto-animate)

## Schema vs Contract

- Schema: Allow empty array
- Contract: Don't allow empty array

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

- Save development time

[comment]: # (!!! data-auto-animate)

## Why Pact?

- Save development time
- Save deployment time

[comment]: # (!!! data-auto-animate)

## Why Pact?

- Save development time
    - Provide fast feedback loop
- Save deployment time

[comment]: # (!!! data-auto-animate)

## Why Pact?

- Save development time
    - Provide fast feedback loop
    - Show exactly where is the problem
- Save deployment time

[comment]: # (!!! data-auto-animate)

## Why Pact?

- Save development time
    - Provide fast feedback loop
    - Show exactly where is the problem
    - Debug problem locally
- Save deployment time

[comment]: # (!!! data-auto-animate)

## Why Pact?

- Save development time
    - Provide fast feedback loop
    - Show exactly where is the problem
    - Debug problem locally
    - Ensure only required API are developed
- Save deployment time

[comment]: # (!!! data-auto-animate)

## Why Pact?

- Save development time
    - Provide fast feedback loop
    - Show exactly where is the problem
    - Debug problem locally
    - Ensure only required API are developed
    - Spend time focus on environmental related bug rather than integration bug
- Save deployment time

[comment]: # (!!! data-auto-animate)

## Why Pact?

- Save development time
    - Provide fast feedback loop
    - Show exactly where is the problem
    - Debug problem locally
    - Ensure only required API are developed
    - Spend time focus on environmental related bug rather than integration bug
- Save deployment time
    - Replace and run faster than integration tests

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

* Team control both consumer and provider

[comment]: # (!!!)

## When Not Pact?

- Team does not control either consumer or provider

[comment]: # (!!! data-auto-animate)

## When Not Pact?

- Team does not control either consumer or provider
- Public API

[comment]: # (!!! data-auto-animate)

## When Not Pact?

- Team does not control either consumer or provider
- Public API
- Performance and load tests

[comment]: # (!!! data-auto-animate)

## When Not Pact?

- Team does not control either consumer or provider
- Public API
- Performance and load tests
- Functional testing of the provider

[comment]: # (!!! data-auto-animate)

## When Not Pact?

- Team does not control either consumer or provider
- Public API
- Performance and load tests
- Functional testing of the provider
- Testing "pass through" APIs

[comment]: # (!!! data-auto-animate)

## When Not Pact?

- Team does not control either consumer or provider
- Public API
- Performance and load tests
- Functional testing of the provider
- Testing "pass through" APIs
- Pact is not a good mocking or stubbing tool for E2E tests

[comment]: # (!!! data-auto-animate)

## Terms

- Pacticipant
    - Consumer
    - Provider
- Intergration
    - Pact
        - Interaction
- Version
    - Consumer Version
    - Provider Version
- Branch
- Environment
- ~~Tag~~
- Deployment
    - Application Instance
- Release
- "Can I Deploy?" Tool
- Webhook

[comment]: # (!!!)

## Best Practices

- How to write consumer test?
- Consumer version selectors
- No optional attributes
- Versioning
- Local development (read-only token)
- CI flow
- Webhook

[comment]: # (Link introduce pact: https://docs.pact.io/#consumer-driven-contracts)
[comment]: # (Link compare schema to contract: https://pactflow.io/blog/schemas-are-not-contracts/)
[comment]: # (Link introduce to design-first contract testing: https://medium.com/coderbyte/design-first-contract-testing-for-micro-services-baf929e29f6c)
[comment]: # (Link explain why no support for optional attribute: https://docs.pact.io/faq#why-is-there-no-support-for-specifying-optional-attributes)
[comment]: # (Link convince to use Pact: https://docs.pact.io/faq/convinceme)
[comment]: # (Link list down situations when to use or not to use Pact: https://docs.pact.io/getting_started/what_is_pact_good_for)
