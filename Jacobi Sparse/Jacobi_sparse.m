function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)

%codul a fost luat din timpul orelor de pregatire organizate de Radu STOCHIȚOIU <3
	rows = size(G_rowptr, 2) - 1;
	prev_x = zeros(rows,1);
	err = inf;
	while err > tol
		x = csr_multiplication(G_values, G_colind, G_rowptr, prev_x) + c;
		err = norm(x - prev_x);
		prev_x = x;
 	endwhile
	
endfunction