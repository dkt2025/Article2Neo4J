// Article2Neo4J - Interactive Knowledge Graph Visualization
// Demo: HYBE Ownership Structure
// Using Vis.js for client-side rendering
// Created by @dkt2025

let network;
let allNodes;
let allEdges;
let originalData;

// Color scheme
const colors = {
    Organization: '#4287f5',
    Person: '#f54242',
    Group: '#f542e0',
    Product: '#42f5d7',
    Event: '#f5d742',
    Concept: '#a442f5',
    Topic: '#f5a442'
};

const edgeColors = {
    OWNS_SHARES_IN: '#42f5a1',
    SUBSIDIARY_OF: '#f5a442',
    MEMBER_OF: '#a442f5',
    FOUNDED: '#4287f5',
    CEO_OF: '#f58442',
    PRESIDENT_OF: '#f58442',
    CHAIRMAN_OF: '#f58442',
    MANAGED_BY: '#f542e0',
    PROPELLED: '#42f5d7',
    RELATED_TO: '#718096',
    default: '#718096'
};

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    initializeGraph();
});

function initializeGraph() {
    // Prepare nodes
    allNodes = graphData.nodes.map(node => ({
        id: node.id,
        label: node.label,
        group: node.group,
        title: formatNodeTooltip(node),
        color: colors[node.group] || '#999',
        shape: getNodeShape(node.group),
        size: getNodeSize(node),
        font: { color: '#333', size: 14 },
        ...node.properties
    }));

    // Prepare edges
    allEdges = graphData.edges.map(edge => ({
        from: edge.from,
        to: edge.to,
        label: edge.label,
        title: formatEdgeTooltip(edge),
        color: { color: edgeColors[edge.label] || edgeColors.default },
        arrows: 'to',
        font: { size: 10, align: 'middle' },
        width: getEdgeWidth(edge),
        ...edge.properties
    }));

    originalData = {
        nodes: new vis.DataSet(allNodes),
        edges: new vis.DataSet(allEdges)
    };

    // Network options
    const options = {
        nodes: {
            borderWidth: 2,
            borderWidthSelected: 3,
            font: {
                size: 14,
                face: 'Arial'
            }
        },
        edges: {
            width: 2,
            selectionWidth: 3,
            smooth: {
                type: 'continuous',
                roundness: 0.5
            }
        },
        physics: {
            enabled: true,
            stabilization: {
                iterations: 200
            },
            barnesHut: {
                gravitationalConstant: -10000,
                centralGravity: 0.3,
                springLength: 150,
                springConstant: 0.04,
                damping: 0.09
            }
        },
        interaction: {
            hover: true,
            navigationButtons: true,
            keyboard: true,
            tooltipDelay: 100
        },
        layout: {
            improvedLayout: true,
            hierarchical: false
        }
    };

    // Create network
    const container = document.getElementById('network');
    network = new vis.Network(container, originalData, options);

    // Event listeners
    network.on('click', function(params) {
        if (params.nodes.length > 0) {
            showNodeInfo(params.nodes[0]);
        }
    });

    network.on('stabilizationIterationsDone', function() {
        hideLoading();
        updateStats();
    });

    network.on('stabilized', function() {
        hideLoading();
    });

    // Hide loading after initial render
    setTimeout(hideLoading, 2000);
}

function getNodeShape(group) {
    const shapes = {
        Organization: 'box',
        Person: 'dot',
        Group: 'star',
        Product: 'diamond',
        Event: 'triangle',
        Concept: 'hexagon',
        Topic: 'ellipse'
    };
    return shapes[group] || 'dot';
}

function getNodeSize(node) {
    if (node.properties && node.properties.market_cap_usd) {
        return Math.max(30, Math.min(60, node.properties.market_cap_usd / 100000000));
    }
    if (node.properties && node.properties.shares) {
        return Math.max(15, Math.min(40, node.properties.shares / 500000));
    }
    if (node.group === 'Organization') return 30;
    if (node.group === 'Group') return 35;
    return 20;
}

