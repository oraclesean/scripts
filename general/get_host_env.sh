#!/bin/bash
set -eux
set -o pipefail

# Reports and saves host metadata to a directory.

# This script is useful for collecting base host information during troubleshooting 
# activities.

# ========================================================================================
# Create a temporary directory for collections:
logdir=$(mktemp -d)

# Write host metadata to files within the temporary directory:
id > "${logdir}"/id
hostname > "${logdir}"/hostname
uname -a > "${logdir}"/uname

# Get the PMON and TNS processes running on the host:
ps -ef | grep pmon | grep -v grep > "${logdir}"/pmon
ps -ef | grep tns | grep -v grep > "${logdir}"/tns

# Show the current user environment:
env | sort > "${logdir}"/env

# Show disk use:
df -hP > "${logdir}"/df

# List files in the ~oracle user directory:
ls -la ~oracle > "${logdir}"/oracle_user_dir

# Copy the redhat-release and oratab file:
cp -p --parents /etc/redhat-release "${logdir}"/
cp -p --parents /etc/oratab "${logdir}"/

# Report semaphore usage:
ipcs -s > "${logdir}"/ipcs_s
ipcs -m > "${logdir}"/ipcs_m
ipcs -u > "${logdir}"/ipcs_u

# Get the contents of the crontab:
crontab -l > "${logdir}"/crontab_$(whoami)
