# FlashArray Discovery

A Bash discovery script for collecting basic Pure Storage FlashArray hardware, controller, drive, and array details over SSH.

## File

- `fa-discovery.sh` - runs a fixed set of Pure CLI commands and saves output to a timestamped text file.

## Requirements

- Bash.
- Network access to the FlashArray management address.
- Passwordless SSH configured for `pureuser`.

## Usage

```sh
chmod +x fa-discovery.sh
./fa-discovery.sh 192.0.2.10
```

The script writes output to a file named like `flasharray_192.0.2.10_YYYYMMDD_HHMMSS.txt`.
