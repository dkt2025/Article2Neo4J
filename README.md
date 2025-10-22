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

Article2Neo4J is a methodology and demonstration for converting articles into interactive knowledge graph visualizations. This project shows how to leverage AI tools like GitHub Copilot and LLMs to transform unstructured text into structured graph data.

### Project Workflow

1. **Article Extraction**: 
   - Copy article text directly from web pages, or
   - Save article as PDF for better formatting preservation
   - Feed to LLMs (GitHub Copilot, ChatGPT, Claude, etc.)

2. **Entity & Relationship Extraction**:
   - Use LLMs to identify entities (people, organizations, events)
   - Extract relationships between entities
   - Structure data into CSV or JSON format

3. **Graph Creation** (Choose your path):
   - **Path A - Direct Visualization**: LLM generates visualization code directly
   - **Path B - Neo4J Database**: Convert to Cypher scripts → Import to Neo4J → Export to JSON

4. **Interactive Visualization**:
   - Client-side web app using Vis.js
   - Futuristic dark mode UI
   - No backend required (static site)

### This Project's Approach

This demo was created using **both paths**:

- **Original Neo4J Database**: Manually created Cypher scripts from article analysis (`/cypher-scripts`)
- **GitHub Pages Visualization**: Generated with GitHub Copilot from the extracted data
- **Best Practice**: Use LLMs to extract entities/relationships, then choose your preferred graph storage method

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

## 🛠️ How to Create Your Own Article2Neo4J Project

### Step 1: Extract Article Content

**Option A: Direct Text Copy (Recommended for simple articles)**
```
1. Open the article in your browser
2. Select and copy the main text content
3. Paste into a text editor
4. Save as .txt file
```

**Option B: PDF Save (Recommended for complex layouts)**
```
1. Open the article in your browser
2. Print → Save as PDF (preserves formatting, images, tables)
3. Better for articles with complex layouts or data tables
4. LLMs can parse PDFs directly
```

**Recommendation**: Use PDF for articles with tables, charts, or complex formatting. Use plain text for simple narrative articles.

### Step 2: Extract Entities & Relationships with LLMs

**Using GitHub Copilot Chat / ChatGPT / Claude:**

```markdown
Prompt Template:
"Extract all entities and relationships from this article. Format as CSV with these columns:

For entities.csv:
- id (unique identifier)
- name (entity name)
- type (Person, Organization, Group, Product, Event, Concept)
- properties (any additional attributes as JSON)

For relationships.csv:
- source_id (from entity)
- target_id (to entity)
- relationship_type (e.g., OWNS_SHARES_IN, MEMBER_OF, CEO_OF)
- properties (percentage, shares, dates, etc. as JSON)

[Paste article text or attach PDF]"
```

**Expected Output**: CSV files ready for import

**Example LLM Prompts:**
- "Convert this article about [topic] into a knowledge graph with entities and relationships"
- "Extract all people, companies, and ownership percentages from this text and format as CSV"
- "Create a network graph data structure from this article, identifying all entities and their connections"

### Step 3A: Direct Visualization (Fast Path - No Database)

**Using GitHub Copilot / LLM:**

```markdown
Prompt:
"Create an interactive network graph visualization using Vis.js with this data:
[Paste CSV or describe entities/relationships]

Requirements:
- Dark mode with glassmorphism UI
- Color-code by entity type
- Show relationship labels
- Interactive hover tooltips
- Filter buttons for different views
- Responsive design"
```

**GitHub Copilot will generate:**
- `index.html` - Main page structure
- `graph-data.js` - Data in JSON format
- `app.js` - Vis.js visualization logic
- `styles.css` - Dark mode styling

**Deploy**: Push to GitHub Pages or any static host

### Step 3B: Neo4J Database Path (Advanced - Full Graph Database)

**1. Convert CSV to Cypher Scripts**

Use an LLM to convert your CSV files to Cypher:

