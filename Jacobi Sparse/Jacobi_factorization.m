function [G_J, c_J] = Jacobi_factorization(A, b)

%codul a fost luat din timpul orelor de pregatire organizate de Radu STOCHIȚOIU <3
	N = diag(diag(A));
	P = N - A;
	G_J = inv(N)*P;
	c_J = inv(N)*b;
endfunction

