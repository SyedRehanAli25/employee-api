# Terraform Drift Detection Document

<img width="1885" height="249" alt="Screenshot 2025-12-20 231515" src="https://github.com/user-attachments/assets/a6f742b6-9ead-47c5-9dc7-a3c881443e50" />

## Author table

| **Author**| **Created**      | **Version** | **Last updated by** | **Last Edited On** | **L0 Reviewer** | **L1 Reviewer** | **L2 Reviewer** |
|-------------|------------------|-------------|----------------------|--------------------|-----------------|-----------------|-----------------|
| Asma Badr Khan | 2025-12-24 | 1.0 | Asma Badr Khan | 2026-01-11 |  |  |  |

---

## Table of Contents

- [Introduction](#introduction)
- [What is Terraform Drift?](#what-is-terraform-drift)
- [Why Drift Detection is Important](#why-drift-detection-is-important)
- [Advantages of Drift Detection](#advantages-of-drift-detection)
- [Design Strategy](#design-strategy)
- [Drift Detection Workflow](#drift-detection-workflow)
- [How Terraform Detects Drift](#how-terraform-detects-drift)
- [Automation Approach](#automation-approach)
  - [Exit Codes](#exit-codes)
- [Drift Reporting Strategy](#drift-reporting-strategy)
- [Remediation Strategy](#remediation-strategy)
- [Best Practices](#best-practices)
- [Conclusion](#conclusion)
- [Contact Information](#contact-information)
- [References](#references)

---
## Introduction

This document provides a detailed design for detecting infrastructure drift using Terraform. It explains the strategy, tools, and automation approach used to identify changes in infrastructure that differ from the Terraform-defined state.
The document also outlines best practices for reporting and managing drift to maintain infrastructure consistency and reliability.

---

## What is Terraform Drift?
Terraform drift refers to changes in infrastructure that are made outside of Terraform, resulting in inconsistencies between Terraform configuration files, state files, and actual infrastructure.

---

## Why Drift Detection is Important
- Prevents unauthorized or manual infrastructure changes  
- Maintains infrastructure consistency  
- Improves operational stability  
- Ensures Terraform remains the single source of truth  
- Supports audit and compliance requirements  

---

## Advantages of Drift Detection

| Advantage | Description |
|--------|-------------|
| Configuration Consistency | Ensures infrastructure matches Terraform code |
| Early Detection | Identifies drift before failures occur |
| Security | Detects unauthorized changes |
| Stability | Prevents unexpected behavior |
| Automation Ready | Easily integrates with CI/CD pipelines |

---

## Design Strategy
The drift detection design follows a compare-and-report approach:
1. Terraform code defines the desired state
2. Terraform state stores the last applied state
3. Terraform queries the cloud provider
4. Actual state is compared with desired state
5. Differences are reported as drift

---

## Drift Detection Workflow

```
Terraform Code
      ↓
Terraform State
      ↓
Cloud Provider API
      ↓
terraform plan / terraform plan -refresh-only
      ↓
Drift Report
```

---

## How Terraform Detects Drift
Terraform compares the desired configuration with the actual infrastructure state retrieved from the cloud provider during plan or refresh operations. Any mismatch is reported as drift.

---

## Automation Approach
Drift detection is automated using CI/CD pipelines:
1. Scheduled pipeline execution
2. Terraform initialization
3. Refresh-only drift check
4. Exit code evaluation
5. Notification on drift detection

### Exit Codes

| Code | Meaning |
|----|---------|
| 0 | No drift detected |
| 2 | Drift detected |
| 1 | Error occurred |

---

## Drift Reporting Strategy

| Channel | Purpose |
|------|--------|
| Console Output | Immediate visibility |
| Pipeline Logs | Audit trail |
| Slack / Email | Notifications |
| Reports | Compliance evidence |

---

## Remediation Strategy
Drift remediation is performed after review:
```bash
terraform apply
```
Automatic remediation is not recommended for production environments.

---

## Best Practices

| Best Practice | Benefit |
|-------------|---------|
| Use refresh-only mode | Prevent unintended changes |
| Automate drift detection | Continuous compliance |
| Restrict manual changes | Reduce drift |
| Secure Terraform state | Protect infrastructure |
| Review plan output | Avoid accidental updates |

---

## Conclusion

Terraform drift detection ensures infrastructure consistency by identifying differences between desired and actual resource states. This design provides a reliable, auditable, and automation-ready approach to managing infrastructure changes.

---

## Contact Information

| Name | Email |
|------|-------|
| Asma Badr Khan | asma.khan.snaatak@mygurukulam.co |

## References

| No. | Reference                                                                                                 | Description                                                                         |
| --- | --------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| 1   | [Terraform Official Documentation](https://developer.hashicorp.com/terraform/docs)                        | Official documentation covering Terraform concepts, workflows, and state management |
| 2   | [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) | Documentation for managing AWS resources using Terraform                            |
| 3   | [Terraform State & Drift Detection](https://developer.hashicorp.com/terraform/language/state)             | Terraform documentation explaining state files and drift detection mechanisms       |
| 4   | [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)                                                 | Official AWS documentation for EC2 instance lifecycle and configuration             |
| 5   | [AWS CLI Documentation](https://docs.aws.amazon.com/cli/)                                                 | Guide for installing and configuring AWS CLI for Terraform authentication           |