```markdown
Prompt:
"Convert this CSV data into Neo4J Cypher CREATE statements:

[Paste entities.csv]

Generate:
1. Constraint creation statements for unique IDs
2. Node creation statements with all properties
3. Organize by entity type
4. Use MERGE to avoid duplicates"
```

```markdown
Prompt:
"Convert this relationships CSV into Neo4J Cypher CREATE statements:

[Paste relationships.csv]

Generate:
1. MATCH statements to find nodes
2. CREATE or MERGE relationship statements
3. Include all relationship properties
4. Handle cases where nodes might not exist"
```

**2. Import to Neo4J**

```bash
# Set up Neo4J
1. Create account at neo4j.com/aura (free tier)
2. Create new database instance
3. Open Query console
4. Run generated Cypher scripts in order:
   - Constraints
   - Nodes (by type)
   - Relationships
```

**3. Export to JSON**

```cypher
// Export all nodes and relationships
MATCH (n)-[r]->(m)
RETURN {
  nodes: collect(DISTINCT {
    id: id(n),
    label: n.name,
    group: labels(n)[0],
    properties: properties(n)
  }),
  edges: collect({
    from: id(n),
    to: id(m),
    label: type(r),
    properties: properties(r)
  })
}
```

Or use LLM to generate export script for your schema.

**4. Create Visualization**

Use GitHub Copilot with the exported JSON (same as Step 3A)

### Step 4: Customize & Deploy

**Test Locally:**
```bash
# Simple HTTP server
python -m http.server 8000
# Or
npx serve .
```

**Deploy to GitHub Pages:**
```bash
git add .
git commit -m "Add Article2Neo4J visualization"
git push origin main

# Enable GitHub Pages in repo settings → Pages → Deploy from main branch
```

## 🎯 Which Method Should You Use?

### Use Direct Visualization (Step 3A) when:
- ✅ Quick prototypes and demos
- ✅ Articles with <100 entities
- ✅ No need for complex queries
- ✅ Want to deploy immediately
- ✅ Working solo or small team

### Use Neo4J Database (Step 3B) when:
- ✅ Large datasets (>100 entities)
- ✅ Need graph algorithms (PageRank, community detection)
- ✅ Want to run complex Cypher queries
- ✅ Multiple data sources to combine
- ✅ Collaborative analysis with team
- ✅ Need audit trail and versioning

### Hybrid Approach (Recommended):
1. Start with LLM-extracted CSV
2. Create Cypher scripts for reproducibility
3. Use GitHub Copilot for quick visualization
4. Keep both Neo4J and web versions in sync

## 🤖 LLM Tools Comparison

| Tool | Best For | Pros | Cons |
|------|----------|------|------|
| **GitHub Copilot** | Code generation | IDE integration, context-aware | Requires VS Code, subscription |
| **ChatGPT** | Data extraction | Large context window, web access | Manual copy-paste workflow |
| **Claude** | PDF processing | Excellent with documents | API limits |
| **Gemini** | Multimodal | Can analyze images/charts | Availability varies |

## 📚 Example: This HYBE Demo Project

### Original Process:
1. ✅ Copied article text from Music Business Worldwide
2. ✅ Manually extracted entities and relationships
3. ✅ Created Cypher scripts with LLM (`/cypher-scripts`)
4. ✅ Imported to Neo4J for validation
5. ✅ Used GitHub Copilot to generate web visualization

### Recommended Process (If Starting Today):
1. ✅ Save article as PDF (preserves tables and structure)
2. ✅ Upload to ChatGPT/Claude: "Extract entities and relationships as CSV"
3. ✅ Use GitHub Copilot: "Convert CSV to Cypher scripts"
4. ✅ Import to Neo4J Aura
5. ✅ Use GitHub Copilot: "Create interactive Vis.js visualization"
6. ✅ Deploy to GitHub Pages


## 🛠️ How to Use This Repository

### Method 1: View the Interactive Visualization (No Setup Required)

