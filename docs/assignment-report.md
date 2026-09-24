# Network Security CA2 — Assignment Report

Introduction

Today's modern digital networks span many different cloud platforms (on-premises, public, private) and have spread to remote endpoints and virtualisation technology. Keeping in mind that the critical infrastructure has also become much more likely to be targeted by skilled attackers using stolen credentials, advanced lateral movement techniques, a mix of artificial intelligence (AI) techniques, and multiple-stage (multistage) attack methodologies, all of which have circumvented most of the established security products, organisations have moved from relying on traditional firewalls and intrusion detection systems (IDS) to using Security Operations Centres (SOCs). The SOC provides organisations with continual visibility, advanced threat detection, rapid incident response and forensic analysis of cyber incidents.

The Security Information and Event Management (SIEM) system is at the heart of SOC operations. It gathers, combines and correlates log data from numerous different sources to produce actionable intelligence on an organisation. Research has shown that SIEM's have changed from just being a way to collect logs to employing advanced analytics, machine learning and the ability to integrate threat intelligence to improve the quality of detection and decrease the amount of work required by a security analyst (Muhammad, Sukarno and Wardana, 2023).

Open-source tools such as Wazuh, Suricata, Zeek, Velociraptor, The Hive and MISP have allowed organisations to use enterprise-level SOC capabilities easily. This project used an open-source solution to create a lab-based SOC that integrates SIEM, IDS, threat intelligence and forensic capabilities for the detection, analysis and investigation of cyber-attacks in real time.

2. Background

2.1 Modern Cyber Threat Landscape

The pace of evolution in the cyber threat environment continues to increase rapidly due to automation, adversarial innovation, and increasing access to sophisticated tools and frameworks used for cyberattacks. Current assessments indicate that organisations are constantly being confronted by rapidly evolving cyber threats, which include a wide variety of attack types, from ransomware to phishing to targeted attacks from well-resourced adversaries (including nation-state actors and highly organised cybercriminal groups).

Recent trends indicate a steady increase in the overall number of AI-generated attacks, the increased targeting of critical infrastructures (particularly healthcare and energy), and the continued confusion of boundaries between nation-state actors, cybercriminals, and hacktivists who are achieving similar goals. Increasingly, attackers are utilising stealthier forms of attack, including command-and-control communications that are encrypted, legitimate system utility abuse (i.e., living off the land), polymorphic malware (changes its signature) designed to evade detection, and fileless attacks (i.e., operate entirely in memory).Such tactics allow adversaries to establish persistence and remain undetected for extended periods, complicating detection using traditional signature-based mechanisms and creating significant challenges for defensive teams (Alabady,2009)

2.2 SIEM and Event Correlation

Security Information and Event Management (SIEM) systems are essential components of a Security Operations Centre (SOC), as they provide a single point of contact for collecting and processing different types of information security logs/user activity events, correlating events from multiple sources, and generating the necessary alert priorities for SOC security analysts to quickly and efficiently analyse potential investigative reports. Current research points to the fact that SIEMs (and similar technologies) have transitioned from being merely log management solutions to offering modern/advanced capabilities, such as use of machine learning assisted techniques, in order to enhance the overall event detection and anomaly identification processes compared to traditional static rule-based notification systems.

Additionally, many modern SIEM solutions incorporate capabilities for the improved reduction of time-to-detect via the integrated use of intrusion detection system telemetry data, real-time operational telemetry from user workstations/devices, user activity correlation, and insights from Machine Learning generated models. While research indicates that a properly configured SIEM can deliver increased speed and precision in detecting anomalous behaviour, the establishment of rules by which to detect anomalies requires ongoing adjustments and tuning due to the rapid evolution of cyber threats. However, SIEM deployment requires careful rule tuning, correlation strategy design and ongoing refinement to match evolving threat patterns, as poorly configured systems can generate false positives leading to analyst fatigue and alert desensitisation (Albasheer et al.,2022).

2.3 Network Intrusion Detection and Sensor Architectures

