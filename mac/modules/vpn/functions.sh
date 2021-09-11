#!/bin/bash


function mutant-vpn-connect-personal() {
  cd ~/.vpn
  sudo openvpn --config my-vpn-config.ovpn
}
