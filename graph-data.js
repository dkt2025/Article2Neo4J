// Article2Neo4J - Graph Data
// Demo: HYBE Ownership Structure
// Exported from Neo4J Aura on 2024-10-22
// Data as of June 30, 2024

const graphData = {
    nodes: [
        // Organizations
        { id: 'ORG001', label: 'HYBE', group: 'Organization', 
          properties: { name: 'HYBE', type: 'K-pop company', market_cap_usd: 5370000000, total_shares: 41650000 }},
        { id: 'ORG002', label: 'Netmarble Corporation', group: 'Organization',
          properties: { name: 'Netmarble Corporation', type: 'Video game developer' }},
        { id: 'ORG003', label: 'National Pension Service', group: 'Organization',
          properties: { name: 'National Pension Service', type: 'Public pension fund' }},
        { id: 'ORG004', label: 'Dunamu Co. Ltd.', group: 'Organization',
          properties: { name: 'Dunamu Co. Ltd.', type: 'Fintech company' }},
        { id: 'ORG010', label: 'ADOR', group: 'Organization',
          properties: { name: 'ADOR', type: 'K-pop label' }},
        { id: 'ORG011', label: 'Belift Lab', group: 'Organization',
          properties: { name: 'Belift Lab', type: 'K-pop label' }},
        { id: 'ORG012', label: 'Pledis Entertainment', group: 'Organization',
          properties: { name: 'Pledis Entertainment', type: 'K-pop label' }},
        { id: 'ORG013', label: 'BIGHIT MUSIC', group: 'Organization',
          properties: { name: 'BIGHIT MUSIC', type: 'K-pop label' }},
        { id: 'ORG014', label: 'Weverse', group: 'Organization',
          properties: { name: 'Weverse', type: 'Fan platform' }},
        
        // Persons
        { id: 'PER001', label: 'Bang Si-hyuk', group: 'Person',
          properties: { name: 'Bang Si-hyuk', role: 'Founder and Chairman', shares: 13150000, percentage: 31.57, value_usd: 1619000000 }},
        { id: 'PER002', label: 'Bang Jun-hyuk', group: 'Person',
          properties: { name: 'Bang Jun-hyuk', role: 'Founder of Netmarble' }},
        { id: 'PER011', label: 'Scooter Braun', group: 'Person',
          properties: { name: 'Scooter Braun', role: 'CEO of HYBE America', shares: 362292, percentage: 0.87, value_usd: 44600000 }},
        { id: 'PER012', label: 'Min Hee-jin', group: 'Person',
          properties: { name: 'Min Hee-jin', role: 'Former CEO of ADOR', shares: 2700, percentage: 0.01 }},
        
        // BTS Members
        { id: 'PER004', label: 'Jin', group: 'Person',
          properties: { name: 'Jin', role: 'BTS member', shares: 62784, percentage: 0.16 }},
        { id: 'PER005', label: 'Suga', group: 'Person',
          properties: { name: 'Suga', role: 'BTS member', shares: 68385, percentage: 0.16 }},
        { id: 'PER006', label: 'J-Hope', group: 'Person',
          properties: { name: 'J-Hope', role: 'BTS member', shares: 62784, percentage: 0.16 }},
        { id: 'PER007', label: 'RM', group: 'Person',
          properties: { name: 'RM', role: 'BTS member', shares: 62784, percentage: 0.16 }},
        { id: 'PER008', label: 'Jimin', group: 'Person',
          properties: { name: 'Jimin', role: 'BTS member', shares: 68385, percentage: 0.16 }},
        { id: 'PER009', label: 'V', group: 'Person',
          properties: { name: 'V', role: 'BTS member', shares: 68385, percentage: 0.16 }},
        { id: 'PER010', label: 'Jungkook', group: 'Person',
          properties: { name: 'Jungkook', role: 'BTS member', shares: 68385, percentage: 0.16 }},
        
        // Groups
        { id: 'GRP001', label: 'BTS', group: 'Group',
          properties: { name: 'BTS', type: 'K-pop boy band', members_count: 7 }},
        { id: 'GRP002', label: 'NewJeans', group: 'Group',
          properties: { name: 'NewJeans', type: 'K-pop girl group' }},
        { id: 'GRP003', label: 'ILLIT', group: 'Group',
          properties: { name: 'ILLIT', type: 'K-pop girl group' }},
        { id: 'GRP004', label: 'ENHYPEN', group: 'Group',
          properties: { name: 'ENHYPEN', type: 'K-pop group' }}
    ],
    
    edges: [
        // Major Ownership
        { from: 'PER001', to: 'ORG001', label: 'OWNS_SHARES_IN', 
          properties: { shares: 13150000, percentage: 31.57, value_usd: 1619000000 }},
        { from: 'ORG002', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 3930000, percentage: 9.44, value_usd: 483800000 }},
        { from: 'ORG003', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 2650000, percentage: 6.36, value_usd: 325900000 }},
        { from: 'ORG004', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 2300000, percentage: 5.53, value_usd: 283400000 }},
        { from: 'PER011', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 362292, percentage: 0.87, value_usd: 44600000 }},
        
        // BTS Members Ownership
        { from: 'PER004', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 62784, percentage: 0.16 }},
        { from: 'PER005', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 68385, percentage: 0.16 }},
        { from: 'PER006', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 68385, percentage: 0.16 }},
        { from: 'PER007', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 62784, percentage: 0.16 }},
        { from: 'PER008', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 68385, percentage: 0.16 }},
        { from: 'PER009', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 68385, percentage: 0.16 }},
        { from: 'PER010', to: 'ORG001', label: 'OWNS_SHARES_IN',
          properties: { shares: 68385, percentage: 0.16 }},
        
        // Corporate Structure
        { from: 'PER001', to: 'ORG001', label: 'FOUNDED', properties: {} },
        { from: 'PER001', to: 'ORG001', label: 'CHAIRMAN_OF', properties: {} },
        { from: 'PER002', to: 'ORG002', label: 'FOUNDED', properties: {} },
        { from: 'PER002', to: 'ORG002', label: 'OWNS_SHARES_IN', properties: { percentage: 24.12 }},
        { from: 'PER001', to: 'PER002', label: 'RELATED_TO', properties: { relationship: 'Relative' }},
        
        // Subsidiaries
        { from: 'ORG010', to: 'ORG001', label: 'SUBSIDIARY_OF', properties: {} },
        { from: 'ORG011', to: 'ORG001', label: 'SUBSIDIARY_OF', properties: { ownership_percentage: 100 }},
        { from: 'ORG012', to: 'ORG001', label: 'SUBSIDIARY_OF', properties: { ownership_percentage: 90 }},
        { from: 'ORG013', to: 'ORG001', label: 'SUBSIDIARY_OF', properties: {} },
        { from: 'ORG014', to: 'ORG001', label: 'SUBSIDIARY_OF', properties: { ownership_percentage: 55.4 }},
        
        // Leadership
        { from: 'PER011', to: 'ORG001', label: 'BOARD_MEMBER', properties: {} },
        { from: 'PER012', to: 'ORG010', label: 'FORMER_CEO_OF', properties: {} },
        
        // Artist Relationships
        { from: 'PER004', to: 'GRP001', label: 'MEMBER_OF', properties: {} },
        { from: 'PER005', to: 'GRP001', label: 'MEMBER_OF', properties: {} },
        { from: 'PER006', to: 'GRP001', label: 'MEMBER_OF', properties: {} },
        { from: 'PER007', to: 'GRP001', label: 'MEMBER_OF', properties: {} },
        { from: 'PER008', to: 'GRP001', label: 'MEMBER_OF', properties: {} },
        { from: 'PER009', to: 'GRP001', label: 'MEMBER_OF', properties: {} },
        { from: 'PER010', to: 'GRP001', label: 'MEMBER_OF', properties: {} },
        
        { from: 'GRP001', to: 'ORG001', label: 'PROPELLED', properties: {} },
        { from: 'GRP002', to: 'ORG010', label: 'MANAGED_BY', properties: {} },
        { from: 'GRP003', to: 'ORG011', label: 'MANAGED_BY', properties: {} },
        { from: 'GRP004', to: 'ORG011', label: 'MANAGED_BY', properties: {} }
    ]
};