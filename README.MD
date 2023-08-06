### Prerequisites

Terraform version 1.4:
<https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli>

AWS CLI v2:
<https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html>

Configure AWS CLI profile:
<https://registry.terraform.io/providers/hashicorp/aws/latest/docs>
<https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-precedence>

Kubectl:
<https://kubernetes.io/docs/tasks/tools/>

Helm:
<https://helm.sh/>


### Infrastructure provisioning
Please check your AWS Region and Access keys in EKS/variables.tf
1. Open terminal

2. Go to EKS folder

3. Run:

terraform init

4. Run:

terraform apply

5. Wait until cluster is created (about 15 min)


### Wordpress Installation 
1. From the same folder you can run <helm repo add wordpress-repo https://charts.bitnami.com/bitnami>
2. Update your kubeconfig file <aws eks update-kubeconfig --name MyEksCluster --region us-east-1 --profile <YOUR-AWS-CLI_PROFILE>>
3. Run <helm install wordpress wordpress-repo/wordpress --set wordpressPassword=password>
4. run <kubectl get svc> to get your LB address it should look something like that: a62ab789f17b44d44a6156f954aebdf4-1235027863.us-east-1.elb.amazonaws.com/
5. Wordpress admin login will accesible in your browser via address : LB_ADDRESS/admin 
6. Username - user / pass - password


### Namespace resource limitaion

1. In order to create resource limitation for Namespace you can apply .yaml file with following content:

apiVersion: v1
kind: ResourceQuota
metadata:
  name: my-resource-quota
  namespace: default  # Replace with your namespace name
spec:
  hard:
    cpu: "2"                # Maximum CPU limit for the namespace
    memory: 2Gi             # Maximum memory limit for the namespace
    pods: "5"              # Maximum number of pods that can be created

2. Run <kubectl apply -f "PATH_TO_YOUR_YAML_FILE">
3. To check if it's applied to specified namespace run: <kubectl describe resourcequota -n NAMESPACEQUOTAAPPLIED>