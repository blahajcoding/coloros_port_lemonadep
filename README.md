<div align="center">


# OxygenOS/ColorOS Porting Project for the OnePlus 9 Pro

</div>

Original source can be found in [toraidl/coloros_port_kebab](https://github.com/toraidl/coloros_port_kebab/tree/staging)

## Tested devices and ROMs to be ported from
- LE2123_14.0.0.730(EX01) ➡️ NE2213_15.0.0.401(EX01)
- LE2123_14.0.0.730(EX01) ➡ CPH2653_15.0.0.602(EX01)
- LE2123_14.0.0.730(EX01) ➡️ PHY110_15.0.0.801(CN01)

## What's working?
- Yes

## Bugs
- Face unlock
- Camera LUTs
- China ROM is bloated...

## How to use
- On any distro:
```shell
# Clone project
git clone https://github.com/blahajcoding/coloros_port_lemonadep.git
cd coloros_port_lemonadep
# Install dependencies (Debian + Arch based distros only)
sudo ./setup.sh
# Start porting
sudo ./port.sh <baserom> <portrom>
```
Other distros will need packages to be installed manually.

- Base ROMs + ROMs to be ported from can be a download link, which in case check 4PDA or XDA. ZIP files are supported.

# Want to port to the OnePlus 9?
- Rename devices/OnePlus9Pro to OnePlus9
- Edit bin/getSuperSize.sh and include your super size.

## Credits
> In this project, some or all of the content is derived from the following open-source projects. Special thanks to the developers of these projects.

- ["BypassSignCheck" by Weverses](https://github.com/Weverses/BypassSignCheck)
- ["contextpatch" by ColdWindScholar](https://github.com/ColdWindScholar/TIK)
- ["fspatch" by affggh](https://github.com/affggh/fspatch)
- ["gettype" by affggh](https://github.com/affggh/gettype)
- ["lpunpack" by unix3dgforce](https://github.com/unix3dgforce/lpunpack)
- ["miui_port" by ljc-fight](https://github.com/ljc-fight/miui_port)
- ["coloros_port_kebab" by Bruce Teng](https://github.com/toraidl/coloros_port_kebab/tree/staging)
- "ColorOS 15 for the OnePlus 9RT" by color591
- etc
