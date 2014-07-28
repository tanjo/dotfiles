#!/usr/bin/python
# coding: utf-8

import sys

class DotfilesInstaller(object):
  """Dotfiles 用インストーラー
  
  Longer class information...
  
  Attributes:
    os_type: OSの種類
  """
  
  OS_TYPE_MAC = "mac"
  OS_TYPE_WIN = "win"
  OS_TYPE_WINDOWS = "windows"
  
  def __init__(self, os_type):
    """Inits DotfilesInstaller with OS type."""
    self.os_type = os_type;
    
  def install(self):
    """Performs operation install."""
    print "Installs tanjo's dotfiles for " + self.os_type + "."
    if(self.os_type == self.OS_TYPE_MAC):
      self.install_mac()
      return
    if(self.os_type == self.OS_TYPE_WIN or self.os_type == self.OS_TYPE_WINDOWS):
      self.install_win()
      return
    print "OS type is wrong. (if you use installer, OS type is set mac or win)"
    
  def install_mac(self):
    print "installing for mac... ."
        
  def install_win(self):
    print "installing for windows... ."
      
def main():
  if (len(sys.argv) == 2):
    installer = DotfilesInstaller(sys.argv[1])
    installer.install()    
    quit()
  print("How to use:\n      python install.py [mac,win]")

if __name__ == '__main__':
  main()