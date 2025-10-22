// Global variables
let viz;
let config;

// Utility function to hide loading spinner
function hideLoading() {
    const loading = document.getElementById('loading');
    if (loading) {
        loading.style.display = 'none';
    }
}

// Utility function to show loading spinner
function showLoading() {
    const loading = document.getElementById('loading');
    if (loading) {
        loading.style.display = 'flex';
    }
}

// Toggle configuration panel
function toggleConfig() {
    const panel = document.getElementById('config-panel');
    const currentDisplay = window.getComputedStyle(panel).display;
    panel.style.display = currentDisplay === 'none' ? 'block' : 'none';
}

// Update statistics
function updateStats(nodes, relationships) {
    const stats = document.getElementById('stats');
    if (stats) {
        stats.innerHTML = `
            <strong>Graph Statistics:</strong> 
            ${nodes || '?'} nodes | 
            ${relationships || '?'} relationships
        `;
        stats.style.display = 'block';
    }
}

// Connect to Neo4J and initialize visualization
function connectAndVisualize() {
    const uri = document.getElementById('neo4j-uri').value.trim();
    const user = document.getElementById('neo4j-user').value.trim();
    const password = document.getElementById('neo4j-password').value.trim();

    // Validation
    if (!uri || !user || !password) {
        alert('⚠️ Please fill in all connection details');
        return;
    }

    if (!uri.startsWith('bolt://') && !uri.startsWith('neo4j://') && !uri.startsWith('neo4j+s://')) {
        alert('⚠️ URI should start with bolt://, neo4j://, or neo4j+s://');
        return;
    }

    showLoading();

    // NeoVis configuration
    config = {
        containerId: "viz",
        neo4j: {
            serverUrl: uri,
            serverUser: user,
            serverPassword: password
        },
        visConfig: {
            nodes: {
                font: {
                    size: 14,
                    face: 'Arial'
                }
            },
            edges: {
                arrows: {
                    to: { enabled: true, scaleFactor: 0.5 }
                },
                font: {
                    size: 12,
                    align: 'top'
                }
            },
            physics: {
                enabled: true,
                stabilization: {
                    iterations: 200
                },
                barnesHut: {
                    gravitationalConstant: -8000,
                    springConstant: 0.04,
                    springLength: 95
                }
            },
            interaction: {
                hover: true,
                navigationButtons: true,
                keyboard: true
            }
        },
        labels: {
            "Organization": {
                label: "name",
                value: "market_cap_usd",
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    function: {
                        title: (node) => {
                            let title = `<b>${node.properties.name}</b>`;
                            if (node.properties.type) title += `\nType: ${node.properties.type}`;
                            if (node.properties.market_cap_usd) {
                                const cap = (node.properties.market_cap_usd / 1000000000).toFixed(2);
                                title += `\nMarket Cap: $${cap}B`;
                            }
                            if (node.properties.founded) title += `\nFounded: ${node.properties.founded}`;
                            return title;
                        }
                    },
                    static: {
                        color: "#4287f5",
                        shape: "box",
                        size: 25
                    }
                }
            },
            "Person": {
                label: "name",
                value: "shares",
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    function: {
                        title: (node) => {
                            let title = `<b>${node.properties.name}</b>`;
                            if (node.properties.role) title += `\nRole: ${node.properties.role}`;
                            if (node.properties.shares) {
                                title += `\nShares: ${node.properties.shares.toLocaleString()}`;
                            }
                            if (node.properties.ownership_percentage) {
                                title += `\nOwnership: ${node.properties.ownership_percentage}%`;
                            }
                            if (node.properties.value_usd) {
                                const value = (node.properties.value_usd / 1000000).toFixed(2);
                                title += `\nValue: $${value}M`;
                            }
                            return title;
                        }
                    },
                    static: {
                        color: "#f54242",
                        shape: "dot",
                        size: 20
                    }
                }
            },
            "Group": {
                label: "name",
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    function: {
                        title: (node) => {
                            let title = `<b>${node.properties.name}</b>`;
                            if (node.properties.type) title += `\nType: ${node.properties.type}`;
                            if (node.properties.members_count) title += `\nMembers: ${node.properties.members_count}`;
                            return title;
                        }
                    },
                    static: {
                        color: "#f542e0",
                        shape: "star",
                        size: 25
                    }
                }
            },
            "Product": {
                label: "name",
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    static: {
                        color: "#42f5d7",
                        shape: "diamond"
                    }
                }
            },
            "Event": {
                label: "name",
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    static: {
                        color: "#f5d742",
                        shape: "triangle"
                    }
                }
            }
        },
        relationships: {
            "OWNS_SHARES_IN": {
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    function: {
                        title: (edge) => {
                            let title = "OWNS SHARES IN";
                            if (edge.properties.shares) {
                                title += `\nShares: ${edge.properties.shares.toLocaleString()}`;
                            }
                            if (edge.properties.percentage) {
                                title += `\nPercentage: ${edge.properties.percentage}%`;
                            }
                            if (edge.properties.value_usd) {
                                const value = (edge.properties.value_usd / 1000000).toFixed(2);
                                title += `\nValue: $${value}M`;
                            }
                            return title;
                        }
                    },
                    static: {
                        color: "#42f5a1",
                        width: 2
                    }
                }
            },
            "SUBSIDIARY_OF": {
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    function: {
                        title: (edge) => {
                            let title = "SUBSIDIARY OF";
                            if (edge.properties.ownership_percentage) {
                                title += `\nOwnership: ${edge.properties.ownership_percentage}%`;
                            }
                            if (edge.properties.acquisition_year) {
                                title += `\nAcquired: ${edge.properties.acquisition_year}`;
                            }
                            return title;
                        }
                    },
                    static: {
                        color: "#f5a442",
                        width: 2
                    }
                }
            },
            "MEMBER_OF": {
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    static: {
                        color: "#a442f5",
                        width: 1.5
                    }
                }
            },
            "CEO_OF": {
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    static: {
                        color: "#f58442",
                        width: 2
                    }
                }
            },
            "PRESIDENT_OF": {
                [NeoVis.NEOVIS_ADVANCED_CONFIG]: {
                    static: {
                        color: "#f58442",
                        width: 2
                    }
                }
            }
        },
        initialCypher: "MATCH (n)-[r]->(m) RETURN n,r,m LIMIT 50"
    };

    try {
        viz = new NeoVis.default(config);
        
        viz.registerOnEvent("completed", () => {
            hideLoading();
            document.getElementById('controls').style.display = 'block';
            document.getElementById('legend').style.display = 'block';
            document.getElementById('config-panel').style.display = 'none';
            console.log('✅ Visualization loaded successfully');
        });

        viz.registerOnEvent("error", (error) => {
            hideLoading();
            console.error('❌ Visualization error:', error);
            alert('❌ Connection failed. Please check your credentials and try again.\n\nError: ' + error.message);
        });

        viz.render();
        
    } catch (error) {
        hideLoading();
        console.error('❌ Connection error:', error);
        alert('❌ Connection failed: ' + error.message);
    }
}

