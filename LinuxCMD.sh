# Create the file and add all content
cat > Linux.txt << 'EOF'
# LINUX COMMANDS GUIDE
# ===================================


## REMOTE ACCESS COMMANDS
### SSH (Secure Shell)
ssh username@hostname                 # Basic SSH connection
ssh -p 2222(port) username@hostname         # Specific port
ssh -i ~/.ssh/key.pem username@hostname  # With identity file
ssh -X username@hostname              # X11 forwarding
ssh -L 8080:localhost:80 username@hostname  # Local port forwarding
ssh -R 9090:localhost:22 username@hostname  # Remote port forwarding



### SCP (Secure Copy)
scp file.txt username@hostname:/path/        # Copy to remote
scp username@hostname:/path/file.txt ./      # Copy from remote
scp -r dir/ username@hostname:/path/         # Recursive copy
scp -P 2222(port) file.txt username@hostname:/path/ # Specific port


### SFTP
sftp username@hostname                # Connect to SFTP
# SFTP commands: put, get, ls, lls, cd, lcd

### RSYNC
rsync -avz /local/ username@hostname:/remote/  # Sync over SSH
rsync -avz --dry-run /local/ username@hostname:/remote/  # Dry run
rsync -avz --partial /local/ username@hostname:/remote/  # Resume transfers



### SSH Configuration
# ~/.ssh/config example:
Host myserver
    HostName server.example.com
    User username
    Port 2222
    IdentityFile ~/.ssh/key



### SSH Key Management
ssh-keygen -t rsa -b 4096            # Generate RSA key
ssh-keygen -t ed25519                 # Generate ED25519 key
ssh-copy-id username@hostname         # Copy key to remote


## SYSTEM LEVEL COMMANDS

### System Information
uname -a                              # System architecture
lscpu                                 # CPU information
free -h                               # Memory information
lsblk                                 # Disk information
df -h                                 # Disk space
du -sh /path                          # Directory size

### System Monitoring
top                                   # Real-time system monitor
htop                                  # Enhanced top
ps aux                                # Process list
pstree                                # Process tree
vmstat                                # Virtual memory stats
iostat                                # I/O statistics


## USER AND PROCESS MANAGEMENT COMMANDS

### User and Group Management
useradd username                      # Create user
userdel -r username                   # Delete user with home
usermod -aG group username            # Add user to group
passwd username                       # Change password
groupadd groupname                    # Create group
groupdel groupname                    # Delete group

### Process Management
kill PID                              # Kill process
kill -9 PID                           # Force kill
killall process_name                   # Kill by name
pkill processname                     # Kill by pattern
nice -n 10 command                    # Start with low priority
renice 15 -p PID                      # Change priority

### Service Management (Systemd)
systemctl start servicename           # Start service
systemctl stop servicename            # Stop service
systemctl restart servicename         # Restart service
systemctl status servicename          # Service status
systemctl enable servicename          # Enable on boot
journalctl -u servicename             # Service logs


## STORAGE MANAGEMENT COMMANDS

### Disk(Storage) Management
fdisk -l                              # List partitions
mkfs.ext4 /dev/sdb1                   # Create filesystem
mount /dev/sdb1 /mnt                  # Mount filesystem
umount /mnt                           # Unmount
fsck /dev/sdb1                        # Check filesystem

### LVM Management
pvcreate /dev/sdb1                    # Create physical volume
vgcreate vgname /dev/sdb1             # Create volume group
lvcreate -L 10G -n lvname vgname      # Create logical volume
lvextend -L +5G /dev/vgname/lvname    # Extend LV


## COMPRESSION COMMANDS
### Tar Archives
tar -cvf archive.tar files/           # Create tar
tar -xvf archive.tar                  # Extract tar
tar -czvf archive.tar.gz files/       # Create tar.gz
tar -xzvf archive.tar.gz              # Extract tar.gz
tar -cjvf archive.tar.bz2 files/      # Create tar.bz2
tar -xjvf archive.tar.bz2             # Extract tar.bz2
tar -cJvf archive.tar.xz files/       # Create tar.xz
tar -xJvf archive.tar.xz              # Extract tar.xz

