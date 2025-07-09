# 📘 GitHub Enterprise - Way of Working

## 1. Overview

This document defines the **Way of Working** for development teams using **GitHub Enterprise**. It is derived from the provided Mermaid diagrams and covers workflows around:

* **Branching strategy** and rules
* **GitHub Actions** for CI/CD pipelines
* **GitHub Packages** for artifact publishing
* **GitHub Releases** for versioning and deployment tagging

The goal is to ensure a consistent, secure, and traceable development and deployment process.

---

## 2. Branching Strategy

### 🔁 Key Branches

| Branch         | Purpose                 | Naming Convention  |
| -------------- | ----------------------- | ------------------ |
| `main`         | Production-ready code   | Protected          |
| `feature/int*` | New feature development | `feature/int123-*` |
| `hotfix/int*`  | Critical fixes to main  | `hotfix/int123-*`  |

### 🔐 Protections

**`main` branch rules:**

* ✅ Require pull requests
* 🔍 Require at least 1 code review
* 🚫 Disallow self-review (Optional)
* 🚫 Disallow direct and force pushes

**`feature/*` and `hotfix/*` rules:**

* 🔤 Enforce naming conventions (`feature/int{number}-*`, `hotfix/int{number}-*`)
* 🚫 Disallow force pushes

### 🧪 Merging Guidelines

* All merges into `main` must occur via pull requests.
* Reviews are mandatory before merge.
* CI checks must pass before a merge is allowed.

---

## 3. GitHub Actions

### ⚙️ Overview

GitHub Actions are used to automate build, package, promote, deploy, and rollback workflows.

### 🧩 Key Workflows

| Workflow File          | Trigger                          | Purpose                          |
| ---------------------- | -------------------------------- | -------------------------------- |
| `build.yml`            | Manual on `feature/int*` and `hotfix/int*`         | Package & push to GHCR           |
| `promote.yml`          | Label-based or merge to `main`   | Tag image and prepare for deploy |
| `deploy.yml`           | Called by `promote.yml`/rollback | Pull, extract & deploy package   |
| `rollback.yml`         | Manual trigger                   | Rollback deployment              |
| `promote-by-label.yml` | Label added to PR                | Trigger promote + deploy         |
| `deploy-on-merge.yml`  | PR merged to `main`              | Promote & deploy to production   |

### 🧱 Modular Patterns

* Workflows are broken down into discrete responsibilities (build, promote, deploy).
* Triggers use a combination of manual triggers, labels, and events.

---

## 4. GitHub Packages

### 📦 Artifact Strategy

Artifacts are built as part of the `build.yml` workflow:

* Code is zipped as `/artifact/integration.zip`
* Docker image is built with the zip file embedded
* Images are tagged as `latest`, then re-tagged as `:dev`, `:test`, `:prod` during promotion

### 📤 Publishing

* Artifacts are pushed to **GitHub Container Registry (GHCR)**
* Naming convention: `int*` per integration

### 🗃️ Retention

* Older tags should be cleaned up automatically except for `:dev`, `:test`, `:prod`, `latest` and versioned release tags.

---

## 5. GitHub Releases

### 📌 Versioning

* Follows: `v1.2.3`
* Tied to deployments made via `deploy.yml`

### 📝 Creating Releases

* Releases are generated automatically in `deploy.yml`
* Release notes include:

  * Integration version
  * Deployment logs
  * Git SHA or tag

---

## 6. Recommended Workflow

### 🧑‍💻 Developer

1. Create a new branch from `main`:

   ```bash
   git checkout -b feature/int123-add-logging
   ```
2. Push changes and optionally trigger manual `build.yml`.

### 🔃 Pull Request

3. Open a pull request to `main`.
4. Add a label if deploying to `dev`/`test` (`deploy-dev`, `deploy-test`).

### 👀 Code Review & Checks

5. Ensure code review is done and CI checks pass.
6. Reviewer removes any deployment label to avoid retriggering.

### ✅ Merge

7. Merge the pull request into `main`.
8. This triggers:

   * `promote.yml` (for `:prod`)
   * `deploy.yml` (to deploy to production)

### 🚀 Deployment

9. GitHub Actions will:

   * Pull Docker image
   * Extract integration zip
   * Deploy infrastructure/code
   * Generate release notes

### ⏪ Rollback (If Needed)

10. Manually trigger `rollback.yml` with integration ID and version tag.

---

## ✅ Summary

This Way of Working ensures:

* Secure, review-driven merging
* Modular and transparent deployments
* Clear artifact tracking via packages and releases
* Flexible promotion paths controlled by labels or PR merges

> Always let the workflow and automation guide the process. Manual steps should be the exception, not the norm.

---