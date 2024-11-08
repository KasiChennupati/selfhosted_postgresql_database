# Platform Standards

Postgres is the most advanced Relational Database management system today.

Many vendors provide postgres as a PaaS or SaaS service. Regardless of the type of the instance and how the instance is being hosted or serviced.

Following a set of standards around how we structure, organise and govern this Technology Capability and Functionality is important and sometimes it may break or make the scalability of your usecase.

## Naming Conventions

Postgres often starts it's abstraction from a cluster notation which often map to a physical/virtual instance or container.

With in the context of this document we will refer to the word postgres-cluster as a single selfhosted instance of Postgres

| Name or Notation | What it means |
| --- | --- |
| postgres-cluster | this denotes any single installed instance of postgres either in a container or a virtual machine or on a physical computer. |
| database-cluster | To denote a collection of data bases connected via a netowork and other postgres High availability and reliability features. |

### Cluster Naming

Postgres cluster is tied to a specific the following levels of physical or logical abstractions before it reaches the platform/application level of postgres 

- Owner (company, individual etc)
- hosted location
- type of host
- release version
- technical pupose
- business/user purpose
