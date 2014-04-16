#!/bin/sh

#DRY="-n"
HOST=yum.qubes-os.org
RELS_TO_SYNC="`readlink current-release|tr -d /`"
REPOS_TO_SYNC="templates-itl templates-community"

for rel in $RELS_TO_SYNC; do

    for repo in $REPOS_TO_SYNC; do
        echo
        echo "Syncing $rel/$repo..."
        rsync $DRY --partial --progress -air $rel/$repo/repodata $USERNAME@$HOST:/var/www/yum.qubes-os.org/$rel/$repo/
    done

done
