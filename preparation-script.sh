# nSet environment variables for Azure resources
export RESOURCE_GROUP="rg-sentiment-${RANDOM_SUFFIX}"
export LOCATION="eastus"
export SUBSCRIPTION_ID=$(az account show --query id --output tsv)

# Generate unique suffix for resource names
RANDOM_SUFFIX=$(openssl rand -hex 3)

# Create resource group
az group create \
    --name ${RESOURCE_GROUP} \
    --location ${LOCATION} \
    --tags purpose=recipe environment=demo

echo "✅ Resource group created: ${RESOURCE_GROUP}"

# Set additional environment variables
export LANGUAGE_SERVICE_NAME="lang-sentiment-${RANDOM_SUFFIX}"
export FUNCTION_APP_NAME="func-sentiment-${RANDOM_SUFFIX}"
export STORAGE_ACCOUNT_NAME="stsentiment${RANDOM_SUFFIX}"