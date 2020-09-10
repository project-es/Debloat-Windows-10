#   Description:
# This script disables unwanted Windows services. If you do not want to disable
# certain services comment out the corresponding lines below.

$services = @(
    "diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                # Connected User Experiences and Telemetry
    "dmwappushservice"                         # Device Management Wireless Application Protocol (WAP) Push message Routing Service (see known issues)
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
    #"RasMan"                                  #Remote Access Connection Manager
    #"RasAuto"                                 #Remote Access Auto Connection Manager
    # Keep enabled if you use IPv6
    "IpxlatCfgSvc"                             #IP Translation Configuration Service from v4 to v6 and vice versa
    "iphlpsvc"                                 #IP Helper (6to4, ISATAP, Port Proxy, and Teredo), and IP-HTTPS. 
    # Keep enabled to make backups of your files in a drive (Settings -> Updates and security -> Backup).
    #"fhsvc"                                   #File History Service
    #"wbengine"                                #Block Level Backup Engine Service (Used by Windows Backup)
    #"SDRSVC"                                  #Windows Backup
    # Keep enabled if you use smart card logins, or electronic certificates depending on national IDs.
    #"SCPolicySvc"                             #Smart Card Removal Policy
    #"ScDeviceEnum"                            #Smart Card Device Enumeration Service
    #"SCardSvr"                                #Smart Card
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
    # https://www.windows-security.org/windows-service/secondary-logon
    "seclogon"                                 #Secondary Logon
    # Keep enabled to use Microsoft Store
    #"InstallService"                          #Microsoft Store Install Service
    #"LicenseManager"                          #Windows License Manager Service (Used by Microsoft Store)
    
    "AJRouter"                                 #AllJoyn Router Service
    #"AppReadiness"                            #App Readiness
    #"AXInstSV"                                #ActiveX Installer
    #"cbdhsvc"                                 #Clipboard User Service
    #"DmEnrollmentSvc"                         #Device Management Enrollment Service
    #"DsSvc"                                   #Data Sharing Service
    #"embeddedmode"                            #Embedded Mode service enables scenarios related to Background Applications
    #"FontCache"                               #Windows Font Cache Service
    "FrameServer"                              #Windows Camera Frame Server (Could be needed to capture webcam frames).
    #"IKEEXT"                                  #IKE and AuthIP IPsec Keying Modules
    "irmon"                                    #Infrared monitor service (File transfer via infrared devices)
    #"LanmanServer"                            #Supports file, print, and named-pipe sharing over the network for your computer.
    #"LanmanWorkstation"                       #Workstation - Remote Server SMB
    #"lltdsvc"                                 #Link-Layer Topology Discovery Mapper
    #"lmhosts"                                 #TCP/IP NetBIOS Helper
    "MSiSCSI"                                  #Microsoft iSCSI Initiator Service
    #"NcdAutoSetup"                            # Network Connected Devices Auto-Setup
    #"NVDisplay.ContainerLocalSystem"          #Container service for NVIDIA root features
    #"NvContainerNetworkService"               #Container service for NVIDIA network features
    #"NvContainerLocalSystem"                  #Container service for NVIDIA root features
    "PeerDistSvc"                              #BranchCache
    "PhoneSvc"                                 #Phone Service
    #"p2psvc"                                  #Peer Networking Group
    #"p2pimsvc"                                #Peer Networking Identity Manager
    #"PNRPAutoReg"                             #PNRP Machine Name Publication Service
    #"PNRPsvc"                                 #Peer Name Resolution Protocol
    #"PolicyAgent"                             #IPsec Policy Agent
    "PushToInstall"                            #Windows PushToInstall Service
    "RetailDemo"                               #Retail Demo
    "SensrSvc"                                 #Sensor Monitoring Service
    "SEMgrSvc"                                 #Payments and NFC/SE Manager
    "SmsRouter"                                #Microsoft Windows SMS
    "smphost"                                  #Microsoft Storage Spaces SMP
    "SNMPTRAP"                                 #SNMP Trap
    #"stisvc"                                  #Windows Image Acquisition (WIA)
    #"swprv"                                   #Microsoft Software Shadow Copy Provider
    "TapiSrv"                                  #Telephony (API)
    #"WalletService"                           #WalletService
    #"wcncsvc"                                 #Windows Connect Now - Config Registrar
    "WpcMonSvc"                                #Parental Controls
    
    #"ConsentUxUserSvc"                        #Allows ConnectUX and PC Settings to Connect and Pair with WiFi displays and Bluetooth devices.

    # Services that appear to start a process per users in the system:
    #"DevicesFlowUserSvc"                      #Allows ConnectUX and PC Settings to Connect and Pair with WiFi displays and Bluetooth devices.
    "UnistackSvcGroup"                         #hidden services that apparently register and start a subprocess per user as a service
    "UnistoreSvc"                              #hidden services that apparently register and start a subprocess per user as a service
    #"BluetoothUserService"                    #The Bluetooth user service supports proper functionality of Bluetooth features relevant to each user session.
    #"CDPUserSvc"                              #This user service is used for Connected Devices Platform scenarios.
    #"CaptureService"                          #Enables optional screen capture functionality for applications that call the Windows.Graphics.Capture API.
    #"DevicePickerUserSvc"                     #This user service is used for managing the Miracast, DLNA, and DIAL UI.
    "MessagingService"                         #Service supporting text messaging and related functionality.
    "PimIndexMaintenanceSvc"                   #Indexes contact data for fast contact searching.
    #"BcastDVRUserService"                     #Keep enabled for Game Recordings and Live Broadcasts.
    #"PrintWorkflowUserSvc"                    #Support for Print Workflow applications. If turn off this service, you may not be able to print successfully.
    #"UserDataSvc"                             #Provides apps access to structured user data, including contact info, calendars, messages, and other content.
    #"OneSyncSvc"                              #This service synchronizes mail, contacts, calendar and various other user data.
    #"WpnUserService"                          #This service hosts Windows notification platform which provides support for local and push notifications.
)

foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}
