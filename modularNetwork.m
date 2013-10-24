function network = modularNetwork(nodes, communities, edges, pRewiring)
	% Generates a Modular network with given number of nodes, edges, communities.
	% pRewiring is the probability that a given node will be rewired
	% Returns adjacency matrix

	network = zeros(nodes, nodes);

	%TODO: Check that number of edges < possible edges (2 * nodes * nodes)

	for community = 1:communities

		communityNodes = communitySplit(nodes, communities, community);

		% number of edges for current community
		communityEdges = size(communitySplit(edges, communities, community),2);
		% sample random edges for current community

		allPairs(communityNodes)
		communityEdges

		randomEdges = datasample(allPairs(communityNodes),communityEdges, 'Replace', false);

		% add edges to adjacency matrix

		for e = 1:size(randomEdges,1)
			network(randomEdges(e,1),randomEdges(e,2)) = 1;
		end
	end

	gplot(network,[3,9;8,9;6,4;4,7;10,8;5,2;2,6;8,6;4,4;1,8],'-*')

end