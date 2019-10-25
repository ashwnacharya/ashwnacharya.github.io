---
layout: post
title:  "Container Networking Notes"
date:   2018-05-02 12:00:00 +0530
---
# Cliff notes from the containers networking book


## 02. Single host Container networking

### Container modes

4 modes of networking in containers:

1. Bridge mode 
2. Host mode
3. Container mode
4. No networking mode

#### Bridge mode

Default networking driver. 

According to the book:

```
Docker daemon creates a virtual ethernet bridge called docker0.
Docker contains all containers on a host to this internal network by creating a pair of peer interfaces.
One peer becomes container's eth0 interface and the other peer will be in the namespace of the host.
The peer on the namespace of the host gets assigned an ip address from the private ip range to the bridge.
```

From the docker documentation

```
In terms of networking, a bridge network is a Link Layer device which forwards traffic between network segments. 

A bridge can be a hardware device or a software device running within a host machine’s kernel.

In terms of Docker, a bridge network uses a software bridge which allows containers connected to the same bridge network to communicate.
```
On one end of the network is a network interface that is in the host's namespace, and the other end is an interface which owned by the container.

#### Host mode network
Will probably be never used anywhere, ever; so i dont want to go deep into this.
Basically it is when the container shares the same IP as the host.
So there is no bridge involved. And no network level isolation.


#### Container mode networking
This is when a second container shares the same IP address as another container. Typically used by sidecar containers within a pod in kubernetes.


#### No networking
Typically used when you dont want to interact with a container over a network. Typically used for batch jobs and such.


## 03. Multi host networking

### Multi host networking 101

These are the challenges:

1. How do containers on different machines talk to each other? 
2. How do they talk to the outside world?
3. How do you keep state, IP address assignments, etc consistent?
4. How do they integrate with existing network infrastructure?


Based on various tradeoffs on each of these variables, there are many options available.

1. Flannel
2. Weave.net
3. Calico
4. Open vSwitch
5. OpenVPN
6. And many more....


### Key challenges

#### IPVLAN
Linux kernel 3.19 allows you to assign each container on a host a unique and routable IP address. 
Effectively, it takes a single network interface and creates multiple virtual network interfaces with different mac addresses assigned to them.

#### IPAM
2 approaches to IP address management
1. Find a free ip address within the existing network
2. Use a overlay network and find a way to bridge it


#### Orchestration compatibility
Check if the container networking option is compatible with the orchestration tool that you are using


#### IPv6 support
And all the teething problems that come with it.


## 04. Orchestration

### What does an orchestrator do
Typically provides functions like

1. Organizational primitives such as labels, to query and group them.
2. Scheduling containers on hosts
3. Automated health checks
4. Autoscaling
5. Updating and upgrading strategies (A/B testing, canary deploys etc.)
6. Service discovery with DNS support
7. Base provisioning (installing/upgrading the local OS on the node where container runs)

### what does a scheduler do?
Places a container on one or more available hosts, using its knowledge of the state of the cluster.


### Different types of orchestrator
* Docker swarm
* Apache mesos
* nomad

## 05. Service discovery

Deals with the problem of reliably determining where a service was deployed, given that the deployment is done by a scheduler; i.e. map a running container to its location.

### The challenge

Registration: Establishes the container -> location mapping.
Lookup: Enables other services to look up mapping

In addition to this, we can also consider the following challenges:

* Exclude unhealthy hosts.
* Tradeoff between consistency and availability (CAP theorem)
* Scalability
* Load balancing

### Technologies
* Zookeeper
* etcd
* Consul
* DNS based solutions
  * Mesos-DNS
  * SkyDNS
  * WeaveDNS


### Load balancing

The goals are to:
1. maximise throughput and minimise response time
2. avoid hotspotting
3. help with overly aggressive dns caching


Popular load balancing options are:
1. Bamboo
2. Haproxy
3. kube-proxy
4. MetaILB
5. Nginx
6. servicerouter.py
7. traefik
8. Vamp-router
9. Vulcand


## 06. Container Networking Interface

CNI provides the pluggable architecture for containers and orchestrators.
It is a lightweight spec that deals with network connectivity of containers as well as garbage collection once containers are deleted.

### Specification and usage

In context of networking, we have the following two definitions:

Container: A linux network namespace
Network: addressable group of entities that can communicate with one another

At a high level, the CNI works as follows:

1. Container runtime takes some configuration and issues a command to a plugin
2. Plugin goes off and configures the network

So, CNI conceptually allows you to add networks to a container, and remove them.

The current version of CNI defines the following operations:
1. Add a container to one or more networks
2. Delete container from network
3. Report CNI version


### Runtimes and plugins
There is a long list of third party plugins for container networking

* Amazon ECS CNI
* Bonding
* Calico
* Cilium
* CNI-Genie
* Infoblox
* Linen
* Multus
* Nuage CNI
* Romana
* Silk
* Vhostuser
* Weave net


## 07. Kubernetes networking

### Kubernetes networking overvidw

Kubernetes only states three fundamental requirements:

1. Containers can communicate with all other containers without NAT.
2. Nodes can communicate with all containers (and vice versa) without NAT.
3. The IP a container sees itself is the same IP as others see it.

How you meet these requirements is up to you. It does not provide a default SDN solution.
This means a lot of freedom.


There are 3 types of network traffic in kubernetes
* Intra pod networking
* Inter pod networking
* Ingress and egress


### Intra pod networking
Within every pod, kubelet launches a container called infrastructure container.
It acquires the pods ip and namespace using bridge mode.
All other containers join this container in container mode.
As a result, all containers in a pod can access each other on localhost.


### Inter-pod networking
Each pod has a routable IP, allowing other pods to communicate without NAT.

So pods can communicate in two ways:
1. caller pod looks up the IP and then calls the callee. Not very scalable because of frequent lookups needed.
2. pods use services to call other pods. Service provides a stable virtual ip that can be discovered, eg. via dns.


### Services
A service has a stable virtual IP (IP:Port) that serves as ain index of a datastructure object that maps to actual IP addresses.


A service addresses a set of pods, that are selected via a label selector.

Each target pod has an endpoint VIP using which it is routed to.

A process called kube-proxy runs on every node and keeps the mapping between the vip and the pods up to date.

It does so by querying the api server and modifying the node's ip tables.



### Service discovery in kubernetes

Two ways to do this:
* Environment variable based
* DNS based

Evironment variable based approach is not very reliable.

DNS based service discovery is possible if you use a DNS cluster add on.
It watches the api server and creates DNS SRV records for the pods' cluster IP.


  
### Ingress and Egress
An ingress controller needs to be deployed for a service to be available to the outside world.

An ingress route is defined by deploying an ingress resource.

An ingress controller listens to `/ingresses` endpoint of the api server and configures the routes so that external traffic lands at specific services. 


### Advances k8s topics

#### Network policies
Network policies allow you to create rules, similar to a firewall.


#### Service meshes
Take away the overhead of configuring the network.

Popular choices are 
* Istio
* Conduit












