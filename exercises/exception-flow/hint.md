# Hint

else executes only after a successful begin body; ensure executes regardless of a rescued error.

Cleanup belongs in ensure; avoid returning from ensure because that can replace the intended result or error.
