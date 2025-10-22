// Create FOUNDED relationships

MATCH (bang_sh:Person {id: 'PER001'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (bang_sh)-[:FOUNDED {
  year: 2005,
  original_name: 'Big Hit Entertainment'
}]->(hybe);

MATCH (bang_jh:Person {id: 'PER002'})
MATCH (netmarble:Organization {id: 'ORG002'})
CREATE (bang_jh)-[:FOUNDED {
  year: 2000
}]->(netmarble);

MATCH (song:Person {id: 'PER003'})
MATCH (dunamu:Organization {id: 'ORG004'})
CREATE (song)-[:FOUNDED]->(dunamu);

MATCH (braun:Person {id: 'PER011'})
MATCH (ithaca:Organization {id: 'ORG005'})
CREATE (braun)-[:FOUNDED]->(ithaca);

MATCH (sung:Person {id: 'PER015'})
MATCH (pledis:Organization {id: 'ORG012'})
CREATE (sung)-[:FOUNDED]->(pledis);

// Create SUBSIDIARY_OF relationships

MATCH (hybe_latam:Organization {id: 'ORG007'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (hybe_latam)-[:SUBSIDIARY_OF {
  established: 2023,
  type: 'Regional division'
}]->(hybe);

MATCH (hybe_america:Organization {id: 'ORG008'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (hybe_america)-[:SUBSIDIARY_OF {
  type: 'Regional division'
}]->(hybe);

MATCH (hybe_apac:Organization {id: 'ORG009'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (hybe_apac)-[:SUBSIDIARY_OF {
  established: 2024,
  type: 'Regional division'
}]->(hybe);

MATCH (ador:Organization {id: 'ORG010'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (ador)-[:SUBSIDIARY_OF {
  type: 'Label'
}]->(hybe);

MATCH (belift:Organization {id: 'ORG011'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (belift)-[:SUBSIDIARY_OF {
  ownership_percentage: 100,
  acquisition_year: 2023,
  type: 'Label'
}]->(hybe);

MATCH (pledis:Organization {id: 'ORG012'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (pledis)-[:SUBSIDIARY_OF {
  ownership_percentage: 90,
  acquisition_year: 2020,
  type: 'Label'
}]->(hybe);

MATCH (bighit:Organization {id: 'ORG013'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (bighit)-[:SUBSIDIARY_OF {
  type: 'Label',
  notes: 'Original company name until 2021'
}]->(hybe);

MATCH (weverse:Organization {id: 'ORG014'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (weverse)-[:SUBSIDIARY_OF {
  ownership_percentage: 55.4,
  acquisition_cost_usd: 122000000,
  as_of_date: date('2024-06-30'),
  type: 'Platform'
}]->(hybe);

// Create ACQUIRED_BY relationships

MATCH (ithaca:Organization {id: 'ORG005'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (ithaca)-[:ACQUIRED_BY {
  year: 2021,
  amount_usd: 1000000000,
  acquirer_note: 'Major acquisition valued at $1 billion+'
}]->(hybe);

MATCH (exile:Organization {id: 'ORG006'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (exile)-[:ACQUIRED_BY {
  year: 2023,
  purpose: 'Foundation of HYBE Latin America'
}]->(hybe);

MATCH (vlive:Organization {id: 'ORG017'})
MATCH (weverse:Organization {id: 'ORG014'})
CREATE (vlive)-[:ACQUIRED_BY {
  year: 2021,
  notes: 'Users and content integrated into Weverse'
}]->(weverse);

// Create CEO_OF and leadership relationships

MATCH (bang_sh:Person {id: 'PER001'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (bang_sh)-[:CHAIRMAN_OF {
  since: 2021,
  previous_role: 'CEO',
  stepped_down: date('2021-01-01')
}]->(hybe);

MATCH (braun:Person {id: 'PER011'})
MATCH (hybe_america:Organization {id: 'ORG008'})
CREATE (braun)-[:CEO_OF]->(hybe_america);

MATCH (min:Person {id: 'PER012'})
MATCH (ador:Organization {id: 'ORG010'})
CREATE (min)-[:FORMER_CEO_OF {
  start_date: date('2021-01-01'),
  end_date: date('2024-08-01'),
  termination_reason: 'Ousted amid conflict with HYBE'
}]->(ador);

MATCH (lee_dh:Person {id: 'PER014'})
MATCH (pledis:Organization {id: 'ORG012'})
CREATE (lee_dh)-[:CEO_OF]->(pledis);

MATCH (shin:Person {id: 'PER016'})
MATCH (bighit:Organization {id: 'ORG013'})
CREATE (shin)-[:PRESIDENT_OF]->(bighit);

MATCH (shin:Person {id: 'PER016'})
MATCH (hybe_apac:Organization {id: 'ORG009'})
CREATE (shin)-[:PRESIDENT_OF {
  appointed: 2024
}]->(hybe_apac);

MATCH (choi:Person {id: 'PER017'})
MATCH (weverse:Organization {id: 'ORG014'})
CREATE (choi)-[:PRESIDENT_OF]->(weverse);

MATCH (lee_gj:Person {id: 'PER013'})
MATCH (belift:Organization {id: 'ORG011'})
CREATE (lee_gj)-[:HEAD_OF_OPERATIONS]->(belift);

// Create PARTNERSHIP_WITH relationships

MATCH (hybe:Organization {id: 'ORG001'})
MATCH (umg:Organization {id: 'ORG018'})
CREATE (hybe)-[:PARTNERSHIP_WITH {
  type: 'Distribution deal',
  duration_years: 10,
  year: 2024,
  exclusivity: true
}]->(umg);

MATCH (hybe:Organization {id: 'ORG001'})
MATCH (netmarble:Organization {id: 'ORG002'})
CREATE (hybe)-[:PARTNERSHIP_WITH {
  type: 'Content development',
  products: ['BTS World']
}]->(netmarble);

MATCH (hybe:Organization {id: 'ORG001'})
MATCH (cjenm:Organization {id: 'ORG019'})
CREATE (hybe)-[:JOINT_VENTURE_WITH {
  year: 2018,
  result: 'Belift Lab',
  status: 'Fully acquired by HYBE in 2023'
}]->(cjenm);

// Create RELATED_TO relationship

MATCH (bang_sh:Person {id: 'PER001'})
MATCH (bang_jh:Person {id: 'PER002'})
CREATE (bang_sh)-[:RELATED_TO {
  relationship: 'Relative',
  type: 'Family'
}]->(bang_jh);