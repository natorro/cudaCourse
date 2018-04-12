#include "aux_functions.h"
#include <math.h>
#include <stdio.h>

__host__ float scale(int i, int n)
{
  return ((float)i) / (n - 1);
}

__device__ float distance(float x1, float x2)
{
  return sqrt((x2 - x1)*(x2 - x1));
}

__global__ void distanceArray(float *d_out, float *d_in, float ref, int n)
{
  const int i = blockIdx.x * blockDim.x + threadIdx.x;
  d_out[i] = distance(d_in[i], ref);
//  printf("i = %2d: dist from %f to %f is %f.\n", i, ref, d_in[i], d_out[i]);
}
