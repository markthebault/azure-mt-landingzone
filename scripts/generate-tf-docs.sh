#!/bin/sh
# regenerates readmes to pick up any changes that impact them

for file in $(find . -name 'README-head.md'); do
    dir=$(dirname "${file}")
    echo $dir
    cd "$dir";
    (cat README-head.md; terraform-docs --no-sort md ./) > README.md
    cd -;
done
