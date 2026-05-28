# fa-discovery

Pure Storage FlashArray discovery script for collecting array, drive, and hardware inventory details over SSH.

## Requirements

- Bash
- SSH client
- Passwordless SSH access to the FlashArray
- `pureuser` access on the target array

## Usage

```bash
chmod +x fa-discovery.sh
./fa-discovery.sh <FlashArray_IP>
```

If no IP address is provided, the script uses the default target configured in `fa-discovery.sh` (`192.168.1.100`).

The script writes discovery output to a timestamped file:

```text
flasharray_<FlashArray_IP>_<YYYYMMDD_HHMMSS>.txt
```

## Collected Data

The script runs the following Pure CLI commands on the target FlashArray:

- `purearray list`
- `purearray list --controller`
- `purearray list --security-token`
- `puredrive list`
- `puredrive list --spec`
- `purehw list`
- `purehw list --spec`

## Validation

Check the script syntax before use:

```bash
bash -n fa-discovery.sh
```

## Security Note

The generated output may contain sensitive FlashArray details, including security token information. Store and share discovery files accordingly.
