# Hint

Compare `hash[key]` with `hash.fetch(key)` for an absent key.
A shared default object is reused; a default block can create and store a fresh
value for each key. Merging returns a new hash; inspect both hashes afterward.

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under
CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md` for attribution and license terms.
