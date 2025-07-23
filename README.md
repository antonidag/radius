```mermaid
flowchart TD

  %% Developer steps
  subgraph WORKPROCESS["Workflow process"]
      %% Developer & Git Process (Top vertical)
    WP1["1: 🧑‍💻 Developer<br>- Create branch feature/int*"]
    WP2["2: 🔃 Open Pull Request <br>on push to main"]
    WP5["3: 🏷️ Add label on Pull Request"]
    WP3["4: 👀 Code Review & Approvals"]
    WP4["5: ✅ Merge PR to main"]
  end

  %% Build Phase
  subgraph WPBUILD["Build & Package"]
    B11["📦 Create integration package"]
  end

  %% Promotion Phase
  subgraph WPPROMOTE["Detect PR label"]
    P11["⚙️ Run deploy (code + iac) or other custom scripts"]
  end

  %% Deploy Phase
  subgraph WPDEPLOY["Deploy Package to PROD"]
    D32["🚀 Deploy infrastructure & application code"]

  end
  WP1 --> WP2
  WP2 --> WPBUILD
  WP5 --> WPPROMOTE
  WP3 --> WP4
  WP4 --> WPDEPLOY
  
  WPBUILD --> W1
  WPPROMOTE --> W5
  WPDEPLOY --> W6

  subgraph WORKFLOWS["🚀 GitHub Workflows"]
      W1["🔧 <b>build.yml</b><br> Creates package"]
      W2["🪧 <b>promote.yml</b><br>Add label to package"]
      W3["🚢 <b>deploy.yml</b><br>Deploy to envionment"]
      W5["🏷️ <b>run-script-by-label.yml</b><br>"]
      W6["✅ <b>deploy-on-merge.yml</b><br>✅ PR merged to main"]
      W4["⏪ <b>rollback.yml</b><br>🔵 Manual trigger"]
  end

  %% build.yml
  W1 --> B1["📦 <b>Step 1: Package</b><br>- Zip integration folder"]
  B1 --> B2["🐳 <b>Step 2: Wrap</b><br>- Build Docker image<br>- Embed ZIP as /artifact/integration.zip"]
  B2 --> B3["🐳 <b>Step 3: Publish</b><br>- Push to GHCR<br>- Name: int* <br>- Tag: :latest"]


  %% promote-by-label.yml
  W5 --> L1["🔍 <b>Extract Info</b> <br>- Determine label"]
  L1 --> L2["⚙️  <b>Call promote.yml</b><br>- With target tag"]
  L2 --> L3["⚙️  <b>Call deploy.yml</b><br>- With target tag"]
  L3 --> L4["❌ <b>Remove label</b><br>- Avoid retriggering"]

  %% promote.yml
  W2 --> P1["🏷️ <b>Tag Promotion</b><br>- dev → test → prod"]
  P1 --> P2["🐳 <b>Docker Tag + Push</b><br>- :dev, :test, :prod"]

  %% deploy-on-merge.yml
  W6 --> M2["⚙️ <b>Call promote.yml</b><br>- With prod tag"]
  M2 --> M3["⚙️ <b>Call deploy.yml</b>"]
  M3 --> M4["📝 Create Release Notes"]
  M4 --> M5["Clean up old builds"]

    %% deploy.yml
  W3 --> D1["🐳 Pull Image/Package"]
  D1 --> D2["📦 Extract /artifact/integration.zip"]
  D2 --> D3["📦 Detect resources"]
  D3 --> D4["🚀 Deploy Infra/Code"]

    %% rollback.yml
  W4 --> R1["📥 <b>Select Tag</b><br>- Provide integration ID + tag"]
  R1 --> R2["⚙️ Re-deploy via deploy.yml"]
```

```mermaid
flowchart TD
  subgraph BRANCHES["🌳 Git Branch Strategy & Protections"]
    F1["🌱 <b>feature/int*</b><br>👷 Development"]
    HF["🔥 <b>hotfix/int*</b><br>🚑 Urgent fixes"]
    PR["🔃 <b>Pull Request</b><br>➡️ Merge into main via PR"]
    MAIN["🌳 <b>main</b><br>"]
  end
  F1 --> PR
  HF --> PR
  PR --> MAIN
  subgraph RULES_MAIN["🔐 Protection: <b>main</b>"]
    M1["✅ Require Pull Request"]
    M2["🔍 Require 1+ Code Review"]
    M3["🚫 Disallow Self review"]
    M4["🛡️ Require Status Checks"]
    M5["🚫 Disallow Force Push & Direct Push"]

  end
  subgraph RULES_FEATURE["🔐 Protection: <b>feature</b>"]
    F2["🔤 Enforce Naming Pattern: feature/int{number}-*"]
    F3["🚫 Disallow Force Push"]
  end
  subgraph RULES_HOTFIX["🔐 Protection: <b>hotfix</b>"]
    H2["🔤 Enforce Naming Pattern: hotfix/int{number}-*"]
    H3["🚫 Disallow Force Push"]
  end
  MAIN --> RULES_MAIN
  RULES_HOTFIX --> HF
  RULES_FEATURE --> F1
```

```mermaid
mindmap
  root((Integration / Logic App Standard / Function App))
    *App Service Plan
    Network
     Private Endpoint
      vNet*
    Storage Account
    Application Insights
    Managed Identity
     RBAC Role Assignments
    App Settings
      Referenced
       Secrets
        *Key Vault
       Config
        *Application Config
    Communication
        Queue / Topic / Event / Subscription
         *Service Bus 
         *Event Grid
        API Management Backend
         *Azure Api Management
```


## ⚠️ Setup Instructions

After cloning the repo, run:

```bash
./setup-hooks.sh
```

This installs the Git hook to enforce good commit messages.

#### 🔃 Or hook into `post-checkout` / `post-merge` (optional)

Advanced: you could even auto-run `setup-hooks.sh` using another Git hook (like `post-checkout` or `post-merge`), but that would require some setup and doesn't always run on first clone.

---

### ✅ Summary

| Task                  | Done By       | Notes                            |
|-----------------------|---------------|----------------------------------|
| Write `commit-msg.sh` | You           | Add to `scripts/commit-msg.sh`  |
| Write `setup-hooks.sh`| You           | Installs symlink to `.git/hooks`|
| Run setup             | Each developer| Only once after cloning          |

Let me know if you want to expand it to check for hook installation automatically or prompt users when missing.



Replace trigger to call 
Rollback -> allso have to be tagged with iac och code.
Fler lager att visa interface layer 
Önske lista vilka integation som är påverkade av

Use branch rules to Require status checks to pass Build job



 