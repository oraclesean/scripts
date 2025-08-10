#!/bin/bash
set -eux
set -o pipefail

# Reports and saves database metadata to a directory.

# This script is useful for collecting base database information during troubleshooting 
# activities.

# ========================================================================================
# Create a temporary directory for collections:
logdir=$(mktemp -d)

# Write host metadata to files within the temporary directory:
 for oracle_sid in $(egrep -v "^$|^#" /etc/oratab | cut -d: -f1)
  do . oraenv <<< "${oracle_sid}"
     db_dir="${logdir}/${ORACLE_SID}"
     mkdir -p "${db_dir}"

     # Set the ORACLE_BASE_* parameters:
     ORACLE_BASE_CONFIG="$("${ORACLE_HOME}"/bin/orabaseconfig 2>/dev/null || echo "${ORACLE_HOME}")"/dbs
     ORACLE_BASE_HOME="$("${ORACLE_HOME}"/bin/orabasehome 2>/dev/null     || echo "${ORACLE_HOME}")"

     # Get directory contents:
     ls -laR "${ORACLE_BASE_CONFIG}"             > "${db_dir}"/ls_ORACLE_BASE_CONFIG
     ls -la  "${ORACLE_BASE_HOME}"               > "${db_dir}"/ls_ORACLE_BASE_HOME
     ls -laR "${ORACLE_BASE_HOME}"/dbs           > "${db_dir}"/ls_ORACLE_BASE_HOME_dbs
     ls -laR "${ORACLE_BASE_HOME}"/network/admin > "${db_dir}"/ls_ORACLE_BASE_HOME_network_admin

     # Copy TNS files:
     cp -pR --parents "${ORACLE_BASE_HOME}/network/admin" "${db_dir}"/

     # Get OPatch information:
     "${ORACLE_HOME}"/OPatch/opatch lsinventory -details >> "${db_dir}"/opatch_lsinventory
     "${ORACLE_HOME}"/OPatch/opatch lsinventory -patch >> "${db_dir}"/opatch_patch

     # Get md5sums of all password files on a host:
     while read -r file
        do md5sum "${file}" > "${db_dir}"/md5sum_"${file}"
      done < <(find "${ORACLE_BASE_CONFIG}"/orapw*)
done
