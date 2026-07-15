#!/bin/bash

set -e

VERSION="1.0.0"
PACKAGE_NAME="ros2gobot_base"

INSTALL_ROOT="/opt/ros2go"
INSTALL_DIR="${INSTALL_ROOT}/software/${PACKAGE_NAME}"

LICENSE_DIR="${INSTALL_ROOT}/license"
MAPS_DIR="${INSTALL_ROOT}/maps"

PROFILE_FILE="/etc/profile.d/${PACKAGE_NAME}.sh"
LD_CONFIG="/etc/ld.so.conf.d/ros2go.conf"


echo "================================================"
echo "             ROS2GO Installer"
echo "             ${PACKAGE_NAME} v${VERSION}"
echo "================================================"
echo


# ------------------------------------------------
# Check root permission
# ------------------------------------------------

if [ "$EUID" -ne 0 ]; then
    echo "[ERROR] Please run installer with sudo"
    echo
    echo "Example:"
    echo "  sudo ./install.sh"
    exit 1
fi


# ------------------------------------------------
# Check Operating System
# ------------------------------------------------

if [ ! -f /etc/os-release ]; then
    echo "[ERROR] Cannot detect operating system"
    exit 1
fi

source /etc/os-release

echo "[INFO] Operating System:"
echo "       $PRETTY_NAME"


if [[ "$ID" != "ubuntu" ]]; then
    echo "[WARNING] This installer is designed for Ubuntu"
fi


# ------------------------------------------------
# Detect ROS 2 Distribution
# ------------------------------------------------

ROS_DISTRO=""

for distro in humble jazzy kilted iron rolling
do
    if [ -f "/opt/ros/${distro}/setup.bash" ]; then
        ROS_DISTRO=${distro}
        break
    fi
done


if [ -z "$ROS_DISTRO" ]; then

    echo
    echo "[ERROR] ROS 2 installation not found."
    echo "Please install ROS 2 before continuing."
    exit 1

fi


echo "[OK] ROS 2 detected:"
echo "     ${ROS_DISTRO}"


# ------------------------------------------------
# Install Package
# ------------------------------------------------

echo
echo "[INFO] Installing ${PACKAGE_NAME}..."


mkdir -p ${INSTALL_ROOT}/software


if [ -d "${INSTALL_DIR}" ]; then

    echo "[INFO] Existing installation detected"
    echo "[INFO] Removing old version..."

    rm -rf ${INSTALL_DIR}

fi


cp -r ${PACKAGE_NAME} ${INSTALL_DIR}


echo "[OK] Package installed:"
echo "     ${INSTALL_DIR}"


# ------------------------------------------------
# Configure Shared Library
# ------------------------------------------------

echo
echo "[INFO] Registering shared libraries..."


echo "${INSTALL_DIR}/lib" > ${LD_CONFIG}


ldconfig


echo "[OK] Library configured"


# ------------------------------------------------
# Create ROS Environment Setup
# ------------------------------------------------

echo
echo "[INFO] Creating ROS environment setup..."


cat > ${PROFILE_FILE} <<EOF
#!/bin/bash

# ROS2GO Environment Setup

# Source ROS 2
source /opt/ros/${ROS_DISTRO}/setup.bash

# Source ros2gobot_base
source ${INSTALL_DIR}/local_setup.bash

EOF


chmod 644 ${PROFILE_FILE}


echo "[OK] Environment configured:"
echo "     ${PROFILE_FILE}"


# ------------------------------------------------
# Create License Directory
# ------------------------------------------------

echo
echo "[INFO] Creating license directory..."


mkdir -p ${LICENSE_DIR}


chmod 755 ${LICENSE_DIR}


echo "[OK] License directory:"
echo "     ${LICENSE_DIR}"


# ------------------------------------------------
# Create Maps Directory
# ------------------------------------------------

echo
echo "[INFO] Creating maps directory..."


mkdir -p ${MAPS_DIR}


chmod 777 ${MAPS_DIR}


echo "[OK] Maps directory:"
echo "     ${MAPS_DIR}"


# ------------------------------------------------
# Finish
# ------------------------------------------------

echo
echo "================================================"
echo " Installation completed successfully!"
echo "================================================"
echo

echo "Installed package:"
echo " ${INSTALL_DIR}"

echo

echo "Created directories:"
echo " ${LICENSE_DIR}"
echo " ${MAPS_DIR}"

echo

echo "Next steps:"
echo
echo "1. Activate your license"
echo "   See README.md section: License Activation"
echo
echo "2. Open a new terminal or run:"
echo
echo "   source ${PROFILE_FILE}"
echo
