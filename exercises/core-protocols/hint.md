# Hint

Enumerable needs an each implementation; Comparable needs <=>.

A no-block each can return enum_for(:each), which uses Kernel’s enumeration support.
