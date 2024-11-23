# Project Scripts

This sectio of the project contains all the necessary setup, admin, operational and maintenance scripts required for quick or standardised pattern for postgres stack.

## Docker Initialisation Scripts

The name suggests that we are running in docker but this is all 

This section contains the required DDL and commands to replicate the build of the postgres database besed on the hierarchicality of the postgres objects existance and scope.

The following order provides a level of sequential execution of commands without throwing errors in postgres.
So, for a first time setup of postgres if we need to set up the postgres based on a predefined DDL structure we can use the below order of sql statement group's to create our base template.

> There are automated and better way to do this. This approach is for the nitpicky ones like me :)

| Sl no | Objects Group      | Description |
| :---: | :----------------- | ----------- |
|   1   | tablespaces        |             |
|   2   | extensions         |             |
|   3   | roles              |             |
|   4   | databases          |             |
|   5   | schemas            |             |
|   6   | types and domains  |             |
|   7   | tables             |             |
|   8   | constraints        |             |
|   9   | indexes            |             |
|  10   | sequences          |             |
|  11   | views              |             |
|  12   | materialised views |             |
|  13   | functions          |             |
|  14   | procedures         |             |
|  15   | triggers           |             |
|  16   | rules              |             |
|  17   | row level security |             |
|  18   | grants             |             |
|  19   | comments           |             |
|  20   | seed               |             |
