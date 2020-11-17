### Practica de AWS, Packer, Ansible y Terraform

#### Using the docker image/container

Start using

```
docker-compose up -d
```

Enter to the container

```
docker exec -it practica-aws bash
```

#### Login as workshop

```
su workshop
```

### Create AWS Profile

```
aws configure --profile aws-workshop
```

### Installing ansible roles

```
cd /app/packer/ansible
ansible-galaxy install -r requirements.yaml
```

### Packer

#### Creating AMI

```
cd /app/packer
packer build ami.json
```

### Terraform

#### Init terraform

```
cd /app/terraform
terraform init
```

#### Checking Terraform Plan

```
terraform plan --var-file=default.tfvars
```

#### Applying Terraform changes

```
terraform apply --var-file=default.tfvars
```

#### Destroying/Reverting Terraform changes

```
terraform destroy --var-file=default.tfvars
```
