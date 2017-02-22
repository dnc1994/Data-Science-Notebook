#!/bin/bash
# Strict mode
set -euo pipefail

# Create the hash to pass to the IPython notebook, but don't export it so it doesn't appear
# as an environment variable within IPython kernels themselves
HASH=$($PY3PATH/python -c "from IPython.lib import passwd; print(passwd('${PASSWORD:-admin}'))")

echo "========================================================================"
echo ""
echo "You can now connect to this IPython Notebook server using password: ${PASSWORD:-admin}"
echo ""
echo "========================================================================"

unset PASSWORD

$PY3PATH/ipython notebook --no-browser --port 8888 --ip=* --NotebookApp.password="$HASH"
