```json
{
  "VirtualSwitchNATInstructions": {
    "CreateNATSwitch": {
      "Step1": "Open Hyper-V Manager on your Windows host.",
      "Step2": "Click on 'Virtual Switch Manager' on the right pane.",
      "Step3": "Create a new 'Internal' virtual switch and name it (e.g., 'NATSwitch'). Click 'OK' to save."
    },
    "ConfigureNAT": {
      "Step1": "Open PowerShell with administrative privileges on your host machine.",
      "Step2": "Run 'Get-VMSwitch' to list all virtual switches and note the name of the new switch.",
      "Step3": "Run 'New-NetIPAddress -IPAddress 192.168.100.1 -PrefixLength 24 -InterfaceAlias \"vEthernet (NATSwitch)\"' to assign an IP address to the virtual switch.",
      "Step4": "Run 'New-NetNat -Name NATNetwork -InternalIPInterfaceAddressPrefix 192.168.100.0/24' to create the NAT network."
    },
    "AssignVMSwitch": {
      "Step1": "Open Hyper-V Manager.",
      "Step2": "Right-click on your Ubuntu VM and select 'Settings'.",
      "Step3": "Go to 'Network Adapter' and select the new 'NATSwitch' virtual switch."
    }
  },
  "NetplanConfigurationInstructions": {
    "EditNetplanFile": {
      "Step1": "Start your Ubuntu VM and open a terminal.",
      "Step2": "Run 'ls /etc/netplan/' to find the YAML configuration file (usually named '01-netcfg.yaml' or '50-cloud-init.yaml').",
      "Step3": "Open the configuration file with 'sudo nano /etc/netplan/01-netcfg.yaml' (replace with your file name if different)."
    },
    "SetStaticIP": {
      "Step1": "Modify the file to set a static IP, gateway, and DNS (see below).",
    },
    "ApplyConfiguration": {
      "Step1": "Save the file and exit the editor.",
      "Step2": "Run 'sudo netplan apply' to apply the changes."
    },
    "Fix Netplan Permissions": {
      "Step1":"sudo chown root:root /etc/netplan/*.yaml",
      "Step2":"sudo chmod 600 /etc/netplan/*.yaml"
    },
    "VerifyNetwork": {
      "Step1": "Run 'ip addr show' to verify the network interface is configured correctly.",
      "Step2": "Test connectivity with 'ping google.com' and 'ping 8.8.8.8'."
    }
  }
}
```

```yaml
# example /etc/netplan/01-network-manager-all.yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - 192.168.100.2/24  # Static IP in the NAT network
      routes:
        - to: 0.0.0.0/0
          via: 192.168.100.1 # Virtual NAT IP
      nameservers:
        addresses:
          - 8.8.8.8  # Google's public DNS
          - 8.8.4.4
```


### Enable boot to CLI by default:
Use `Ctr+Alt+F6` from the GUI login screen to hop to the command line.

Edit `/etc/default/grub`:
```sh
GRUB_CMDLINE_LINUX_DEFAULT="text"
GRUB_TERMINAL=console
```

After saving changes you need to run:
```
sudo update-grub
sudo systemctl enable multi-user.target --force
sudo systemctl set-default multi-user.target
```

Then a `reboot` should ensure you go straight to the command line.