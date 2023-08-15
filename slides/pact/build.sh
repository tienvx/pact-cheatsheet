#!/bin/sh

path=$(readlink -f "${BASH_SOURCE:-$0}")
dir=$(dirname $path);

docker run --rm -u `id -u`:`id -g` -v $dir/src/diagrams:/data -v $dir/src/media:/output minlag/mermaid-cli -i ci-backend.mmd -o ../output/ci-backend.svg
docker run --rm -u `id -u`:`id -g` -v $dir/src/diagrams:/data -v $dir/src/media:/output minlag/mermaid-cli -i ci-frontend.mmd -o ../output/ci-frontend.svg
docker run --rm -u `id -u`:`id -g` -v $dir/src/diagrams:/data -v $dir/src/media:/output minlag/mermaid-cli -i contract-test.mmd -o ../output/contract-test.svg
docker run --rm -u `id -u`:`id -g` -v $dir/src/diagrams:/data -v $dir/src/media:/output minlag/mermaid-cli -i contract-verification.mmd -o ../output/contract-verification.svg
mdslides --include $dir/src/media --output_dir $dir/output $dir/src/presentation.md
