![](img/opencl.png) ![](img/cuda.png) ![](img/shaders.png)

# Description

This layer adds support for GPU related languages like CUDA, OpenCL and
various Shader formats to Spacemacs.

## Features:

-   Syntax highlighting for
    -   `.cl` (OpenCL)
    -   `.cu` (CUDA)
    -   `.cuh` (CUDA)
    -   `.fsh` (Shaders)
    -   `.vsh` (Shaders)
    -   `.glsl` (Shaders)
    -   `.vert` (Shaders)
    -   `.frag` (Shaders)
    -   `.comp` (Shaders)
    -   `.geom` (Shaders)
    -   `.tesc` (Shaders)
    -   `.tese` (Shaders)
-   Simple auto-completion via
    [company-glsl](https://github.com/Kaali/company-glsl) for
    -   `.vert` (Shaders)
    -   `.geom` (Shaders)
    -   `.tesc` (Shaders)
    -   `.tese` (Shaders)
    -   `.frag` (Shaders)
    -   `.comp` (Shaders)

# Install

To use this configuration layer, add it to your `~.spacemacs`. You will
need to add `gpu` to the existing `dotspacemacs-configuration-layers`
list in this file.

For auto-completion you will also need to install
[`glslangValidator`](https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/).