The intrusion detection system (IDS) like Suricata and Zeek is still one of the more important parts of an SOC Architecture because detects malicious behaviours via analysing network traffic, how protocols behave and what patterns exist for suspicious communications. These 'Network-Based' sensors are also one of the best ways to identify an attack against an organisation, such as Network Reconnaissance, Brute-Force attempts at Authentication, Malware Distribution, Command-and-Control activity (C2), or unusual traffic leaving the organisation that may be a sign of Data Exfiltration. More recent research shows how distributed yet collaborative 'IDS Nodes' can provide telemetry to a central location for analysis, like the modern SOC Architecture where multiple 'sensors' deployed across multiple network segments are able to feed events into a Security Information Event Management (SIEM) location for correlation/enrichment. By using this 'Distributed Detection' approach, organisations have significant improvements in visibility across multiple complex network topologies while also lowering the likelihood of attackers bypassing monitoring points through strategic network placement. Network telemetry therefore plays a critical role in complementing SIEM analysis and providing the context needed to detect lateral movement, privilege escalation, exfiltration attempts, and attacker command-and control activity across multi-stage attack campaigns (Davies et al.,2025).

2.4 Threat Intelligence Platforms and IoC Correlation

Today’s security operations center (SOC) must leverage threat intelligence to improve detection rates and efficiently provide context behind alerts with respect to threats posed by adversaries using malicious tactics and techniques as well as leveraging infrastructure used to perpetrate these attacks. The open-source Malware Information Sharing Platform (MISP) has become the go-to solution for organizations wishing to collect and share information about Indicators of Compromise (IoCs) through the creation of collaborative networks aimed toward developing collective security. By providing intelligence regarding active attacks, infrastructure operated by adversaries such as bad domain names and IPs, hashes of malicious files, and known patterns of behaviour associated with certain threat actors, MISP helps organizations to work cooperatively. The temporal nature of cyber-criminal behaviour due to the continuous changes made by adversaries necessitates that SOC designs need to be able to create automated processes that ensure the timely and effective harvesting of data regarding the attacks and the infrastructure utilized by adversaries. Integrating MISP with SIEM ensures that alerts are enriched with situational intelligence, improving the SOC’s ability to identify known threats, prioritise high-confidence detections, and coordinate responses based on community’s knowledge (Iklody et al.,2018).

2.5 Anomaly Detection and Log-based Behavioural Analytics

The volume of logs generated by enterprise networks requires SOCs to use advanced analytics to identify suspicious activity hidden in high-volume normal operating logs. Log SHIELD is a new graph-based log anomaly detection framework that learns the frequency of log events and the time in which they were created, allowing it to detect irregular behaviour in an organisational environment in near real-time. Log SHIELD also shows the advantages of using graph models to identify complex log data relationships to make subtle pattern comparisons that traditional alarm activation techniques cannot detect. Research on using graph database and machine-learning models to detect anomalies resulting from advanced persistent threats also highlight that these techniques take advantage of the slow, methodical nature of advanced persistent threats, thus allowing them to potentially avoid triggering traditional detection mechanisms. All this research demonstrates the need for SOC architecture to convert all raw log data into structured graph representations, which then allows more in-depth machine-learning analysis to identify the deviations from "normal" log activity. Such research highlights that modern SIEM’s benefit from modern analytics pipelines that transforms logs into meaningful behavioural models, supporting both supervised detection of known attack patterns and unsupervised identification of novel threats (Schindler,2018).

2.6 SOC Setup and Conclusion

A SOC can be assembled from various open-source packages that collectively ensure layered security for endpoints, networks, and logs. Wazuh is the tool that combines SIEM and endpoint security functions, as it collects logs, performs file integrity checks, detects malware, and in general, issues alerts if it finds any suspicious activity. Velociraptor is the forensic tool that gives the investigators access to artifacts, the ability to view system state, and even run queries for finding the presence of the threats. Suricata is a network-based IDS/IPS that looks at network traffic using deep packet inspection to figure out if some evil-doing is going on.

