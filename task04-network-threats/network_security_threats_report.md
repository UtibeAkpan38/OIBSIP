# Common Network Security Threats

## Introduction

Every device on a network depends on that network working correctly and honestly. An attacker who controls, floods, or deceives the network can cause damage without ever touching a single file on a server. Network security threats matter today because almost every business process now runs over a network, from payment processing to internal communication. A single successful attack can take a company offline for hours, expose millions of customer records, or let an attacker sit quietly inside a network collecting data for months. Understanding how these attacks work is the first step toward building defenses that actually hold.

## 1. DoS/DDoS Attacks

### How it works

A Denial-of-Service (DoS) attack floods a target with so much traffic or so many requests that it cannot respond to legitimate users. A Distributed Denial-of-Service (DDoS) attack does the same thing, but from many machines at once, usually a botnet of compromised devices spread across the world. This makes DDoS far harder to block, since the traffic arrives from thousands of different sources rather than one.

### Real-world example

In mid-May 2025, Cloudflare blocked the largest DDoS attack ever recorded at that time, a staggering 7.3 terabits per second, targeting a hosting provider that uses Cloudflare's Magic Transit service to defend its IP network. The attack originated from 5,433 different networks, showing how widely distributed a single DDoS campaign can be. Attacks at this scale have only grown since, with Cloudflare later reporting even larger volumetric events in the following months.

### Impact

A successful DDoS attack takes a service offline for the duration of the attack, which can range from seconds to days. For an e-commerce site, this means lost sales. For a hospital or emergency service, it can mean a genuine safety risk. Even a short outage damages customer trust and can trigger contractual penalties if the business has uptime guarantees with its own clients.

### Mitigation strategies

1. **Use a DDoS mitigation service.** Services like Cloudflare or Akamai absorb and filter malicious traffic before it reaches the target server.
2. **Build in redundancy.** Spreading services across multiple servers and regions means one flooded location does not take down the whole system.
3. **Rate limit and monitor traffic.** Setting limits on how many requests a single source can make, combined with real-time traffic monitoring, helps catch an attack early before it overwhelms the system.

## 2. Man-in-the-Middle (MITM) Attacks

### How it works

A Man-in-the-Middle attack happens when an attacker secretly positions themselves between two parties who believe they are communicating directly, such as a user and a website. The attacker intercepts the traffic, and can read it, steal it, or alter it before passing it along. Common techniques include ARP spoofing on a local network, setting up a fake Wi-Fi hotspot, or exploiting weaknesses in how a connection is encrypted.

### Real-world example

The Equifax data breach of 2017 is a well-known example of the impact MITM attacks can have, resulting in a data breach affecting over 145 million users, linked to MITM and SSL weaknesses in how the company handled encrypted traffic. The breach remains one of the most damaging data exposure incidents in modern corporate history, both in scale and in the sensitivity of the data involved.

### Impact

Because MITM attacks intercept data in transit, they can expose login credentials, financial details, and private communications without the victim ever knowing. The damage is often discovered only after the stolen data is used elsewhere, which makes MITM attacks particularly dangerous since the window between compromise and discovery can be long.

### Mitigation strategies

1. **Enforce HTTPS everywhere.** Encrypted connections make intercepted traffic far harder to read or alter.
2. **Use a VPN on untrusted networks.** This encrypts traffic end to end, so even a compromised public Wi-Fi network cannot expose the content of a connection.
3. **Deploy multi-factor authentication (MFA).** Even if an attacker intercepts a password, MFA adds a second barrier that stolen credentials alone cannot pass.

## 3. IP Spoofing

### How it works

IP spoofing is the practice of sending network packets with a false source IP address, making the traffic appear to come from a different machine than it actually did. This is possible because the basic IP protocol does not verify that the sender's claimed address is genuine. Attackers use this to hide their real identity, to impersonate a trusted machine, or to redirect large amounts of traffic toward a victim who never sent the original request.

### Real-world example

In the 2018 attack on GitHub, attackers used a distributed amplification attack through the Memcached protocol, which relies on UDP and does not check the integrity of the IP header. This let the attackers spoof the source IP address with GitHub's own address, producing an amplification factor of 51,200, meaning a tiny request generated a response tens of thousands of times larger, all directed at GitHub. The attack peaked at 1.35 terabits per second via 126.9 million packets per second, and GitHub was briefly unavailable before its mitigation provider rerouted the traffic.

### Impact

IP spoofing rarely causes damage on its own. Its danger comes from what it enables: it is the technique that made the GitHub amplification attack possible, and it is also used to bypass IP-based access controls or to frame an innocent machine for malicious traffic. Because the true source is hidden, spoofing also makes attacks much harder to trace and prosecute.

### Mitigation strategies

