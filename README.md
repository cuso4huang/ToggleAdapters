# ToggleAdapters4JNU

由于jnu有线校园网的锐捷客户端会检测到vmware和wsl的虚拟网卡导致连接不上虚拟网卡，所以写了一个windows下的脚本，用于一键关闭或开启这三个虚拟网卡（wsl一个，VMware两个）

#### 使用方法

1. 将ToggleAdapters.ps1下载到本地
2. 使用管理员身份打开终端
3. 切换到ToggleAdapters.ps1的路径下，运行ToggleAdapters.ps1
   每次如果要使用有线网，就先运行一次脚本出现Disable字样就证明关闭了虚拟网卡，可正常使用有线网；如果要使用虚拟机，就只能使用无线网，再运行一次脚本出现Enable字样，证明打开了虚拟网卡，可在虚拟机正常联网。

#### 使用示例

1. 将ToggleAdapters.ps1安装到桌面

2. 按住 win+x 选择windows终端（管理员），默认进行home目录

3. ```powershell
   cd 桌面 # 或者 cd Desktop
   ```

4. ```powershell
   ls # 查看当前目录所有文件，看是否包含ToggleAdapters.ps1
   ```

5. ```powershell
   .\ToggleAdapters.ps1 # 执行当前脚本
   ```

至此，已经完成了运行脚本，若想更加方便，可考虑将脚本复制到home目录下

```powershell
cd 桌面 # 或者 cd Desktop
cp .\ToggleAdapters.ps1 ~\ToggleAdapters.ps1 # 将桌面的脚本复制到home目录下
```

这样，以后就可以直接：

1. win+x,再按a打开windows终端（管理员）

2. ```powershell
   .\ToggleAdapters.ps1 # 执行当前脚本
   ```

**本脚本内容简单，为本人自用，并不具备普适性，但可根据脚本思路，自行修改脚本为己所用。**

