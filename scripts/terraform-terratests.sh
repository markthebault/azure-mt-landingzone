#!/bin/sh
# Validates that the modules are declared correctly


for file in $(find . -name '*_test.go'); do
    dir=$(dirname "${file}")

    echo -e "\\n\\n"
    echo "************ Runnin on directory: $dir"
    cd "$dir";

    echo -e "provider \"azurerm\" { \\n version = \"=2.6.0\" \\n features {} \\n }" > ../provider.tf
    echo -e "provider \"azurerm\" { \\n alias = \"shared_services\" \\n version = \"=2.6.0\" \\n features {} \\n }" > ../provider2.tf
    go test -v -timeout 45m

    #Clean up
    rm ../provider.tf ../provider2.tf
    # rm -Rf .terraform
    cd -;
done
