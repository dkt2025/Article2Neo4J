# Article2Neo4J - Neo4J Import Guide

This package contains Cypher scripts to import the HYBE ownership structure into Neo4J Aura.

## Files Overview

1. **01_create_constraints.cypher** - Creates constraints and indexes
2. **02_create_organizations.cypher** - Creates all organization nodes
3. **03_create_persons.cypher** - Creates all person nodes
4. **04_create_groups_products_events.cypher** - Creates groups, products, events, concepts, and topics
5. **05_create_ownership_relationships.cypher** - Creates ownership relationships
6. **06_create_corporate_relationships.cypher** - Creates corporate structure relationships
7. **07_create_artist_relationships.cypher** - Creates artist and product relationships
8. **08_create_event_topic_relationships.cypher** - Creates event and topic relationships
9. **09_useful_queries.cypher** - Collection of 20 useful queries to explore the data

## Import Instructions

### Option 1: Neo4J Aura Console (Recommended)

1. Log into your Neo4J Aura instance
2. Open the Query tab
3. Run each script **in order** (01 through 08)
4. Copy and paste the entire content of each file
5. Execute each script before moving to the next

### Option 2: Neo4J Desktop

1. Open Neo4J Desktop
2. Select your database
3. Click "Open" to open Neo4J Browser
4. Run each script **in order** (01 through 08)

### Option 3: Cypher Shell

```bash
# Connect to your database
cypher-shell -a <your-bolt-url> -u <username> -p <password>

# Run each file in order
:source 01_create_constraints.cypher
:source 02_create_organizations.cypher
:source 03_create_persons.cypher
:source 04_create_groups_products_events.cypher
:source 05_create_ownership_relationships.cypher
:source 06_create_corporate_relationships.cypher
:source 07_create_artist_relationships.cypher
:source 08_create_event_topic_relationships.cypher
```

## Graph Schema

### Node Types

- **Organization**: Companies and business entities (HYBE, subsidiaries, partners)
- **Person**: Individuals (executives, artists, founders)
- **Group**: Musical groups (BTS, NewJeans, ENHYPEN, ILLIT)
- **Product**: Products and services (BTS World game)
- **Event**: Significant events (IPO, strategy launches)
- **Concept**: Business concepts (multi-label structure)
- **Topic**: Themes and issues (conflicts, strategies)

### Relationship Types

- **OWNS_SHARES_IN**: Ownership stakes (with shares, percentage, value)
- **FOUNDED**: Founder relationships
- **SUBSIDIARY_OF**: Corporate hierarchy
- **ACQUIRED_BY**: Acquisition relationships
- **CEO_OF / PRESIDENT_OF / CHAIRMAN_OF**: Leadership roles
- **MEMBER_OF**: Group membership
- **MANAGED_BY**: Artist-label relationships
- **PARTNERSHIP_WITH**: Business partnerships
- **INVESTED_IN**: Investment relationships
- **RELATED_TO**: Family/personal relationships
- **PROPELLED**: Impact relationships
- **IMPLEMENTED_STRATEGY**: Strategic initiatives
- **INVOLVED_IN**: Conflict/topic participation
- **And more...**

## Key Queries

The file `09_useful_queries.cypher` contains 20 pre-written queries including:

1. All shareholders ordered by ownership
2. Complete ownership chain visualization
3. HYBE subsidiaries breakdown
4. BTS members' shareholdings
5. K-pop groups and their labels
6. Bang Si-hyuk's relationship network
7. All HYBE acquisitions
8. Leadership positions across the ecosystem
9. Min Hee-jin conflict network
10. Partnerships and investments timeline
11. Corporate structure visualization
12. Top individual shareholders
13. Market metrics and statistics
14. And more...

## Data Points Captured

- **41.65 million** total HYBE shares outstanding
- **20+ organizations** including HYBE and subsidiaries
- **17 individuals** including executives and BTS members
- **4 musical groups** (BTS, NewJeans, ENHYPEN, ILLIT)
- **Ownership data** as of June 30, 2024
- **Market data** as of September 9, 2024
- **Financial values** in both KRW and USD
- **Historical events** from 2000-2024

## GraphRAG Usage

Once imported, you can use this knowledge graph for:

1. **Ownership Analysis**: Track who owns what and calculate indirect ownership
2. **Relationship Discovery**: Find hidden connections between entities
3. **Impact Analysis**: Understand how conflicts affect the corporate structure
4. **Timeline Tracking**: Visualize the evolution of HYBE's structure
5. **Network Analysis**: Identify key influencers and central nodes
6. **Query Augmented Generation**: Use graph context to enhance LLM responses

## Verification Queries

After import, verify your data:

```cypher
// Count all nodes
MATCH (n) RETURN labels(n) AS NodeType, count(n) AS Count;

// Count all relationships
MATCH ()-[r]->() RETURN type(r) AS RelationType, count(r) AS Count;

// Verify HYBE node
MATCH (h:Organization {name: 'HYBE'}) RETURN h;

// Check total shares
MATCH ()-[r:OWNS_SHARES_IN]->(h:Organization {name: 'HYBE'})
RETURN sum(r.shares) AS TotalSharesTracked, h.total_common_shares AS TotalOutstanding;
```

## Notes

- All monetary values are in USD unless specified otherwise
- Dates are stored in ISO format (YYYY-MM-DD)
- Ownership percentages are stored as decimals (e.g., 31.57 not 0.3157)
- Some historical data points have specific as_of_date properties

## Data Source

This knowledge graph is based on the MBW article "Who owns K-pop giant HYBE?" 
published September 10, 2024, by Daniel Tencer.

## Support

For Neo4J specific questions, refer to:
- [Neo4J Aura Documentation](https://neo4j.com/docs/aura/)
- [Cypher Query Language Guide](https://neo4j.com/docs/cypher-manual/)
- [Neo4J GraphRAG Documentation](https://neo4j.com/docs/graphrag/)

---

**Created**: 2025-10-22
**Data as of**: 2024-06-30 (ownership) / 2024-09-09 (market data)
**Total Entities**: 40+ nodes, 100+ relationships
