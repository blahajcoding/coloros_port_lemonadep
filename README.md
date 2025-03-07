<div align="center">


# ColorOS Porting Project for the OnePlus 9 Pro

</div>

Original source can be found in [toraidl/coloros_port_kebab](https://github.com/toraidl/coloros_port_kebab/tree/staging)

## Tested devices and ROMs to be ported from
LE2123_14.0.0.501(EX01) -> NE2213_15.0.0.401(CN01)

## What's working?
- Yes


## Bugs


## How to use
- On any Red Hat, Debian or Arch based distro:
```shell
    # Clone project
    git clone https://github.com/toraidl/coloros_port_kebab.git
    cd coloros_port_kebab
    # Install dependencies
    sudo ./setup.sh
    # Start porting
    sudo ./port.sh <baserom> <portrom>
```
- Base ROMs + ROMs to be ported from can be a download link, which in case check 4PDA or XDA. ZIP files are supported.

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
