#!/bin/bash
# --------------------------------------------
# The script is to automatically resolve the 
# conflicted copy arising from Dropbox synchronization

conflict_label="*conflicted\ copy*"

# list of conflicted files
find . -name "$conflict_label"


# # if found conflict, take the newer one
# get_all_conflicted_files()

