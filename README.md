# 🌐 Terraform LAMP Stack (3-Tier Architecture on AWS)

This project provisions a **modular three-tier LAMP stack** (Linux, Apache, MySQL, PHP) using **Terraform Infrastructure as Code (IaC)** on AWS.

---

## 📦 Stack Overview

| Tier            | Description                                  | Deployment |
|-----------------|----------------------------------------------|------------|
| **Web Tier**    | EC2 + Apache + PHP (public subnet)           | ✅         |
| **App Tier**    | EC2 for PHP logic (private subnet)           | ✅         |
| **Database Tier** | EC2 + MySQL (private subnet)               | ✅         |

---

## 📁 Module Structure

```bash
lamp-terraform/
├── main.tf                 # Root Terraform config
├── output.tf               # Output values
├── modules/
│   ├── vpc/                # VPC + subnets
│   ├── security_groups/    # Security groups with SG rules
│   ├── web/                # Web tier EC2 + Apache
│   ├── app/                # App tier EC2 + PHP
│   └── db/                 # DB tier EC2 + MySQL
````

---

## ⚙️ What It Creates

* Custom **VPC** with public & private subnets
* **Security Groups** with custom ingress/egress rules
* **Apache web server** (HTTP + SSH open to world)
* **App logic server** restricted to internal traffic
* **MySQL server** restricted to app tier only
* User data scripts for automatic software installation

---

## 🚀 How to Use

### 1. Clone the Repo

```bash
git clone git@github.com:muhirwaJD/lamp-terraform.git
cd lamp-terraform
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Review the Plan

```bash
terraform plan
```

### 4. Deploy Infrastructure

```bash
terraform apply
```

> Type `yes` to confirm.

---

## ✅ Outputs

After deployment, you'll get:

* ✅ Web public IP
* ✅ EC2 Instance IDs (Web, App, DB)
* ✅ Subnet and VPC IDs

---

## 🔐 Requirements

* Terraform v1.5+
* AWS CLI configured
* AWS IAM user with EC2, VPC, and RDS permissions

---

## 📦 Notes

* AMI used: Ubuntu 22.04 (`ami-01f23391a59163da9`)
* Web tier is the only publicly accessible instance
* App & DB tiers are private for better security
* Easily extendable with RDS, ALB, or S3 modules

---

## 🧹 Tear Down

To destroy the infrastructure:

```bash
terraform destroy
```

---
