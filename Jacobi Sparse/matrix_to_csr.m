function [values, colind, rowptr] = matrix_to_csr(A)
	
	rows = size(A,1);
	cols = size(A,2);
	
	rowptr = zeros(1, rows + 1);
	
	for i = 1:1:rows
		for j = 1:1:cols 	

			if( A(i,j) != 0)

				colind(1, end + 1) = j;
				
				values(1, end + 1) =  A(i,j);

				if(rowptr(1,i) == 0)
					rowptr(1,i) = size(colind,2);
				endif

			endif

		endfor

	nz = size(colind,2);
	rowptr(1,end) =  nz + 1;
	endfor
endfunction