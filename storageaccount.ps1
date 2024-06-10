# Variables
$resourceGroupName = "MyResourceGroup"
$location = "EastUS"
$storageAccountName = "mystorageaccount$(Get-Random)"
$skuName = "Standard_LRS"
$kind = "StorageV2"

# Create Resource Group if it does not exist
if (-not (Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue)) {
    Write-Output "Creating Resource Group: $resourceGroupName in $location"
    New-AzResourceGroup -Name $resourceGroupName -Location $location
} else {
    Write-Output "Resource Group $resourceGroupName already exists."
}

# Create Storage Account
Write-Output "Creating Storage Account: $storageAccountName in $resourceGroupName"
New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Location $location -SkuName $skuName -Kind $kind

Write-Output "Storage Account $storageAccountName created successfully."



