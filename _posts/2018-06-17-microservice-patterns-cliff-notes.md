# Microservices patterns - by Chris Richardson - Cliff Notes

## Table of Contents
[Chapter 1: Escaping Monolithic hell](#ch01)  
[Chapter 2: Decomposition Strategies](#ch02)  
[Chapter 3: Interprocess communication](#ch03)  
[Chapter 4: Managing transactions with sagas](#ch04)  

<a name="ch01" />
## Chapter 1: Escaping Monolithic hell

### Monolithic Architecture
![Monolithic Architecture](https://i.imgur.com/42pm1iH.png)

Monolithic architecture have lots of benefits, at least initially

* *Simple to develop:* IDEs and other developer tools are focused on building a single application. 
* *Easy to make changes:* You can change the code and the database schema, build, and deploy. 
* *Straightforward to test:* The developers wrote end-to-end tests that launched the application, invoked the REST API, and tested the UI with Selenium. 
* *Straightforward to deploy:* Single artifact to deploy
* *Easy to scale:* multiple instances of the application behind a load balancer.

### Drawbacks of a monolith
Successful applications have a habit of outgrowing the monolithic architecture.

Deploying changes into production is a long and painful process.

![Deploying a monolith](https://i.imgur.com/WXgL9KG.png)

A monolith also has problems scaling. That’s because different application modules have conflicting resource requirements.


Monolith becomes unreliable: testing the application thoroughly is difficult, due to its large size. This lack of testability means bugs make their way into production. To make matters worse, the application lacks fault isolation, because all modules are running within the same process


The architecture forces them to use a technology stack that’s becoming increasingly obsolete.


Interestingly, software architecture has very little to do with functional requirements. You can implement a set of use cases: with any architecture. In fact, it’s common for successful applications to be big balls of mud.


### Microservices

![Microservice Architecture](https://i.imgur.com/WbqLN5T.png)

The high-level definition of microservice architecture (microservices) is an architectural style that functionally decomposes an application into a set of services. Note that this definition doesn’t say anything about size. Instead, what matters is that each service has a focused, cohesive set of responsibilities

Long- lived, monolithic applications usually degenerate into big balls of mud. The microservice architecture uses services as the unit of modularity.

A key characteristic of the microservice architecture is that the services are loosely coupled and communicate only via APIs. One way to achieve loose coupling is by each service having its own datastore.

SOA and the microservice architecture usually use different technology stacks.


Applications built using the microservice architecture tend to use lightweight, open source technologies. The services communicate via dumb pipes, such as message brokers or lightweight protocols like REST or gRPC.


The microservice architecture has the following benefits: 

* It enables the continuous delivery and deployment of large, complex applications. 
    * It has the testability required by continuous delivery/deployment
    * It has the deployability required by continuous delivery/deployment
    * It enables development teams to be autonomous and loosely coupled
    * Each service is relatively small. The code is easier for a developer to understand
* Services are small and easily maintained. 
* Services are independently deployable. 
* Services are independently scalable. 
* The microservice architecture enables teams to be autonomous. 
* It allows easy experimenting and adoption of new technologies. 
* It has better fault isolation.


![Deploying Microservices](https://i.imgur.com/4E0Ku6C.png)


### Drawbacks of Microservice architecture

Finding the right set of services is challenging. Distributed systems are complex, which makes development, testing, and deployment difficult. Deploying features that span multiple services requires careful coordination. Deciding when to adopt the microservice architecture is difficult.


patterns are valuable is because a pattern must describe the context within which it applies. The idea that a solution is specific to a particular context and might not work well in other contexts is an improvement over how technology used to typically be discussed. For example, a solution that solves the problem at the scale of Netflix might not be the best approach for an application with fewer users.



### Microservice patterns

![Microservice patterns](https://i.imgur.com/WxGv3KM.png)

#### 3 layers of Microservice patterns:

* *Infrastructure patterns:* These solve problems that are mostly infrastructure issues outside of development. 
* *Application infrastructure:* These are for infrastructure issues that also impact development. 
* *Application patterns:* These solve problems faced by developers.


#### Pattern groups:
* Patterns for decomposing an application into services
* Communication patterns
* Data consistency patterns
* Querying
* Deployment patterns
* Observability patterns
* Automated testing patterns
* Cross cutting concern handling patterns
* Security patterns


<a name="ch02" />
## Chapter 2: Decomposition Strategies

3 step process to identify Microservice architecture for an app

1. Identify system operations
2. Group operations into services
3. Determine API for each service

Obstacles to decomposition:
* network latency: too many round trips between services
* synchronous communication between services
* data consistency across services
* god classes (for decomposing existing apps)


### Identifying system operations
Derive domain models from nouns
Derive system operations from verbs
Descibe system operations in terms of creating, updating and deleting system objects (commands)
Describe queries (reading domain models)

### Grouping into services
2 patterns:
* Decompose by business capability
* Decompose by domain model

Personal opinion: Decompose by business capability when breaking down an existing monolith. Decompose by domain model if designing from scratch; then derive business capablities from domain models; often domain models do translate seamlessly to business capablities.


### Guidelines for decomposition:
* Single responsibility principle: Each service should do one thing and one thing only
* Common closure principle: Package cohesive classes together in a service

http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod


<a name="ch03" />
## Chapter 3: Interprocess communication

### Overview
Services can use:
* synchronous request/response-based communication mechanisms, 
    * HTTP- based REST
    * gRPC. 
* asynchronous, message-based communication mechanisms
    * AMQP
    * STOMP. 
    
messages formats
* human-readable, text-based formats
    * JSON
    * XML. 
* More efficient binary format
    * Avro
    * Protocol Buffers.


#### Interaction Styles

2 dimensions of interactions

|       | One to One                                      | One to Many               |
|-------|-------------------------------------------------|---------------------------|
| Sync  |   Request/Response                              |                           |
| Async |   Async request/ response, One way notificatons |Pub/sub, async responses   |



#### Defining APIs
* First you write the interface definition. 
* Then you review the interface definition with the client developers. 
* After iterating on the API definition do you then implement the service. 

http://www.programmableweb.com/news/how-to-design-great-apis-api-first-design-and-raml/how-to/2015/07/10


Use RAML to define API spec.


#### Evolving APIs

Use semantic versioning for APIs
* MAJOR: When you make an incompatible change to the API
* MINOR: When you make backward-compatible enhancements to the API
* PATCH: When you make a backward-compatible bug fix

#### Message Formats

Text based:
* JSON
* XML

Binary:
* Apache Avro
* Protocol buffers

### Synchronous communication

Pattern: Remote procedure invocation
A client invokes a service using a synchronous, remote procedure invocation-based protocol, such as REST (http://microservices.io/patterns/communication-style/messaging.html).

#### REST
Use HATEOAS

Benefits:
* Simple, familiar
* Test from browser, postman, curl
* Request/response style communication
* Firewall friendly
* No intermediate broker

Drawbacks:
* Only request/response (One-to-One, Sync)
* Reduced availability, both ends should be running
* Clients must be aware of endpoints
* Cannot multiples
* Difficult to map operations to verbs


#### gRPC
You define your gRPC APIs using a Protocol Buffers-based IDL, which is Google’s language-neutral mechanism for serializing structured data.

You use the Protocol Buffer compiler to generate client-side stubs and server-side skel- etons.


#### Ciruit breakers
Handles partial failures by implementing a mechanism to reject invocations after a certain threshold of failures.

#### Service discovery

Implement a service registry, which is a queryable data store that stores service endpoints, which implements

A service registry consists of:
* a Query API to query services
* a registration end point to register services


Service discovery can happen at:
* application level
* platform level (kubernetes, docker swarm, etc)



Application level Service discovery patterns:
* Self registration on startup of services.
* Client side discovery, service client load balances across available services

Platform level service discovery patterns:
* 3rd party registration
* Server side discovery


### Async communication

Services communicate asynchronously, using messages.

Typically uses:
* Message broker, an intermediary for storing messages
* brokerless architecture


#### Messaging

A message can be:
* Document - just data, upto receiver to interpret it.
* Command - an operation
* Query - reads


Messages are exchanged over channels.
* point to point - directed to exact clients
* pub/sub - published over channel, subscribers listen and act.


#### Implementing interactions using messaging

##### Request response and Aync request response
Exchange a pair of messages.
One for request by client over a point to point request channel.
One with response by responder when it is ready over a point to point reply channel.

Response contains a correlation ID that corresponds to request.

Client will process requests asynchronously.
More often, there will be multiple client instances that respond to it.


##### One way notifications
Straightforward. 
Send a message over a point to point channel.

##### pub/sub
Again straightforward.
Messages are exchanged over a pub/sub as opposed to a point to point channel.

##### publish/async responses
Combine elements of pub/sub and request response.
Publish a message that specifies a reply channel id over a pub/sub channel.

Response over the specified point to point.


#### API spec for messaging based service
No RAML like API spec format for messaging.
Informal document that records:
* operations
  * request, async style response
    * channel
    * message format
    * format of reply
  * notification
    * channel
    * message format

#### Message brokers

##### Brokerless 
Popular solution
* ZeroMQ

Advantages
* Allows lighter network traffic and better latency, because messages go directly from the sender to the receiver, instead of having to go from the sender to the message broker and from there to the receiver

* Eliminates the possibility of the message broker being a performance bottle- neck or a single point of failure

* Features less operational complexity, because there is no message broker to set up and maintain

Disadvantages
* Services need to know about each other’s locations and must therefore use one of the discovery mechanisms 

*  It offers reduced availability, because both the sender and receiver of a message must be available while the message is being exchanged.

* Implementing mechanisms, such as guaranteed delivery, is more challenging.


##### Broker based messaging

Popular solutions
* ActiveMQ
* Kafka
* RabbitMQ


Benefits of broker based solutions
* Loose coupling
* Buffering
* Flexiblity
* Explicit interprocess communication

Drawbacks:
* Performance bottleneck
* Single point of failure
* Additional operational complexity


#### Competing receivers and message ordering
Using multiple threads and service instances to concurrently process messages increases the throughput of the application.   
But the challenge with processing messages concurrently is ensuring that each message is processed once and in order.

A common solution, used by modern message brokers like Apache Kafka and AWS Kinesis, is to use sharded (partitioned) channels.

1.  A sharded channel consists of two or more shards, each of which behaves like a channel.

2. The sender specifies a shard key in the message’s header, which is typically an arbitrary string or sequence of bytes. The message broker uses a shard key to assign the message to a particular shard/partition. 

3. The messaging broker groups together multiple instances of a receiver and treats them as the same logical receiver. 



#### Duplicate messages
Exactly-once messaging is usually too costly. 
Instead, most message brokers promise to deliver a message at least once.


There are a couple of different ways to handle duplicate messages: 
* Write idempotent message handlers.
* Track messages and discard duplicates.



#### Transactions using messaging

Implemented by applying the following patterns together:

1. Transactional outbox pattern: Uses a database table as a temporary queue.
2. One of the following  
    a. Polling publisher pattern: Polls database and publishes to queue  
    b. Transaction log trailing


### Aynchronous messaging to improve availability

#### Synchronous communication reduces availability
Availability is reduced whenever a service can only respond to its client after receiving a response from another service. 

#### Eliminating synchronous interaction

* Use asynchronous interaction styles
* Replicate data
* Finish processing after returning a response


<a name="ch04" />

## Chapter 4: Managing transactions with sagas

### Transaction management in a microservices based architecture


Operations spanning numerous services need a transaction management mechanism that works across services.

Instead of an ACID transactions, an operation that spans services must use what’s known as a saga, a message-driven sequence of local transactions, to maintain data consistency.

One challenge with sagas is that they are ACD (Atomicity, Consistency, Durability). They lack the isolation feature of traditional ACID transactions. As a result, an application must use what are known as countermeasures, design techniques that prevent or reduce the impact of concurrency anomalies caused by the lack of isolation.

the biggest obstacle developers will face when adopting microservices is moving from a single database with ACID transactions to a multi-database architecture with ACD sagas.

Transaction management is straightforward in a monolithic application that accesses a single database. Transaction management is more challenging in a complex monolithic application that uses multiple databases and mes- sage brokers. And in a microservice architecture, transactions span multiple services, each of which has its own database. In this situation, the application must use a more elaborate mechanism to manage transactions.

IN microservice architecture, the needed data is scattered around multiple services.

The traditional approach to maintaining data consistency across multiple services, databases, or message brokers is to use distributed transactions.

A Monolith uses two-phase commit (2PC) to ensure that all participants in a transaction either commit or rollback.

Another problem with distributed transactions is that they are synchronous, which reduces availability.

Sagas are mechanisms to maintain data consistency in a microservice architecture without having to use distributed transactions. You define a saga for each system com- mand that needs to update data in multiple services. 

A saga is a sequence of local transactions. 

Each local transaction updates data within a single service using the familiar ACID transaction frameworks and libraries mentioned earlier.

The system operation initiates the first step of the saga. The completion of a local transaction triggers the execution of the next local transaction.

An important benefit of asynchronous messaging is that it ensures that all the steps of a saga are executed, even if one or more of the saga’s participants is temporarily unavailable.

Sagas differ from ACID transactions in a couple of important ways because they lack the isolation property of ACID transactions.

Also, because each local transaction commits its changes, a saga must be rolled back using compensating transactions.

Unfortunately, sagas can’t be automatically rolled back, because each step commits its changes to the local database. 

This means, in case of a failure, an application must explicitly undo the changes made by the first three steps. 

You must write what are known as compensating transactions.


Suppose that the (n + 1)th transaction of a saga fails. The effects of the previous n transactions must be undone. 

Conceptually, each of those steps, Ti, has a corresponding compensating transaction, Ci, which undoes the effects of the Ti. To undo the effects of those first n steps, the saga must execute each Ci in reverse order.

It’s essential that the database update and the publishing of the event happen atomically. 

Consequently, to communicate reliably, the saga participants must use transactional messaging.


### Coordinating Sagas

There are a couple of different ways to structure a saga’s coordination logic:

Choreography—Distribute the decision making and sequencing among the saga participants. They primarily communicate by exchanging events. there’s no central coordinator telling the saga participants what to do. Instead, the saga participants subscribe to each other’s events and respond accordingly.

Orchestration: Centralize a saga’s coordination logic in a saga orchestrator class. 

A saga orchestrator sends command messages to saga participants telling them which operations to perform. 

You define an orchestrator class whose sole responsibility is to tell the saga participants what to do. 

The saga orchestrator communicates with the participants using command/ async reply-style interaction. 

To execute a saga step, it sends a command message to a participant telling it what operation to perform. 

After the saga participant has per- formed the operation, it sends a reply message to the orchestrator. 

The orchestrator then processes the message and determines which saga step to perform next.

A good way to model a saga orchestrator is as a state machine.




Benefits of Choreography based sagas: 
* Simplicity: Services publish events when they create, update, or delete business objects. 
* Loose coupling: The participants subscribe to events and don’t have direct knowl- edge of each other.

Drawbacks of choreography based sagas:
* More difficult to understand: Unlike with orchestration, there isn’t a single place in the code that defines the saga.

* Cyclic dependencies between the services: The saga participants subscribe to each other’s events, which often creates cyclic dependencies.

* Risk of tight coupling: Each saga participant needs to subscribe to all events that affect them.



Benefits of orchestration sagas:

* Simpler dependencies: No cyclic dependencies.

* Less coupling: Each service implements an API that is invoked by the orches- trator, so it does not need to know about the events published by the saga participants.

* Improves separation of concerns and simplifies the business logic: The saga coordination logic is localized in the saga orchestrator. The domain objects are simpler and have no knowledge of the sagas that they participate in.


Drawbacks of Orchestration: 

* The risk of centralizing too much business logic in the orchestrator. This results in a design where the smart orchestrator tells the dumb services what operations to do. Fortunately, you can avoid this problem by designing orchestrators that are solely responsible for sequencing and don’t contain any other business logic.


### Handling lack of isolation

The challenge with using sagas is that they lack the isolation property of ACID transactions. That’s because the updates made by each of a saga’s local transactions are immediately visible to other sagas once that transaction commits.

This behavior can cause two problems. First, other sagas can change the data accessed by the saga while it’s executing. And other sagas can read its data before the saga has completed its updates, and consequently can be exposed to inconsistent data

You can, in fact, consider a saga to be ACD:

The lack of isolation can cause the following three anomalies: 
* Lost updates: One saga overwrites without reading changes made by another saga. 

* Dirty reads: A transaction or a saga reads the updates made by a saga that has not yet completed those updates. 

* Fuzzy/nonrepeatable reads: Two different steps of a saga read the same data and get different results because another saga has made updates.


Countermeasures to handle lack of isolation:

* Semantic lock: An application-level lock. 

* Commutative updates: Design update operations to be executable in any order. Operations are commutative if they can be executed in any order.

* Pessimistic view: Reorder the steps of a saga to minimize business risk. 

* Reread value: Prevent dirty writes by rereading data to verify that it’s unchanged before overwriting it. 

* Version file: Record the updates to a record so that they can be reordered. It’s a way to turn noncommutative operations into commutative operations.


* By value: It’s a strategy for selecting concurrency mechanisms based on business risk. It executes low-risk requests using sagas, perhaps applying the countermeasures described in the preceding section. But it executes high-risk requests involving, for example, large amounts of money, using distributed transactions.



Structure of a saga:
Compensatable transactions: Transactions that can potentially be rolled back using a compensating transaction.

Pivot transaction: The go/no-go point in a saga. If the pivot transaction commits, the saga will run until completion.

Retriable transactions: Transactions that follow the pivot transaction and are guaranteed to succeed.

When using the semantic lock countermeasure, a saga’s compensatable transaction sets a flag in any record that it creates or updates.

The flag can either be a lock that prevents other transactions from accessing the record or a warning that indicates that other transactions should treat that record with suspicion.



