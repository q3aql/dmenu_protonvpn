dmenu_protonvpn - Dmenu script tool for manage your ProtonVPN connections
=========================================================================

### Dependencies:

  * gcc 
  * make
  * openvpn
  * coreutils
  * sed
  * kitty `(Opcional)`
  * xterm
  * bash
  * freetype2-devel
  * expat-devel

### Build and install:

* Open terminal and run the following commands:

  ```shell
  $ git clone https://github.com/q3aql/dmenu_protonvpn
  $ sudo make install clean
  ````

### How to use:

* Open terminal and type the following command as root:

  ```shell
  dmenu_protonvpn
  ```

* You can also use the applications menu: `Menu > Network > Dmenu_ProtonVPN`

<img src="examples/dmenu_protonvpn.png" /> 

* Copy your .ovpn files to `~/protonFiles`. These files will be loaded into `dmenu_protonvpn` the next time it is run.

### How to use (CLI):

* Open terminal and type the following command as root:

  ```shell
  dmenu_protonvpn_cli
  ```
  
<img src="examples/dmenu_protonvpn_cli.png" /> 
 
### External links:

  * [ProtonVPN homepage](https://protonvpn.com/)
  * [OpenVPN homepage](https://openvpn.net/)
  * [OpenVPN Community](https://openvpn.net/community-downloads/)
  * [Zenity homepage](https://wiki.gnome.org/Projects/Zenity)



