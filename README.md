# 📊 Article2Neo4J

[![GitHub Pages](https://img.shields.io/badge/demo-live-success)](https://dkt2025.github.io/Article2Neo4J/)
[![Neo4J](https://img.shields.io/badge/database-Neo4J-blue)](https://neo4j.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Convert articles into interactive Neo4J knowledge graph visualizations. Transform unstructured text into structured, queryable knowledge graphs.

![Article2Neo4J Preview](assets/preview.png)

## 🌟 Features

- **Article to Graph**: Convert long-form articles into structured knowledge graphs
- **Interactive Visualization**: Explore complex relationships through an interactive graph interface
- **Multiple Views**: Pre-configured views for different perspectives on the data
- **Real-time Data**: Visualize directly from Neo4J or use static JSON exports
- **Detailed Information**: Hover over nodes and edges to see properties and relationships
- **Responsive Design**: Works seamlessly on desktop and mobile devices
- **Export Ready**: Generate Cypher scripts for Neo4J import

## 🚀 Live Demo

**👉 [View Live Demo](https://dkt2025.github.io/Article2Neo4J/)**

Demo dataset: HYBE Ownership Structure (K-pop industry case study)

## 📖 What is Article2Neo4J?

Article2Neo4J is a tool and methodology for converting articles into Neo4J knowledge graphs. It helps you:

1. **Extract entities** from articles (people, organizations, events, etc.)
2. **Identify relationships** between entities
3. **Structure data** into a graph database schema
4. **Visualize connections** interactively
5. **Query insights** using graph algorithms

### Use Cases

- 📰 **Journalism**: Map out corporate ownership structures, political relationships
- 🔬 **Research**: Extract knowledge from academic papers
- 💼 **Business Intelligence**: Analyze competitive landscapes and market relationships
- 📚 **Education**: Create interactive learning materials from textbooks
- 🎯 **Due Diligence**: Map organizational structures and stakeholder relationships

## 🎯 Demo: HYBE Ownership Structure

The current demo showcases a knowledge graph created from a Music Business Worldwide article about K-pop giant HYBE's ownership structure.

### Data Included

- **41.65 million** HYBE shares tracked
- **20+ organizations** including HYBE and all subsidiaries
- **17 individuals** including executives and BTS members
- **4 musical groups** (BTS, NewJeans, ENHYPEN, ILLIT)
- **100+ relationships** mapping ownership, management, and corporate structure

### Data Coverage

- Ownership stakes from 0.0003% to 31.57%
- Market capitalization: $5.37 billion (as of Sept 9, 2024)
- Financial data in USD and KRW
- Historical events from 2000-2024

## 🛠️ How to Use Article2Neo4J

### Method 1: Convert Your Own Article

1. **Prepare your article** in text format
2. **Identify entities**:
   - People (executives, founders, members)
   - Organizations (companies, subsidiaries)
   - Groups (teams, bands, divisions)
   - Events (acquisitions, launches, IPOs)
   - Concepts (business models, strategies)

3. **Map relationships**:
   - Ownership (OWNS_SHARES_IN)
   - Hierarchy (SUBSIDIARY_OF, CEO_OF)
   - Membership (MEMBER_OF)
   - Actions (FOUNDED, ACQUIRED_BY)

4. **Create Cypher scripts** using the templates in `/cypher-scripts`
5. **Import to Neo4J** and visualize

### Method 2: Use the Demo Dataset

1. **Clone this repository**
   ```bash
   git clone https://github.com/dkt2025/Article2Neo4J.git
   cd Article2Neo4J
   ```

2. **Set up Neo4J Aura**
   - Sign up at [Neo4J Aura](https://neo4j.com/cloud/aura-free/) (free tier)
   - Create a new database instance
   - Save your connection credentials

3. **Import the data**
   - Open your Neo4J Aura Query console
   - Run the Cypher scripts in order from `/cypher-scripts`:
     ```
     01_create_constraints.cypher
     02_create_organizations.cypher
     03_create_persons.cypher
     04_create_groups_products_events.cypher
     05_create_ownership_relationships.cypher
     06_create_corporate_relationships.cypher
     07_create_artist_relationships.cypher
     08_create_event_topic_relationships.cypher
     ```

4. **View the visualization**
   - Open `index.html` in your browser, or
   - Visit the [live demo](https://dkt2025.github.io/Article2Neo4J/)
   - Explore the interactive graph

## 📁 Repository Structure

```
Article2Neo4J/
├── index.html              # Main visualization page
├── styles.css              # Styling
├── app.js                  # Visualization logic
├── graph-data.js           # Graph data (JSON format)
├── README.md               # This file
├── LICENSE                 # MIT License
├── cypher-scripts/         # Neo4J import scripts
│   ├── 01_create_constraints.cypher
│   ├── 02_create_organizations.cypher
│   ├── 03_create_persons.cypher
│   ├── 04_create_groups_products_events.cypher
│   ├── 05_create_ownership_relationships.cypher
│   ├── 06_create_corporate_relationships.cypher
│   ├── 07_create_artist_relationships.cypher
│   ├── 08_create_event_topic_relationships.cypher
│   └── 09_useful_queries.cypher
├── data/                   # Raw data files
│   └── hybe_ownership_knowledge_graph.csv
├── docs/                   # Documentation
│   ├── INSTALLATION.md
│   ├── QUERIES.md
│   └── SCHEMA.md
└── assets/                 # Images and media
    └── preview.png
```

## 🎨 Graph Schema

### Node Types
- **Organization**: Companies and business entities
- **Person**: Individuals (executives, artists, founders)
- **Group**: Musical groups, teams, or collectives
- **Product**: Products and services
- **Event**: Significant events (IPOs, acquisitions, launches)
- **Concept**: Business concepts and strategies
- **Topic**: Themes and issues

### Relationship Types
- `OWNS_SHARES_IN`: Ownership stakes with shares, percentage, and value
- `SUBSIDIARY_OF`: Corporate hierarchy
- `MEMBER_OF`: Group membership
- `MANAGED_BY`: Artist-label or team-organization relationships
- `CEO_OF` / `PRESIDENT_OF` / `CHAIRMAN_OF`: Leadership roles
- `FOUNDED`: Founder relationships
- `ACQUIRED_BY`: Acquisition events
- `PARTNERSHIP_WITH`: Business partnerships
- `INVESTED_IN`: Investment relationships
- `RELATED_TO`: Family or personal relationships
- And 15+ more relationship types...

## 💡 Usage Examples

### View All Shareholders
```cypher
MATCH (owner)-[r:OWNS_SHARES_IN]->(company:Organization {name: 'HYBE'})
RETURN owner, r, company
ORDER BY r.percentage DESC
```

### Explore Network Connections
```cypher
MATCH (member:Person)-[:MEMBER_OF]->(group:Group {name: 'BTS'})
MATCH (member)-[owns:OWNS_SHARES_IN]->(company:Organization)
RETURN member, group, owns, company
```

### Find Corporate Structure
```cypher
MATCH (sub)-[r:SUBSIDIARY_OF]->(parent:Organization {name: 'HYBE'})
RETURN sub, r, parent
```

See `/cypher-scripts/09_useful_queries.cypher` for 20+ pre-written queries.

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Add new article conversions**: Submit your own article-to-graph conversions
2. **Improve documentation**: Help others understand the process
3. **Enhance visualization**: Improve the UI/UX
4. **Report issues**: Found a bug? Let us know!

### Contribution Process

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📊 Technical Stack

- **Database**: Neo4J (graph database)
- **Visualization**: Vis.js (network visualization)
- **Frontend**: Vanilla JavaScript, HTML5, CSS3
- **Hosting**: GitHub Pages (static site)
- **Data Format**: JSON (exported from Neo4J)

## 📄 Demo Data Source

The demo knowledge graph is based on the article:

**"Who owns K-pop giant HYBE?"**  
By Daniel Tencer  
Music Business Worldwide  
Published: September 10, 2024  
[Read the article](https://www.musicbusinessworldwide.com/who-owns-k-pop-giant-hybe/)

## 📝 Citation

If you use Article2Neo4J in your research or project, please cite:

```bibtex
@misc{article2neo4j-2024,
  author = {dkt2025},
  title = {Article2Neo4J: Converting Articles to Interactive Knowledge Graphs},
  year = {2024},
  publisher = {GitHub},
  url = {https://github.com/dkt2025/Article2Neo4J}
}
```

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Demo data source: [Music Business Worldwide](https://www.musicbusinessworldwide.com/)
- Built with [Neo4J](https://neo4j.com/)
- Visualization powered by [Vis.js](https://visjs.org/)
- Inspired by the need to make complex relationships more accessible

## 📧 Contact

Created by [@dkt2025](https://github.com/dkt2025)

- **GitHub**: [github.com/dkt2025](https://github.com/dkt2025)
- **Issues**: [Report an issue](https://github.com/dkt2025/Article2Neo4J/issues)
- **Discussions**: [Start a discussion](https://github.com/dkt2025/Article2Neo4J/discussions)

## 🗺️ Roadmap

- [ ] AI-powered entity extraction from articles
- [ ] Automatic relationship detection
- [ ] Support for multiple article sources
- [ ] GraphRAG integration for enhanced querying
- [ ] Export to other graph formats (GraphML, GML)
- [ ] API for programmatic access
- [ ] More demo datasets from various domains

---

**⭐ Star this repo if you find it useful!**

**🔗 Share with others who might benefit from graph-based knowledge representation**

**💬 Have questions? [Open an issue](https://github.com/dkt2025/Article2Neo4J/issues) or [start a discussion](https://github.com/dkt2025/Article2Neo4J/discussions)**