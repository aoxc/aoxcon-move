<div align="center">

<a href="https://github.com/aoxc/aoxcore-sui">
  <img src="logos/aoxc_transparent.png" alt="AOXC Logo" width="180">
</a>

# 🌐 AOXC Sui Protocol
### Enterprise-Grade Infrastructure for Sui-Native Assets

[![Network](https://img.shields.io/badge/Network-Sui%20Mainnet-blue?style=for-the-badge&logo=sui)](https://sui.io)
[![Security](https://img.shields.io/badge/Security-Audit_In_Progress-gold?style=for-the-badge&logo=shield)](docs/AUDIT_NOTES.md)
[![Status](https://img.shields.io/badge/Status-Phase--3_Active-orange?style=for-the-badge)](docs/ROADMAP_2026.md)

---

**AOXC** is a high-integrity protocol stack engineered for auditable cross-chain operations, 
institutional-grade asset custody, and hybrid AI-augmented governance.

> **🚧 Institutional Notice:** This repository is currently in an **active development and hardening phase**. While core modules are operational, we are continuously refining the architecture and undergoing rigorous internal security reviews. We appreciate the community's patience as we stabilize the production environment.

</div>

---

## 🛡️ Audit & Security Framework

Transparency is our core principle. Below is the primary documentation for risk assessment and protocol integrity.

| Specification | Focus Area | Status |
| :--- | :--- | :--- |
| 🔍 [Threat Model](docs/THREAT_MODEL.md) | Vectors of attack and mitigation strategies | **Active** |
| ✅ [Release Checklist](docs/RELEASE_CHECKLIST.md) | Pre-deployment security & quality gates | **Mandatory** |
| 📐 [Formal Invariants](docs/SPEC.md) | Mathematical constraints and logic verification | **In Review** |
| ⚙️ [Indexer Runbook](docs/INDEXER_RUNBOOK.md) | Operational reconciliation & data consistency | **Draft** |

---

## 🚀 Phase-3 Technical Implementation

The current iteration focuses on protocol resilience and structured data integrity:

* **🛡️ Circuit Breaker:** Centralized protocol liveness monitor and emergency halts in `sources/circuit_breaker.move`.
* **⛓️ Typed Bridge:** Transitioned from raw byte transfers to structured, type-safe payloads via `sources/bridge_payload.move`.
* **💰 Real-Asset Treasury:** Advanced `Coin<T>` vault management with autonomous, rule-based distribution (`sources/treasury.move`).
* **🤖 Neural Staking:** High-fidelity liquid staking featuring automated slashing and compounding hooks.
* **🌐 AI Marketplace:** Decentralized dataset licensing layer integrated with Walrus protocol for economic data routing.

---

## 📦 Core Architecture & Documentation

### 🏛️ Protocol Foundation
* `sources/aoxc.move` — Neural asset object model with cryptographically secured lineage.
* `sources/sentinel_dao.move` — Institutional governance featuring timelocks and multi-sig veto rights.
* `sources/reputation.move` — On-chain reputation scoring linked to cross-protocol attestations.

### 📚 Strategic Resources
* **[Architecture](docs/ARCHITECTURE.md)** — High-level module topology and trust boundary definitions.
* **[Economy](docs/ECONOMY.md)** — Phase-5 Neural Economy tokenomics and incentive structures.
* **[Gap Analysis](docs/GAP_ANALYSIS.md)** — Identification of technical debt and upcoming operational milestones.
* **[AI Integration](ai/INTEGRATION.md)** — Technical flow for XLayer, Sui, and Walrus AI compatibility.

---

<div align="center">
  <sub>© 2026 AOXC Protocol | Secure. Auditable. Intelligent.</sub>
</div>
