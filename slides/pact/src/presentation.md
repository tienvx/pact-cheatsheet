[comment]: # (Introduce to Pact (contract testing tool))

Tien Vo | Developer | August 13, 2023

# Pact

[comment]: # (!!!)

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

[comment]: # (Link: https://docs.pact.io/#consumer-driven-contracts)

[comment]: # (!!!)

## What is Pact?

- Code-first: contract is generated from (contract test) code

[comment]: # (!!! data-auto-animate)

## What is Pact?

- Code-first: contract is generated from (contract test) code
- Design-first: contract is generated from api design

[comment]: # (!!!)

## What is Pact?

- Consumer-driven: consumer write contract, provider validate implementation against it

[comment]: # (!!! data-auto-animate)

## What is Pact?

- Consumer-driven: consumer write contract, provider test implementation against it
- Provider-driven: provider write contract, consumer test implementation against it

[comment]: # (!!!)

## What is Pact?

- Schema: all possible combinations of fields an API can accept and return

[comment]: # (!!! data-auto-animate)

## What is Pact?

- Schema: all possible combinations of fields an API can accept and return
- Contract: one single combination of fields an API can accept and return

[comment]: # (Link: https://pactflow.io/blog/schemas-are-not-contracts/)

[comment]: # (!!!)

## Code-first Consumer-driven

![code-first consumer-driven](https://miro.medium.com/v2/resize:fit:720/format:webp/1*aSzw1aA8Ef8ruCbcNjA2Lg.png)

[comment]: # (!!!)

## Design-first

![design-first](https://miro.medium.com/v2/resize:fit:720/format:webp/1*LV9FwYBT8WSDAD0O9yG1QQ.png)

[comment]: # (Link: https://medium.com/coderbyte/design-first-contract-testing-for-micro-services-baf929e29f6c)

[comment]: # (!!!)

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
