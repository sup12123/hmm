#!/bin/bash

# run-shellcheck
#
# CIS Debian Hardening
#

#
#This is a testing script. use at your own risk
#

#
# 1.1.1.1 Ensure Mounting of freevxfs filesystems is disabled (Scored)
#

set -e # One error, it's over
set -u # One variable unset, it's over

# shellcheck disable=2034
HARDENING_LEVEL=2
# shellcheck disable=2034
DESCRIPTION="Disable mounting of freevxfs filesystems."

KERNEL_OPTION="CONFIG_VXFS_FS"
MODULE_NAME="freevxfs"

# This function will be called if the script status is on enabled / audit mode
audit() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing or disable this check!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            crit "$MODULE_NAME is enabled!"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will be called if the script status is on enabled mode
apply() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            warn "I cannot fix $MODULE_NAME, recompile your kernel or blacklist module $MODULE_NAME (/etc/modprobe.d/blacklist.conf : +install $MODULE_NAME /bin/true)"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will check config parameters required
check_config() {
    :
}

# Source Root Dir Parameter
if [ -r /etc/default/cis-hardening ]; then
    # shellcheck source=../../debian/default
    . /etc/default/cis-hardening
fi
if [ -z "$CIS_ROOT_DIR" ]; then
    echo "There is no /etc/default/cis-hardening file nor cis-hardening directory in current environment."
    echo "Cannot source CIS_ROOT_DIR variable, aborting."
    exit 128
fi

# Main function, will call the proper functions given the configuration (audit, enabled, disabled)
if [ -r "$CIS_ROOT_DIR"/lib/main.sh ]; then
    # shellcheck source=../../lib/main.sh
    . "$CIS_ROOT_DIR"/lib/main.sh
else
    echo "Cannot find main.sh, have you correctly defined your root directory? Current value is $CIS_ROOT_DIR in /etc/default/cis-hardening"
    exit 128
fi

#
# 1.1.1.2 Esnure mounting of jffs2 filesystems is disabled (Scored)
#

set -e # One error, it's over
set -u # One variable unset, it's over

# shellcheck disable=2034
HARDENING_LEVEL=2
# shellcheck disable=2034
DESCRIPTION="Disable mounting of jffs2 filesystems."

KERNEL_OPTION="CONFIG_JFFS2_FS"
MODULE_NAME="jffs2"

# This function will be called if the script status is on enabled / audit mode
audit() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing or disable this check!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            crit "$MODULE_NAME is enabled!"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will be called if the script status is on enabled mode
apply() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            warn "I cannot fix $MODULE_NAME, recompile your kernel or blacklist module $MODULE_NAME (/etc/modprobe.d/blacklist.conf : +install $MODULE_NAME /bin/true)"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will check config parameters required
check_config() {
    :
}

# Source Root Dir Parameter
if [ -r /etc/default/cis-hardening ]; then
    # shellcheck source=../../debian/default
    . /etc/default/cis-hardening
fi
if [ -z "$CIS_ROOT_DIR" ]; then
    echo "There is no /etc/default/cis-hardening file nor cis-hardening directory in current environment."
    echo "Cannot source CIS_ROOT_DIR variable, aborting."
    exit 128
fi

# Main function, will call the proper functions given the configuration (audit, enabled, disabled)
if [ -r "$CIS_ROOT_DIR"/lib/main.sh ]; then
    # shellcheck source=../../lib/main.sh
    . "$CIS_ROOT_DIR"/lib/main.sh
else
    echo "Cannot find main.sh, have you correctly defined your root directory? Current value is $CIS_ROOT_DIR in /etc/default/cis-hardening"
    exit 128
fi
#
# 1.1.1.3 Ensure mounting of hfs filesystems is disabled (Scored)
#

set -e # One error, it's over
set -u # One variable unset, it's over

# shellcheck disable=2034
HARDENING_LEVEL=2
# shellcheck disable=2034
DESCRIPTION="Disable mounting of hfs filesystems."

KERNEL_OPTION="CONFIG_HFS_FS"
MODULE_NAME="hfs"

# This function will be called if the script status is on enabled / audit mode
audit() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing or disable this check!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            crit "$MODULE_NAME is enabled!"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will be called if the script status is on enabled mode
apply() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            warn "I cannot fix $MODULE_NAME, recompile your kernel or blacklist module $MODULE_NAME (/etc/modprobe.d/blacklist.conf : +install $MODULE_NAME /bin/true)"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will check config parameters required
check_config() {
    :
}