This laboratory setup aims at illustrating how these tools interact. VM1 is hosted with the Wazuh Manager, thus it is responsible for unifying log collection, event correlation, and file hash verification with VirusTotal. VM2 is the endpoint under observation, where the Wazuh Agent run is forwarding logs; Velociraptor is there for forensic readiness, and Suricata is reading network traffic.VM3 acts as the adversary machine, generating simulated attacks to test how effectively VM2’s tools detect, alert and correlate malicious activity.

3.Network Attacks Tested

3.1 SSH Brute Force Attack

Figure 1: COMMAND used for ssh brute force attack

The command will use Hydra to conduct an SSH brute-force against VM2 (10.0.2.20).It attempts to login as root by utilizing passwords from the rockyou.txt Password List (with a total of 14 million passwords). The connection will be achieved utilizing four simultaneous connection attempts for each password to prevent the common lockout mechanisms of SSH.

3.1 Logs generated in Wazuh for SSH Brute Force Attack

Figure 2:SSH brute force attack detected by wazuh after exceeding maximum authentication attempts

The attack resulted in the triggering of three unique Wazuh rules. The first of these three was Rule 5758, which was denoted as Maximum Authentication Attempts Exceeded (severe level 8 - High). This specific Wazuh rule was triggered when SSH enabled on VM2 determined that a single source had exceeded the maximum number of times they could authenticate to the SSH service from that single source (an indication of an ongoing attack), rather than just a few failed attempts to log into the SSH service from the same source, as reflected in the Wazuh rule groups syslog, sshd and authentication_failed..

Figure 3:ssh authentication failure alerts by excessive failed login attempts against root user

The severity level 5 (medium) rule 2501 is for failed user authentication. When this rule is triggered, it captures failed Authentication attempts in real time and provides detailed reporting on every unsuccessful logon attempt made by the Hydra tool. Thus, with this rule, you can see how each step in the sequence was unsuccessful.

Figure 4: SIMILAR SSH AUTHENTICATION FAILURE ALERT DETECTED BY WAZUH

The detection of SSH Authentication Failed with a critical severity level of 11 - Rule 5760 depicts one of the most advanced techniques mapped to the MITRE ATT&CK Framework. This rule has identified the attack as being related to T1110.001 (Password Guessing), and T1021.004 (SSH), thus validating the method used and providing threat intelligence context around the attack. The alert also identifies techniques related to lateral movement and credential access techniques.

3.2 Logs generated with integrated Suricata Network Monitoring

Figure 5: PRIVELGE escalation attack detected by Suricata

3.3 Differences between logs generated in Wazuh and from Suricata

The logs differ in their detection methods and severity levels. The generic "User authentication failure" log is associated with Rule 2501 (Level 5) and reports generic failure information regarding basic user authentication attempts through syslog. In contrast, Rule 5758 (Level 8) indicates that "Maximum authentication attempts exceeded" and contains the exact error message from the SSH Daemon notifying the user that they have exhausted their connection attempts. Furthermore, Rule 5760 (Level 11) provides the most detailed information regarding how the activity was classified and mapped to specific MITRE techniques, specifically T1110.001 (Password Guessing) and T1021.004 (SSH) related to "Password Guessing, SSH" pertaining to Credential Access and Lateral Movement tactics with a total of 42 alerts.

All three of the alerts referenced are based on the same set of logs, each showing Wazuh is processing authentication data collected by the host system. The fields decoder.parent and decoder.name indicate that the two logging agents collecting the same log data are "sshd" and "journald" respectively, and therefore Wazuh's alerting rules represent analyses of host-based authentication logs relating to SSH. The integration of Suricata indicates that Wazuh extracts and analyzes this data via /var/log/suricata/eve.json, from where Suricata has logged failed network SSH connection attempts, and uses Wazuh's alerting rules (5758, 2501, 5760) to interpret and correlate this information to provide action-oriented alerts based on failed authentication attempts. Whereas, Suricata has collected the network traffic and connection behavior patterns of users, Wazuh creates security-focused alerts enriched with context-based threat intelligence and classified by level of severity and mapped to the MITRE ATT&CK framework.