function getEdgeWidth(edge) {
    if (edge.properties && edge.properties.percentage) {
        return Math.max(1, Math.min(5, edge.properties.percentage / 5));
    }
    if (edge.label === 'OWNS_SHARES_IN') return 3;
    if (edge.label === 'SUBSIDIARY_OF') return 2.5;
    return 1.5;
}

function formatNodeTooltip(node) {
    const props = node.properties;
    let tooltip = `<b>${node.label}</b>`;
    
    if (props.type) tooltip += `<br>Type: ${props.type}`;
    if (props.role) tooltip += `<br>Role: ${props.role}`;
    if (props.shares) tooltip += `<br>Shares: ${props.shares.toLocaleString()}`;
    if (props.percentage) tooltip += `<br>Ownership: ${props.percentage}%`;
    if (props.value_usd) {
        const value = (props.value_usd / 1000000).toFixed(2);
        tooltip += `<br>Value: $${value}M`;
    }
    if (props.market_cap_usd) {
        const cap = (props.market_cap_usd / 1000000000).toFixed(2);
        tooltip += `<br>Market Cap: $${cap}B`;
    }
    
    return tooltip;
}

function formatEdgeTooltip(edge) {
    let tooltip = `<b>${edge.label.replace(/_/g, ' ')}</b>`;
    
    if (edge.properties) {
        if (edge.properties.shares) {
            tooltip += `<br>Shares: ${edge.properties.shares.toLocaleString()}`;
        }
        if (edge.properties.percentage) {
            tooltip += `<br>Percentage: ${edge.properties.percentage}%`;
        }
        if (edge.properties.value_usd) {
            const value = (edge.properties.value_usd / 1000000).toFixed(2);
            tooltip += `<br>Value: $${value}M`;
        }
        if (edge.properties.ownership_percentage) {
            tooltip += `<br>Ownership: ${edge.properties.ownership_percentage}%`;
        }
    }
    
    return tooltip;
}

function showNodeInfo(nodeId) {
    const node = allNodes.find(n => n.id === nodeId);
    if (!node) return;
    
    const infoPanel = document.getElementById('node-info');
    const infoContent = document.getElementById('node-info-content');
    
    let html = `<h5>${node.label}</h5>`;
    html += `<p><strong>Type:</strong> ${node.group}</p>`;
    
    Object.keys(node).forEach(key => {
        if (!['id', 'label', 'group', 'title', 'color', 'shape', 'size', 'font', 'x', 'y'].includes(key)) {
            const value = node[key];
            if (value !== null && value !== undefined) {
                html += `<p><strong>${key.replace(/_/g, ' ')}:</strong> ${formatValue(value)}</p>`;
            }
        }
    });
    
    infoContent.innerHTML = html;
    infoPanel.style.display = 'block';
}

function formatValue(value) {
    if (typeof value === 'number') {
        if (value > 1000000) {
            return `$${(value / 1000000).toFixed(2)}M`;
        }
        return value.toLocaleString();
    }
    return value;
}

function updateStats() {
    const statsContent = document.getElementById('stats-content');
    const nodeCount = network.body.data.nodes.length;
    const edgeCount = network.body.data.edges.length;
    
    const nodeTypes = {};
    allNodes.forEach(node => {
        nodeTypes[node.group] = (nodeTypes[node.group] || 0) + 1;
    });
    
    let html = `<p><strong>Total Nodes:</strong> ${nodeCount}</p>`;
    html += `<p><strong>Total Relationships:</strong> ${edgeCount}</p>`;
    html += `<h5>Node Distribution:</h5>`;
    Object.keys(nodeTypes).forEach(type => {
        html += `<p>${type}: ${nodeTypes[type]}</p>`;
    });
    
    statsContent.innerHTML = html;
}

function hideLoading() {
    const loading = document.getElementById('loading');
    if (loading) {
        loading.style.display = 'none';
    }
}

function showLoading() {
    const loading = document.getElementById('loading');
    if (loading) {
        loading.style.display = 'flex';
    }
}

// Filter functions
function loadFullGraph() {
    network.setData(originalData);
    network.fit();
    updateStats();
}

