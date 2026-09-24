# SSH Brute-Force Detection

## Scenario
Hydra was used to generate repeated SSH authentication attempts against the monitored VM. The report documents the target as `10.0.2.20` and the adversary host as `10.0.2.25`.

## Example command

```bash
hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://10.0.2.20 -t 4
```

Use only against systems you own or are explicitly authorised to test.

## Wazuh observations
The report documents Wazuh rules 2501, 5758 and 5760. Rule 2501 records failed authentication attempts; rule 5758 identifies excessive authentication attempts; and rule 5760 provides a higher-severity SSH authentication detection with the documented MITRE ATT&CK mappings T1110.001 and T1021.004.

## Suricata observations
Suricata supplied network-level visibility into the connection activity. The report explains that Wazuh consumed Suricata's `eve.json` telemetry and used it as part of its alerting context.

## Velociraptor investigation
The report uses `Linux.Sys.LastUserLogin` to examine login-session records and `Linux.Network.NetstatEnriched` to inspect listening ports, connections and associated processes.

## Evidence
See the screenshots extracted from the submitted report under `screenshots/`.
