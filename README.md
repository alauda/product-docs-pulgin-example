# Alauda Product Docs Plugin Example

This repository provides a configuration example for an Alauda product documentation plugin. It demonstrates how to package and deploy product documentation as a plugin in the Alauda Container Platform (ACP).

## Repository Structure

- **Dockerfile**: Builds a simple Alpine-based image. The static site resources for the documentation should be placed in the `/dist` directory of the image.
- **chart/**: Contains the Helm chart for the documentation plugin.
  - **module-plugin.yaml**: Required configuration for ACP cluster plugins. It declares basic information about the plugin. Please update the fields in this file according to your actual plugin details.
  - **templates/**: Contains the deployment resources for the plugin.
    - **image-load-cm.yaml**: The core resource. This configuration declares that the static resources from the `/dist` directory of the documentation image will be copied to the `/docs` directory of the ACP frontend application. The ACP `image-loader` component will use this configuration to perform the copy operation, allowing the ACP frontend to serve the documentation as a static website.
    - **ingress.yaml** and **language-redirect-ingress.yaml**: Configure the ACP platform to route the `/docs` path to the documentation static website.

## Usage

1. Build the documentation image using the provided Dockerfile, ensuring your static site is in `/dist`.
2. Update `module-plugin.yaml` with your plugin's information.
3. Deploy the chart to your ACP cluster to enable documentation hosting.
