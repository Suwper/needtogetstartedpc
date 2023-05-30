#!/bin/bash
#set -e
##################################################################################################################
# Written to be used on 64 bits computers
# Author  :   DarkXero
# Website   :   http://xerolinux.xyz
##################################################################################################################
tput setaf 2
echo "###############################################################################"
echo "#               XeroLinux nVidia (Proprietary) Driver Installer               #"
echo "###############################################################################"
tput sgr0
echo
echo "Hello $USER, Please Select An Option Below.."
echo
echo "1.  Check Which nVidia GPU You Have."
echo
echo "###### TKG Drivers (Recommended/Game Optimized) #######"
echo
echo "2. TKG R530.x Drivers (New Features Branch)."
echo "3. TKG R525.x Drivers (Production Branch)."
echo "4. TKG R470.x Drivers (Legacy Branch)."
echo
echo "############ Vanilla Drivers (For Purists) ############"
echo
echo "5. Latest Vanilla Drivers (New Features Branch)."
echo
echo "6. Cleanup TKG &/or Vanilla Drivers. (Start Fresh)"
echo
echo "Type Your Selection. To Exit, just close Window."
echo

while :; do

read CHOICE

case $CHOICE in

    1 )
      echo
      echo "##########################################"
      echo "          Checking Installed GPU          "
      echo "##########################################"
      echo
      echo "Your system has the following GPU(s)"
      echo
      sleep 3
      lspci -x | grep VGA
      sleep 3
      echo
            glxinfo | grep -E "OpenGL vendor|OpenGL renderer*"
            sleep 6
      echo
      echo "##################################################################"
      echo "                  Opening nVidia Drivers page...                  "
      echo " Check What Version Your GPU Needs Before Installing or Building. "
      echo "##################################################################"
      sleep 6
      xdg-open https://www.nvidia.com/download/index.aspx?lang=en-us &
      sleep 1
      clear && sh /usr/share/xerowelcome/scripts/nVidia_drivers.sh
      echo
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"

      ;;

    2 )
      
      echo
      echo "####################################################"
      echo "              New Feature Branch (NFB)              "
      echo "                                                    "
      echo "  Provide early adopters access to latest features  "
      echo "     before merging to the Production Branches      "
      echo "####################################################"
      sleep 10
      echo
      echo "##########################################"
      echo "   Installing nVidia R530.x GPU Drivers   "
      echo "##########################################"
      sleep 3
      sudo pacman -S --needed nvidia-dkms-tkg nvidia-utils-tkg nvidia-settings-tkg nvidia-egl-wayland-tkg opencl-nvidia-tkg libxnvctrl lib32-libxnvctrl lib32-nvidia-utils-tkg lib32-opencl-nvidia-tkg dxvk-nvapi-mingw vulkan-icd-loader lib32-vulkan-icd-loader dxvk-bin
      sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    3 )
      echo
      echo "####################################################"
      echo "               Production Branch (PB)               "
      echo "                                                    "
      echo "      Provides optimal stability & performance      "
      echo "   Receives sustained bug fix & security updates.   "
      echo "####################################################"
      sleep 10
      echo
      echo "##########################################"
      echo "   Installing nVidia R525.x GPU Drivers   "
      echo "##########################################"
      sleep 3
      sudo pacman -S --needed nvidia-525xx-dkms-tkg nvidia-525xx-utils-tkg nvidia-525xx-settings-tkg nvidia-525xx-egl-wayland-tkg opencl-nvidia-525xx-tkg libxnvctrl-525xx lib32-nvidia-525xx-utils-tkg lib32-opencl-nvidia-525xx-tkg dxvk-nvapi-mingw dxvk-bin
      sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    4 )
      echo
      echo "####################################################"
      echo "                 Legacy Branch (LB)                 "
      echo "                                                    "
      echo "       Provides Support for now Legacy GPUs         "
      echo "    Rarely receives any updates. Use at Own Risk    "
      echo "####################################################"
      sleep 10
      echo
      echo "##########################################"
      echo "   Installing nVidia R470.x GPU Drivers   "
      echo "##########################################"
      sleep 3
      sudo pacman -S --needed nvidia-470xx-dkms-tkg nvidia-470xx-utils-tkg nvidia-470xx-settings-tkg opencl-nvidia-470xx-tkg libxnvctrl-470xx lib32-nvidia-470xx-utils-tkg lib32-opencl-nvidia-470xx-tkg lib32-libxnvctrl-470xx dxvk-nvapi-mingw dxvk-bin
      sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    5 )
      echo
      echo "####################################################"
      echo "            Clean Vanilla Drivers (NFB)             "
      echo "                                                    "
      echo "          Provides Clean Vanilla Drivers            "
      echo "        Limiting you to only 900 Series & Up        "
      echo "####################################################"
      sleep 10
      echo
      echo "##########################################"
      echo "        Installing Vanilla Drivers        "
      echo "##########################################"
      sleep 3
      sudo pacman -S --needed nvidia-dkms nvidia-settings nvidia-utils lib32-nvidia-utils egl-wayland dxvk-nvapi-mingw libxnvctrl dxvk-bin lib32-libxnvctrl vulkan-icd-loader lib32-vulkan-icd-loader
      sleep 3
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    6 )
      echo
      echo "#########################################"
      echo "     Uninstalling all nVidia Drivers     "
      echo "#########################################"
      sleep 3
      # Array of NVIDIA package names
      packages=(
        "nvidia-dkms-tkg"
        "nvidia-utils-tkg"
        "nvidia-settings-tkg"
        "nvidia-egl-wayland-tkg"
        "opencl-nvidia-tkg"
        "libxnvctrl"
        "lib32-libxnvctrl"
        "lib32-nvidia-utils-tkg"
        "lib32-opencl-nvidia-tkg"
        "dxvk-nvapi-mingw"
        "vulkan-icd-loader"
        "lib32-vulkan-icd-loader"
        "lib32-nvidia-libgl"
        "dxvk-bin"
        "nvidia-525xx-dkms-tkg"
        "nvidia-525xx-utils-tkg"
        "nvidia-525xx-settings-tkg"
        "nvidia-525xx-egl-wayland-tkg"
        "opencl-nvidia-525xx-tkg"
        "libxnvctrl-525xx"
        "lib32-nvidia-525xx-utils-tkg"
        "lib32-opencl-nvidia-525xx-tkg"
        "nvidia-470xx-dkms-tkg"
        "nvidia-470xx-utils-tkg"
        "nvidia-470xx-settings-tkg"
        "opencl-nvidia-470xx-tkg"
        "libxnvctrl-470xx"
        "lib32-nvidia-470xx-utils-tkg"
        "lib32-opencl-nvidia-470xx-tkg"
        "lib32-libxnvctrl-470xx"
        "nvidia-dkms"
        "nvidia-settings"
        "nvidia-utils"
        "lib32-nvidia-utils"
        "egl-wayland"
      )
    # Loop through the packages and remove them
    for package in "${packages[@]}"; do
     pacman -Rns "$package" > /dev/null 2>&1
    done
      sleep 3
      echo
      echo "#######################################"
      echo "                 Done !                "
      echo "#######################################"
            exit
      ;;

    * )
      echo "#################################"
      echo "    Choose the correct number    "
      echo "#################################"
      ;;
esac
done