3.4 Logs generated in Velociraptor for SSH Brute Force Attack

Figure 6: USER LOGIN HISTORY COLLECTED BY VELOCIRAPTOR

Figure 7:SSH service listening on port 22 collected by velociraptor EDR

The Velociraptor artifacts collected during the investigation provide a fundamentally different perspective compared to the Wazuh and Suricata detection logs. While both Wazuh and Suricata generated real-time alerts about the SSH brute force attack, Velociraptor was used to pivot into deep endpoint forensics after the alerts were detected.

Linux.Sys. LastUserLogin Artifact

The folder in the VM2 environment contains all raw login session records retrieved directly from wtmp/btmp files . These login session records contain metadata, such as your login_host, login_user (usually root/UID 0), your terminal you logged into, all the time of logging in, and the process ID of the system when you signed in. In addition, Velociraptor gives the failed sessions of the user through unusual login_leader values, such as **** or () and provides process IDs as indicated by fields such as ProcID = "1:70/root/mail", giving you visibility to what the underlying authentication mechanisms are.

Unlike Wazuh, where alerts are interpreted with rules (5758, 2501, 5760), severity ratings, and mappings to MITRE's attack framework classification, Velociraptor does not have the ability to interpret alerts, as it provides only unprocessed forensic evidence.

The Linux.Network.NetstatEnriched artifact obtained the current connections made by the VM2 environment, which were TCP states, listening ports, local/remote addresses, and processes bound to the sockets.

Unlike Suricata, which performs real-time packet inspection and generates alerts based on signature attributes, Velociraptor gives the operating system view of the endpoint, which confirms which sshd processes were communicating with the attacker's host at 10.0.2.25 during the time of the investigation.

3.5 Malware Download and Execution Simulation

Figure 8: SCREENSHOT showing that i downloaded the eicar test file

The screenshot shows that i have downloaded the EICAR test file (eicar.com). This is a safe, standard test string that is commonly used to verify if an antivirus program is working properly. It is not actual malware, but most security tools will identify it as if it ​‍​‌‍​‍‌were.

3.6 Logs generated in Wazuh for Malware Download and Execution

Figure 9: WAZUH FIM ALERT SHOWING REAL TIME DETECTION OF MODIFIED EICAR TEST FILE

Wazuh monitored the file located at /home/kali/Downloads/eicar(1).com and discovered that this file's size had changed from 0 bytes to 68 bytes indicating the completion of the file download. Wazuh then performed content verification of this file and determined that it contains a signature file known as "EICAR-STANDARD-ANTIVIRUS-TEST-FILE". The use of this signature is widely accepted as a means of validating both the functionality of an antivirus program and any type of security program used for protection against harmful software. The file's new size of 68 bytes can be confirmed by the following hash values (MD5: d41d8cd98f00b204e9800998ecf8427e) used for forensic purposes. This finding demonstrates that Wazuh can do more than just monitor the creation of files, and that it can also analyse downloaded files for evidence of known malware samples.

Figure 10: VIRUSTOTAL alert indicating detection of eicar test file

A Virus Total Integration alert has been received in this log, indicating a file was found on the server to contain a malicious threat (Rule 87105, Level 12 - Critical) and this file was automatically submitted to VirusTotal’s Threat Intelligence Platform; this file is located at /home/kali/Downloads/eicar(1).com and was detected to be a malicious threat by 66 different antivirus engines.

The alert describes the VirusTotal integration feature of Wazuh enhancing a file integrity monitoring (FIM) alert by providing external threat intelligence, as evidenced by the alert description "Virus Total: Alert /home/kali/Downloads/eicar(1).com - 66 engines detected this file".

The very high number of detections (66) provides substantial evidence of the file being malicious and demonstrates how the VirusTotal integration can augment a basic FIM alert with community-based (crowdsourced) threat intelligence, providing a much more accurate detection and enabling faster incident response times.

3.7 Logs generated in Velociraptor for Malware Download and Execution

