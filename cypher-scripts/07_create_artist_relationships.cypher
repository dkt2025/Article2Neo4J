// Create MEMBER_OF relationships for BTS

MATCH (bts:Group {id: 'GRP001'})
MATCH (jin:Person {id: 'PER004'})
CREATE (jin)-[:MEMBER_OF]->(bts);

MATCH (bts:Group {id: 'GRP001'})
MATCH (suga:Person {id: 'PER005'})
CREATE (suga)-[:MEMBER_OF]->(bts);

MATCH (bts:Group {id: 'GRP001'})
MATCH (jhope:Person {id: 'PER006'})
CREATE (jhope)-[:MEMBER_OF]->(bts);

MATCH (bts:Group {id: 'GRP001'})
MATCH (rm:Person {id: 'PER007'})
CREATE (rm)-[:MEMBER_OF]->(bts);

MATCH (bts:Group {id: 'GRP001'})
MATCH (jimin:Person {id: 'PER008'})
CREATE (jimin)-[:MEMBER_OF]->(bts);

MATCH (bts:Group {id: 'GRP001'})
MATCH (v:Person {id: 'PER009'})
CREATE (v)-[:MEMBER_OF]->(bts);

MATCH (bts:Group {id: 'GRP001'})
MATCH (jungkook:Person {id: 'PER010'})
CREATE (jungkook)-[:MEMBER_OF]->(bts);

// Create PROPELLED relationship

MATCH (bts:Group {id: 'GRP001'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (bts)-[:PROPELLED {
  description: 'Musical phenomenon that made HYBE the largest K-pop company'
}]->(hybe);

// Create MANAGED_BY relationships

MATCH (newjeans:Group {id: 'GRP002'})
MATCH (ador:Organization {id: 'ORG010'})
CREATE (newjeans)-[:MANAGED_BY]->(ador);

MATCH (illit:Group {id: 'GRP003'})
MATCH (belift:Organization {id: 'ORG011'})
CREATE (illit)-[:MANAGED_BY]->(belift);

MATCH (enhypen:Group {id: 'GRP004'})
MATCH (belift:Organization {id: 'ORG011'})
CREATE (enhypen)-[:MANAGED_BY]->(belift);

// Create DEVELOPED_BY relationship for BTS World

MATCH (btsworld:Product {id: 'PRD001'})
MATCH (netmarble:Organization {id: 'ORG002'})
CREATE (btsworld)-[:DEVELOPED_BY]->(netmarble);

MATCH (btsworld:Product {id: 'PRD001'})
MATCH (bts:Group {id: 'GRP001'})
CREATE (btsworld)-[:FEATURES]->(bts);