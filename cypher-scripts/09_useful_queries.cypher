// ====================================================
// USEFUL QUERIES FOR HYBE KNOWLEDGE GRAPH
// ====================================================

// 1. Find all shareholders and their ownership percentages (ordered by ownership)
MATCH (entity)-[r:OWNS_SHARES_IN]->(hybe:Organization {name: 'HYBE'})
RETURN entity.name AS Shareholder, 
       r.shares AS Shares, 
       r.percentage AS Percentage,
       r.value_usd AS ValueUSD,
       r.position AS Position
ORDER BY r.percentage DESC;

// 2. Find the complete ownership chain (who owns what)
MATCH path = (owner)-[:OWNS_SHARES_IN*1..3]->(company)
RETURN path;

// 3. Find all HYBE subsidiaries and their ownership percentages
MATCH (subsidiary)-[r:SUBSIDIARY_OF]->(hybe:Organization {name: 'HYBE'})
RETURN subsidiary.name AS Subsidiary,
       subsidiary.type AS Type,
       r.ownership_percentage AS OwnershipPercentage,
       r.acquisition_year AS AcquisitionYear
ORDER BY r.ownership_percentage DESC;

// 4. Find all BTS members and their shareholdings
MATCH (member:Person)-[:MEMBER_OF]->(bts:Group {name: 'BTS'})
MATCH (member)-[r:OWNS_SHARES_IN]->(hybe:Organization {name: 'HYBE'})
RETURN member.name AS Member,
       r.shares AS Shares,
       r.initial_shares AS InitialShares,
       r.value_usd AS ValueUSD
ORDER BY r.shares DESC;

// 5. Find all K-pop groups and their managing labels
MATCH (group:Group)-[:MANAGED_BY]->(label:Organization)
RETURN group.name AS Group,
       group.type AS Type,
       label.name AS Label
ORDER BY group.name;

// 6. Find the relationship network of Bang Si-hyuk
MATCH (bang:Person {name: 'Bang Si-hyuk'})-[r]-(connected)
RETURN bang.name AS Person,
       type(r) AS Relationship,
       connected.name AS ConnectedEntity,
       labels(connected) AS EntityType;

// 7. Find all acquisitions made by HYBE
MATCH (acquired)-[r:ACQUIRED_BY]->(hybe:Organization {name: 'HYBE'})
RETURN acquired.name AS AcquiredCompany,
       acquired.type AS Type,
       r.year AS Year,
       r.amount_usd AS AmountUSD
ORDER BY r.year DESC;

// 8. Calculate total BTS ownership value
MATCH (member:Person)-[:MEMBER_OF]->(:Group {name: 'BTS'})
MATCH (member)-[r:OWNS_SHARES_IN]->(:Organization {name: 'HYBE'})
RETURN sum(r.shares) AS TotalShares,
       sum(r.value_usd) AS TotalValueUSD,
       avg(r.percentage) AS AvgPercentage;

// 9. Find all leadership positions in HYBE ecosystem
MATCH (person:Person)-[r]-(org:Organization)
WHERE type(r) IN ['CEO_OF', 'PRESIDENT_OF', 'CHAIRMAN_OF', 'HEAD_OF_OPERATIONS']
RETURN person.name AS Name,
       type(r) AS Position,
       org.name AS Organization
ORDER BY org.name;

// 10. Find the Min Hee-jin conflict network
MATCH (conflict:Topic {name: 'HYBE-Min Hee-jin conflict'})-[r]-(entity)
RETURN conflict.name AS Conflict,
       type(r) AS Relationship,
       entity.name AS InvolvedEntity,
       labels(entity) AS EntityType;

// 11. Find all partnerships and investments
MATCH (entity1)-[r:PARTNERSHIP_WITH|INVESTED_IN]-(entity2)
RETURN entity1.name AS Entity1,
       type(r) AS RelationType,
       entity2.name AS Entity2,
       r.year AS Year,
       r.type AS PartnershipType
ORDER BY r.year DESC;

// 12. Show the complete HYBE corporate structure
MATCH (hybe:Organization {name: 'HYBE'})<-[:SUBSIDIARY_OF]-(subsidiary)
OPTIONAL MATCH (subsidiary)<-[:MANAGED_BY]-(artist:Group)
RETURN hybe.name AS Parent,
       subsidiary.name AS Subsidiary,
       subsidiary.type AS Type,
       collect(artist.name) AS Artists;

// 13. Find top 5 individual shareholders (excluding organizations)
MATCH (person:Person)-[r:OWNS_SHARES_IN]->(hybe:Organization {name: 'HYBE'})
RETURN person.name AS Shareholder,
       person.role AS Role,
       r.shares AS Shares,
       r.percentage AS Percentage,
       r.value_usd AS ValueUSD
ORDER BY r.percentage DESC
LIMIT 5;

// 14. Find all products and their relationships
MATCH (product:Product)-[r]-(entity)
RETURN product.name AS Product,
       type(r) AS Relationship,
       entity.name AS RelatedEntity,
       labels(entity) AS EntityType;

// 15. Find family/relative relationships
MATCH (p1:Person)-[r:RELATED_TO]-(p2:Person)
RETURN p1.name AS Person1,
       p2.name AS Person2,
       r.relationship AS Relationship,
       r.type AS Type;

// 16. Calculate HYBE's market metrics
MATCH (hybe:Organization {name: 'HYBE'})
RETURN hybe.name AS Company,
       hybe.market_cap_usd AS MarketCapUSD,
       hybe.revenue_2023_usd AS Revenue2023USD,
       hybe.stock_performance_ytd AS StockPerformanceYTD,
       hybe.international_revenue_percentage AS InternationalRevenuePercent;

// 17. Find all events related to HYBE
MATCH (hybe:Organization {name: 'HYBE'})-[r]-(event:Event)
RETURN event.name AS Event,
       event.type AS Type,
       event.date AS Date,
       event.year AS Year,
       type(r) AS Relationship
ORDER BY coalesce(event.date, date(event.year + '-01-01')) DESC;

// 18. Find shortest path between two entities (e.g., Scooter Braun and BTS)
MATCH path = shortestPath(
  (braun:Person {name: 'Scooter Braun'})-[*]-(bts:Group {name: 'BTS'})
)
RETURN path;

// 19. Find all entities connected to Weverse
MATCH (weverse:Organization {name: 'Weverse'})-[r]-(entity)
RETURN weverse.name AS Weverse,
       type(r) AS Relationship,
       entity.name AS ConnectedEntity,
       labels(entity) AS EntityType
ORDER BY type(r);

// 20. Calculate aggregate ownership statistics
MATCH (:Person)-[r:OWNS_SHARES_IN]->(hybe:Organization {name: 'HYBE'})
WITH sum(r.shares) AS totalPersonShares, 
     sum(r.value_usd) AS totalPersonValue,
     count(r) AS personCount
MATCH (:Organization)-[r2:OWNS_SHARES_IN]->(hybe:Organization {name: 'HYBE'})
WITH totalPersonShares, totalPersonValue, personCount,
     sum(r2.shares) AS totalOrgShares,
     sum(r2.value_usd) AS totalOrgValue,
     count(r2) AS orgCount
RETURN personCount AS IndividualShareholders,
       totalPersonShares AS IndividualShares,
       totalPersonValue AS IndividualValueUSD,
       orgCount AS OrganizationShareholders,
       totalOrgShares AS OrganizationShares,
       totalOrgValue AS OrganizationValueUSD;