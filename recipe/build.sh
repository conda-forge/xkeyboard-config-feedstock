#!/bin/bash
set -ex

meson setup builddir --prefix="${PREFIX}"

cd builddir
meson compile
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
  meson test
fi
meson install
