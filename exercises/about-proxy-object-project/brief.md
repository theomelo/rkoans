# Proxy Object Project

Complete `Exercises::AboutProxyObjectProject::Proxy` in `about_proxy_object_project.rb`.
Forward unknown messages to any target's public methods, preserving positional
arguments, keywords, blocks and return values. Record message names in order.
Expose `messages`, `called?(name)` and `number_of_times_called(name)`; reading
these bookkeeping methods must not add messages. Unsupported messages should
raise `NoMethodError`. Make `respond_to?` agree with the target's public API.

Adapted from Ruby Koans by Jim Weirich and Joe O'Brien, licensed under CC BY-NC-SA 3.0. See `THIRD_PARTY_NOTICES.md`.
