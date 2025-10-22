// Create OWNS_SHARES_IN relationships

// Match nodes first
MATCH (bang_sh:Person {id: 'PER001'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (bang_sh)-[:OWNS_SHARES_IN {
  shares: 13150000,
  percentage: 31.57,
  value_usd: 1619000000,
  as_of_date: date('2024-06-30'),
  position: 'Largest shareholder'
}]->(hybe);

MATCH (netmarble:Organization {id: 'ORG002'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (netmarble)-[:OWNS_SHARES_IN {
  shares: 3930000,
  percentage: 9.44,
  value_usd: 483800000,
  as_of_date: date('2024-06-30'),
  position: 'Second largest shareholder'
}]->(hybe);

MATCH (nps:Organization {id: 'ORG003'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (nps)-[:OWNS_SHARES_IN {
  shares: 2650000,
  percentage: 6.36,
  value_usd: 325900000,
  as_of_date: date('2024-06-30'),
  position: 'Third largest shareholder'
}]->(hybe);

MATCH (dunamu:Organization {id: 'ORG004'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (dunamu)-[:OWNS_SHARES_IN {
  shares: 2300000,
  percentage: 5.53,
  value_usd: 283400000,
  as_of_date: date('2024-06-30'),
  position: 'Fourth largest shareholder'
}]->(hybe);

MATCH (braun:Person {id: 'PER011'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (braun)-[:OWNS_SHARES_IN {
  shares: 362292,
  percentage: 0.87,
  value_usd: 44600000,
  as_of_date: date('2024-06-30')
}]->(hybe);

MATCH (min:Person {id: 'PER012'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (min)-[:OWNS_SHARES_IN {
  shares: 2700,
  percentage: 0.01,
  as_of_date: date('2024-06-30')
}]->(hybe);

MATCH (lee_gj:Person {id: 'PER013'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (lee_gj)-[:OWNS_SHARES_IN {
  shares: 1562,
  percentage: 0.0004,
  as_of_date: date('2024-06-30')
}]->(hybe);

MATCH (lee_dh:Person {id: 'PER014'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (lee_dh)-[:OWNS_SHARES_IN {
  shares: 2161,
  percentage: 0.0005,
  as_of_date: date('2024-06-30')
}]->(hybe);

MATCH (shin:Person {id: 'PER016'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (shin)-[:OWNS_SHARES_IN {
  shares: 1302,
  percentage: 0.0003,
  as_of_date: date('2024-06-30')
}]->(hybe);

MATCH (choi:Person {id: 'PER017'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (choi)-[:OWNS_SHARES_IN {
  shares: 60,
  as_of_date: date('2024-06-30')
}]->(hybe);

// BTS members ownership
MATCH (jin:Person {id: 'PER004'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (jin)-[:OWNS_SHARES_IN {
  shares: 62784,
  initial_shares: 68385,
  percentage: 0.16,
  grant_year: 2018,
  as_of_date: date('2023-01-01')
}]->(hybe);

MATCH (suga:Person {id: 'PER005'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (suga)-[:OWNS_SHARES_IN {
  shares: 68385,
  percentage: 0.16,
  value_usd: 8420000,
  grant_year: 2018
}]->(hybe);

MATCH (jhope:Person {id: 'PER006'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (jhope)-[:OWNS_SHARES_IN {
  shares: 62784,
  initial_shares: 68385,
  grant_year: 2018,
  as_of_date: date('2023-01-01')
}]->(hybe);

MATCH (rm:Person {id: 'PER007'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (rm)-[:OWNS_SHARES_IN {
  shares: 62784,
  initial_shares: 68385,
  grant_year: 2018,
  as_of_date: date('2023-01-01')
}]->(hybe);

MATCH (jimin:Person {id: 'PER008'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (jimin)-[:OWNS_SHARES_IN {
  shares: 68385,
  percentage: 0.16,
  value_usd: 8420000,
  grant_year: 2018
}]->(hybe);

MATCH (v:Person {id: 'PER009'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (v)-[:OWNS_SHARES_IN {
  shares: 68385,
  percentage: 0.16,
  value_usd: 8420000,
  grant_year: 2018
}]->(hybe);

MATCH (jungkook:Person {id: 'PER010'})
MATCH (hybe:Organization {id: 'ORG001'})
CREATE (jungkook)-[:OWNS_SHARES_IN {
  shares: 68385,
  percentage: 0.16,
  value_usd: 8420000,
  grant_year: 2018
}]->(hybe);

// Bang Jun-hyuk owns Netmarble
MATCH (bang_jh:Person {id: 'PER002'})
MATCH (netmarble:Organization {id: 'ORG002'})
CREATE (bang_jh)-[:OWNS_SHARES_IN {
  percentage: 24.12,
  as_of_date: date('2023-12-31'),
  effective_control: true
}]->(netmarble);

// Naver owns shares in Weverse
MATCH (naver:Organization {id: 'ORG015'})
MATCH (weverse:Organization {id: 'ORG014'})
CREATE (naver)-[:OWNS_SHARES_IN {
  investment_amount_usd: 321600000,
  investment_year: 2021,
  notes: 'Remaining shares after HYBE acquisition'
}]->(weverse);

// UMG invested in Weverse
MATCH (umg:Organization {id: 'ORG018'})
MATCH (weverse:Organization {id: 'ORG014'})
CREATE (umg)-[:INVESTED_IN {
  year: 2024,
  investment_type: 'Minority investment',
  notes: 'As part of 10-year distribution partnership'
}]->(weverse);