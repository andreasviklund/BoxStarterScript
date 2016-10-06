Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -EnableShowFullPathInTitleBar
Update-ExecutionPolicy RemoteSigned

[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://seproxy.hm.com:8078/", "Machine")
[Environment]::SetEnvironmentVariable("HTTP_PROXY", "http://seproxy.hm.com:8078/", "Process")
[Environment]::SetEnvironmentVariable("no_proxy", "seucm6.hm.com, seucm7.hm.com, sesthcc1ucm011.hm.com, ldapgslb.hm.com, hm.com", "Machine")
[Environment]::SetEnvironmentVariable("EDITOR", "notepad.exe", "User")

Function Test-Windows10 { return [Environment]::OSVersion.Version -ge (New-Object 'Version' "10.0.1") }

If (Test-Windows10) {
  # from http://www.howto-connect.com/show-run-as-different-user-on-start-menu-windows-10/
  new-item -ItemType Directory -force HKCU:\Software\Policies\Microsoft\Windows\Explorer
  New-ItemProperty -path HKCU:\Software\Policies\Microsoft\Windows\Explorer -name ShowRunasDifferentuserinStart -PropertyType DWORD -value 1 -Force
}

# yes, I think it is necessary to install chocolatey, cause otherise it will not be accessible after boxstarter
choco install -y chocolatey
choco install netfx-4.5.2-devpack
choco install git
[Environment]::SetEnvironmentVariable("LANG", "C", "User")
choco install 7zip
# some want google chrome beta channel
choco install Google-Chrome-x64
choco install PowerShell				

#choco install VisualStudio2013Premium -InstallArguments "/Features:'SQL WebTools'"
# VS2015 has disappeared from chocolatey repository
choco install -y visualstudio2015enterprise
#choco install visualstudio2015enterprise -pre -InstallArguments "/Features:'SQL WebTools'"
#choco install -y visualstudio2015-update
choco install visualsvn
choco install resharper
choco install stylecop
choco install -y nugetpackageexplorer

choco install kdiff3
choco install tortoisesvn
choco install poshgit
choco install gitextensions
choco install tortoisegit
choco install nodejs
# this is old and not maintained
#choco install typescript
choco install fiddler4
choco install linqpad


#choco install notepadplusplus.install
choco install notepad2
#choco install atom
choco install -y VisualStudioCode
#choco install ConEmu
choco install -y cmder
choco install sysinternals
choco install rdcman
choco install nuget.commandline

choco install mssqlserver2014express
choco install mssqlservermanagementstudio2014express

choco install -y GitVersion.Portable

# Proxy settings are needed for the NPM calls.
npm config set proxy http://seproxy.hm.com:8078
npm install -g gulp

git config --global mergetool.keepbackup false
git config --global alias.lol "log --graph --decorate --oneline --all"
git config --global alias.lo "log --graph --decorate --oneline"
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.mt mergetool
git config --global alias.dt difftool
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global fetch.prune true
git config --global log.decorate short
git config --global log.abbrevcommit true
git config --global log.date relative
# Special settings for ProductPlan
git config --global core.autocrlf false
git config --global core.safecrlf false
git config --global push.default simple
git config --global core.preloadindex true
git config --global core.fscache true
git config --global http.proxy http://seproxy.hm.com:8078
git config --global http."http://bitbucket.hm.com/".proxy `"`"
#git config --global http."http://stash.hm.com/".proxy `"`"
#git config --global http."http://secc5328.hm.com/".proxy `"`"
git config --global core.longpaths true
git config --global credential.helper '!\"C:\Program Files (x86)\GitExtensions\GitCredentialWinStore\git-credential-winstore.exe\"'

dism /online /enable-feature /featurename:MSMQ-Container /featurename:MSMQ-Server

