# Tools

This document provides a concise overview of the tools used in developing, testing, and managing **Azure Logic Apps (Standard)** and **Azure Function Apps**, along with their specific purposes.

---

## Tools & Their Purpose

### 1. Visual Studio Code (VS Code)

A lightweight, extensible code editor used for writing and managing Logic App and Function App code.

#### Key Extensions:

| Extension                       | Purpose                                                                                                                                |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| **Azure Logic Apps (Standard)**     | Enables local development of Logic Apps Standard. Provides a visual designer and code view to edit workflows (`.workflow.json` files). |
| **Azure Functions**                 | Adds support for creating, running, and debugging Azure Functions locally. Useful for HTTP triggers, timers, and other bindings.       |
| **Azure Tools**                     | A suite of Azure management tools integrated into VS Code (subscriptions, resources, deployments).                                     |
| **YAML**                            | Adds syntax support and schema validation for `.yaml` files, often used in CI/CD pipelines or configuration files.                     |

---

### 2. Git Bash

A terminal emulator for Windows that provides a Unix-like shell environment.

#### Used for:

* Managing Git repositories
* Scripting deployments and automation
* Interacting with local and remote environments

---

### 3. Terraform

An Infrastructure-as-Code (IaC) tool used to provision and manage Azure resources declaratively.

#### Used for:

* Creating and managing **Logic Apps** and **Function Apps**
* Defining resource groups, app settings, and storage accounts
* Automating deployments in a repeatable and version-controlled way

---

## Optional Tools (Based on Workflow Needs)

| Tool                       | Purpose                                                                                    |
| -------------------------- | ------------------------------------------------------------------------------------------ |
| Azure CLI                  | Command-line tool for interacting with Azure (e.g., deploy Logic Apps, publish Functions). |
| Azure Storage Explorer     | GUI tool to manage blobs, queues, and file shares used by Logic Apps or Functions.         |
| Postman            | Testing endpoints exposed by Function Apps or Logic Apps with HTTP triggers.               |

---