# Terraform Drift Detection – POC

<img width="1885" height="249" alt="image" src="https://github.com/user-attachments/assets/a7efa29e-859a-4f68-b82b-0638e84edca7" />

## Author table

| **Author**| **Created**      | **Version** | **Last updated by** | **Last Edited On** |  **L0 Reviewer** | **L1 Reviewer** | **L2 Reviewer** |
|-------------|------------------|-------------|----------------------|--------------------|-----------------|-----------------|-----------------|
| Asma Badr Khan | 2025-12-23 | 1.0 | Asma Badr Khan | 2026-01-11 |   |  |  |

## Table of Contents

- [Overview](#overview)
- [Objective](#objective)
- [Pre-requisites](#pre-requisites)
- [Step by Step Implementation](#step-by-step-implementation)
  - [Step 1: Prechecks](#step-1-prechecks)
  - [Step 2: Terraform Configuration](#step-2-terraform-configuration)
  - [Step 3: Initialize and Apply](#step-3-initialize-and-apply)
  - [Step 4: Introduce Drift](#step-4-introduce-drift)
  - [Step 5: Detect Drift](#step-5-detect-drift)
  - [Step 6: Remediate Drift](#step-6-remediate-drift)
- [Cleanup](#cleanup)
- [Conclusion](#conclusion)
- [Contact Information](#contact-information)
- [References](#references)

---
## Overview
This Poc demonstrates how Terraform detects infrastructure drift when changes are made manually outside of Terraform.

## Objective
- Install Terraform and AWS CLI from scratch
- Provision AWS infrastructure using Terraform
- Introduce manual infrastructure changes
- Detect drift using Terraform
- Optionally remediate drift

## Pre-requisites

| Category         | Requirement                   | Description                                         | Verification                   |
| ---------------- | ----------------------------- | --------------------------------------------------- | ------------------------------ |
| AWS Account      | Active AWS account            | Required to create and manage AWS resources         | Login to AWS Console           |
| IAM User         | Programmatic access           | IAM user with `AmazonEC2FullAccess` policy          | Access & Secret Keys available |
| AWS CLI          | Installed                     | AWS CLI v2 must be installed on the system          | `aws --version`                |
| AWS CLI          | Configured                    | AWS credentials and default region configured       | `aws sts get-caller-identity`  |
| Terraform        | Installed                     | Terraform v1.x installed on the system              | `terraform version`            |
| Permissions      | EC2 Access                    | Ability to create, modify, and delete EC2 resources | IAM policy attached            |

## Step by step implementation

### Step 1: Prechecks

```bash
aws --version
terraform version
```
<img width="867" height="138" alt="Screenshot 2025-12-20 190700" src="https://github.com/user-attachments/assets/3b93473f-1669-4d12-b73b-bd457719d219" />

```bash
aws sts get-caller-identity
```
<img width="823" height="156" alt="image" src="https://github.com/user-attachments/assets/b4641eff-efe7-4162-bf43-90c1c2c07941" />


### Step 2: Terraform Configuration
Create `main.tf`:

<img width="639" height="331" alt="Screenshot 2025-12-20 190811" src="https://github.com/user-attachments/assets/e49f9453-4c96-4648-8698-b4adeb8d95c3" />

### Step 3: Initialize and Apply

```bash
terraform init
terraform apply -auto-approve
```

<img width="917" height="443" alt="Screenshot 2025-12-20 190910" src="https://github.com/user-attachments/assets/e037ad43-ff03-42e6-ba0f-a59b7a3314e5" />

```bash
terraform validate
```

<img width="699" height="87" alt="Screenshot 2025-12-20 190916" src="https://github.com/user-attachments/assets/53ef5491-7bae-43b3-8a2c-a00151e0c770" />

```bash
terraform plan
```

<img width="1702" height="728" alt="Screenshot 2025-12-20 190946" src="https://github.com/user-attachments/assets/2d2d4924-0fca-4cdb-afdb-e4a6b8ddaba7" />

```bash
terraform apply
```
<img width="986" height="374" alt="Screenshot 2025-12-20 191051" src="https://github.com/user-attachments/assets/aa79adb5-9752-484f-a2f6-2c76dd3f5979" />

#### Resource created

```bash
terraform state list
```
<img width="726" height="75" alt="Screenshot 2025-12-20 191119" src="https://github.com/user-attachments/assets/6ccbc506-a2d0-44a8-9aa8-e934968753c6" />

---
<img width="1618" height="225" alt="Screenshot 2025-12-20 191202" src="https://github.com/user-attachments/assets/b45af35c-0f1b-4ec1-9981-b9e7c8c97b37" />


### Step 4: Introduce Drift
**Changing instance type**

<img width="1273" height="881" alt="Screenshot 2025-12-20 193337" src="https://github.com/user-attachments/assets/b98b46a3-fdf9-4f13-a957-7844491e8c52" />

---

<img width="1124" height="599" alt="Screenshot 2025-12-20 193406" src="https://github.com/user-attachments/assets/33a0c0d9-8a45-409d-9da7-c482befcf0e7" />


### Step 5: Detect Drift

```bash
terraform plan
terraform plan -refresh-only
```

<img width="1825" height="646" alt="Screenshot 2025-12-20 193941" src="https://github.com/user-attachments/assets/1a93e54b-1bfa-4fa2-be95-7d73f91ee996" />

### Step 6: Remediate Drift

```bash
terraform apply -auto-approve
```
<img width="1602" height="719" alt="Screenshot 2025-12-20 194252" src="https://github.com/user-attachments/assets/a4513b5e-87d1-450d-979e-f64f3fdc5368" />

### Cleanup

```bash
terraform destroy -auto-approve
```
<img width="1053" height="733" alt="Screenshot 2025-12-20 195249" src="https://github.com/user-attachments/assets/3a32a4e7-7331-41df-b1dd-8b1fc0737ba3" />

---

## Conclusion

This POC demonstrates how Terraform detects infrastructure drift caused by manual changes made outside Terraform. By comparing the desired state with the actual infrastructure state, Terraform accurately identifies configuration differences during the planning phase. This ensures infrastructure consistency and helps prevent unmanaged or unauthorized changes.

## Contact Information
| Name | Email |
|------|-------|
| Asma Badr Khan | asma.khan.snaatak@mygurukulam.co |

---
## References


| No. | Reference                                                                                                 | Description                                                                         |
| --- | --------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| 1   | [Terraform Official Documentation](https://developer.hashicorp.com/terraform/docs)                        | Official documentation covering Terraform concepts, workflows, and state management |
| 2   | [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) | Documentation for managing AWS resources using Terraform                            |
| 3   | [Terraform State & Drift Detection](https://developer.hashicorp.com/terraform/language/state)             | Terraform documentation explaining state files and drift detection mechanisms       |
| 4   | [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)                                                 | Official AWS documentation for EC2 instance lifecycle and configuration             |
| 5   | [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)                                                 | Guide for installing and configuring AWS CLI for Terraform authentication           |
