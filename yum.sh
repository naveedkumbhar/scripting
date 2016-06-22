#!/bin/bash
# This script installs packages automatically, using yum.
if [ $# -lt 1 ]; then
echo "Usage: $0 package."
exit 1
fi
yum install $1 << CONFIRM
y
CONFIRM
