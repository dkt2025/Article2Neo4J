// Create Organization nodes

// HYBE - Main entity
CREATE (hybe:Organization {
  id: 'ORG001',
  name: 'HYBE',
  type: 'K-pop company',
  description: 'Largest K-pop company in the world, formerly Big Hit Entertainment',
  former_name: 'Big Hit Entertainment',
  founded: 2005,
  market_cap_krw: 7160000000000,
  market_cap_usd: 5370000000,
  revenue_2023_usd: 1660000000,
  international_revenue_percentage: 64,
  stock_performance_ytd: -31.68,
  total_common_shares: 41650000,
  as_of_date: date('2024-09-09'),
  country: 'South Korea'
});

// Netmarble Corporation
CREATE (netmarble:Organization {
  id: 'ORG002',
  name: 'Netmarble Corporation',
  type: 'Video game developer',
  founded: 2000,
  initial_hybe_stake_percentage: 25.71,
  initial_hybe_stake_year: 2018,
  country: 'South Korea'
});

// National Pension Service
CREATE (nps:Organization {
  id: 'ORG003',
  name: 'National Pension Service',
  type: 'Public pension fund',
  description: "World's 3rd-largest public pension fund",
  assets_under_management_usd: 850000000000,
  country: 'South Korea'
});

// Dunamu Co. Ltd.
CREATE (dunamu:Organization {
  id: 'ORG004',
  name: 'Dunamu Co. Ltd.',
  type: 'Fintech company',
  business: 'Blockchain asset trading',
  description: 'Operates Upbit cryptocurrency exchange',
  country: 'South Korea'
});

// Ithaca Holdings
CREATE (ithaca:Organization {
  id: 'ORG005',
  name: 'Ithaca Holdings',
  type: 'Entertainment company',
  acquisition_year: 2021,
  acquisition_amount_usd: 1000000000,
  country: 'United States'
});

// Exile Music
CREATE (exile:Organization {
  id: 'ORG006',
  name: 'Exile Music',
  type: 'Music company',
  acquisition_year: 2023,
  country: 'Latin America'
});

// HYBE Latin America
CREATE (hybe_latam:Organization {
  id: 'ORG007',
  name: 'HYBE Latin America',
  type: 'Music division',
  established: 2023,
  description: 'Expansion into Latin music market'
});

// HYBE America
CREATE (hybe_america:Organization {
  id: 'ORG008',
  name: 'HYBE America',
  type: 'Music division',
  description: 'Led by Scooter Braun'
});

// HYBE MUSIC GROUP APAC
CREATE (hybe_apac:Organization {
  id: 'ORG009',
  name: 'HYBE MUSIC GROUP APAC',
  type: 'Music division',
  established: 2024,
  description: 'Oversees music labels in Korea and Japan'
});

// ADOR
CREATE (ador:Organization {
  id: 'ORG010',
  name: 'ADOR',
  type: 'K-pop label',
  description: 'Label behind NewJeans'
});

// Belift Lab
CREATE (belift:Organization {
  id: 'ORG011',
  name: 'Belift Lab',
  type: 'K-pop label',
  founded: 2018,
  full_acquisition_year: 2023,
  ownership_percentage: 100,
  description: 'Started as joint venture with CJ ENM'
});

// Pledis Entertainment
CREATE (pledis:Organization {
  id: 'ORG012',
  name: 'Pledis Entertainment',
  type: 'K-pop label',
  acquisition_year: 2020,
  ownership_percentage: 90
});

// BIGHIT MUSIC
CREATE (bighit:Organization {
  id: 'ORG013',
  name: 'BIGHIT MUSIC',
  type: 'K-pop label',
  description: 'Original name of HYBE until 2021 rebrand'
});

// Weverse
CREATE (weverse:Organization {
  id: 'ORG014',
  name: 'Weverse',
  type: 'Fan platform',
  former_name: 'beNX',
  hybe_ownership_percentage: 55.4,
  acquisition_cost_krw: 164400000000,
  acquisition_cost_usd: 122000000,
  as_of_date: date('2024-06-30')
});

// Naver
CREATE (naver:Organization {
  id: 'ORG015',
  name: 'Naver',
  type: 'Tech and software company',
  investment_year: 2021,
  investment_amount_usd: 321600000,
  country: 'South Korea'
});

// beNX (historical)
CREATE (benx:Organization {
  id: 'ORG016',
  name: 'beNX',
  type: 'HYBE subsidiary',
  description: 'Developed Weverse, renamed to WEVERSE COMPANY Inc.',
  renamed_year: 2021
});

// V LIVE
CREATE (vlive:Organization {
  id: 'ORG017',
  name: 'V LIVE',
  type: 'Platform division',
  description: 'Division of Naver, acquired by Weverse',
  acquisition_year: 2021
});

// Universal Music Group
CREATE (umg:Organization {
  id: 'ORG018',
  name: 'Universal Music Group',
  type: 'Music company',
  investment_year: 2024,
  partnership_duration_years: 10
});

// CJ ENM
CREATE (cjenm:Organization {
  id: 'ORG019',
  name: 'CJ ENM',
  type: 'Entertainment company',
  joint_venture_year: 2018,
  country: 'South Korea'
});