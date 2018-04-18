__global__ 
void kernel2D( uchar4 *d_output, int w, int h, ... ) { 
// Compute column and row indices. 
int c = blockIdx.x* blockDim.x + threadIdx.x; 
int r = blockIdx.y* blockDim.y + threadIdx.y; 
int i = r * w + c; // 1D flat index 
// Check if within image bounds. 
 if (( r > = h) | | (c > = w)) { 
 return; 
 } 
d_output[ i].x = RED_FORMULA; // Compute red 
d_output[ i]. y = GREEN_ FORMULA; // Compute green 
d_output[ i]. z = BLUE_ FORMULA; // Compute blue 
d_output[ i]. w = 255; // Fully opaque 
}
