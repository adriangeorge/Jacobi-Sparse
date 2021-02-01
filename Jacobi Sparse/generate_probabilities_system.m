function [A, b] = generate_probabilities_system(rows)
  
	nodes = rows * (rows + 1) * 0.5;
  
	A = zeros(nodes, nodes);
	b = zeros(nodes,1);

	for level = 1:1:rows
		%printf(" On level %d we have nodes : ", level);
		for pos = 1:1:level
			
			%calculating value of current node
			node = pos + level * (level - 1) * 0.5;
			
			if((level == 1) || ((level == rows) && (pos == 1 || pos == level)))
				A(node, node) = 4;
			elseif ( pos == 1 || pos == level)
				A(node, node) = 5;
			elseif ( level == rows && pos > 1 && pos < level)
				A(node, node) = 5;
			else
				A(node, node) = 6;
			endif
			
			%"linking" nodes only if the nodes they link to exist
			
			%linking upper left node
			if(pos > 1)
				A(node - level , node ) = -1;
				A(node , node - level ) = -1;
			endif
			
			%linking upper right node
			if(pos < level)
				A(node - level + 1 , node) = -1;
				A(node, node - level + 1 ) = -1;
			endif
			
			%linking left node
			if(pos > 1)
				A(node - 1, node) = -1;
				A(node , node - 1) = -1;
			endif
			
			%linking right node
			if(pos < level)
				A(node + 1, node) = -1;
				A(node , node + 1) = -1;
			endif
			
			if(level == rows)
				b(node,1) = 1;
			endif
			
		endfor
		

	endfor
	
	
endfunction