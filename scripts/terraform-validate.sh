#!/bin/sh
# Validates that the modules are declared correctly

set -e

for file in $(find . -name 'README-head.md'); do
    dir=$(dirname "${file}")

    echo -e "\\n\\n"
    echo "************ Runnin on directory: $dir"
    cd "$dir";

    echo -e "provider \"azurerm\" { \\n version = \"=2.10.0\" \\n features {} \\n }" > provider.tf
    echo -e "provider \"azurerm\" { \\n alias = \"shared_services\" \\n version = \"=2.10.0\" \\n features {} \\n }" > provider2.tf
    terraform init
    terraform validate

    #Clean up
    rm provider.tf provider2.tf
    # rm -Rf .terraform
    cd -;
done
