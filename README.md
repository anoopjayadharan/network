# AWS VPC deployment using Terraform

[![Network](https://github.com/anoopjayadharan/network/actions/workflows/network.yml/badge.svg)](https://github.com/anoopjayadharan/network/actions/workflows/network.yml)

The AWS account where this script will run is created based on the [AWS Security Reference Architecture](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/network.html)

A Network account is defined to host networking resources. Using the AWS resource access manager managed service, the resources are shared across other AWS accounts in a [multi-account environment](https://docs.aws.amazon.com/prescriptive-guidance/latest/migration-aws-environment/building-landing-zones.html#aws-control-tower)

The Terraform script creates a VPC resource with four subnets, two public and two private, corresponding route tables, and an internet gateway associated with the public subnets.

Here is a diagram of the VPC we want to build:

![Diagram](./assets/images/vpc-diagram.PNG)

**Region: eu-west-1**

***VPC***

![vpc](./assets/images/vpc.PNG)

***Subnets***

![subnets](./assets/images/subnets.PNG)

***Route Tables***

![route-tables](./assets/images/route%20tables.PNG)

***Internet Gateway***

![igw](./assets/images/igw.PNG)

## AWS Resource Access Manager

AWS Resource Access Manager (AWS RAM) helps you securely share your resources across AWS accounts, within your organization or organizational units (OUs), and with AWS Identity and Access Management (IAM) roles and users for supported resource types.

**Benefits of AWS RAM**
- Reduces your operational overhead
- Provides security and consistency
- Provides visibility and auditability

### How resource sharing works

![](./assets/images/ram%20-%20diagram.PNG)

***Resource Access Manager***

![resource-access-manager](./assets/images/ram.PNG)

***Resource Share***

![shared-resources](./assets/images/shared%20resources.PNG)

Resource sharing has already been enabled at the organisational level. Here, we share it only within an OU.

***Principal***

![principals](./assets/images/principals.PNG)