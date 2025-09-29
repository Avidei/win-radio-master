## win-radio-master
Listen and download standard internet radio streams<br>
Command-line interpreter script for windows x32/x64 <br>
Based on [streamripper](https://github.com/streamripper/streamripper)

> [!Warning]
> Use this one only for download content not protected by copyright

### Use:

* Download project
```console
git clone https://github.com/Avidei/win-radio-master.git
cd win-radio-master
```

* Double click win-radio-master.bat

* Chose directory to save streams, config will be saved in %userprofile%\radio_save_dir, delete this config if any trouble and rerun script

* If you don't have a streamripper installed on your computer - script will open it's download page

* Close Command Prompt, download and install streamripper-windows-installer-{any_version}.exe on your computer

* Rerun script and choose radiostation, it should open stream in your default browser and run job to ripping in command prompt

* To stop the programm just close command prompt

> [!Note]
> To add new radiostation create new row like `echo [{symbol}] {name of radiostation}` in section `::TITLE`<br>
> Add {symbol} to the end in section `::CHECK`<br>
> Add new row like `IF %startradio%=={symbol} SET url={radiostation_url}` in section `::URL`

### Known issues

* If you got `error -6`

```console
error -6 [SR_ERROR_CANT_RESOLVE_HOSTNAME]
bye..
shutting down
```

This problem is caused by the user-agent. 
If you use for instance VLC ("VLC/2.2.6 LibVLC/2.2.6"), the stream works






