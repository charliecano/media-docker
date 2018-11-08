#!/usr/bin/env bash
set -euo pipefail

apt_update() {
  info "Updating apt repositories."
  sudo apt-get -y update > /dev/null 2>&1 || err "Error occurred updating apt repositories."

  info "Upgrading packages from apt."
  sudo apt-get -y dist-upgrade > /dev/null 2>&1 || err "Error occurred while updating packages from apt."

  info "Cleaning up remnants of unused packages."
  sudo apt-get -y autoremove > /dev/null 2>&1 || err "Failed to clean up unused packages."
  sudo apt-get -y autoclean > /dev/null 2>&1 || err "Failed to cleanup cache from apt."
}