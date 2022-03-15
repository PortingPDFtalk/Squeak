#!/bin/bash
set -e

[[ -z "${SMALLTALK_CI_HOME}" ]] && exit 2
[[ -z "${CONFIG_SMALLTALK}" ]] && exit 3
[[ -z "${SMALLTALK_CI_CACHE}" ]] && exit 4
[[ -z "${SMALLTALK_CI_VMS}" ]] && exit 5

source "${SMALLTALK_CI_HOME}/helpers.sh" # download_file extract_file ...
source "${SMALLTALK_CI_HOME}/squeak/run.sh" # get_vm_details

config_smalltalk="${CONFIG_SMALLTALK}"
config_vm_dir="${SMALLTALK_CI_VMS}/${config_smalltalk}"
require_spur=1

vm_details=$(squeak::get_vm_details \
	"${config_smalltalk}" "$(uname -s)" "${require_spur}")
set_vars vm_filename vm_path git_tag "${vm_details}"

LATEST_BUILD="https://github.com/OpenSmalltalk/opensmalltalk-vm/releases/download/latest-build"
is_dir "${SMALLTALK_CI_CACHE}" || mkdir "${SMALLTALK_CI_CACHE}"

case $RUNNER_OS in
	"Windows")
		download_url="${LATEST_BUILD}/squeak.cog.spur_win64x64.zip"
		target="${SMALLTALK_CI_CACHE}/vm.zip"
		;;
	"Linux")
		download_url="${LATEST_BUILD}/squeak.cog.spur_linux64x64.tar.gz"
		target="${SMALLTALK_CI_CACHE}/vm.tar.gz"
		;;
	"macOS")
		# download_url="https://github.com/hpi-swa/smalltalkCI/releases/download/v2.9.6/squeak.cog.v3_macos32x86_202101260417.dmg"
		download_url="${LATEST_BUILD}/squeak.cog.spur_macos64x64.dmg"
		target="${SMALLTALK_CI_CACHE}/vm.dmg"
		;;
esac

download_file "${download_url}" "${target}"

is_dir "${config_vm_dir}" || mkdir -p "${config_vm_dir}"
extract_file "${target}" "${config_vm_dir}"

chmod +x "${vm_path}"
if is_cygwin_build || is_mingw64_build; then
	chmod +x "$(dirname ${vm_path})/"*.dll
fi

echo "VM_FILEPATH=${vm_path}" >> $GITHUB_ENV


# Use custom image to speed up the tests
LATEST_IMAGE="http://files.squeak.org/trunk/Squeak6.0alpha-21461-64bit/Squeak6.0alpha-21461-64bit.zip"

download_file "${LATEST_IMAGE}" "${SMALLTALK_CI_CACHE}/image.zip"
extract_file "${SMALLTALK_CI_CACHE}/image.zip" "${SMALLTALK_CI_BUILD}"
cp "${SMALLTALK_CI_BUILD}/*.image" "${SMALLTALK_CI_BUILD}/latest.image"
cp "${SMALLTALK_CI_BUILD}/*.changes" "${SMALLTALK_CI_BUILD}/latest.changes"

echo "IMAGE_FILEPATH=${SMALLTALK_CI_BUILD}/latest.image" >> $GITHUB_ENV
