# azure-appservice-bicep-examples
Some examples of deploying different types of App Services

```yaml
+-- linux
|   +-- linux-custom-container
|       +-- linux-custom-container.bicep
|       +-- deployment-commmands.txt
|   +-- linux-webapp
|       +-- linux-webapp.bicep
|       +-- deployment-commmands.txt
+-- windows
|   +-- windows-custom-container
|       +-- windows-custom-container.bicep
|       +-- deployment-commmands.txt
|   +-- windows-webapp
|       +-- windows-webapp.bicep
|       +-- deployment-commmands.txt
```

**Instructions to run:**
> **NOTE**: This assumes a Resource Group is already created

1. Review the needed environment variables within the respective `deployment-commands.txt` file
2. Run the command in the `deployment-commands.txt` file