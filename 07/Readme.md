# Mechanism to guarantee HA

For K8s cluster to be highly available, there are somethings to put in place when configuring this cluster

1. Use a managed Kubernetes cluster ( AWS EKS), this will help in managing master node and you can take care of worker nodes
2. Use Autoscaling : several tools like terraform or EKSCTL can help in managing your worker nodes and we can configure it in a way to be in Multi region
3. We can also implement pod topology spread constraints

