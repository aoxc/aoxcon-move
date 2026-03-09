# AOXC Sui Protocol - Audit Notes & Recommendations

## Scope Covered in Current Codebase

1. **Cross-chain command verification** with digest replay lock and secp256k1 checks.
2. **Global pause controls** that can be triggered by bridge commands and governance actions.
3. **On-chain reputation gating** for treasury distribution fairness.
4. **Hash-based forensic trail** in neural assets and Walrus report anchoring.

## Recommended Next Steps (High Priority)

1. Add Move unit tests for each module:
   - replay rejection,
   - timelock enforcement,
   - veto finalization path,
   - treasury distribution threshold failures,
   - duplicate blob rejection.
2. Add integration tests (transaction-level) for:
   - bridge halt -> transfer blocked,
   - bridge resume -> transfer allowed,
   - DAO pause/resume with timelock.
3. Add event indexing schema docs for off-chain services.
4. Add fixed-point math policy (if yield/reward formulas are introduced).
5. Add key rotation playbook for `GatewayAdminCap` and emergency runbook.

## Recommended Next Steps (Medium Priority)

1. Replace in-memory-style score updates with merkle-proof-attested updates if off-chain reputation model remains authoritative.
2. Introduce proposal payload decoding and explicit action structs in `sentinel_dao`.
3. Add bounded report retention / archival strategy for relay growth.
4. Add package-level specification docs (state machine and invariants per module).
