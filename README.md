# AOS Settings
Settings App for the AOS Operating System

## How to build
- Requirements
    - [Flutter SDK](https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.22.2-stable.tar.xz)
    - Flutter Engine Depenencies
    ```
    sudo apt-get update -y && sudo apt-get upgrade -y;
    sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
    git commit
    ```
    - Flutter Linux Embedder Dependencies
    ```
    sudo apt-get install \
      clang cmake git \
      ninja-build pkg-config \
      libgtk-3-dev liblzma-dev \
      libstdc++-12-dev
    ```
- Instructions
    - Clone the repository
    - Navigate to the root directory of the repository
    - Run ``` flutter build linux ``` to build the application
    - Navigate to the ``` {Root Directory of Repository}/build/linux/x64/release/bundle ``` and run the ``` aos-settings ``` executable (Make sure not to delete other folders/files in the ```bundle``` directory and ship only the binary, as these files/folders are crucial for the execution of the applications)
