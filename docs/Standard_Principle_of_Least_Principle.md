# Principle of Least Principle

Postgres is the most popular database and widely used and being adopted in multiple projects and enterpise contexts. This creates a need to implement necessary governance and security processes in place. 

[Principle of Least Principle (PoLP)](https://en.wikipedia.org/wiki/Principle_of_least_privilege) is a security principle and standard that ensures that only the minimum amout of necessary permission(s) is provided to the identity. 

This means that every postgres platform identity (user, role, service, script, microservice, admin, reporting tool) has only the permissions required to perform its intended function—nothing more. PoLP protects the platform from data leaks, schema corruption, privilege escalation, accidental damage, and lateral movement across databases.

## Enterprise Governace Body

It is recommended to have a governance body with inthe organisation to makesure this standard and other governance and security policies and standards in line with enterprise Risk and Compliance team. 

It is important to know that Legislatory Compliance interpretation to the enterprise standards are not the job of Technology Team this need to be put in place by the Legal & Compliance team of the company.

- Non Technical Legal and Compiance team in an organisation sets up the organisation internal governance and regulatory policies
- Enterprise Architecture team with a mixture of Security, Data and Business Architects will translate the governance and compliance policies to a technical implementation processes and logic

## PLOP Guidance for Postgres

- No app role owns schema
- No app role has CREATE privilege
- PUBLIC has no rights
- All roles follow NOLOGIN to LOGIN hierarchy
- Developers have RO access only
- Migration role is separate
- Default privileges configured
- Superuser restricted
- Monitoring role isolated
- RLS enforced where needed
