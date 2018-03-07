NVCC = /usr/local/cuda-8.0/bin/nvcc
NVCC_FLAGS = -G -g -Xcompiler -Wall 

first.exe: first.cpp 
	$(NVCC) $(NVCC_FLAGS) $< -o $@

clean:
	rm -rf *~ *.exe 