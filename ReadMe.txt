#Project Task
1. The code represents the spherical wave, given the focal length, wavelength, aperture, sampling, and generates the Fresnel lens phase distribution;
2. The code realizes Fraunhofer diffraction, Fresnel diffraction, angular spectrum diffraction, and calculates the PSF intensity distribution of the lens at different depths.

#Program structure
"Main_PSF" main program, the code characterizes the spherical wave, generates the Fresnel lens phase distribution, and calls the diffraction function to obtain the PSF;
The "propagation_PSF" function program contains three diffraction algorithms: Fresnel diffraction, angular spectrum diffraction, and Fraunhofer diffraction.

#Program ideas
     The point light source emits a spherical wave, the complex amplitude U0 on the front surface of the Fresnel lens is calculated, and the complex amplitude U1 on the back surface is obtained after passing through the Fresnel lens.
Call the diffraction function to get the PSF intensity distribution at different distances.

#Instructions
Run the main program

#Author
Wei Chen

#Development tools and installation environment
MATLAB R2020a
window10

#time
October 14, 2020 21:03:50
