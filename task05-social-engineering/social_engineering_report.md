# Social Engineering Attacks

## Introduction

No firewall can stop an employee from trusting the wrong phone call. Social engineering is the practice of manipulating people, rather than exploiting software, to gain access to systems, data, or money. It works because it targets something no patch can fix: ordinary human trust, urgency, and helpfulness. Security researchers consistently rank social engineering among the most effective attack vectors precisely because it bypasses technical defenses entirely. An organization can invest millions in firewalls and encryption, and still lose everything to a single well-crafted phone call or email.

## 1. Phishing

### Types

- **Spear phishing**: a targeted email aimed at a specific person or group, often personalized with real details about the target to appear credible.
- **Whaling**: a form of spear phishing aimed specifically at senior executives, who have higher access and authority.
- **Vishing**: phishing conducted over the phone, where an attacker impersonates a trusted party verbally.
- **Smishing**: phishing conducted through SMS text messages.

### How it works

An attacker sends a message, usually an email, designed to look like it comes from a trusted source, such as a bank, a vendor, or a colleague. The message creates urgency or curiosity and asks the victim to click a link, open an attachment, or provide credentials. Because the message exploits trust and time pressure rather than a technical flaw, even well-trained employees can fall for a sufficiently convincing attempt.

### Real-world case study

In June 2015, Ubiquiti Networks Inc., an American network technology company, lost $46.7 million because of a spear phishing email. A report by the U.S. Securities and Exchange Commission showed the attack was carried out through employee impersonation and fraudulent requests from an outside entity targeting the company's finance department. It was discovered that the attackers did not penetrate Ubiquiti's IT infrastructure and that no malicious insider activity occurred, highlighting how a seemingly harmless email can cause real-world financial damage without any software exploit at all.

### Prevention recommendations

1. Verify any request for a fund transfer or credential change through a second communication channel, such as a phone call to a known number, before acting.
2. Train employees to recognize urgency and authority pressure as red flags, not reasons to act faster.
3. Deploy email authentication standards (SPF, DKIM, DMARC) to reduce the chance of spoofed sender addresses reaching inboxes.
4. Run regular phishing simulation exercises so employees practice spotting real attempts in a safe setting.

## 2. Pretexting

### How it works

Pretexting involves an attacker inventing a believable false scenario, a pretext, to convince a victim to hand over information or access. Unlike phishing, which often relies on a single message, pretexting frequently involves ongoing interaction, where the attacker builds a persona and a story that holds up under questioning, such as posing as IT support, a new hire, or a vendor representative.

### Real-world case study

The July 2020 Twitter hack ran on phone calls, a convincing pretext, and a credential-phishing page, with no software exploit anywhere. Attackers phoned Twitter employees posing as IT support, with a VPN-trouble pretext, and directed victims to log into a fake internal Twitter VPN page that harvested their real credentials. The attackers managed to overcome the organization's multi-factor authentication system, potentially through further social engineering, and were able to use password-reset functionality to gain access to high-profile accounts belonging to figures such as Barack Obama, Elon Musk, and Bill Gates. The compromised accounts were used to post a Bitcoin scam that received about $110,000 in transactions before Twitter removed the messages.

### Prevention recommendations

1. Require internal support staff to verify identity through a separate, pre-established channel before granting any access or credential reset.
2. Limit how many employees hold privileged access to sensitive internal tools, reducing the number of possible targets for this kind of pretext.
3. Train staff to treat unsolicited IT or support calls with the same suspicion as unsolicited emails, especially when they request login details.

## 3. Baiting

Baiting exploits curiosity or greed by offering something enticing, physical or digital, that delivers malware or steals credentials once the victim takes the bait.

### Physical baiting

This usually takes the form of an infected USB drive left somewhere a target is likely to find it, such as a parking lot, lobby, or break room. Curiosity about the drive's contents leads the victim to plug it into a work computer, letting the payload run.

### Digital baiting

This takes the form of fake downloads, pirated software, or "too good to be true" offers online that trick a user into downloading malware disguised as something desirable.

