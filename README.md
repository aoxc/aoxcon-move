# AOXC Sui Protocol

Enterprise-grade, Sui-native protocol stack for AOXC with auditable cross-chain controls, autonomous treasury logic, and hybrid AI/community governance.

## Modules

- `sources/errors.move`: Centralized abort code catalog used by all modules.
- `sources/aoxc.move`: Neural asset layer with metadata/display objects and lineage-aware `NeuralAsset` objects.
- `sources/neural_bridge.move`: XLayer->Sui command verifier with secp256k1 checks, replay lock table, and global circuit breaker.
- `sources/reputation.move`: Shared reputation book for deterministic score updates and threshold enforcement.
- `sources/treasury.move`: Autonomous treasury that distributes rewards only to addresses meeting reputation thresholds.
- `sources/sentinel_dao.move`: 24h timelock governance with community veto and pause/resume execution.
- `sources/relay.move`: Walrus public report anchoring for governance, bridge, and reputation transparency.

## Security Posture

- **Defense-in-depth**: Signature verification + replay protection + timelock + circuit breaker.
- **Auditability by default**: Hash lineage on assets and report root anchoring in relay module.
- **Least-privilege flows**: Module-level capability objects (admin/distributor/relay caps).
- **Deterministic policy checks**: Reputation-gated treasury distribution and explicit status validation.

For implementation recommendations and audit checklist items, see `docs/AUDIT_NOTES.md`.