### Gzip
gzip filename                         # Compress file
gzip -d filename.gz                   # Decompress
gunzip filename.gz                    # Decompress
zcat filename.gz                      # View compressed

### Bzip2
bzip2 filename                        # Compress
bzip2 -d filename.bz2                 # Decompress
bunzip2 filename.bz2                  # Decompress
bzcat filename.bz2                    # View compressed

### Zip/Unzip
zip archive.zip files                 # Create zip
zip -r archive.zip directory/         # Recursive zip
unzip archive.zip                     # Extract zip
unzip -l archive.zip                  # List contents

### 7-Zip
7z a archive.7z files/                # Create 7z
7z x archive.7z                       # Extract 7z
7z l archive.7z                       # List contents

### Advanced Compression
pigz filename                         # Parallel gzip
pbzip2 filename                       # Parallel bzip2
tar -cf - dir/ | pigz > archive.tar.gz # Tar with parallel compression



## NETWORKING COMMANDS

### Network Configuration
ip addr show                          # Show IP addresses
ip link show                          # Show network interfaces
ip route show                         # Show routing table
ip addr add 192.168.1.10/24 dev eth0  # Add IP address
ifconfig                              # Legacy interface config

### Connectivity Testing
ping google.com                       # Basic ping
ping -c 4 google.com                  # Limited count
traceroute google.com                 # Path discovery
mtr google.com                        # Advanced traceroute
nc -zv hostname port                  # Port testing
telnet hostname port                  # Telnet test

### DNS Troubleshooting
dig google.com                        # DNS lookup
dig @8.8.8.8 google.com               # Specific DNS server
nslookup google.com                   # DNS query
host google.com                       # Simple DNS lookup

### Network Statistics
ss -tulpn                             # Socket statistics
netstat -tulpn                        # Network statistics (legacy)
netstat -r                            # Routing table
iftop                                 # Bandwidth monitoring
nethogs                               # Bandwidth per process

### HTTP/Web Testing
curl https://google.com               # HTTP request
curl -O https://example.com/file      # Download file
wget https://example.com/file         # Download file
wget --mirror https://site.com        # Mirror website

### Advanced Networking
tcpdump -i eth0                       # Packet capture
iptables -L                           # Firewall rules
ssh -L 8080:localhost:80 user@host    # SSH tunnel
iwconfig                              # Wireless config
iw dev wlan0 scan                     # Scan WiFi



## FILE MANAGEMENT COMMANDS

### Basic File Operations
ls -la                                # List all files
cp file1 file2                        # Copy file
cp -r dir1 dir2                       # Recursive copy
mv file1 file2                        # Move/rename
rm file                               # Remove file
rm -r directory                       # Remove directory
mkdir dirname                         # Create directory
rmdir dirname                         # Remove empty directory

### File Permissions
chmod 755 filename                    # Change permissions
chmod u+x filename                    # Add execute for user
chown user:group filename             # Change ownership
chgrp group filename                  # Change group

### File Searching
find /path -name "*.txt"              # Find files by name
find /path -type f -mtime -7          # Find files modified in last 7 days
locate filename                       # Find using database
grep "pattern" file                   # Search in file
grep -r "pattern" /path               # Recursive grep

### Text Processing
cat file                              # Display file
less file                             # Page through file
head -n 10 file                       # First 10 lines
tail -n 10 file                       # Last 10 lines
tail -f file                          # Follow file
sed 's/old/new/g' file                # Replace text
awk '{print $1}' file                 # Print first column
sort file                             # Sort lines
uniq file                             # Remove duplicates


## PACKAGE MANAGEMENT

### Debian/Ubuntu (APT)
apt update                            # Update package list
apt upgrade                           # Upgrade packages
apt install package                   # Install package
apt remove package                    # Remove package
apt search keyword                    # Search packages
dpkg -i package.deb                   # Install DEB package

### RedHat/CentOS (YUM/DNF)
yum update                            # Update packages
yum install package                   # Install package
yum remove package                    # Remove package
dnf install package                   # DNF package manager
rpm -i package.rpm                    # Install RPM package

