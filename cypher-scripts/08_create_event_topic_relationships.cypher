// Create relationships with Events

MATCH (ipo:Event {id: 'EVT001'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (hybe)-[:WENT_PUBLIC_IN]->(ipo);

MATCH (hybe2:Event {id: 'EVT002'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (hybe)-[:IMPLEMENTED_STRATEGY]->(hybe2);

// Create relationships with Concepts

MATCH (multilabel:Concept {id: 'CON001'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (hybe)-[:IMPLEMENTS]->(multilabel);

// Create relationships with Topics

MATCH (conflict:Topic {id: 'TOP001'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (hybe)-[:INVOLVED_IN]->(conflict);

MATCH (conflict:Topic {id: 'TOP001'})
MATCH (min:Person {id: 'PER012'})
CREATE (min)-[:INVOLVED_IN]->(conflict);

MATCH (conflict:Topic {id: 'TOP001'})
MATCH (ador:Organization {id: 'ORG010'})
CREATE (ador)-[:SUBJECT_OF]->(conflict);

MATCH (conflict:Topic {id: 'TOP001'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (conflict)-[:IMPACTED {
  impact_type: 'Stock price pressure',
  year: 2024
}]->(hybe);

// Create RENAMED_TO relationship

MATCH (benx:Organization {id: 'ORG016'})
MATCH (weverse:Organization {id: 'ORG014'})
CREATE (benx)-[:RENAMED_TO {
  year: 2021,
  new_name: 'WEVERSE COMPANY Inc.'
}]->(weverse);