### Real-world case study

One of the most infamous baiting attacks in history was the 2008 incident at the U.S. Department of Defense, known as Operation Buckshot Yankee. It involved an infected USB flash drive left in the parking lot of a DoD facility in the Middle East. An employee found the drive and plugged it into a military laptop, and the resulting malware spread across both classified and unclassified Department of Defense networks, triggering what became one of the most significant breaches of U.S. military computer systems at the time and a major overhaul of the Pentagon's digital defense policy. A separate academic study reinforces how effective this technique remains in general: a University of Illinois study found that nearly 50% of people will pick up a random USB stick and run through all the steps required to have their computer compromised.

### Prevention recommendations

1. Disable autorun for removable media on all company devices so inserting a drive cannot automatically execute code.
2. Train employees to never plug in a USB drive or device of unknown origin, treating found hardware the same as a suspicious email attachment.
3. Restrict or monitor USB port usage on sensitive machines, and use endpoint protection that can scan removable media before allowing access.

## 4. Quid Pro Quo (Bonus)

### Explanation

Quid pro quo attacks offer a service or benefit in exchange for information or access. A classic example is an attacker calling employees at random, posing as IT support offering to fix a (nonexistent) problem, until someone agrees, and the attacker asks for their login credentials "to proceed with the fix." Unlike baiting, which relies on an item, quid pro quo relies on an offered service or favor.

### Prevention

Train employees to never provide credentials or system access in exchange for unsolicited help, and to always verify a support request originated with their own IT department rather than with the caller.

## 5. Comparison Table

| Attack Type | Primary Target | Psychological Lever Exploited | Best Countermeasure |
|---|---|---|---|
| Phishing | Any employee with email or financial access | Urgency, authority, trust in familiar sources | Multi-channel verification and phishing simulation training |
| Pretexting | Employees with access to internal tools or support systems | Trust in authority and a believable story | Identity verification through a separate, pre-established channel |
| Baiting | Any employee who encounters the lure | Curiosity and greed | Disabling autorun and employee training on unknown devices |
| Quid Pro Quo | Employees who feel they are receiving a favor | Reciprocity and the desire for help | Verifying all unsolicited support requests through official channels |

## 6. Organisational Recommendations

A 5-point employee security awareness training checklist:

1. **Teach verification, not just suspicion.** Employees should know the exact steps to verify a request through a second channel, not just "be careful."
2. **Run realistic phishing and vishing simulations regularly.** Repeated, low-stakes practice builds the instinct to pause before acting.
3. **Make reporting easy and blame-free.** An employee who clicked a bad link should report it immediately without fear of punishment, since fast reporting limits damage.
4. **Limit access on a need-to-know basis.** Fewer people with access to sensitive systems means fewer targets for pretexting and fewer opportunities for serious damage if one account is compromised.
5. **Review and update training after every real incident.** Attackers adapt their stories constantly, so training content should reflect the latest tactics seen in the wild, not a static slide deck from years ago.

## References

1. Help Net Security / SEC filing summary via InfoSec Institute, "Spear phishing: Real life examples": https://www.infosecinstitute.com/resources/phishing/spear-phishing-real-life-examples/
2. TechEarl, "The 2020 Twitter Hack: Vishing to God-Mode in a Day": https://techearl.com/twitter-2020-hack-social-engineering
3. Morgan Franklin Consulting, analysis of the 2020 Twitter security incident: https://www.morganfranklin.com/?p=11768
4. PrivacyAffairs, "What Is a Baiting Attack?": https://www.privacyaffairs.com/what-is-a-baiting-attack/
5. Business Insider, "We saw firsthand how a USB stick is a hacker's best friend": https://www.businessinsider.in/We-saw-firsthand-how-a-USB-stick-is-a-hackers-best-friend-and-your-worst-nightmare/articleshow/52059241.cms
6. SANS Institute Reading Room: https://sans.org/reading-room
7. CISA, Social Engineering guidance: https://cisa.gov
