#   Description:
# This script disables unwanted Windows services. If you do not want to disable
# certain services comment out the corresponding lines below.

$services = @(
    "diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                # Diagnostics Tracking Service
    "dmwappushservice"                         # WAP Push Message Routing Service (see known issues)
    # Keep enabled to use geolocation software
    "lfsvc"                                    # Geolocation Service
    # Windows service for application access to downloaded maps, disabling this service will prevent apps from accessing maps.
    "MapsBroker"                               # Downloaded Maps Manager
    # Keep enabled for remote access, configuring a VPN, accessing your files via VPN, etc.
    "RemoteAccess"                             # Routing and Remote Access
    "RemoteRegistry"                           # Remote Registry
    # Keep these two enabled to share your Internet connection to other devices.
    "SharedAccess"                             # Internet Connection Sharing (ICS)
    "icssvc"                                   # Windows Mobile Hotspot Service
    # Keep enabled to keep track of folders with shortcuts. If the folder is moved, the service re-link the shortcut to new location.
    #"TrkWks"                                  # Distributed Link Tracking Client
    # Leave Xbox stuff for gaming
    #"XblAuthManager"                          # Xbox Live Auth Manager
    #"XblGameSave"                             # Xbox Live Game Save
    #"XboxNetApiSvc"                           # Xbox Net Api
    #"XboxGipSvc"                              # Xbox Accessory Management Service
    # -
    "NetTcpPortSharing"                        # Net.Tcp Port Sharing Service
    "WbioSrvc"                                 # Windows Biometric Service (required for Fingerprint reader / facial detection)
    "NaturalAuthentication"                    #Natural Authentication evaluates signals based on time, network, geolocation, bluetooth
    #"WlanSvc"                                 # WLAN AutoConfig
    "WMPNetworkSvc"                            # Windows Media Player Network Sharing Service
    #"wscsvc"                                  # Windows Security Center Service
    #"WSearch"                                 # Windows Search
    "ndu"                                      # Windows Network Data Usage Monitor
    # Services which cannot be disabled
    #"WdNisSvc"
    
    # NEW ADDITIONS WITH RESPECT TO W4RH4WK SCRIPT FROM THIS LINE:
    # Keep enabled to use a Microsoft account in your Windows user.
    #"wlidsvc"                                 #Microsoft Account Sign-in Assistant
    # Seems neccesary to log-in with Microsoft account (https://securityboulevard.com/2020/02/how-to-use-microsoft-passport-in-windows-10/).
    #"NgcSvc"                                  #Microsoft Passport
    #"NgcCtnrSvc"                              #Microsoft Passport Container
    # UWP-apps-related stuff
    #"camsvc"                                  #Capability Access Manager Service
    # Keep enabled to use Bluetooth.
    #"bthserv"                                 # Bluetooth Support Service
    #"BthAvctpSvc"                             # AVCTP service Audio Video Control Transport Protocol service (BT)
    #"BTAGService"                             # Bluetooth Audio Gateway Service
    # UPnP-related stuff
    #"SSDPSRV"                                 #SSDP Discovery
    #"upnphost"                                #UPnP Device Host
    # Server-related stuff (WS-Management).
    "WinRM"                                    #Windows Remote Management (WS-Management)
    "Wecsvc"                                   #Windows Event Collector
    # Keep enabled for VPN, DNS, etc. connections.
    "RasMan"                                   #Remote Access Connection Manager
    "RasAuto"                                  #Remote Access Auto Connection Manager
    # Keep enabled if you use IPv6
    "IpxlatCfgSvc"                             #IP Translation Configuration Service from v4 to v6 and vice versa
    "iphlpsvc"                                 #IP Helper (6to4, ISATAP, Port Proxy, and Teredo), and IP-HTTPS. 
    # -
    "HomeGroupListener"                        # HomeGroup Listener
    "HomeGroupProvider"                        # HomeGroup Provider
    #"NcdAutoSetup"                            # Network Connected Devices Auto-Setup
    #"lltdsvc"                                 #Link-Layer Topology Discovery Mapper
    #"AXInstSV"                                #ActiveX Installer
    "AJRouter"                                 #AllJoyn Router Service
    #"AppReadiness"                            #App Readiness
    "SmsRouter"                                #Microsoft Windows SMS
    #"PNRPsvc"                                 #Peer Name Resolution Protocol
    #"p2psvc"                                  #Peer Networking Group
    #"p2pimsvc"                                #Peer Networking Identity Manager
    #"PNRPAutoReg"                             #PNRP Machine Name Publication Service
    #"WalletService"                           #WalletService
    #"DmEnrollmentSvc"                         #Device Management Enrollment Service
    "RetailDemo"                               #Retail Demo
    #"LanmanServer"                            #Supports file, print, and named-pipe sharing over the network for your computer.
    #"LanmanWorkstation"                       #Workstation - Remote Server SMB
    #"lmhosts"                                 #TCP/IP NetBIOS Helper
    # https://www.windows-security.org/windows-service/secondary-logon
    "seclogon"                                 #Secondary Logon
    # Keep enabled to make backups of your files in a drive (Settings -> Updates and security -> Backup).
    #"fhsvc"                                   #File History Service
    #"wbengine"                                #Block Level Backup Engine Service (Used by Windows Backup)
    #"SDRSVC"                                  #Windows Backup
    # Keep enabled to use Bitlocker encryption service.
    #"BDESVC"                                  #BitLocker Drive Encryption Service
    # Makes network files available in local when the network connection is unavailable (mobsync -> Manage offline files).
    "CscService"                               #Offline Files
    # https://smallbusiness.chron.com/netlogon-77314.html
    "Netlogon"                                 #Netlogon domain controller services
    # Virtualization environment of Microsoft.
    "vmicvss"                                  #Hyper-V Volume Shadow Copy Requestor
    "vmicvmsession"                            #Hyper-V PowerShell Direct Service
    "vmictimesync"                             #Hyper-V Time Synchronization Service
    "vmicshutdown"                             #Hyper-V Guest Shutdown Service
    "vmicrdv"                                  #Hyper-V Remote Desktop Virtualization Service
    "vmickvpexchange"                          #Hyper-V Data Exchange Service
    "vmicheartbeat"                            #Hyper-V Heartbeat Service
    "vmicguestinterface"                       #Hyper-V Guest Service Interface
    "HvHost"                                   #HV Host Service
    "AppVClient"                               #Microsoft App-V Client
    "UevAgentService"                          #User Experience Virtualization Service
    # -
    "WpcMonSvc"                                #Parental Controls
    #"wcncsvc"                                 #Windows Connect Now - Config Registrar
    "TapiSrv"                                  #Telephony (API)
    #"swprv"                                   #Microsoft Software Shadow Copy Provider
    #"stisvc"                                  #Windows Image Acquisition (WIA)
    "SNMPTRAP"                                 #SNMP Trap
    "smphost"                                  #Microsoft Storage Spaces SMP
    "SensrSvc"                                 #Sensor Monitoring Service
    "SEMgrSvc"                                 #Payments and NFC/SE Manager
    # Keep enabled if you use smart card logins, or electronic certificates depending on national IDs.
    #"SCPolicySvc"                             #Smart Card Removal Policy
    #"ScDeviceEnum"                            #Smart Card Device Enumeration Service
    #"SCardSvr"                                #Smart Card
    # -
    "PushToInstall"                            #Windows PushToInstall Service
    #"PolicyAgent"                             #IPsec Policy Agent
    "PhoneSvc"                                 #Phone Service
    "PeerDistSvc"                              #BranchCache
    #"NVDisplay.ContainerLocalSystem"          #Container service for NVIDIA root features
    #"NvContainerNetworkService"               #Container service for NVIDIA network features
    #"NvContainerLocalSystem"                  #Container service for NVIDIA root features
    "MSiSCSI"                                  #Microsoft iSCSI Initiator Service
    #"InstallService"                          #Microsoft Store Install Service
    #"LicenseManager"                          #Windows License Manager Service (Used by Microsoft Store)
    #"ITBMService"                             #Intel(R) Turbo Boost Max 3.0 Technology Application Service
    "irmon"                                    #Infrared monitor service (File transfer via infrared devices)
    #"IKEEXT"                                  #IKE and AuthIP IPsec Keying Modules
    "FrameServer"                              #Windows Camera Frame Server (Could be needed to capture webcam frames).
    #"FontCache"                               #Windows Font Cache Service
    #"embeddedmode"                            #Embedded Mode service enables scenarios related to Background Applications
    #"DsSvc"                                   #Data Sharing Service
    #"Browser"                                 #unknown
    #"cbdhsvc"                                 #Clipboard User Service
    #"ConsentUxUserSvc"                        #Allows ConnectUX and PC Settings to Connect and Pair with WiFi displays and Bluetooth devices.
    "UnistackSvcGroup"                         #hidden services that apparently register and start a subprocess per user as a service
    "UnistoreSvc"                              #hidden services that apparently register and start a subprocess per user as a service
    "BluetoothUserService"                     #hidden services that apparently register and start a subprocess per user as a service
    "CDPUserSvc"                               #hidden services that apparently register and start a subprocess per user as a service
    "CaptureService"                           #hidden services that apparently register and start a subprocess per user as a service
    "DevicePickerUserSvc"                      #hidden services that apparently register and start a subprocess per user as a service
    "DevicesFlowUserSvc"                       #hidden services that apparently register and start a subprocess per user as a service
    "MessagingService"                         #hidden services that apparently register and start a subprocess per user as a service
    "PimIndexMaintenanceSvc"                   #hidden services that apparently register and start a subprocess per user as a service
    "BcastDVRUserService"                      #hidden services that apparently register and start a subprocess per user as a service
    "PrintWorkflowUserSvc"                     #hidden services that apparently register and start a subprocess per user as a service
    "UserDataSvc"                              #hidden services that apparently register and start a subprocess per user as a service
    "OneSyncSvc"                               #hidden services that apparently register and start a subprocess per user as a service
    "WpnUserService"                           #hidden services that apparently register and start a subprocess per user as a service
)

foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}
