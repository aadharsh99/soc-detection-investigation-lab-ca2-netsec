# Lab Architecture

The submitted report describes a three-VM SOC laboratory.

```text
                         ┌───────────────────────┐
                         │ VM3 — Adversary       │
                         │ Hydra / attack tools  │
                         └───────────┬───────────┘
                                     │ controlled activity
                                     ▼
┌───────────────────────┐    ┌──────────────────────────┐
│ Network telemetry     │───►│ VM2 — Monitored Endpoint │
│ Suricata              │    │ Wazuh Agent              │
└───────────────────────┘    │ Velociraptor             │
                             └────────────┬─────────────┘
                                          │ logs / evidence
                                          ▼
                             ┌──────────────────────────┐
                             │ VM1 — Wazuh Manager      │
                             │ SIEM / correlation / FIM │
                             │ VirusTotal enrichment    │
                             └──────────────────────────┘


The report states that VM1 centralises log collection, event correlation and file-hash verification; VM2 is the monitored endpoint; and VM3 generates simulated attacks for detection testing.

See the original report's SOC setup section for the source description.