1. **Implement ingress and egress filtering.** Network providers can configure routers to reject packets whose source address could not possibly have come from where they claim, following standards like BCP 38.
2. **Disable or restrict unnecessary UDP services.** Since UDP does not verify the sender, services that do not need to be open to the public internet should be firewalled or disabled.
3. **Use packet authentication protocols.** Protocols like IPsec can cryptographically verify that a packet truly came from its claimed source.

## 4. DNS Poisoning/Spoofing

### How it works

DNS (Domain Name System) translates human-readable website names into the numeric IP addresses computers use to connect. DNS cache poisoning corrupts the stored records in a DNS resolver, inserting a false IP address for a legitimate domain name. Once poisoned, anyone who queries that resolver for the affected domain is silently redirected to the attacker's own server instead of the real one, often without any visible warning in the browser.

### Real-world example

In April 2018, a major DNS cache poisoning attack compromised Amazon's DNS servers, redirecting users to malicious websites instead of the legitimate services they intended to reach. Attackers used this redirection to intercept traffic intended for a cryptocurrency platform, capturing user credentials and funds from people who believed they were on the authentic site.

### Impact

Because the attack happens at the DNS level, victims have almost no way to notice anything is wrong. The website address in the browser bar can look completely normal while the underlying connection goes to a attacker-controlled server. This makes DNS poisoning especially effective for large-scale phishing, credential theft, and malware distribution, since it can redirect many users at once without compromising their individual devices.

### Mitigation strategies

1. **Deploy DNSSEC.** DNS Security Extensions add cryptographic signatures to DNS records, letting resolvers verify that a response has not been tampered with.
2. **Keep DNS software patched.** Many poisoning techniques, including the well-known Kaminsky bug from 2008, exploited specific software flaws that vendors later patched.
3. **Use trusted, secure DNS resolvers.** Choosing resolvers that support encrypted DNS queries (DNS over HTTPS or DNS over TLS) and that actively monitor for anomalies reduces the chance of a successful poisoning attempt reaching end users.

## 5. Comparison Table

| Threat | Primary Attack Vector | Who Is At Risk | Difficulty to Execute | Ease of Mitigation |
|---|---|---|---|---|
| DoS/DDoS | Flooding a target with traffic from one or many sources | Any internet-facing service, especially e-commerce and critical infrastructure | Low to Moderate (botnets for hire are widely available) | Moderate (requires a dedicated mitigation service for large attacks) |
| Man-in-the-Middle | Intercepting traffic between two parties | Anyone using unencrypted or poorly secured connections, especially on public Wi-Fi | Moderate (needs network positioning or a convincing fake access point) | Moderate (HTTPS and MFA significantly reduce risk) |
| IP Spoofing | Forging the source address of network packets | Organizations running exposed UDP services, and anyone relying on IP-based trust | Low (requires no special access, only the right tools) | Moderate (depends on network providers adopting filtering standards) |
| DNS Poisoning | Inserting false records into a DNS resolver's cache | Any user relying on an unprotected DNS resolver | Moderate to High (older flaws are patched, but new techniques emerge) | Moderate to Hard (requires DNSSEC adoption across the chain) |

## 6. Conclusion

Three takeaways stand out for a network administrator:

1. **Distributed and spoofed attacks keep growing in scale.** Both DDoS and IP spoofing techniques rely on the same underlying weakness, that the internet's basic protocols do not verify where traffic truly comes from. Fixing this requires effort at the network provider level, not just at any single organization.
2. **Encryption and verification close the most dangerous gaps.** HTTPS, DNSSEC, and multi-factor authentication each directly block one of the techniques covered here, MITM and DNS poisoning, by making it far harder for an attacker to impersonate a trusted party convincingly.
3. **No single defense is sufficient on its own.** Every threat in this report required a combination of technical controls, monitoring, and sound network design. A network administrator who treats security as a layered practice, rather than a single tool, is far better positioned when a new variant of these attacks appears.

## References

1. Cloudflare, "Defending the Internet: how Cloudflare blocked a monumental 7.3 Tbps DDoS attack": https://blog.cloudflare.com/defending-the-internet-how-cloudflare-blocked-a-monumental-7-3-tbps-ddos/
2. Netwrix, "Man-in-the-Middle (MITM) Attacks: What They Are & How to Prevent Them": https://netwrix.com/zh/cybersecurity-glossary/cyber-security-attacks/man-in-the-middle-attack-mitm
3. Security Affairs, "GitHub hit by largest ever DDoS attack": https://securityaffairs.com/69762/hacking/github-largest-ddos-attack.html
4. OWASP Ghana, "Anatomy of a DNS Cache Poisoning Attack": https://wiki.owasp.org/images/b/b4/DNS_Cache_Poisoning%28OWASP_GHANA%29.pdf
5. MITRE ATT&CK: https://attack.mitre.org
