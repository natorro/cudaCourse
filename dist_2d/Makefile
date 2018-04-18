NVCC = /usr/local/cuda/bin/nvcc
NVCC_FLAGS = -g -G -Xcompiler -Wall

dist_2d.exe: dist_2d.cu
	$(NVCC) $^ -o $@

clean:
	rm -f *.o *.exe *~
