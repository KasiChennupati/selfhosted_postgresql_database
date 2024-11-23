# Platform Standards

Postgres is the most advanced Relational Database management system today.

Many vendors provide postgres as a PaaS or SaaS service. Regardless of the type of the instance and how the instance is being hosted or serviced.

Following a set of standards around how we structure, organise and govern this Technology Capability and Functionality is important and sometimes it may break or make the scalability of your usecase.

## Environments

It is a common practice in an enterprise setting to maintain multiple postgres environments to provide environments for different level of isolation for mitiating risk of code errors, human errors, logic failures.

Below are the different environments and the 3 letter short code conformation.

| Sl No |          Environment          | Short Code |
| :---: | :---------------------------: | :--------: |
|   1   |          Production           |    PRD     |
|   2   |        PRE-Production         |    PRE     |
|   3   |            Staging            |    STG     |
|   4   |        Non-Production         |    NPD     |
|   5   |    User Acceptance Testing    |    UAT     |
|   6   |   Quality Assurance Testing   |    QAT     |
|   7   |            Testing            |    TST     |
|   8   |      System Integration       |    SIT     |
|   9   |          Development          |    DEV     |
|  10   |            Sandbox            |    SBX     |
|  11   |       Proof Of Concept        |    POC     |
|  12   |            Backup             |    BKP     |
|  13   |            Archive            |    ARC     |
|  14   | Disaster Recovery Environment |    DRE     |

## Naming Conventions

Postgres often starts it's abstraction from a cluster notation which often map to a physical/virtual instance or container.

With in the context of this document we will refer to the word postgres-cluster as a single selfhosted instance of Postgres

| Name or Notation          | What it means                                                                                                                                                          |
| :------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| postgres-cluster          | This denotes any single installed instance of postgres either in a container or a virtual machine or on a physical computer.                                           |
| postgres-database-cluster | To denote a collection of data bases connected via a network and other postgres High availability and reliability features multiple (Multi-Master, High-Availability). |

### Cluster Naming

Postgres cluster is tied to the following levels of physical or logical abstractions before it reaches the platform/application level of postgres (database, scheme, table, role etc).

__Note:__ `Maintain max length for cluster name is 63 chars`

- Owner (company, individual etc)
- Environment
- Hosted Location
- Type of host
- Release Version
- Technical Pupose
- Business / User Purpose

The above are the identifiers to consider when naming a postgres-cluster.

General lexical standards to maintain:

- All lowercase
- Hyphen-separated (safe for hostnames)
- Start with a letter
- Name Max up to 63 characters

| __Suffix__ | __Length__ | __Meaning__                             | __Use Case__                     |
| ---------- | :--------: | --------------------------------------- | -------------------------------- |
| repl       |     5      | Generic read replica                    | Standard replication             |
| read       |     5      | Read-only replica                       | Reporting, dashboards            |
| rptc       |     5      | Reporting replica                       | BI tools, analytics queries      |
| anal       |     5      | Analytics replica                       | Heavy queries, ML workloads      |
| fail       |     5      | Failover replica                        | DR / passive standby             |
| xreg       |     5      | Cross-region replica                    | For multi-region deployments     |
| xzon       |     5      | Cross-zone replica                      | For HA within same region        |
| hotr       |     5      | Hot standby (HA, streaming replication) | PostgreSQL synchronous HA setups |

__Examples:__

we can use `"_" or "-"` and stick to either `lowercase or uppercase` in below examples

| SL No | Postgres Cluster Name                                                                                                                          | Description                                                                                                                                                                      |
| :---: | :--------------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|   1   | `MSFT-PRD-LOC-PHY-PG15-PRIMARY-SALES-DATABASE` or `MSFT_PRD_LOC_PHY_PG15_PRIMARY_SALES_DATABASE` or `MSFTPRDLOCPHYPG15-PRIMARY-SALES-DATABASE` | Microsoft wanted to store their production sales department systems data in a postgres cluster in databases using postgres 15 version as hosted local site on a physical machine |
|       | <ul><li>`MSFT-PRD-LOC-PHY-PG15-PRIMARY-SALES-DATABASE`</li><li>`MSFT_PRD_LOC_PHY_PG15_PRIMARY_SALES_DATABASE`</li></ul>                        |                                                                                                                                                                                  |

### Database Naming

General lexical standards to maintain:

- All lowercase
- Hyphen-separated (safe for hostnames)
- Start with a letter
- Safe up to 63 characters

### Users and Roles Naming

Postgres users and Groups are the best way to govern and control the data access to the users and applications on the platform.

#### Users Naming

__Users:__ the postgres security objects that can login and perform database operations are called users learn more here : 

__Naming Guidelines:__

- user names are created by prefixing the username by `usr`
- special users like microservice applications specific users are created with prefix `sys`

__Different Types of postgres security roles:__

| Type of User                 | Prefix | Description                                                                                    |
| ---------------------------- | ------ | ---------------------------------------------------------------------------------------------- |
| User Groups                  | grp    | used to group a bunch of postgres users together                                               |
| Postgres Roles               | pg     | These are default rules in postgres not should almost never be used rather create custom roles |
| Roles                        | rol    | This is a role created in postgres that contains specific actionable permissions               |
| Non-Human / Machine Accounts | svc    | user account created for <ul> <li>admin users with following `_adm`, </li> <li>applications with following `_adm`</li> <li>and services with following `_a`</li> </ul>                                |
| Human User Accounts          | usr    | normal human users                                                                             |

> The above table is carefully selected and thought by arranging different security roles in alphabetical order :)

__Additional Notes:__

- some other options to a Admin, App or Service users are (srv / sys)

#### Groups Naming

__Groups:__ the postgres security objects that can not login and enable the database operations for users who are part of this  are called users learn more here

| Group                    | Description                                                                      |
| ------------------------ | -------------------------------------------------------------------------------- |
| grp_db_<<db_name>>_owner | used to group a bunch of postgres users together                                 |
| rol_db_<<db_name>>_owner | This is a role created in postgres that contains specific actionable permissions |
