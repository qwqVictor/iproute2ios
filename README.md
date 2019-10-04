iproute2ios
===

CLI wrapper for basic network utilities on jailbroken iOS inspired with iproute2 on Linux systems - `ip` command.

This utility was written by [brona](https://github.com/brona/), and this repository is an iOS port of iproute2mac.

Provided functionality is limited and command output is not fully compatible with [iproute2](http://www.policyrouting.org/iproute2.doc.html).

Goal of this project is to make basic network configuration/debug tasks on jailbroken iOS easy for admins who already use Linux systems.

For advanced usage use `netstat`, `ifconfig`, `ndp`, `arp`, `route` and directly.

## Building

Makefile is provided to make a deb package. 

Please run `make dist` as **root** with `dpkg-deb` installed on your computer.

Then you'll find the package in `dist` folder.

## Installation

A) Using [Cydia](http://cydia.saurik.com):

  Add my source  -- [Victor's Cydia Repository](https://cydia.qwq.ren) and install it.

B) Manual installation:

    $ su
    # apt install sudo curl network-cmds python3
    # curl --remote-name -L https://github.com/qwqVictor/iproute2ios/raw/master/src/ip.py
    # chmod +x ip.py
    # mv ip.py /usr/local/bin/ip

## Supported commands / Example usage

Goal of this utility is to provide compatible CLI with [iproute2](http://www.policyrouting.org/iproute2.doc.html), supporting same command shortcuts and user experience.

* Help
  * `ip help`
  * `ip link help`
  * `ip addr help`
  * `ip route help`
  * `ip neigh help`
* Link module (Interfaces)
  * List local interfaces `ip link`
  * Show one interface `ip link show en0`
  * Shutdown interface `ip link set dev en0 down`
  * Start interface `ip link set dev en0 up`
  * Set custom MAC address `ip link set dev en0 address 00:12:34:45:78:90`
  * Set **Random MAC** address `ip link set en0 address random`
  * Set MTU `ip link set dev en0 mtu 9000`
* Neighbour module (ARP/NDP)
  * Show all neighbours `ip neigh`
  * Show all IPv4 (ARP) neighbours `ip -4 neigh`
  * Show all IPv6 (NDP) neighbours `ip -6 neigh`
  * Show all IPv4 (ARP) neighbours for a specific interface `ip -4 neigh show dev en0`
  * IPv6 (NDP) neighbours cannot be currently shown for a specific interface
  * Flush all neighbours (IPv4 + IPv6) for a specific interface `ip neigh flush dev en0`
  * Flush all IPv4 (ARP) neighbours for a specific interface `ip -4 neigh flush dev en0`
  * IPv6 (NDP) neighbours are currently flushed for all interfaces
* Address module
  * List all addresses `ip addr`
  * List IPv4 addresses `ip -4 addr`
  * List IPv6 addresses `ip -6 addr`
  * Add address to interface `ip addr add 10.0.0.5/24 dev en0`
  * Remove address to interface `ip addr del 10.0.0.5 dev en0`
* Route module
  * List IPv4 addresses `ip route`
  * List IPv6 addresses `ip -6 route`
  * Get route for destination `ip route get 8.8.8.8`
  * Add static route `ip route add 192.168.0.0/16 nexthop 10.0.0.1`
  * Add default route `ip route add default nexthop 10.0.0.1`
  * Remove static route `ip route del 192.168.0.0/16`

## Supported iOS versions (Tested)

* iOS 12.4 (Python 3.7.3)

## Changelog

**v1.2.3**

* Supported iOS.
* Switched to Python 3.

**v1.2.2**

* Fixed handling arguments while using `ip -4` (Thanks @bsholdice)
* Fixed `ip help` (Thanks @KireinaHoro)

**v1.2.1**

* Fixed error return codes and test script
* `ip neigh flush` now requires specific device (consistent behaviour with iproute2)

**v1.2.0**

* Enhanced input parsing to support arbitrary length commands (Thanks @deployable)
* Simple test script added (Thanks @deployable)
* Fixed error return codes to simulate iproute2 (At this moment help messages are inconsistently printed to stderr for all errors unlinke iproute2 behaviour)

**v1.1.2**

* Correctly show `src` for `ip route get` on IPv6 addresses (Thanks @codeaholics)

**v1.1.1**

* Added `dev` option to `ip route add` command (Thanks @ThangCZ)

**v1.1.0**

* Added source IP address to `ip route get` command
* Accepted to Homebrew master branch, tap is no longer supported

**v1.0.9**

* Fixed versioning

**v1.0.8**

* Better error handling and error messages (Thanks @rgcr)

**v1.0.7**

* Help messages are sent to stderr (Thanks @rgcr)

**v1.0.6**

* Fixed `ip -6 neigh` failing for N status flag

**v1.0.5**

* Added `s` shortcuts to `show` commands (Thanks @vmoutoussamy)

**v1.0.4**

* Added `ip neigh flush` (Thanks ThangCZ)
* Added 'dev' option for `ip neigh show` and `ip neigh flush`

**v1.0.3**

* Fixed `ifconfig: dev: bad value` in `ip addr del`

**v1.0.2**

* Interface name is concatenated to `ip addr` inet rows

## Authors

See AUTHORS.

Used software/code:

* [macgen.py](http://www.linux-kvm.com/sites/default/files/macgen.py) - Function for generating random MAC address
* [SpoofMAC](https://github.com/feross/SpoofMAC) - Code for obtaining factory default MAC address for interface

## License

* The MIT License (MIT)
