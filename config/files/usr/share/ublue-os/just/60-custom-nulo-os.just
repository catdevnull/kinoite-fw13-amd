# Include some of your custom scripts here!

# Add boot parameters needed for a Framework 13 AMD laptop
fw13-amd:
  #!/usr/bin/env bash
  echo 'Adding Recommended Kernel Parameters for Framework 13 AMD'
  rpm-ostree kargs --append="cpufreq.default_governor=powersave" --append="pcie_aspm.policy=powersupersave" --append="amd_pstate=active"

# Run amd s2idle script for debugging sleep issues
check_sleep:
  #!/usr/bin/env bash
  echo 'Running amd_s2idle.py'
  sudo /usr/bin/python3 /usr/share/ublue-os/scripts/amd_s2idle.py

# Run amd psr script for debugging psr issues
check_psr:
  #!/usr/bin/env bash
  echo 'Running psr.py'
  sudo /usr/bin/python3 /usr/share/ublue-os/scripts/psr.py

# Setup screen color profile
fw13-amd-colors:
  #!/usr/bin/env bash
  device_id=$(colormgr get-devices | grep 'Object Path:' | head -n1 | awk '{ print $3 }')
  profile_id=/org/freedesktop/ColorManager/profiles/icc_61a9306b9acc9420d7cb33e30d9892bb
  colormgr device-add-profile $device_id $profile_id
  colormgr device-make-profile-default $device_id $profile_id