Simply visit the **[Live Demo](https://dkt2025.github.io/Article2Neo4J/)** to explore the HYBE ownership knowledge graph in an interactive, browser-based visualization.

### Method 2: Use the Pre-built Neo4J Scripts

1. **Clone this repository**
   ```bash
   git clone https://github.com/dkt2025/Article2Neo4J.git
   cd Article2Neo4J
   ```

2. **Set up Neo4J**
   - Option A: [Neo4J Aura](https://neo4j.com/cloud/aura-free/) (cloud, free tier)
   - Option B: [Neo4J Desktop](https://neo4j.com/download/) (local installation)
   - Create a new database instance
   - Save your connection credentials

3. **Import the data**
   - Open your Neo4J Query console (Browser or Desktop)
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

4. **Query and analyze**
   - Use the Neo4J Browser to visualize the graph
   - Run custom Cypher queries
   - Explore with Neo4J Bloom (if available)
   - See `09_useful_queries.cypher` for example queries

### Method 3: Fork and Customize

1. **Fork this repository** on GitHub
2. **Replace the data**:
   - Use LLM to extract entities from your article
   - Update `graph-data.js` with your JSON data
   - Or: Create new Cypher scripts → Import to Neo4J → Export
3. **Customize with GitHub Copilot**:
   - Modify colors, filters, and UI elements
   - Add new node types or relationship types
   - Enhance visualizations
4. **Deploy your version** on GitHub Pages

### Method 4: Learn the Process

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

1. **Study the article source** (link in demo)
2. **Examine the Cypher scripts** to understand entity modeling
3. **Review the visualization code** to see Vis.js implementation
4. **Follow the "How to Create Your Own" guide** above with your own article
5. **Use LLMs to accelerate** extraction and code generation

## 💡 LLM-Powered Best Practices

### For Entity Extraction:
```markdown
✅ Good Prompt:
"Extract entities from this article. For each entity, provide:
- Unique ID, name, type (Person/Organization/etc.)
- All mentioned properties (titles, percentages, values, dates)
Format as CSV with headers: id,name,type,properties_json"

❌ Vague Prompt:
"Find all the companies in this text"
```

### For Relationship Extraction:
```markdown
✅ Good Prompt:
"Extract all relationships from this article. Include:
- Source entity ID and target entity ID
- Relationship type (use verbs like OWNS, MANAGES, MEMBER_OF)
- Properties (percentages, dates, amounts)
Format as CSV: source_id,target_id,type,properties_json"

❌ Vague Prompt:
"Show me how things are connected"
```

### For Cypher Generation:
```markdown
✅ Good Prompt:
"Convert this CSV to Neo4J Cypher CREATE statements:
[paste CSV]
Use MERGE to avoid duplicates. Create constraints for unique IDs.
Group statements by entity type."

❌ Vague Prompt:
"Make this work in Neo4J"
```

### For Visualization Code:
```markdown
✅ Good Prompt:
"Create a Vis.js network graph with this data:
[paste JSON or describe structure]
Requirements:
- Dark blue background (#050814)
- Color-code by type: Person=pink, Organization=blue
- Show relationship types as edge labels
- Add filter buttons for each node type
- Glassmorphism UI panels with backdrop-filter blur"

❌ Vague Prompt:
"Make a graph visualization"
```

## 🎓 Tips for Better Results

1. **Be Specific**: Tell the LLM exact field names and formats you want
2. **Iterate**: Start with a sample, review, then process the full article
3. **Validate**: Check LLM output for hallucinations or missed entities
4. **Provide Context**: Include domain knowledge in your prompts
5. **Use Examples**: Show the LLM 2-3 examples of desired output format
6. **Chain Prompts**: Break complex tasks into steps
   - Step 1: Extract entities
   - Step 2: Extract relationships  
   - Step 3: Generate visualization code

## � Real Example: Extracting This Demo

**If recreating this HYBE demo using modern LLM workflow:**

1. **Article Source**: Music Business Worldwide article (4,200 words)

2. **Prompt 1 - Entity Extraction**:
```
"Extract all entities from this article about HYBE's ownership structure.
Create CSV with: id, name, type (Person/Organization/Group/Product/Event)

Include BTS members, shareholders, subsidiaries, company executives, 
and major events. Capture properties like share counts, percentages, 
market cap, and dates.

[paste article text]"
```

3. **Prompt 2 - Relationship Extraction**:
```
"Now extract all relationships from the same article.
CSV format: source_id, target_id, relationship_type, properties_json

Relationship types: OWNS_SHARES_IN, SUBSIDIARY_OF, MEMBER_OF, 
CEO_OF, CHAIRMAN_OF, FOUNDED, MANAGED_BY

[paste article text]"
```

4. **Prompt 3 - Cypher Conversion**:
```
"Convert these CSVs to Neo4J Cypher scripts:
[paste entities.csv]
[paste relationships.csv]

Split into separate files:
- 01_constraints.cypher (unique IDs)
- 02_organizations.cypher
- 03_persons.cypher
- 04_groups_products.cypher
- 05_relationships.cypher"
```

5. **Prompt 4 - Visualization**:
```
"Create a Vis.js interactive graph visualization with dark mode UI.
Use this JSON data: [paste exported data]

Features needed:
- View filters (Full Graph, Ownership, Subsidiaries, BTS Network)
- Glassmorphism panels with blur effects
- Color scheme: #5b9dff (org), #ff6b9d (person), #ff7ce5 (group)
- White text with stroke for readability
- Legend showing node and relationship types"
```

**Time Investment**:
- Manual (original): ~8-10 hours
- With LLMs: ~2-3 hours
- Accuracy: 90-95% (requires validation)

## 🔄 Workflow Comparison

| Step | Manual Process | LLM-Assisted Process | Time Saved |
|------|---------------|---------------------|------------|
| Read article | 30 min | 5 min (skim) | 83% |
| Extract entities | 2-3 hours | 15 min (prompt + review) | 90% |
| Map relationships | 2-3 hours | 15 min (prompt + review) | 90% |
| Create Cypher | 1-2 hours | 10 min (prompt + validate) | 92% |
| Build visualization | 2-3 hours | 30 min (prompt + tweak) | 80% |
| **Total** | **8-11 hours** | **1.5-2 hours** | **~85%** |

## 📋 Template Prompts Library

Save these prompts for your own article conversions:

### 1. Initial Analysis
```
"Analyze this article and identify:
1. Main entities (people, orgs, events)
2. Key relationships between entities  
3. Measurable data points (numbers, percentages, dates)
4. Best graph structure to represent this information

[paste article]"
```

### 2. CSV Generation
```
"Extract entities from this text into CSV format.

Required columns: id,name,type,properties_json

Types: Person, Organization, Group, Product, Event, Concept, Topic

Make IDs lowercase with underscores. Put all extra info in properties_json.

[paste article]"
```

### 3. Cypher Script Generation
```
"Convert this CSV to Neo4J Cypher MERGE statements:
[paste CSV]

Requirements:
- Create unique constraints first
- Use MERGE to avoid duplicates
- Set all properties
- Add comments for clarity
- Group by entity type"
```

### 4. Visualization Template
```
"Generate complete HTML/JS/CSS for Vis.js network visualization:

Data structure: [describe nodes and edges]

UI Requirements:
- Dark mode (#050814 background)
- Glassmorphism panels (backdrop-filter: blur(20px))
- Filter buttons: [list filter names]
- Node colors: [specify color mapping]
- Interactive tooltips with full property display
- Legend panel
- Responsive mobile layout
- Graph container: 75% of viewport height

Generate separate files: index.html, app.js, styles.css, graph-data.js"
```

## 🎯 Success Metrics

After using LLMs for article conversion:

- ✅ **Entity Detection**: 95%+ accuracy on named entities
- ✅ **Relationship Extraction**: 85-90% accuracy (review complex cases)
- ✅ **Code Generation**: 90%+ functional on first try
- ⚠️ **Hallucinations**: Check ~5-10% of data for fabricated facts
- ⚠️ **Edge Cases**: Manual review needed for ambiguous relationships

**Best Practice**: Always validate LLM output against the source article!

## 🛠️ Old Method Documentation (For Reference)

### Method 2: Use the Pre-built Neo4J Scripts

## 📁 Repository Structure

```
Article2Neo4J/
├── index.html              # Main visualization page (Copilot-generated)
├── styles.css              # Futuristic dark mode UI (Copilot-generated)
├── app.js                  # Vis.js visualization logic (Copilot-generated)
├── graph-data.js           # Graph data in JSON format (exported from Neo4J)
├── README.md               # This file
├── LICENSE                 # MIT License
├── cypher-scripts/         # Neo4J database scripts
│   ├── 01_create_constraints.cypher       # Unique constraints
│   ├── 02_create_organizations.cypher     # Company nodes
│   ├── 03_create_persons.cypher           # Person nodes  
│   ├── 04_create_groups_products_events.cypher  # Other entities
│   ├── 05_create_ownership_relationships.cypher # Ownership edges
│   ├── 06_create_corporate_relationships.cypher # Corporate edges
│   ├── 07_create_artist_relationships.cypher    # Artist edges
│   ├── 08_create_event_topic_relationships.cypher # Event edges
│   └── 09_useful_queries.cypher           # Example queries
├── data/                   # Source data
│   └── hybe_ownership_knowledge_graph.csv
└── assets/                 # Media files
    └── preview.png
```

### File Purposes

| File | Created By | Purpose |
|------|-----------|---------|
| `cypher-scripts/*.cypher` | Manual/LLM-assisted | Neo4J database creation |
| `graph-data.js` | Exported from Neo4J | JSON data for visualization |
| `index.html, app.js, styles.css` | GitHub Copilot | Interactive web interface |
| `data/*.csv` | Manual extraction | Source data from article |

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

1. **Add new article conversions**: Submit your own article-to-graph projects
2. **Share LLM prompts**: Document effective prompts for entity extraction
3. **Improve documentation**: Add tutorials, tips, and best practices
4. **Enhance visualization**: New features, filters, or UI improvements
5. **Report issues**: Found a bug or have suggestions? Let us know!
6. **Template libraries**: Create reusable prompt templates for different article types

### Contribution Areas

- **Article Conversions**: More domains (finance, politics, technology, science)
- **LLM Workflows**: Documented prompt chains and extraction strategies
- **Cypher Templates**: Reusable patterns for common graph structures
- **Visualization Features**: New layouts, animations, or interaction modes
- **Documentation**: Video tutorials, case studies, comparison guides
- **Tool Integration**: Plugins for Neo4J Browser, VS Code extensions

### Contribution Process

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📊 Technical Stack

### Data Extraction & Processing
- **LLMs**: GitHub Copilot, ChatGPT, Claude (entity & relationship extraction)
- **Input Formats**: Plain text, PDF, HTML
- **Output Format**: CSV → JSON or CSV → Cypher → Neo4J → JSON

### Graph Database (Optional)
- **Database**: Neo4J Aura (cloud) or Neo4J Desktop (local)
- **Query Language**: Cypher
- **Data Model**: Property graph (nodes + relationships)
- **Purpose**: Advanced querying, graph algorithms, data persistence

### Web Visualization (Required)
- **Visualization**: Vis.js (network graphs)
- **Frontend**: Vanilla JavaScript, HTML5, CSS3
- **UI Style**: Dark mode, glassmorphism, futuristic
- **Code Generation**: GitHub Copilot
- **Hosting**: GitHub Pages (free static hosting)
- **Data Format**: JSON (nodes and edges arrays)

### Development Workflow

```
Article (Text/PDF)
       ↓
   LLM Extraction (ChatGPT/Copilot)
       ↓
   CSV Data (entities + relationships)
       ↓
    ┌──────┴──────┐
    │             │
Path A          Path B
Direct      →   Neo4J
    │             │
    │         Cypher Scripts
    │             │
    │         Import DB
    │             │
    │         Export JSON
    │             │
    └──────┬──────┘
           ↓
    JSON Data (graph-data.js)
           ↓
    GitHub Copilot Generates
    Vis.js Visualization
           ↓
    GitHub Pages Deployment
```

### Why This Stack?

- ✅ **Free**: GitHub Pages, Neo4J Aura free tier, LLM free tiers
- ✅ **Fast**: LLMs reduce manual work by 85%
- ✅ **Flexible**: Choose Neo4J path for complex analysis or skip it for speed
- ✅ **No Backend**: Static site = easy deployment, no server costs
- ✅ **AI-Powered**: Leverage latest LLMs for extraction and code generation

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

- **Article Source**: [Music Business Worldwide](https://www.musicbusinessworldwide.com/) - HYBE ownership analysis
- **Graph Database**: [Neo4J](https://neo4j.com/) - Graph database platform
- **Visualization**: [Vis.js](https://visjs.org/) - Network visualization library
- **AI Assistance**: [GitHub Copilot](https://github.com/features/copilot) - Code generation
- **LLM Tools**: ChatGPT, Claude, and other LLMs for data extraction
- **Hosting**: [GitHub Pages](https://pages.github.com/) - Free static site hosting

### Key Technologies

- **Neo4J Cypher** for graph database creation and querying
- **GitHub Copilot** for generating visualization code and UI components
- **LLMs (ChatGPT/Claude)** for entity and relationship extraction
- **Vis.js** for client-side network graph rendering
- **Glassmorphism CSS** for modern, futuristic UI design

## 📧 Contact

Created by [@dkt2025](https://github.com/dkt2025)

- **GitHub**: [github.com/dkt2025](https://github.com/dkt2025)
- **Issues**: [Report an issue](https://github.com/dkt2025/Article2Neo4J/issues)
- **Discussions**: [Start a discussion](https://github.com/dkt2025/Article2Neo4J/discussions)

## 🗺️ Roadmap

### In Progress
- [ ] **LLM Prompt Library**: Collection of tested prompts for various article types
- [ ] **Video Tutorials**: Step-by-step guides for complete workflow
- [ ] **Automatic Validation**: Check LLM output against source article

### Planned Features
- [ ] **Multi-Article Support**: Combine knowledge from multiple sources
- [ ] **GraphRAG Integration**: Use graph structure for RAG queries
- [ ] **LLM Comparison Tool**: Test different LLMs for extraction accuracy
- [ ] **Cypher Generator Tool**: Web UI for CSV-to-Cypher conversion
- [ ] **Template Gallery**: Pre-built templates for different domains
- [ ] **Export Formats**: GraphML, GML, Gephi, Cytoscape

### Future Exploration
- [ ] **Real-time Scraping**: Direct article URL → Graph generation
- [ ] **API Integration**: Programmatic access to conversion pipeline
- [ ] **Collaborative Editing**: Multiple users refining extractions
- [ ] **Version Control**: Track graph changes over time
- [ ] **Community Datasets**: Share and remix article conversions

### Recent Updates (October 2025)

- ✅ **LLM-Powered Workflow**: Complete guide for using LLMs in extraction
- ✅ **Prompt Templates**: Ready-to-use prompts for different stages
- ✅ **Dual Path Documentation**: Both direct and Neo4J approaches
- ✅ **PDF vs Text Guide**: Recommendations for article extraction
- ✅ **Time Comparison**: Manual vs LLM-assisted workflows
- ✅ **Futuristic UI**: Dark mode with glassmorphism effects
- ✅ **High Contrast**: Optimized visibility for all node types
- ✅ **Mobile Responsive**: Graph-first layout on all devices

---

**⭐ Star this repo if you find it useful!**

**🔗 Share with others who might benefit from graph-based knowledge representation**

**💬 Have questions? [Open an issue](https://github.com/dkt2025/Article2Neo4J/issues) or [start a discussion](https://github.com/dkt2025/Article2Neo4J/discussions)**