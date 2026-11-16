# The Importance of Patch Management

## Introduction

Patch management is the ongoing process of identifying, acquiring, testing, and installing updates that fix security flaws and bugs in software. It sits inside a larger process called the vulnerability lifecycle: a flaw is discovered, reported, assigned a public identifier (a CVE), fixed by the vendor, and then must actually be applied by every organization running that software. The gap between a patch being available and a patch being installed is where most real-world damage happens. Two of the most expensive breaches in modern history, covered below, were both entirely preventable with a patch that already existed.

## Why Patches Matter

### How vulnerabilities are discovered, reported, and exploited

Security researchers, vendors, and sometimes attackers themselves find flaws in software. When a flaw is responsibly disclosed, it is assigned a CVE (Common Vulnerabilities and Exposures) identifier and the vendor releases a patch, ideally before the details become public. The danger window opens the moment the vulnerability becomes known, since attackers immediately begin scanning the internet for systems that have not yet applied the fix.

### Real-world breach 1: WannaCry / EternalBlue (2017)

WannaCry emerged on May 12, 2017 by exploiting a vulnerability in the SMBv1 protocol of Microsoft Windows, known as EternalBlue. This vulnerability was addressed by the Microsoft security patch MS17-010 in March 2017, a full two months before the attack, and allowed remote code execution without authentication. WannaCry began spreading rapidly, infecting over 200,000 systems in more than 150 countries within hours, with particular impact on British hospital IT systems and Spanish telecommunications networks. The worm needed only two conditions: unpatched SMBv1 and open network access to it. Microsoft had released the patch two months before the outbreak, so the organizations hit hardest were those running unpatched systems on flat, permissive networks.

### Real-world breach 2: Equifax (2017)

Equifax's breach of 143 million Americans' sensitive personal and financial information was the result of the company's failure to patch a two-month-old bug in Apache Struts, despite multiple reports of the bug being exploited in the wild. A patch for the vulnerability was issued on March 6, and Equifax's website was breached by exploiting the same bug in mid-May, more than two months after the patch was issued. In the interim, there were widespread reports of mass attacks by hackers exploiting this exact flaw. The breach exposed personal data belonging to 147 million Americans, and Equifax ultimately agreed to a $700 million settlement over the incident.

Both breaches share the same root cause: a patch existed, was publicly known, and simply was not applied in time.

## Consequences of Not Patching

Unpatched systems create risk across several categories at once:

- **Data breaches.** Both case studies above resulted in the exposure of personal and financial data on a massive scale.
- **Ransomware attacks.** WannaCry demonstrated how a single unpatched flaw can let ransomware spread automatically across an entire network with no user interaction required.
- **Compliance violations.** Regulations such as PCI-DSS and HIPAA set specific requirements around timely remediation of known vulnerabilities; failing to patch can itself be a compliance failure, separate from any breach that follows.
- **Financial penalties.** Equifax's $700 million settlement shows that the cost of not patching can dwarf the cost of patching many times over. Other estimates put WannaCry's total global financial impact in the hundreds of millions to billions of dollars.

## Patch Management Lifecycle

NIST SP 800-40 describes enterprise patch management as a continuous cycle rather than a one-time project. NIST breaks the patching lifecycle into three broad phases: know about the vulnerability, plan how to respond, then execute that response by preparing, deploying, verifying, and monitoring the fix. In practical terms, this breaks down into five phases:

1. **Discovery.** Maintain an accurate inventory of every asset and the software running on it. A system nobody knows about cannot be patched.
2. **Assessment.** When a new vulnerability or patch is announced, assess which of your assets are affected and how severe the risk is, often using CVSS scoring.
3. **Testing.** Test patches in isolated staging environments, validate application compatibility, test rollback procedures, and document results through defined approval workflows before pushing to production.
4. **Deployment.** Roll the patch out, often in phases, starting with less critical systems and expanding to the full environment once stability is confirmed.
5. **Verification.** Confirm the patch was actually applied successfully across all target systems, and monitor for any issues the patch may have introduced.

## Best Practices: A Prioritised 7-Step Checklist

1. Maintain a complete, current inventory of all hardware and software assets.
2. Subscribe to vendor and CVE notifications for every piece of software in use.
3. Assess and prioritise new vulnerabilities by severity and exposure, patching internet-facing and critical systems first.
4. Test every patch in a staging environment before production deployment.
5. Deploy patches on a defined schedule, with an emergency path for critical, actively exploited vulnerabilities.
6. Verify successful deployment across all affected systems, not just a sample.
7. Document every step and review the process regularly to close any recurring gaps.

## Challenges

- **Legacy systems.** Older systems may no longer receive vendor patches at all, or a patch may break custom software built on top of them, forcing organizations to choose between stability and security. Overcome this by isolating legacy systems on segmented networks and planning a replacement timeline.
- **Downtime concerns.** Applying a patch, especially to a server, often requires a restart, which teams may delay to avoid disrupting operations. Overcome this with scheduled maintenance windows and phased rollouts that keep some systems online while others patch.
- **Testing requirements.** Thorough testing takes time that attackers do not wait for. Overcome this by maintaining a staging environment that mirrors production closely enough to test quickly and confidently, and by fast-tracking critical, actively exploited vulnerabilities through an abbreviated emergency process.

## References

1. NIST Special Publication 800-40 Revision 4, "Guide to Enterprise Patch Management Planning": https://www.nist.gov/node/1700211
2. CISA: https://cisa.gov
3. CVE database (MITRE): https://cve.mitre.org
4. SecurityWeek, "One Year After WannaCry Outbreak, EternalBlue Exploit Still a Threat": https://www.securityweek.com/one-year-after-wannacry-outbreak-eternalblue-exploit-still-threat/
5. BankInfoSecurity, "Equifax's Colossal Error: Not Patching Apache Struts Flaw": https://www.bankinfosecurity.com/equifaxs-colossal-mistake-patching-apache-struts-a-10292
