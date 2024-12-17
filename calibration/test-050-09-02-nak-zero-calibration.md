---
title: NAK Zero ___Calibration Test___
subtitle: OSDP Verified Test Case 050-09-02
---

\newpage{}

# Configuration #

- Windows 10/11 or suitable platform running OSDP.Net's "Console" application as the ACU.
- libosdp-conformance 1.61-0 running as the PD.
- an OSDP line monitor

# Purpose of Test #

Demonstrate a PD responding with NAK, Sequence number 0, and a reason code (typically but not always
"bad sequence number".)

Demonstrate the ACU DUT reacting by resetting it's sequence number to zero on the next command.

# Test #

1. start PD
2. start ACU
3. confirm connectivity, by observing LSTATR and by sending a valid LED command (typically green.)
4. stop the PD for a few seconds, then restart it.
5. confirm via the monitor that this caused the ACU to go into packet retry (or otherwise continue to attempt
to send a nonzero sequence number.)

## Test Criteria ##

The test passes if the PD was shown to send a nak/sequence=0 response and that the ACU reacted by resetting
it's sequence number to zero.

# Unaddressed Edge Cases #

- what if there is an active secure channel.  Should that be terminated.
- should there ever be a secure channel nak/sequence=0 and what does that mean.

\newpage{}

# Appendix #

## Sample Trace ##

```
P:000233 t=1734396204.820623995 C:osdp_POLL          A  0. S1 L0008 CRC da99
P:000234 t=1734396204.836677180 R:osdp_ACK           A  0. S1 L0008 CRC 689f
P:000235 t=1734396205.026897957 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
P:000236 t=1734396205.044740476 R:osdp_ACK           A  0. S2 L0008 CRC 3bca
P:000237 t=1734396205.220581050 C:osdp_POLL          A  0. S3 L0008 CRC b8ff
P:000238 t=1734396205.236579531 R:osdp_ACK           A  0. S3 L0008 CRC 0af9
P:000239 t=1734396205.412672402 C:osdp_POLL          A  0. S1 L0008 CRC da99
P:000240 t=1734396205.444570291 R:osdp_ACK           A  0. S1 L0008 CRC 689f
P:000241 t=1734396205.620540457 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
P:000242 t=1734396205.860479938 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000243 t=1734396206.068540605 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000244 t=1734396206.292422012 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000245 t=1734396206.500492012 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000246 t=1734396206.724352012 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000247 t=1734396206.964446179 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000248 t=1734396207.172435956 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000249 t=1734396207.396217549 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000250 t=1734396207.604316549 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000251 t=1734396207.828169382 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000252 t=1734396208.052147752 C:osdp_POLL          A  0. S2 L0008 CRC 89cc
NOTES:   - Retry or skip
  - Command retransmission
P:000253 t=1734396208.068277345 R:osdp_NAK           A  0. S0 L0009 Reason:Sequence Error      Detail 82 CRC 82f4
NOTES:   - sequence number not next in ACU sequence
P:000254 t=1734396208.260267770 C:osdp_POLL          A  0. S0 L0008 CRC ebaa
P:000255 t=1734396208.276280289 R:osdp_LSTATR        A  0. S0 L0010 CRC 0fa1
```

