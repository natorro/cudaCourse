#ifndef AUX_FUNCTIONS_H
#define AUX_FUNCTIONS_H

// Function to scale input on interval [0,1]
__host__ float scale(int i, int n);
// Compute the distance between 2 points on a line.
__device__ float distance(float x1, float x2);
// Compute scaled distance for an array of input values.
__global__ void distanceArray(float *out, float *in, float ref, int n);

#endif
