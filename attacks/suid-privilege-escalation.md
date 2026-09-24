# SUID Privilege-Escalation Detection

## Scenario
The assignment documents a controlled SUID demonstration using a small C program that calls `setuid(0)`, `setgid(0)` and starts a shell.

## Lab stages
1. Create the C program.
2. Compile it with GCC.
3. Execute it before SUID configuration.
4. Change ownership and set the SUID bit.
5. Execute the binary and observe the resulting elevated shell.

## Wazuh
Wazuh FIM recorded file and permission changes associated with the SUID binary. The report highlights command, process and file metadata captured by the alert.

## Velociraptor
Velociraptor's `Sys.SUID` artifact provided an inventory of SUID binaries and metadata including permissions, ownership, size and modification time.

## Evidence
The original report contains screenshots for the C source, compilation, permission changes, SUID verification, successful execution, Wazuh detection and Velociraptor collection.
