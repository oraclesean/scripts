# Scripts
Various scripts for managing Oracle database environments.
## General Diagnostics and Reporting
- [get_host_env.sh](https://github.com/oraclesean/scripts/blob/main/general/get_host_env.sh): Collect host metadata into a directory for troubleshooting.
- [get_db_env.sh](https://github.com/oraclesean/scripts/blob/main/general/get_db_env.sh): Collect database metadata into a directory for troubleshooting.
- [Show Hidden Parameters](https://gist.github.com/oraclesean/9df1f084bff202e59783edc803e229ae): Show hidden (underscore) parameters.
- [Database Commit Rate](https://gist.github.com/oraclesean/e53728fcbcdca686e9a64eb94bb3cdba): Database commit rate.
- [Log Switches](https://gist.github.com/oraclesean/f217a686bfb36e13ce2291152c7dfb24): Find log switches in the alert log.
- [Search alert log](https://gist.github.com/oraclesean/30805bb967a739b1d105afaa7977276d): Find messages in the alert log.
- [`srvctl` reports and metadata](https://gist.github.com/oraclesean/f6d81af7161f500169b806c66554d870): Some useful `srvctl` commands for database environments.
## Automatic Diagnostic Repository (ADR)
- [ADR-report-errors.sh](https://github.com/oraclesean/scripts/blob/main/ADR/ADR-report-errors.sh): Report, repair, and clean up ADR directories.
## Autonomous Health Framework (AHF)

## Data Guard
- [Helpful commands](https://gist.github.com/oraclesean/dc992189f59096ac8753e1aa7bc80d02): Helpful commands for reporting and validating components of Data Guard Broker configurations.
- [Find Data Guard logs](https://gist.github.com/oraclesean/b016cce7e150bcce699b40358b9afbf0): Retrieve locations for database alert and Data Guard Broker logs.
- [Get connection strings](https://gist.github.com/oraclesean/09b06491d1fd819997859a98ed74be73): Retrieve the Data GUard connection strings for a database.
## Real Application Clusters (RAC)
- [pretty_crs_stat](https://gist.github.com/oraclesean/e544469a9b4322f074020a9c6224b012): Pretty-print output from `crs_stat`.
- [ASM disk devices](https://gist.github.com/oraclesean/6c40de23128566fdc002c600a016d71a): Associate ASM disks to their major/minor devices.
## Recovery Manager (RMAN)
- [RMAN alias](https://gist.github.com/oraclesean/1783a723c8c1654e6c539f141e597fb1): An alias for calling RMAN that sets `NLS_DATE_FORMAT` and enables detailed date/time output from RMAN commands.
- [Helpful commands](https://gist.github.com/oraclesean/f1b9808b30d694917652b9ae5ce01f98): Helpful commands for reporting RMAN metadata.
## Zero Data Loss Recovery Appliance (ZDLRA)
