# Components

### VPC
1. 3 Availability zone 1a,1b,1c
2. 3 public subnets
3. 3 Private subnets
4. 3 Nat gateway
5. 1 Bation Host
6. 3 Worker nodes on staging and QA
7. 6 Worker noded on prod with an autoscaling group

### QA & Staging Env
In other to reduce cost, we can have QA and staging have on cluster and we can leverage K8s NS (Namespace) to handle the env
