# Input bindings are passed in via param block.
param([byte[]] $InputBlob, $TriggerMetadata)

# Write out the blob name and size to the information log.
Write-Host "PowerShell Blob trigger function Processed blob! Name: $($TriggerMetadata.Name) Size: $($InputBlob.Length) bytes"

# Create a container and container group and spin up the container in the new group
$port1 = New-AzContainerInstancePortObject `
            -Port 3000 `
            -Protocol TCP

$port2 = New-AzContainerInstancePortObject `
            -Port 3001 `
            -Protocol TCP

$container = New-AzContainerInstanceObject `
                -Name test-container `
                -Image mjklearncontainerregistry.azurecr.io/getting-started:latest `
                -Port @($port1, $port2)

$imageRegistryCredential = New-AzContainerGroupImageRegistryCredentialObject `
                            -Server $env:ImageRegistryCredential_Server `
                            -Username $env:ImageRegistryCredential_User `
                            -Password (ConvertTo-SecureString $env:ImageRegistryCredential_Password -AsPlainText -Force) 

New-AzContainerGroup `
    -ResourceGroupName mjklearningrg `
    -Name test-cg `
    -Location WestUS `
    -Container $container `
    -ImageRegistryCredential $imageRegistryCredential `
    -IPAddressDnsNameLabel "mjk-test-container" `
    -IPAddressType Public