Figure 11: SHOWING THE DISCOVERY OF THE EICAR TEST FILE IN THE /HOME DIRECTORY

Linux.Search.FileFinder Artifact

This log presents the results of Velociraptor's Linux.Search.FileFinder artifact collection on the endpoint, indicating that it detected the EICAR malware file located at /home/eicar.com (68 bytes, inode 420). Additionally, the second entry details the /home/kali directory (4096 bytes). Both entries include inclusion forensic meta-data such as FlowId (F. D4P13UO2BJM9) tracking the collection session and ClientId (C. ce699a835fc31b) identifying the monitor system. The Velociraptor logs are fundamentally different than the Wazuh detection logs both in format and purpose; Wazuh generates security alerts using rule IDs (550, 554, 87105), severity values (5 and 12) and explicitly identifies the EICAR-STANDARD-ANTIVIRUS-TEST-FILE signature(s) in the file’s content. As well as security context in Wazuh logs including the mitigation of attack methods using MITRE ATT&CK, (compliance frameworks, PCI_DSS 11.5), VirusTotal automated threat intelligence with 66 antivirus engine detections. Wazuh’s alerts are designed to inform security analysts that a malicious action has occurred and provide contextual information about the threat.

3.8 Privilege Escalation

Figure 12:C PROGRAM DEMONSTRATING SETUID PRIVILEGE ESCALATION ATTACK

Figure 13: COMPILING THE SETUID BINARY WITH GCC

Figure 14: SETTING THE SETUID BIT ON THE BINARY

Figure 15: FILE permissions before SETUID bit configuration

Figure 16: VERIFYING SETUID BIT CONFIGURATION

Figure 17: SUCCESSFUL PRIVILEGE ESCALATION EXPOIT

Step 1: Create malicious program

An C program was created with three key features: one to set the user ID (UID) to root (0), another to set the group ID (GID) to root (0), and the last feature spawns a shell process using the system call to start a new terminal session. The C program includes all three headers, unistd.h, sys/types.h and stdlib.h to provide access to these privileged system calls.

Step 2: Compile the Binary

The command to compile the source code into an executable binary (gcc -o setuid setuid.c), results in a fresh binary without any special bits set on the binaries, just default file permissions.

Step 3: Test without SUID

Testing without SUID bit Executing the binary file via cmd line (. /setuid) with the SUID bit unset resulted in default file permission of -rwxrwxr-x and executed as the shell user kali@kali. The execution of this method failed to escalate privileges since users without SUID permission cannot change their effective UID to root user.

Step 4: Change ownership and set SUID Bit

I set the SUID on the file using the command chmod u+s setuid. The permissions of the file changed to -rwsr-xr-x 1 root root where the s in place of x for the user’s execute bit indicates that SUID is set on the file. The SUID bit allows the file to run with root privileges, regardless of the user running it.

Step 5: Execute and gain root access

Once I set the SUID on the file, I executed the command. /setuid, and I escalated my privileges successfully. The command prompt changed and displayed root@kali in red, indicating that I now was logged in as a root user. Since I had set the SUID bit, when I ran the setuid(0) and setgid(0) system calls through my program, both succeeded, and I got a root shell and complete control over the system.

3.9 Logs generated in Wazuh for Privilege Escalation Attack

Figure 17: WAZUH DETECTION OF PRIVILEGE ESCALATION ATTACK

Wazuh’s file log shows a File Integrity Monitoring (FIM) alert has been raised against the file indicated below for a privilege escalation attempt stemming from a SUID-based attack. The log contains information on the affected file, the command used to perform the attack, related process actions, and metadata describing the file (including data type, data group ID, and data inode). The “kali_data_pname,” “data_gname,” “usr_data_pname,” and “data_commands” fields in the log show that Wazuh has recorded the names of each of the processes that performed these actions, as well as all changes made to the affected file(s) and the associated SUID binaries that were executed.

This alert provides strong evidence of a security breach, as the attacker modified permissions on the target file (chmod u+s), changed its owner (chown root:root), and utilized SUID binaries to obtain root privileges. In addition, this incident demonstrates that Wazuh can effectively detect unauthorized permission changes and log the activity associated with using these binaries in such a way that they are frequently exploited to escalate privileges.