# Source Root Dir Parameter
if [ -r /etc/default/cis-hardening ]; then
    # shellcheck source=../../debian/default
    . /etc/default/cis-hardening
fi
if [ -z "$CIS_ROOT_DIR" ]; then
    echo "There is no /etc/default/cis-hardening file nor cis-hardening directory in current environment."
    echo "Cannot source CIS_ROOT_DIR variable, aborting."
    exit 128
fi

# Main function, will call the proper functions given the configuration (audit, enabled, disabled)
if [ -r "$CIS_ROOT_DIR"/lib/main.sh ]; then
    # shellcheck source=../../lib/main.sh
    . "$CIS_ROOT_DIR"/lib/main.sh
else
    echo "Cannot find main.sh, have you correctly defined your root directory? Current value is $CIS_ROOT_DIR in /etc/default/cis-hardening"
    exit 128
fi

#
# 1.1.1.4 Ensure mounting of hfsplus filesystems is disabled (Scored)
#

set -e # One error, it's over
set -u # One variable unset, it's over

# shellcheck disable=2034
HARDENING_LEVEL=2
# shellcheck disable=2034
DESCRIPTION="Disable mounting of hfsplus filesystems."

KERNEL_OPTION="CONFIG_HFSPLUS_FS"
MODULE_NAME="hfsplus"

# This function will be called if the script status is on enabled / audit mode
audit() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing or disable this check!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            crit "$MODULE_NAME is enabled!"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will be called if the script status is on enabled mode
apply() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            warn "I cannot fix $MODULE_NAME, recompile your kernel or blacklist module $MODULE_NAME (/etc/modprobe.d/blacklist.conf : +install $MODULE_NAME /bin/true)"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will check config parameters required
check_config() {
    :
}

# Source Root Dir Parameter
if [ -r /etc/default/cis-hardening ]; then
    # shellcheck source=../../debian/default
    . /etc/default/cis-hardening
fi
if [ -z "$CIS_ROOT_DIR" ]; then
    echo "There is no /etc/default/cis-hardening file nor cis-hardening directory in current environment."
    echo "Cannot source CIS_ROOT_DIR variable, aborting."
    exit 128
fi

# Main function, will call the proper functions given the configuration (audit, enabled, disabled)
if [ -r "$CIS_ROOT_DIR"/lib/main.sh ]; then
    # shellcheck source=../../lib/main.sh
    . "$CIS_ROOT_DIR"/lib/main.sh
else
    echo "Cannot find main.sh, have you correctly defined your root directory? Current value is $CIS_ROOT_DIR in /etc/default/cis-hardening"
    exit 128
fi

#
# 1.1.1.5 Ensure mounting of squashfs filesystems is disabled (Scored)
#

set -e # One error, it's over
set -u # One variable unset, it's over

# shellcheck disable=2034
HARDENING_LEVEL=2
# shellcheck disable=2034
DESCRIPTION="Disable mounting of squashfs filesytems."

KERNEL_OPTION="CONFIG_SQUASHFS"
MODULE_NAME="squashfs"

# This function will be called if the script status is on enabled / audit mode
audit() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing or disable this check!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            crit "$MODULE_NAME is enabled!"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will be called if the script status is on enabled mode
apply() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            warn "I cannot fix $MODULE_NAME, recompile your kernel or blacklist module $MODULE_NAME (/etc/modprobe.d/blacklist.conf : +install $MODULE_NAME /bin/true)"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will check config parameters required
check_config() {
    :
}

# Source Root Dir Parameter
if [ -r /etc/default/cis-hardening ]; then
    # shellcheck source=../../debian/default
    . /etc/default/cis-hardening
fi
if [ -z "$CIS_ROOT_DIR" ]; then
    echo "There is no /etc/default/cis-hardening file nor cis-hardening directory in current environment."
    echo "Cannot source CIS_ROOT_DIR variable, aborting."
    exit 128
fi

# Main function, will call the proper functions given the configuration (audit, enabled, disabled)
if [ -r "$CIS_ROOT_DIR"/lib/main.sh ]; then
    # shellcheck source=../../lib/main.sh
    . "$CIS_ROOT_DIR"/lib/main.sh
