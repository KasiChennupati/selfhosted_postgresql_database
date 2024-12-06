# Principle of Least Principle

Postgres is the most popular database and widely used and being adopted in multiple projects and enterpise contexts. This creates a need to implement necessary governance and security processes in place. 

[Principle of Least Principle (PoLP)](https://en.wikipedia.org/wiki/Principle_of_least_privilege) is a security principle and standard that ensures that only the minimum amout of necessary permission(s) is provided to the identity. 

This means that every postgres platform identity (user, role, service, script, microservice, admin, reporting tool) has only the permissions required to perform its intended function—nothing more. PoLP protects the platform from data leaks, schema corruption, privilege escalation, accidental damage, and lateral movement across databases.