4.0 Logs generated in Velociraptor for Privilege Escalation Attack

Figure 18: VELOCIRAPTOR DETECTION OF SUID BINARY

Velociraptor's Sys.SUID Artifact provides a list of SUID binaries located on a computer. Included in this list is a SUID binary created by an attacker that has filesystem metadata attached to it. The Velociraptor record includes a Mode field containing the SUID Permissions; a Size field noting the Small size of the file; and a Mtime timestamp documenting the time when the file was compiled and modified by the attacker, which in the case of this record is 12/6/2025 08:18:36. The Owner32 and Group32 fields (0:0) typically indicate root ownership. The FlowId and ClientId fields are used to identify the Velociraptor Collection Instance where the artifact was collected.

The Velociraptor record serves as a fixed timeline inventory of SUID binaries, while Wazuh generates alert notifications in near real-time when a SUID binary is created, modified, or executed. In contrast to Velociraptor's simplified summary of the presence and attributes of a SUID binary, Wazuh's FIM Rule Reports-Indicate that there are permission changes occurring to the generated binaries and classify those occurrences as security incidents by providing contextually relevant metadata.

5.0 Conclusion

This​‍​‌‍​‍‌ SOC employed tools like Wazuh, Suricata, Velociraptor, and VirusTotal to identify a wide range of threats and perform in-depth investigations. Wazuh was the SIEM and the endpoint monitoring solution that it was, gathering system and security logs, keeping an eye on file integrity, malware detection, and in general security by real-time alerts for any security breaches. Suricata was the network-level intrusion detection engine that it was, performing deep packet inspection on the traffic to detect the network activities that are malicious such as SSH brute force attempts. Velociraptor was the advanced forensics investigator that it was, providing the remote collection of forensic artifacts, command histories, SUID binary inventories, and file system timelines for correlation with Wazuh alerts. VirusTotal made detection more powerful by giving the suspicious files check against numerous antivirus engines, going outside for threat intelligence to help improve the confidence in alerts.

By employing such a layered strategy, the SOC can detect the SSH brute force attacks, SUID-based privilege escalation, and malware delivery. The convergence of host-based monitoring, network analysis, threat intelligence, and forensic investigation is a prime example of multi-source correlation leading to high-confidence threat detection and enterprise-grade security monitoring being achievable with open-source ​‍​‌‍​‍‌tools.

6.0 References

Alabady, S. (2009) (PDF) design and implementation of a network security model for Cooperative Network, ResearchGate. Available at: https://www.researchgate.net/publication/50367393_Design_and_Implementation_of_a_Network_Security_Model_for_Cooperative_Network (Accessed: 13 December 2025).

Albasheer, H. et al. (2022) Cyber-attack prediction based on network intrusion detection systems for Alert Correlation Techniques: A survey, Sensors (Basel, Switzerland). Available at: https://pmc.ncbi.nlm.nih.gov/articles/PMC8879519/ (Accessed: 13 December 2025).

Davies, T. et al. (2025) A collaborative intrusion detection system using Snort IDS Nodes, arXiv.org. Available at: https://arxiv.org/abs/2504.16550 (Accessed: 13 December 2025).

Iklody, A. et al. (2018) Decaying indicators of compromise, arXiv.org. Available at: https://arxiv.org/abs/1803.11052 (Accessed: 13 December 2025).

Muhammad, A.R., Sukarno, P. and Wardana, A.A. (2023) Integrated Security Information and Event Management (SIEM) with Intrusion Detection System (IDS) for live analysis based on machine learning - sciencedirect, ScienceDirect. Available at: https://www.sciencedirect.com/science/article/pii/S1877050922024243 (Accessed: 13 December 2025).

Schindler, T. (2018) Anomaly detection in log data using graph databases and machine learning to defend Advanced persistent threats, arXiv.org. Available at: https://arxiv.org/abs/1802.00259 (Accessed: 13 December 2025).