# win-radio-master

A small batch script for Windows (x32 and x64) that records internet radio streams. The actual recording is done by [streamripper](https://github.com/streamripper/streamripper); the script just wraps it so you can pick a station from a menu.

<p align="left">
  <img src="img/radio_records.png" alt="radio_records" width="400">
</p>

> [!WARNING]
> Only use this to record content that isn't protected by copyright.

## Usage

Clone the repo (or just download it as a zip):

```bash
git clone https://github.com/Avidei/win-radio-master.git
cd win-radio-master
```

Then double-click `win-radio-master.bat`.

On the first run it asks where to save recordings and stores that choice in `%userprofile%\radio_save_dir`. If something goes wrong later, delete that file and start the script again.

If streamripper isn't installed, the script opens its download page. Close the Command Prompt, install `streamripper-windows-installer-<version>.exe`, and run the script again. Pick a station from the list and it will open in your default browser and start recording.

To stop, close the Command Prompt window.

## Adding your own stations

Open the `.bat` file and add three things:

```batch
::TITLE
echo [{symbol}] {name of radiostation}

::CHECK
Add {symbol} to the end of the section

::URL
IF %startradio%=={symbol} SET url={radiostation_url}
```

`{symbol}` is whatever key you want to press to select the station.

## Known issues

### error -6

```text
error -6 [SR_ERROR_CANT_RESOLVE_HOSTNAME]
bye..
shutting down
```

This comes from the user-agent streamripper sends. Some streams only work with a different one. For example, the same stream plays fine when the user-agent is VLC's ("VLC/2.2.6 LibVLC/2.2.6").

## License

GPL v3. See the [license text](https://www.gnu.org/licenses/gpl-3.0.html).
