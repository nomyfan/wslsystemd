# wslsystemd
Make systemd's PID 1 using Linux namespace

## How to use
Just run the script with WHO variable specified
```bash
WHO=`whoami` sudo -E ./wslsystemd.sh
```
If there's no systemd process, you need to run this script twice. I don't know much about Linux, so I have no idea how to solve the issue now.
