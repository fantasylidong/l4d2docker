# Left 4 Dead 2 Server Docker Image

## Ports
By default, you'll want to allow both incoming TCP and UDP traffic on port 27015. 



```
docker run -p 2333:2333/tcp -p 2333:2333/udp -e PORT=2333 -e MAP="c2m1_highway" -e REGION=255 -e HOSTNAME="LEO" -e password="123456" -e steamgroup="25622692,26419628" -e plugin="anne" -e steamid="STEAM_1:1:121430603" -v "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Left 4 Dead 2\\left4dead2\\addons":"/map" --name anne morzlee/l4d2
```



### Changing the port
To change the port used inside the container change the `PORT` environment variable, then map the new ports instead.

## Hostname
This identifies your server in the server browser.  By default it is set to "Left4DevOps L4D2".  Change it by setting the `HOSTNAME` environment variable.

e.g. To change your hostname to BILLS HERE:

`docker run -e HOSTNAME="BILLS HERE"`...

## Region
To help hint to Steam where your server is located, set the `REGION` environment variable as one of the following numeric regions:

| Location        | REGION   |
| --------------- | -------- |
| East Coast USA  | 0        |
| West Coast USA  | 1        |
| South America   | 2        |
| Europe          | 3        |
| Asia            | 4        |
| Australia       | 5        |
| Middle East     | 6        |
| Africa          | 7        |
| World (Default) | 255      |

e.g. If your server was in Europe:

`docker run -e REGION=3`...

## plugins type
There are three types plugins to choose.

sirplease github address: https://github.com/SirPlease/L4D2-Competitive-Rework

anna github address: https://github.com/Caibiii/AnneServer
neko github address: https://github.com/himenekocn/NekoSpecials-L4D2

Default plugins package is anna.

`docker run -e plugin=anna`...

| type          | mean                             |
| ------------- | -------------------------------- |
| anne(default) | anna plugins package             |
| neko          | neko plugins package             |
| sirplease     | sirplease versus plugins package |
| none          | don't install plugins            |

## Custom Addons
Softlink l4d2 maps to addons folder.
It would more convenience while you want add custom map. Exspecially when you have sourcemod plugins.
you just need mount your extra map folder to docker container /map . 

## plugins setting

Just set an environment variable 'steamid' with your steamid form game console.

Just set an environment variable 'steamgroup' with your steamgroup form game console.

Just set an environment variable 'password' , so you can take control your server by rcon game server manager.
