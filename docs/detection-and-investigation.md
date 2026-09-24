# Detection & Investigation Workflow

## 1. Generate controlled activity
Attack activity is produced in the isolated lab from the adversary VM.

## 2. Detect
Wazuh and Suricata provide detection/telemetry at different layers.

## 3. Enrich
The documented Wazuh + VirusTotal integration adds external context to suspicious file activity.

## 4. Investigate
Velociraptor artifacts are used to pivot from an alert into endpoint evidence such as login history, network sockets, discovered files and SUID binaries.

## 5. Correlate
The report compares host, network and forensic evidence to understand the attack sequence.
