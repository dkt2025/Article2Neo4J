// Create Group nodes

CREATE (bts:Group {
  id: 'GRP001',
  name: 'BTS',
  type: 'K-pop boy band',
  description: 'Musical phenomenon that propelled HYBE to prominence',
  total_shares_granted: 478695,
  total_ownership_percentage: 1.15,
  grant_year: 2018,
  members_count: 7
});

CREATE (newjeans:Group {
  id: 'GRP002',
  name: 'NewJeans',
  type: 'K-pop girl group',
  description: 'Popular girl group'
});

CREATE (illit:Group {
  id: 'GRP003',
  name: 'ILLIT',
  type: 'K-pop girl group',
  description: 'Developed by Belift Lab'
});

CREATE (enhypen:Group {
  id: 'GRP004',
  name: 'ENHYPEN',
  type: 'K-pop group',
  description: 'Popular K-pop group'
});

// Create Product nodes

CREATE (btsworld:Product {
  id: 'PRD001',
  name: 'BTS World',
  type: 'Video game',
  description: 'Game featuring BTS members'
});

// Create Event nodes

CREATE (ipo:Event {
  id: 'EVT001',
  name: 'HYBE IPO',
  type: 'Initial Public Offering',
  date: date('2020-10-01'),
  description: 'HYBE went public in October 2020'
});

CREATE (hybe2:Event {
  id: 'EVT002',
  name: 'HYBE 2.0 Strategy',
  type: 'Corporate strategy',
  year: 2024,
  description: 'New strategy including label services in US'
});

// Create Concept nodes

CREATE (multilabel:Concept {
  id: 'CON001',
  name: 'Multi-label structure',
  type: 'Business model',
  description: 'First of its kind in South Korea music industry',
  focus: 'Competition vs. Synergy'
});

// Create Topic nodes

CREATE (conflict:Topic {
  id: 'TOP001',
  name: 'HYBE-Min Hee-jin conflict',
  type: 'Corporate dispute',
  year: 2024,
  impact: 'Stock price pressure',
  description: 'Conflict over alleged plot to seize ADOR control'
});