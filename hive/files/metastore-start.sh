#!/bin/bash

# Start Hadoop
/etc/bootstrap.sh

# Start the metastore
hive --service metastore --hiveconf hive.root.logger=DEBUG,console --hiveconf fs.azure.account.key.${AZURE_STORAGE_ACCOUNT_NAME}.blob.core.windows.net=${AZURE_STORAGE_ACCOUNT_KEY} --hiveconf fs.adl.impl=org.apache.hadoop.fs.adl.AdlFileSystem --hiveconf fs.AbstractFileSystem.wasbs.impl=org.apache.hadoop.fs.azure.Wasbs

# Spin wait
while true; do sleep 1000; done