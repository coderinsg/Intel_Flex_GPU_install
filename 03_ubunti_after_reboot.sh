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
