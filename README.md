# devcontainer-features

Welcome to `devcontainer-features`, a repository dedicated to the development and testing of new features for development containers (Dev Containers). This repository is designed to streamline the process of developing and testing Dev Container features, both locally and remotely using VSCode and GitHub CodeSpaces.

## About Dev Containers

Dev Containers provide a fully configured development environment that can be used to develop and test applications in a consistent, reproducible manner. This repository contains a Dev Container definition to facilitate development.

## Repository Structure

This repository is structured to support the development of Dev Container features. It includes:

- `.devcontainer/` - **Dev Container Definition**: A definition for setting up a development environment quickly and efficiently.
- `.github/workflows/` - **GitHub Actions**: Automated workflows to test, publish, and maintain the quality of Dev Container features.
- `src/*`, `test/*` - **Feature Directories**: Each Dev Container feature has its own directory containing all necessary files.

## Current Features

- **LaTeX**: A Dev Container feature to build LaTeX projects, integrated with a VSCode extension for enhanced functionality.

## Development and Testing

### Running Dev Containers with VSCode

To run a Dev Container using VSCode:

1. Ensure you have VSCode and the Remote - Containers extension installed.
2. Clone the repository to your local machine.
3. Open the repository folder in VSCode.
4. VSCode may prompt you to reopen the folder in a container. If not, press `F1` and select `Remote-Containers: Open Folder in Container`.

### Running Dev Containers with GitHub CodeSpaces

To use a Dev Container in GitHub CodeSpaces:

1. Navigate to the GitHub repository in your web browser.
2. Click the 'Code' button and select 'Open with CodeSpaces'.
3. If you have existing CodeSpaces, select one, or create a new CodeSpace.
4. GitHub will prepare your Dev Container environment, allowing you to develop and test features directly in your browser.

### Local Development with Dev Container CLI

You can test and develop features locally using the [Dev Container CLI](https://github.com/devcontainers/cli). This allows you to replicate the remote environment on your local machine using VSCode.

### GitHub Actions

Our repository utilizes GitHub Actions for continuous integration and delivery:

- **Test Workflow**: Automatically tests code on every pull request update against the `main` branch.
- **Publish Workflow**: Handles the publishing of Dev Container features.
- **Auto-update Workflow**: Automatically updates README.md files in feature directories.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Getting Started

To get started with `devcontainer-features`, clone the repository and follow the instructions in the README.md files of individual feature directories.

## Support

For support, questions, or more information, please [open an issue](https://github.com/prulloac/devcontainer-features/issues) in this repository.
