#include <stdio.h>

int main(void)
{
  int N;
  int *a, *b, *c;
  N = 10;		
  a = (int*)malloc(N*sizeof(int));
  b = (int*)malloc(N*sizeof(int));
  
  cudaMalloc(&c, N*sizeof(int));
  
  
  for (int i = 0; i < N; i++){
    a[i] = i;
  }
  
  cudaMemcpy(c, a, N*sizeof(int), cudaMemcpyHostToDevice);
  cudaMemcpy(b, c, N*sizeof(int), cudaMemcpyDeviceToHost);
  
  for (int i = 0; i < N; i++){
    printf("%d ,", a[i]);
  }
  
  for (int i = 0; i < N; i++){
    printf("%d ,", b[i]);
  }
}
