# Description
* Splits on fadeout
* Supports Project64 1.6 and Mupen64Plus
* Aims to support all common split options. If something is broken or missing please let me (AndySandford) know.

# You should also check out [aglab2's autosplitter](https://github.com/aglab2/LiveSplitAutoSplitters)
It just reads the split names so you don't have to edit configs or even .asl files to add new routes. That means you just write your splits file (with the correct format) and it will split without you having to edit any configs. Whereas my splitter requires you to first configure your route. My splitter also requires you to edit the .asl files if you want to add new routes. When I first wrote this splitter I wasn't aware of aglab2's splitter nor the more advanced features of the ASL language, which is my splitter is the way it is. I'm not planning to rewrite this splitter because that would make it more or less identical to aglab2's splitter. I will however continue to maintain it, fix bugs and add new routes should anyone request it. (You might say that one advantage of my splitter is that you can choose whatever split names you want ;))

# How to use:  
Download the file called [`LiveSplit.SM64.asl`](https://github.com/andysandford/sm64-livesplit-autosplitter/releases/download/v1.3/LiveSplit.SM64.asl). Edit your LiveSplit layout and add the `Scriptable Auto Splitter` component.  
![image](https://user-images.githubusercontent.com/93740337/140424715-53cea1e5-8a96-4573-922e-bf0e6dccd39b.png)  

Then go to `Layout Settings` and look at the `Scriptable Auto Splitter` tab.
Choose the file you downloaded in the `Script Path` field. It should load and show you some different split options.  
![image](https://user-images.githubusercontent.com/93740337/142740561-215b87ac-a100-49b1-b259-808a1437a7b7.png)

Then you just check the boxes for the splits you want. If a split you want is missing feel free to open an issue here or contact me (AndySandford) on Discord so I can add it.

Make sure you select the correct game version and emulator (JP Mupen64Plus or JP Project 64). Changing it requries you to restart LiveSplit.

If everything has been configured correctly LiveSplit should start when you start or reset your emulator.

## Start Settings
The splitter can either start the timer when the game starts normally, but it can be inconsistent. The splitter therefore supports starting on the first frame of the logo. It is a lot more consistent but you need to configure LiveSplit to start at 1.33s.

![image](https://user-images.githubusercontent.com/93740337/142740503-b6f1ccd0-fcee-4426-93d3-0b269060df5d.png)  

# Known issues
* Doing Metal Cap as the last star of HMC is not supported. If you do this then the splitter will trigger after the last proper star of HMC, causing a split one star too early.
* Splits can trigger multiple times. For example if you die in BitS and re-enter the stage it will split again.

# Example configs
## 16 Star No LBLJ
![image](https://user-images.githubusercontent.com/93740337/140610599-b6e1af1d-a660-432c-b458-5a6a1910c54f.png)
![image](https://user-images.githubusercontent.com/93740337/140610533-80ab2ba2-acc3-4bca-abfd-92ff8c8c87fe.png)

## 16 Star No LBLJ Beginner (No BitDW Red Coins)
![16StarNoLBLJBeginnerSettings](https://user-images.githubusercontent.com/60489413/153927050-a6f17ecb-ba50-439c-b816-a242d1e908d8.png)
![image](https://user-images.githubusercontent.com/60489413/153926120-457c8342-c545-43c2-a6f2-dbd519958b92.png)

## 16 Star LBLJ
![image](https://user-images.githubusercontent.com/93740337/140610687-a99dfa21-d8a3-408a-9c08-6998235c5276.png)
![image](https://user-images.githubusercontent.com/93740337/140610660-d1bfe335-eabd-4812-91ec-80de64a46dfb.png)

## 70 Star CCM18 No TTC100 (SL Reds)
![70-no-ttc-100](https://user-images.githubusercontent.com/93740337/141648786-b9276d5c-243f-4f6c-a04c-18c1255e59e0.png)
![image](https://user-images.githubusercontent.com/93740337/141648743-b302b817-b076-4096-bf6b-89917e0a93fc.png)

## 70 Star CCM18 With TTC100
![70-ccm18](https://user-images.githubusercontent.com/93740337/141648863-2bf1d893-6bb8-4a13-96b5-8c8a2ea4860e.png)
![image](https://user-images.githubusercontent.com/93740337/141648885-687c7ec0-e60a-4bac-aed3-bdcde4236bcb.png)

## 70 Star CCM17 With Island Hop
![70-ccm17](https://user-images.githubusercontent.com/93740337/141648898-b3af60f5-30d2-4695-a7e1-fe4acf2b2f44.png)
![image](https://user-images.githubusercontent.com/93740337/141648959-b7d6ba12-2b4d-48e6-b6ea-ca679ff6007c.png)

## 120 Star No LBLJ
![image](https://user-images.githubusercontent.com/93740337/140610848-1e073741-1bbe-4f02-8738-b60b4229662a.png)
![image](https://user-images.githubusercontent.com/93740337/140610792-a845726a-737b-467b-bbb7-04a2c6bb4218.png)
