# Introduction

This page will list down the softwares/tools that are most commonly used in design and development of Azure applications in Skanska Sweden. There might be some new tool that the developers want to use in few cases, it is preferable to check the terms of use before making use of them. Also, any new tool might need approval from IECC team of architects.


# Work Tools
## Design
### Diagrams.net (formerly Draw io)

This is a free online architecture diagramming software. It is based on the open source project by the same name.

This tool provides users with a quick way to start diagramming software, hardware, or other types of IT infrastructure. It also has a wide collection of useful templates out of the box, including software, network, and business objects for everything from threat modeling for Security Architects to a full set of Azure-specific shapes that are needed for Azure architectural diagrams. 

The "Click to connect and clone" option makes building out repetitive shapes a breeze, and the wide range of ways to import and export make for a great tool for quick drafts or deep design work. It also offers the option to export as a URL, making an image publicly available in an instant.

Most impressively, diagrams can be saved as simple XML files, making backups and sharing incredibly straightforward.

- System Requirement to run Diagrams.Net : You can use it in various web browsers, such as Chrome, Edge, Safari and Firefox.

## Development

### Visual Studio Code

VS Code is our first choice development tool to develop workflows in Azure. It is possible to locally create, run and test workflows using the Visual Studio Code development environment.

Visual Studio Code is free. Also, there are few extensions which are needed to be installed before it is ready for development.
#### Key Extensions:

| Extension                       | Purpose                                                                                                                                |
| ------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| **Azure Logic Apps (Standard)**     | Enables local development of Logic Apps Standard. Provides a visual designer and code view to edit workflows (`.workflow.json` files). |
| **Azure Functions**                 | Adds support for creating, running, and debugging Azure Functions locally. Useful for HTTP triggers, timers, and other bindings.       |
| **Azure Tools**                     | A suite of Azure management tools integrated into VS Code (subscriptions, resources, deployments).                                     |
| **YAML**                            | Adds syntax support and schema validation for `.yaml` files, often used in CI/CD pipelines or configuration files.                     |


### 2. Git Bash

A terminal emulator for Windows that provides a Unix-like shell environment.

#### Used for:

* Managing Git repositories
* Scripting deployments and automation
* Interacting with local and remote environments


### 3. Terraform

An Infrastructure-as-Code (IaC) tool used to provision and manage Azure resources declaratively.

#### Used for:

* Creating and managing **Logic Apps** and **Function Apps**
* Defining resource groups, app settings, and storage accounts
* Automating deployments in a repeatable and version-controlled way



### Azure Portal

Azure Portal is a single portal where one can access and manage all Azure applications in one place. one can build, manage, and monitor simple web-apps to complex cloud applications using a single portal. There is designer available for Logic Apps as well to design and test in Azure Portal. Other resources can also be viewed and messages can be checked via this as well. Azure portal gives an excellent Dashboard that allows us to add needed applications so that they can be monitored and accessed easily whenever we want to check. We can customize this dashboard to bring the resources you use frequently into a single view at one place.

https://portal.azure.com/

- Recommended browsers : It is recommended to use most up-to-date browser that's compatible with operating system. The following browsers are supported:

Microsoft Edge (latest version)
Safari (latest version, Mac only)
Chrome (latest version)
Firefox (latest version)

### Postman

Postman is a very handly tool that can be used to test connection with APIs before connection them to Logic App. In many cases we get source or destination systems APIs where we need to connect or push data. 

Postman can be configured with required authentication methodologies to connect to specific APIs and get/post data to see how the response looks like.

It is available here : https://www.postman.com/downloads/

- system requirements for using Postman


  The Postman Desktop app is available for Windows, macOS, and Linux platforms:

  Mac OS X: OS X El Capitan (10.11+), including macOS Monterey.
  Windows: Windows 7 and later are supported. Older operating systems are not 
  supported (and do not work).
  Linux: Ubuntu 14.04 and newer, Fedora 24 and newer, and Debian 8 and newer. 
  Note: For the best experience, we recommend using the latest version of Postman.


  The Postman Web app is optimized for the following browsers:

  Chrome (78 and higher)
  Firefox (76 and higher)
  Edge (79 and higher)
  Safari (13.1.1 and higher)
  

### Liquid

Liquid is an open-source template language created by Shopify and written in Ruby. This is one of the most popular choices while doing JSON mappings. To do Liquid operations from VS Code there is an extension that needs to be installed. It supports formatting, tag, filter, object and schema auto-completions, hovers, syntax highlighting, diagnostic capabilities and respects HTML intellisense features.

This is available in :
https://github.com/panoply/vscode-liquid

This is plugin/extension of Visual Studio Code, so it has the same system requirement as Visual Studio Code.

