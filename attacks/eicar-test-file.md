# EICAR Test-File Detection

## Scenario
The EICAR test file was downloaded to the endpoint as a safe way to test security monitoring. The submitted report explicitly describes EICAR as a standard antivirus test string rather than actual malware.

## Wazuh
Wazuh monitored the file through File Integrity Monitoring and detected the file activity. The report also documents VirusTotal enrichment of the event.

## VirusTotal enrichment
The submitted report records a VirusTotal alert associated with the EICAR test file and describes the integration as adding external threat-intelligence context to the FIM event.

## Velociraptor
The `Linux.Search.FileFinder` artifact was used to locate the EICAR test file and provide filesystem/forensic metadata.

## Evidence
See the EICAR download, Wazuh and Velociraptor screenshots in `screenshots/`.
