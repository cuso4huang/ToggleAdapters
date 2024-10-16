# 此脚本只适用于Windows下的VMware和WSL启停虚拟网卡
# 此脚本的功能：若WSL或VMware的两个虚拟网卡，其中一个打开了那就把三个虚拟网卡都关了
# 如果都关了那就把三个都打开。所以只需在每次使用锐捷客户端的时候用管理员身份运行一下这个脚本就可以行了，如果要使用WSL或者VMware就再用管理员身份运行一下。
#
# @author：黄增钦
#
#
# PowerShell 脚本 - ToggleAdapters.ps1

# 定义适配器名称
$adapters = @("VirtualBox Host-Only Network","VMware Network Adapter VMnet1", "VMware Network Adapter VMnet8", "vEthernet (WSL (Hyper-V firewall))")

# 获取适配器状态
$adaptersStatus = Get-NetAdapter -IncludeHidden | Where-Object { $adapters -contains $_.Name }

# 检查是否有任何适配器是启用状态
$anyEnabled = $adaptersStatus | Where-Object { $_.Status -eq 'Up' }

if ($anyEnabled) {
    # 如果有任何适配器是启用状态，禁用所有适配器
    foreach ($adapter in $adapters) {
        Get-NetAdapter -IncludeHidden | Where-Object { $_.Name -eq $adapter } | ForEach-Object {
            Disable-NetAdapter -IncludeHidden -Name $_.Name -Confirm:$false -ErrorAction SilentlyContinue
            Write-Output "Disabled: $($_.Name)"
        }
    }
} else {
    # 如果所有适配器都是禁用状态，启用所有适配器
    foreach ($adapter in $adapters) {
        Get-NetAdapter -IncludeHidden | Where-Object { $_.Name -eq $adapter } | ForEach-Object {
            Enable-NetAdapter -Name $_.Name -Confirm:$false -ErrorAction SilentlyContinue
            Write-Output "Enabled: $($_.Name)"
        }
    }
}

