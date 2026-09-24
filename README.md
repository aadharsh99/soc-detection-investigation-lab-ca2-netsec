# Network Security CA2 — Open-Source SOC Attack Detection Lab

A lab-based Security Operations Centre (SOC) project demonstrating detection and investigation of simulated attacks using **Wazuh, Suricata, Velociraptor and VirusTotal**.

> **Source:** This repository is based on the submitted Network Security CA2 report. The repository reorganises the report into a portfolio/GitHub-friendly structure while retaining the technologies, attacks, observations and screenshots documented in the original work.

## Project Overview

The lab demonstrates a layered detection and investigation workflow across endpoint, network and forensic telemetry. The report describes a three-VM setup:

- **VM1 — Wazuh Manager:** central log collection, event correlation, file integrity monitoring and VirusTotal integration.
- **VM2 — Monitored endpoint:** Wazuh Agent, Velociraptor forensic collection and Suricata network monitoring.
- **VM3 — Adversary machine:** used to generate controlled attack activity against the monitored environment.

The documented scenarios are:

1. SSH brute-force attack
2. EICAR test-file download/detection simulation
3. SUID-based privilege-escalation simulation

## Detection Stack

| Component | Role in the lab |
|---|---|
| Wazuh | SIEM, endpoint monitoring, FIM and alerting |
| Suricata | Network intrusion detection and traffic analysis |
| Velociraptor | Endpoint forensic collection and investigation |
| VirusTotal | External threat-intelligence enrichment |
| Hydra | Controlled SSH brute-force generation |
| EICAR test file | Safe antivirus/security-control test |
| GCC / Linux SUID | Controlled privilege-escalation demonstration |

## Repository Structure

```text
network-security-ca2-soc-lab/
├── README.md
├── docs/
│   ├── assignment-report.md
│   ├── architecture.md
│   └── detection-and-investigation.md
├── attacks/
│   ├── ssh-brute-force.md
│   ├── eicar-test-file.md
│   └── suid-privilege-escalation.md
├── architecture/
│   └── lab-architecture.md
├── screenshots/
│   └── source-figures/       # screenshots extracted from the submitted report
├── scripts/
│   ├── ssh-bruteforce-example.sh
│   └── suid-test.c
├── references/
│   └── references.md
└── .gitignore
```

## Attack 1 — SSH Brute Force

Hydra was used from the adversary VM to generate repeated SSH authentication attempts against VM2. Wazuh recorded failed authentication activity and generated multiple alerts, including rules **2501**, **5758** and **5760**. The report also documents MITRE ATT&CK mappings to **T1110.001 (Password Guessing)** and **T1021.004 (SSH)**.

Suricata provided network-level visibility, while Velociraptor was used after detection to investigate login history and listening network services.

See [`attacks/ssh-brute-force.md`](attacks/ssh-brute-force.md).

## Attack 2 — EICAR Test File

The EICAR test file was used as a safe security-control test rather than real malware. Wazuh detected the file through File Integrity Monitoring and the documented VirusTotal integration enriched the event with external detection information. Velociraptor's `Linux.Search.FileFinder` artifact was then used to locate the test file on the endpoint.

See [`attacks/eicar-test-file.md`](attacks/eicar-test-file.md).

## Attack 3 — SUID Privilege Escalation

A controlled C program was compiled and used to demonstrate how a SUID binary can execute with elevated privileges. The report documents the stages from compilation and permission changes through successful root-shell execution.

Wazuh detected file/permission changes through FIM, while Velociraptor's `Sys.SUID` artifact provided an endpoint inventory of SUID binaries and associated filesystem metadata.

See [`attacks/suid-privilege-escalation.md`](attacks/suid-privilege-escalation.md).

## Detection Comparison

The project demonstrates complementary visibility rather than identical logging:

- **Wazuh:** interprets endpoint/security telemetry, applies detection rules and severity, and provides alert context.
- **Suricata:** observes network traffic and connection behaviour.
- **Velociraptor:** collects endpoint forensic evidence and system state for investigation.
- **VirusTotal:** adds external threat-intelligence context to suspicious file activity.

This layered model allows an analyst to move from **detection → enrichment → endpoint investigation → incident understanding**.

## Evidence

Screenshots from the original report are included under [`screenshots/`](screenshots/). They show the commands, Wazuh alerts, Suricata results, Velociraptor artifacts, EICAR test-file activity and SUID privilege-escalation stages documented in the assignment.

## Safety / Lab Scope

All activity described here is intended for an isolated, authorised lab environment. The EICAR file is a standard antivirus test string, and the privilege-escalation demonstration is performed against the student's controlled virtual machine.

## Source Report

The complete report text, reorganised into Markdown, is available in [`docs/assignment-report.md`](docs/assignment-report.md).

## Author

**Aadharsh Anbuchezhian**  
Cybersecurity Graduate | SOC | Penetration Testing | AWS | Dublin
