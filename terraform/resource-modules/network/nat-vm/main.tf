
# Create network interface
resource "azurerm_network_interface" "natnic" {
  name                      = "${var.prefix}-natnic"
  location                  = var.resource_group_location
  resource_group_name       = var.resource_group_name
  enable_ip_forwarding      = "true"

  ip_configuration {
    name                          = "${var.prefix}-natnic-conf"
    subnet_id                     = var.nat_subnet_id
    private_ip_address_allocation = "dynamic"
  }

  tags = var.tags
}

# Private key
resource "tls_private_key" "nat_vm" {
  algorithm = "ECDSA"
}

resource "random_string" "password" {
  length  = 16
  special = false
}

# Create virtual machine
resource "azurerm_virtual_machine" "natvm" {
  name                  = "${var.prefix}natvm"
  location              = var.resource_group_location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.natnic.id]
  vm_size               = var.vmsize

  storage_os_disk {
    name              = "${var.prefix}-ftosdisk-nat"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_profile {
    computer_name  = "natvm"
    admin_username = var.admin_username
    admin_password = random_string.password.result
  }



  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = var.tags

}

resource "azurerm_virtual_machine_extension" "natvmext" {
  name                 = "natvmext"
  virtual_machine_id   = azurerm_virtual_machine.natvm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "script": "IyEvYmluL3NoCnN1ZG8gYXB0LWdldCB1cGRhdGUKCiMgbmV0LmlwdjQuaXBfZm9yd2FyZCA9IDEKY3AgL2V0Yy9zeXNjdGwuY29uZiAvdG1wL3N5c2N0bC5jb25mCmVjaG8gIm5ldC5pcHY0LmlwX2ZvcndhcmQgPSAxIiA+PiAvdG1wL3N5c2N0bC5jb25mCnN1ZG8gY3AgL3RtcC9zeXNjdGwuY29uZiAvZXRjL3N5c2N0bC5jb25mCgojIGZpcmV3YWxsZApzdWRvIC9ldGMvaW5pdC5kL25ldHdvcmtpbmcgcmVzdGFydApzdWRvIGFwdC1nZXQgaW5zdGFsbCAteSBmaXJld2FsbGQKc3VkbyBzeXN0ZW1jdGwgZW5hYmxlIGZpcmV3YWxsZApzdWRvIHN5c3RlbWN0bCBzdGFydCBmaXJld2FsbGQKc3VkbyBmaXJld2FsbC1jbWQgLS1zdGF0ZQpzdWRvIGZpcmV3YWxsLWNtZCAtLXNldC1kZWZhdWx0LXpvbmU9ZXh0ZXJuYWwKc3VkbyBmaXJld2FsbC1jbWQgLS1yZWxvYWQ="
    }
    SETTINGS
  ## Script passed:
  # #!/bin/sh
  # sudo apt-get update

  # # net.ipv4.ip_forward = 1
  # cp /etc/sysctl.conf /tmp/sysctl.conf
  # echo "net.ipv4.ip_forward = 1" >> /tmp/sysctl.conf
  # sudo cp /tmp/sysctl.conf /etc/sysctl.conf

  # # firewalld
  # sudo /etc/init.d/networking restart
  # sudo apt-get install -y firewalld
  # sudo systemctl enable firewalld
  # sudo systemctl start firewalld
  # sudo firewall-cmd --state
  # sudo firewall-cmd --set-default-zone=external
  # sudo firewall-cmd --reload

  tags = var.tags
}