# Intel Flex GPU install
Scripts for installing GPU drivers for Intel Flex GPU on Ubuntu

# About
Source: https://dgpu-docs.intel.com/driver/installation.html#ubuntu-install-steps

Tested on:
```
$ more /etc/os-release
PRETTY_NAME="Ubuntu 22.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.4 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

# How to use the scripts
1. Execute the script in order.
2. First, login to the terminal via SSH. Then paste and execute the content of `01_ubuntu_set_repo.txt`
3. Execute the script, `02_ubuntu_before_reboot`. After completion, it will reboot.
4. After reboot, continue the setup by executing `03_ubunti_after_reboot`.
5. When it is completed, run `xpu-smi discovery` to check if the GPUs were discovered.

    you should see cards such as `Intel Flex140 GPU`.

   `xpu-smi discovery -d0` can be used for specific card. 