// View functions
function loadFullGraph() {
    showLoading();
    viz.renderWithCypher("MATCH (n)-[r]->(m) RETURN n,r,m LIMIT 300");
    viz.registerOnEvent("completed", hideLoading);
}

function loadOwnershipView() {
    showLoading();
    viz.renderWithCypher(`
        MATCH (owner)-[r:OWNS_SHARES_IN]->(hybe:Organization {name: 'HYBE'})
        RETURN owner, r, hybe
        ORDER BY r.percentage DESC
    `);
    viz.registerOnEvent("completed", hideLoading);
}

function loadSubsidiaries() {
    showLoading();
    viz.renderWithCypher(`
        MATCH (sub)-[r:SUBSIDIARY_OF]->(hybe:Organization {name: 'HYBE'})
        OPTIONAL MATCH (group:Group)-[:MANAGED_BY]->(sub)
        RETURN sub, r, hybe, group
    `);
    viz.registerOnEvent("completed", hideLoading);
}

function loadBTSNetwork() {
    showLoading();
    viz.renderWithCypher(`
        MATCH path = (member:Person)-[:MEMBER_OF]->(bts:Group {name: 'BTS'})
        OPTIONAL MATCH (member)-[owns:OWNS_SHARES_IN]->(hybe:Organization {name: 'HYBE'})
        OPTIONAL MATCH (bts)-[rel]-(other)
        RETURN path, member, owns, hybe, bts, rel, other
        LIMIT 100
    `);
    viz.registerOnEvent("completed", hideLoading);
}

function loadTopShareholders() {
    showLoading();
    viz.renderWithCypher(`
        MATCH (shareholder)-[r:OWNS_SHARES_IN]->(hybe:Organization {name: 'HYBE'})
        WHERE r.percentage >= 0.5
        RETURN shareholder, r, hybe
        ORDER BY r.percentage DESC
    `);
    viz.registerOnEvent("completed", hideLoading);
}

function loadCorporateStructure() {
    showLoading();
    viz.renderWithCypher(`
        MATCH (hybe:Organization {name: 'HYBE'})
        OPTIONAL MATCH (hybe)<-[sub:SUBSIDIARY_OF]-(subsidiary)
        OPTIONAL MATCH (hybe)<-[own:OWNS_SHARES_IN]-(major_shareholder)
        WHERE own.percentage > 5
        OPTIONAL MATCH (leader)-[lead:CEO_OF|PRESIDENT_OF|CHAIRMAN_OF]->(hybe)
        RETURN hybe, sub, subsidiary, own, major_shareholder, lead, leader
    `);
    viz.registerOnEvent("completed", hideLoading);
}

// Initialize on page load
console.log('🎵 HYBE Knowledge Graph Viewer loaded');
console.log('📊 Created by @dkt2025');
console.log('🔗 GitHub: https://github.com/dkt2025/Article2Neo4J');
