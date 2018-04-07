NVCC = /usr/local/cuda/bin/nvcc
NVCC_FLAGS = -g -G -Xcompiler -Wall

cudacopy.exe: cudacopy.cu
	$(NVCC) $(NVCC_FLAGS) $< -o $@

clean:	
	rm -f *.o *.exe	