# kinoite-fw13-amd

Heavily inspired on [achhabra2's images](https://github.com/achhabra2/fw13-amd-kinoite), this image is a lightweight layer on top of UBlue's Kinoite with a few tweaks for the Framework 13 (AMD 7040 series).

## Features

- Scripts to setup special kernel arguments needed for a smooth experience in the FW13 AMD
  - Including one to setup the display's color profile :)
- `amdgpu_top` and some ROCM stuff from upstream which I haven't tested :)
- `amd_s2idle.py` already installed with dependencies
- A few extras (powertop, tailscale, fish shell, wl-clipboard)

## Installation

> **Warning**  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/catdevnull/kinoite-fw13-amd:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/catdevnull/kinoite-fw13-amd:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```
- Setup recommended kernel arguments and screen color profile:
  ```
  just fw13-amd
  just fw13-amd-colors
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/catdevnull/kinoite-fw13-amd
```
