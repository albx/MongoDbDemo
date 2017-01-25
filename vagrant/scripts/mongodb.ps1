$mongoDbPath = "C:\MongoDB" 
$mongoDbConfigPath = "$mongoDbPath\mongod.cfg"
$url = "http://downloads.mongodb.org/win32/mongodb-win32-x86_64-2008plus-3.4.1.zip" 
$zipFile = "$mongoDbPath\mongo.zip" 
$unzippedFolderContent ="$mongoDbPath\mongodb-win32-x86_64-2008plus-3.4.1"

if ((Test-Path -path $mongoDbPath) -eq $True) 
{ 
  write-host "Seems you already installed MongoDB"
	exit 
}

mkdir $mongoDbPath 
mkdir "$mongoDbPath\log" 
mkdir "$mongoDbPath\data" 
mkdir "$mongoDbPath\data\db"

$config = @"
systemLog:
   destination: file
   path: C:\MongoDB\log\mongo.log
   logAppend: true
storage:
   dbPath: C:\MongoDB\data\db
   journal:
      enabled: true
   mmapv1:
      smallFiles: true
net:
   bindIp: 0.0.0.0
   port: 27017
"@

[System.IO.File]::AppendAllText("$mongoDbConfigPath", "$config")

$webClient = New-Object System.Net.WebClient 
$webClient.DownloadFile($url,$zipFile)

$shellApp = New-Object -com shell.application 
$destination = $shellApp.namespace($mongoDbPath) 
$destination.Copyhere($shellApp.namespace($zipFile).items())

Copy-Item "$unzippedFolderContent\*" $mongoDbPath -recurse

Remove-Item $unzippedFolderContent -recurse -force 
Remove-Item $zipFile -recurse -force

& $mongoDBPath\bin\mongod.exe --config $mongoDbConfigPath --install

& netsh advfirewall firewall add rule name="MongoDbPort" dir=in protocol=tcp localport=27017 action=allow profile=any

& net start MongoDB
