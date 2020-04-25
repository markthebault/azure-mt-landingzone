#!/bin/sh
# regenerates readmes to pick up any changes that impact them

set -e

for file in $(find . -name 'README-head.md'); do
    dir=$(dirname "${file}")

    echo -e "\\n\\n"
    echo "************ Runnin on directory: $dir"
    cd "$dir";

    echo -e "provider \"azurerm\" { \\n version = \"=2.6.0\" \\n features {} \\n }" > provider.tf
    terraform init
    terraform validate

    #Clean up
    rm provider.tf
    # rm -Rf .terraform
    cd -;
done
