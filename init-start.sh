#!/bin/sh
/opt/start-bin/bin/create-directory.sh
/opt/start-bin/bin/start-es.sh
/opt/start-bin/bin/es-init.sh
/opt/start-bin/bin/start-all-no-es.sh
