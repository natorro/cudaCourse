#include "aux_functions.h"
#include <stdlib.h> // Supports dynamic memory management.
#include <stdio.h> // Supports printing

#define N 6144 // A large array size.
#define TPB 1024

int main()
{
  float *in = (float *)calloc(N, sizeof(float));
  float *d_in, *d_out;
  cudaMalloc(&d_in, N*sizeof(float));
  cudaMalloc(&d_out, N*sizeof(float));
  
  const float ref = 0.5f;

  for (int i = 0; i < N; ++i)
  {
    in[i] = scale(i, N);
  }
  
  cudaMemcpy(d_in, in, N*sizeof(float), cudaMemcpyHostToDevice);
  
  distanceArray<<<N/TPB, TPB>>>(d_out, d_in, ref, N);
  
  cudaMemcpy(in, d_out, N*sizeof(float), cudaMemcpyDeviceToHost);
 for(int i = 0; i < N; i++){
   printf("i = %2d: dist from %f to value is %f.\n", i, ref, in[i]);
 }
 
  // Release the heap memory after we are done using it
  free(in);
  cudaFree(d_in);
  cudaFree(d_out);

  return 0;
}
