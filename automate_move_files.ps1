$query_multiple_files = Read-Host "Would you like to move multiple different files types? If YES answer Y. If NO answer N"
$source = Read-Host "Enter source destination of files"
$dest = Read-Host "Enter movement destination of files"
$extensions = @()
if($query_multiple_files -like "N"){
   $extensions += Read-Host "Enter file extension type. If you would like to get all files of that type enter '*.filetype'"
}else{
   Do{
       $response = Read-Host "Enter file extension type. If you would like to get all files of that type enter '*.filetype'. Enter 'q' when you are done entering file types"
       if($response -ne "q"){ $extensions += $response }
   }
   Until($response -eq "q")
}

foreach($extension in $extensions){
    $trim_ext = $extension
    $new_dir = -join($trim_ext.TrimStart(".*"), "_", (Get-Date).ToString('MM-dd-yyyy'))
    $new_path = Join-Path $dest $new_dir
    if(!(Test-Path $new_path)){
        New-Item -Force -Path $new_path -ItemType "directory"
    }
    $items = Join-Path $source $extension
    Move-Item -Path $items -Destination $new_path 
}