function filterByType(type) {
    showLoading();
    
    let nodesToShow = [];
    let edgesToShow = [];
    
    if (type === 'ownership') {
        // Show HYBE and all direct shareholders
        const hybeNode = allNodes.find(n => n.id === 'ORG001');
        nodesToShow.push(hybeNode);
        
        allEdges.forEach(edge => {
            if (edge.label === 'OWNS_SHARES_IN' && edge.to === 'ORG001') {
                edgesToShow.push(edge);
                const fromNode = allNodes.find(n => n.id === edge.from);
                if (fromNode && !nodesToShow.find(n => n.id === fromNode.id)) {
                    nodesToShow.push(fromNode);
                }
            }
        });
    } else if (type === 'subsidiaries') {
        // Show HYBE and all subsidiaries
        const hybeNode = allNodes.find(n => n.id === 'ORG001');
        nodesToShow.push(hybeNode);
        
        allEdges.forEach(edge => {
            if (edge.label === 'SUBSIDIARY_OF' && edge.to === 'ORG001') {
                edgesToShow.push(edge);
                const fromNode = allNodes.find(n => n.id === edge.from);
                if (fromNode && !nodesToShow.find(n => n.id === fromNode.id)) {
                    nodesToShow.push(fromNode);
                }
            }
        });
        
        // Add artists managed by subsidiaries
        edgesToShow.slice().forEach(edge => {
            const subId = edge.from;
            allEdges.forEach(e => {
                if (e.label === 'MANAGED_BY' && e.to === subId) {
                    edgesToShow.push(e);
                    const artistNode = allNodes.find(n => n.id === e.from);
                    if (artistNode && !nodesToShow.find(n => n.id === artistNode.id)) {
                        nodesToShow.push(artistNode);
                    }
                }
            });
        });
    } else if (type === 'bts') {
        // Show BTS network
        const btsNode = allNodes.find(n => n.id === 'GRP001');
        const hybeNode = allNodes.find(n => n.id === 'ORG001');
        nodesToShow.push(btsNode, hybeNode);
        
        // Add all BTS members
        allEdges.forEach(edge => {
            if (edge.to === 'GRP001' && edge.label === 'MEMBER_OF') {
                edgesToShow.push(edge);
                const memberNode = allNodes.find(n => n.id === edge.from);
                if (memberNode && !nodesToShow.find(n => n.id === memberNode.id)) {
                    nodesToShow.push(memberNode);
                }
                
                // Add member's ownership relationship
                allEdges.forEach(e => {
                    if (e.from === edge.from && e.label === 'OWNS_SHARES_IN') {
                        edgesToShow.push(e);
                    }
                });
            }
        });
        
        // Add BTS propelled relationship
        allEdges.forEach(edge => {
            if (edge.from === 'GRP001' && edge.label === 'PROPELLED') {
                edgesToShow.push(edge);
            }
        });
    } else if (type === 'major-shareholders') {
        // Show shareholders with >5% ownership
        const hybeNode = allNodes.find(n => n.id === 'ORG001');
        nodesToShow.push(hybeNode);
        
        allEdges.forEach(edge => {
            if (edge.label === 'OWNS_SHARES_IN' && edge.to === 'ORG001' && 
                edge.properties && edge.properties.percentage >= 5) {
                edgesToShow.push(edge);
                const fromNode = allNodes.find(n => n.id === edge.from);
                if (fromNode && !nodesToShow.find(n => n.id === fromNode.id)) {
                    nodesToShow.push(fromNode);
                }
            }
        });
    }
    
    network.setData({
        nodes: new vis.DataSet(nodesToShow),
        edges: new vis.DataSet(edgesToShow)
    });
    
    setTimeout(() => {
        network.fit();
        hideLoading();
        updateStats();
    }, 500);
}

function resetView() {
    network.fit();
}

// Initialize
console.log('📊 Article2Neo4J loaded');
console.log('🎵 Demo: HYBE Ownership Structure');
console.log(`📈 ${allNodes ? allNodes.length : 0} nodes, ${allEdges ? allEdges.length : 0} relationships`);
console.log('👤 Created by @dkt2025');
console.log('🔗 GitHub: https://github.com/dkt2025/Article2Neo4J');