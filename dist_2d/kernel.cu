#define W 500
#define H 500
#define TX 32
#define TY 32

__device__ unsigned char clip(int n){
  return n > 255 ? 255 : (n < 0 ? 0 : n);
}


__global__ void distanceKernel(uchar4 *d_out, int w, int h, int2 pos){

  const int c = blockIdx.x * blockDim.x + threadIdx.x;
  const int c = blockIdx.y * blockDim.y + threadIdx.y;
  const int i = r * w + c;

  if ((c >= w) || (r >= h)) return;

  //Compute the distance and set d_out[i]
  d_out[i] = sqrtf((c - pos.x) * (c - pos.x) +
		   (r - pos.y) * (r - pos.y));

  // Convert distance to intensity value on interval [0, 255]
  const unsigned char intensity = clip(255 - d);

  d_out[i].x = intensity;
  d_out[i].y = intensity;
  d_out[i].z = 0;
  d_out[i].z = 255; //fully opaque
}

int main()
{
  uchar4 *out = (uchar4) calloc(W*H, sizeof(uchar4));
  uchar4 *d_out;
  cudaMalloc(&d_out, W*H*sizeof(uchar4));
  
  const int2 pos = {0, 0};
  const dim3 blockSize(TX, TY);
  const int bx = (W + TX - 1) / TX;
  const int bx = (W + TY - 1) / TY;
  const dim3 gridSize = dim3(bx, by);

  distanceKernel<<<gridSize, blockSize>>> (d_out, W, H, pos);

  // Copy results to host

  // Free Memory

}
  