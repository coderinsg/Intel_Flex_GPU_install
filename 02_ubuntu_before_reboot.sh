# . /etc/os-release
# if [[ ! " jammy " =~ " ${VERSION_CODENAME} " ]]; then
#   echo "Ubuntu version ${VERSION_CODENAME} not supported"
# else
#   wget -qO - https://repositories.intel.com/gpu/intel-graphics.key | \
#     sudo gpg --yes --dearmor --output /usr/share/keyrings/intel-graphics.gpg
#   echo "deb [arch=amd64 signed-by=/usr/share/keyrings/intel-graphics.gpg] https://repositories.intel.com/gpu/ubuntu ${VERSION_CODENAME}/lts/2350 unified" | \
#     sudo tee /etc/apt/sources.list.d/intel-gpu-${VERSION_CODENAME}.list
#   sudo apt update
# fi

sudo apt-get install -y intel-platform-vsec-dkms intel-platform-cse-dkms
sudo apt-get install -y intel-i915-dkms intel-fw-gpu

sudo apt install -y \
  linux-headers-$(uname -r) \
  linux-modules-extra-$(uname -r) \
  flex bison \
  intel-fw-gpu intel-i915-dkms xpu-smi
sudo reboot

sudo apt install -y \
  intel-opencl-icd intel-level-zero-gpu level-zero \
  intel-media-va-driver-non-free libmfx1 libmfxgen1 libvpl2 \
  libigdgmm12 vainfo hwinfo clinfo

sudo apt install -y \
  libigc-dev intel-igc-cm libigdfcl-dev libigfxcmrt-dev level-zero-dev

stat -c "%G" /dev/dri/render*
groups ${USER}

# If the active user is not a member of the same group used by the DRM render nodes (usually ‘render’), add the user to the render node group.
sudo gpasswd -a ${USER} render

# This will be sufficient for shells created after this update. To change the group ID of the current shell:
newgrp render
