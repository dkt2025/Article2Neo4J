// Create Person nodes

// Bang Si-hyuk - HYBE Founder
CREATE (bang_sh:Person {
  id: 'PER001',
  name: 'Bang Si-hyuk',
  role: 'Founder and Chairman',
  wealth_status: 'Billionaire',
  shares: 13150000,
  ownership_percentage: 31.57,
  value_usd: 1619000000,
  as_of_date: date('2024-06-30'),
  notes: 'Stepped down as CEO in 2021, remains Chairman'
});

// Bang Jun-hyuk - Netmarble Founder
CREATE (bang_jh:Person {
  id: 'PER002',
  name: 'Bang Jun-hyuk',
  role: 'Founder of Netmarble',
  relationship: 'Relative of Bang Si-hyuk',
  netmarble_ownership_percentage: 24.12,
  effective_hybe_control_percentage: 2.27,
  as_of_date: date('2023-12-31')
});

// Song Chi-hyung - Dunamu Founder
CREATE (song:Person {
  id: 'PER003',
  name: 'Song Chi-hyung',
  role: 'Founder of Dunamu',
  estimated_worth_usd: 950000000
});

// BTS Members
CREATE (jin:Person {
  id: 'PER004',
  name: 'Jin',
  role: 'BTS member',
  shares: 62784,
  initial_shares_granted: 68385,
  grant_year: 2018,
  ownership_percentage: 0.16,
  as_of_date: date('2023-01-01'),
  notes: 'Reduced stake from original grant'
});

CREATE (suga:Person {
  id: 'PER005',
  name: 'Suga',
  role: 'BTS member',
  shares: 68385,
  initial_shares_granted: 68385,
  grant_year: 2018,
  ownership_percentage: 0.16,
  estimated_value_usd: 8420000
});

CREATE (jhope:Person {
  id: 'PER006',
  name: 'J-Hope',
  role: 'BTS member',
  shares: 62784,
  initial_shares_granted: 68385,
  grant_year: 2018,
  as_of_date: date('2023-01-01'),
  notes: 'Reduced stake from original grant'
});

CREATE (rm:Person {
  id: 'PER007',
  name: 'RM',
  role: 'BTS member',
  shares: 62784,
  initial_shares_granted: 68385,
  grant_year: 2018,
  as_of_date: date('2023-01-01'),
  notes: 'Reduced stake from original grant'
});

CREATE (jimin:Person {
  id: 'PER008',
  name: 'Jimin',
  role: 'BTS member',
  shares: 68385,
  initial_shares_granted: 68385,
  grant_year: 2018,
  ownership_percentage: 0.16,
  estimated_value_usd: 8420000
});

CREATE (v:Person {
  id: 'PER009',
  name: 'V',
  role: 'BTS member',
  shares: 68385,
  initial_shares_granted: 68385,
  grant_year: 2018,
  ownership_percentage: 0.16,
  estimated_value_usd: 8420000
});

CREATE (jungkook:Person {
  id: 'PER010',
  name: 'Jungkook',
  role: 'BTS member',
  shares: 68385,
  initial_shares_granted: 68385,
  grant_year: 2018,
  ownership_percentage: 0.16,
  estimated_value_usd: 8420000
});

// Scooter Braun
CREATE (braun:Person {
  id: 'PER011',
  name: 'Scooter Braun',
  role: 'CEO of HYBE America',
  shares: 362292,
  ownership_percentage: 0.87,
  value_usd: 44600000,
  as_of_date: date('2024-06-30'),
  notes: 'Joined HYBE board after Ithaca Holdings acquisition'
});

// Min Hee-jin
CREATE (min:Person {
  id: 'PER012',
  name: 'Min Hee-jin',
  role: 'Former CEO of ADOR',
  shares: 2700,
  ownership_percentage: 0.01,
  as_of_date: date('2024-06-30'),
  ousted_date: date('2024-08-01'),
  notes: 'Ousted in August 2024 amid conflict with HYBE'
});

// Lee Ga-jun
CREATE (lee_gj:Person {
  id: 'PER013',
  name: 'Lee Ga-jun',
  role: 'Head of Operations at Belift Lab',
  shares: 1562,
  ownership_percentage: 0.0004,
  as_of_date: date('2024-06-30')
});

// Lee Da Hye
CREATE (lee_dh:Person {
  id: 'PER014',
  name: 'Lee Da Hye',
  role: 'CEO of Pledis Entertainment',
  shares: 2161,
  ownership_percentage: 0.0005,
  as_of_date: date('2024-06-30')
});

// Sung Soo Han
CREATE (sung:Person {
  id: 'PER015',
  name: 'Sung Soo Han',
  role: 'Founder of Pledis Entertainment',
  title: 'Master Professional'
});

// Young Jae Shin
CREATE (shin:Person {
  id: 'PER016',
  name: 'Young Jae Shin',
  role: 'President of BIGHIT MUSIC',
  role2: 'President of HYBE MUSIC GROUP APAC',
  shares: 1302,
  ownership_percentage: 0.0003,
  as_of_date: date('2024-06-30'),
  appointment_year: 2024
});

// Joon Choi
CREATE (choi:Person {
  id: 'PER017',
  name: 'Joon Choi',
  role: 'President of Weverse',
  shares: 60,
  as_of_date: date('2024-06-30')
});