else
    echo "Cannot find main.sh, have you correctly defined your root directory? Current value is $CIS_ROOT_DIR in /etc/default/cis-hardening"
    exit 128
fi

#
# 1.1.1.6 Ensure mounting of udf filesystems is disabled (Scored)
#

set -e # One error, it's over
set -u # One variable unset, it's over

# shellcheck disable=2034
HARDENING_LEVEL=2
# shellcheck disable=2034
DESCRIPTION="Disable mounting of udf filesystems."

KERNEL_OPTION="CONFIG_UDF_FS"
MODULE_NAME="udf"

# This function will be called if the script status is on enabled / audit mode
audit() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing or disable this check!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            crit "$MODULE_NAME is enabled!"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will be called if the script status is on enabled mode
apply() {
    if [ "$IS_CONTAINER" -eq 1 ]; then
        # In an unprivileged container, the kernel modules are host dependent, so you should consider enforcing it
        ok "Container detected, consider host enforcing!"
    else
        is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_NAME" "($MODULE_NAME|install)"
        if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
            warn "I cannot fix $MODULE_NAME, recompile your kernel or blacklist module $MODULE_NAME (/etc/modprobe.d/blacklist.conf : +install $MODULE_NAME /bin/true)"
        else
            ok "$MODULE_NAME is disabled"
        fi
    fi
}

# This function will check config parameters required
check_config() {
    :
}

# Source Root Dir Parameter
if [ -r /etc/default/cis-hardening ]; then
    # shellcheck source=../../debian/default
    . /etc/default/cis-hardening
fi
if [ -z "$CIS_ROOT_DIR" ]; then
    echo "There is no /etc/default/cis-hardening file nor cis-hardening directory in current environment."
    echo "Cannot source CIS_ROOT_DIR variable, aborting."
    exit 128
fi

# Main function, will call the proper functions given the configuration (audit, enabled, disabled)
if [ -r "$CIS_ROOT_DIR"/lib/main.sh ]; then
    # shellcheck source=../../lib/main.sh
    . "$CIS_ROOT_DIR"/lib/main.sh
else
    echo "Cannot find main.sh, have you correctly defined your root directory? Current value is $CIS_ROOT_DIR in /etc/default/cis-hardening"
    exit 128
fi


#
# 1.1.1.7 Ensure mounting of FAT filesystems is limited (Not Scored)
#

set -e # One error, it's over
set -u # One variable unset, it's over

# shellcheck disable=2034
HARDENING_LEVEL=5
# shellcheck disable=2034
DESCRIPTION="Limit mounting of FAT filesystems."

# Note: we check /proc/config.gz to be compliant with both monolithic and modular kernels

KERNEL_OPTION="CONFIG_VFAT_FS"
MODULE_FILE="vfat"

# This function will be called if the script status is on enabled / audit mode
audit() {
    # TODO check if uefi enabled if yes check if only boot partition use FAT
    is_kernel_option_enabled "$KERNEL_OPTION" "$MODULE_FILE"
    if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
        crit "$KERNEL_OPTION is enabled!"
    else
        ok "$KERNEL_OPTION is disabled"
    fi
}

# This function will be called if the script status is on enabled mode
apply() {
    is_kernel_option_enabled "$KERNEL_OPTION"
    if [ "$FNRET" = 0 ]; then # 0 means true in bash, so it IS activated
        warn "I cannot fix $KERNEL_OPTION enabled, recompile your kernel please"
    else
        ok "$KERNEL_OPTION is disabled, nothing to do"
    fi
}

# This function will check config parameters required
check_config() {
    :
}

# Source Root Dir Parameter
if [ -r /etc/default/cis-hardening ]; then
    # shellcheck source=../../debian/default
    . /etc/default/cis-hardening
fi
if [ -z "$CIS_ROOT_DIR" ]; then
    echo "There is no /etc/default/cis-hardening file nor cis-hardening directory in current environment."
    echo "Cannot source CIS_ROOT_DIR variable, aborting."
    exit 128
fi

# Main function, will call the proper functions given the configuration (audit, enabled, disabled)
if [ -r "$CIS_ROOT_DIR"/lib/main.sh ]; then
    # shellcheck source=../../lib/main.sh
    . "$CIS_ROOT_DIR"/lib/main.sh
else
    echo "Cannot find main.sh, have you correctly defined your root directory? Current value is $CIS_ROOT_DIR in /etc/default/cis-hardening"
    exit 128
fi