### Arch Linux
pacman -Syu                           # Update system
pacman -S package                     # Install package
pacman -R package                     # Remove package



## SYSTEM MAINTENANCE

### Backup Commands
tar -czf backup.tar.gz /data          # Create backup
rsync -av source/ destination/        # Sync backup
dd if=/dev/sda of=backup.img          # Disk image

### Cron Jobs
crontab -e                            # Edit cron jobs
crontab -l                            # List cron jobs
# Cron format: * * * * * command
# │ │ │ │ │
# │ │ │ │ └── Day of week (0-6)
# │ │ │ └──── Month (1-12)
# │ │ └────── Day of month (1-31)
# │ └──────── Hour (0-23)
# └────────── Minute (0-59)

### Log Management
tail -f /var/log/syslog               # Follow system log
journalctl -f                         # Follow systemd journal
grep "error" /var/log/syslog          # Search for errors
logrotate -f /etc/logrotate.conf      # Force log rotation



## SECURITY COMMANDS

### Security Hardening
ufw enable                            # Enable firewall
ufw allow 22/tcp                      # Allow SSH
fail2ban-client status                # Fail2ban status
chattr +i file                        # Make file immutable

### Audit and Monitoring
last                                  # Login history
who                                   # Logged in users
w                                     # Logged in users with processes
ausearch -k keyname                   # Audit log search



## KERNEL AND HARDWARE

### Kernel Management
uname -r                              # Kernel version
lsmod                                 # Loaded modules
modprobe modulename                   # Load module
rmmod modulename                      # Remove module
sysctl -a                             # Kernel parameters

### Hardware Information
lspci                                 # PCI devices
lsusb                                 # USB devices
lshw                                  # Hardware info
dmidecode                             # DMI information
sensors                               # Hardware sensors

## TEXT EDITORS
### Vim
vim filename                          # Open file
# Vim modes: Normal, Insert, Visual
# Basic commands: i (insert), Esc (normal), :wq (save quit), :q! (quit without save)



### Nano
nano filename                         # Open file
# Ctrl+O - Save, Ctrl+X - Exit

## SHELL AND SCRIPTING
### Shell Basics
echo "text"                           # Output text
cat > file.txt                        # Create file
echo "text" >> file.txt               # Append to file
source script.sh                      # Execute script
chmod +x script.sh                    # Make executable

### Variables and Environment
export VAR=value                      # Set environment variable
echo $VAR                             # Display variable
env                                   # Show all environment variables

### Useful Shortcuts
Ctrl+C                                # Interrupt process
Ctrl+Z                                # Suspend process
Ctrl+D                                # End of file (logout)
Ctrl+A                                # Beginning of line
Ctrl+E                                # End of line
Ctrl+R                                # Reverse search history



## QUICK REFERENCE
### Common Options
-a, --all                            # All items
-r, -R, --recursive                  # Recursive
-f, --force                          # Force operation
-v, --verbose                        # Verbose output
-h, --human-readable                 # Human readable sizes

### Important Directories
/                                     # Root directory
/home                                 # User home directories
/etc                                  # Configuration files
/var                                  # Variable data
/tmp                                  # Temporary files
/usr                                  # User programs
/bin, /sbin                          # Essential binaries
/opt                                  # Optional software

### File System Hierarchy
/boot                                # Boot loader files
/dev                                 # Device files
/proc                                # Process information
/sys                                 # System information
/lib                                 # Shared libraries
/mnt                                 # Mount point
/media                               # Removable media

## TROUBLESHOOTING TIPS
1. Check logs: /var/log/ and journalctl
2. Verify disk space: df -h
3. Check memory: free -h
4. Monitor processes: top or htop
5. Test network: ping, traceroute
6. Check services: systemctl status
7. Verify permissions: ls -la

## BEST PRACTICES
1. Always use sudo for system commands if you are not root
2. Keep system updated regularly
3. Use key-based SSH authentication
4. Regular backups are essential
5. Monitor system resources
6. Use descriptive names for files and directories
7. Document your configurations

# END OF LINUX COMMANDS GUIDE
EOF
