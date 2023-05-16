# Azure-Container-Samples
Sample showing how to create an azure container instance based on a blob trigger.

This is a simple Azure Function written in Powershell that demonstrates how to spin up a simple Node.js web app in a container instance using an image that has already been uploaded to the Azure Container Registry.

# Running Locally
1. Be sure to follow the prerequisites outlined in the Micirosoft article: https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-vs-code-powershell
2. Once your environment is set up, clone this repository and create a local.settings.json file containing your Azure secrets.

![local settings json](https://github.com/mkornegay/Azure-Container-Samples/assets/6258739/3e32b7aa-e320-4377-a287-713a6f9db174)

3. You should now be ready to run the function locally by clicking F5 in VS Code.
4. Once the function is running, go to your Azure storage account, find the folder you designated in the function.json file, and upload any file.
5. The function should now execute and create a container group and container instance accordingly.
6. When the function finishes, you can go to your Azure portal container instances and note the FQDN of your container instance.
7. Enter the address in your browser with port 3000 as follows:
  
    http://FQDN:3000/

# Creating a Container Image
Although you can use any container image you would like, I have created a separate repo where you can clone a simple Node.js application image.  
(This is the Docker getting-started image modified to upload to Azure Container Registry.)

Clone this repo to get the image: https://github.com/mkornegay/getting-started
  
You can get a fresh copy of the repo from the source in the Docker Getting Started documentation. https://github.com/docker/getting-started.git
  
  
  
