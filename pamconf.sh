#!/bin/bash

# Backup original PAM configuration
sudo cp -a /etc/pam.d /etc/pam.d_backup

# Disable password-based authentication for root in SSH
sudo sed -i 's/^PermitRootLogin.*/PermitRootLogin prohibit-password/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Configure password complexity requirements
sudo cp /etc/security/pwquality.conf /etc/security/pwquality.conf.backup
echo "minlen = 12" | sudo tee /etc/security/pwquality.conf
echo "minclass = 3" | sudo tee -a /etc/security/pwquality.conf

# Configure PAM common-auth to enforce strong authentication
sudo sed -i 's/^auth[[:space:]]*\[success=1 default=ignore\].*/auth    requisite           pam_unix.so try_first_pass nullok_secure/' /etc/pam.d/common-auth
sudo sed -i 's/^auth[[:space:]]*\[success=1 default=ignore\].*/auth    requisite           pam_unix.so try_first_pass nullok_secure/' /etc/pam.d/common-account

# Configure PAM common-password to enforce password policies
sudo sed -i 's/^password[[:space:]]*\[success=1 default=ignore\].*/password requisite           pam_pwquality.so retry=3/' /etc/pam.d/common-password
sudo sed -i '/pam_unix.so/s/ nullok_secure//' /etc/pam.d/common-password

# Configure PAM common-session to limit access
sudo sed -i 's/^session[[:space:]]*\[default=1\].*/session [default=1]            pam_permit.so/' /etc/pam.d/common-session

# Configure PAM common-session-noninteractive to limit access
sudo sed -i 's/^session[[:space:]]*\[default=1\].*/session [default=1]            pam_permit.so/' /etc/pam.d/common-session-noninteractive

# Lock accounts after a certain number of failed login attempts
echo "auth required pam_tally2.so deny=5 onerr=fail unlock_time=900" | sudo tee -a /etc/pam.d/common-auth

# Configure PAM for passwordless sudo (optional, consider security implications)
# Add the following line to a sudo-specific file in /etc/pam.d/
# echo "auth sufficient pam_permit.so" | sudo tee -a /etc/pam.d/sudo

# Review other PAM configurations in /etc/pam.d/ and adjust as needed

# Restart services using PAM
sudo systemctl restart sshd

# Display a message indicating that PAM has been configured
echo "PAM has been configured for enhanced security."

# Optionally, reboot the system to apply changes
# sudo reboot
