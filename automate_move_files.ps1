$source = Read-Host "Enter source destination of files."
$dest = Read-Host "Enter movement destination of files."
$extension = Read-Host "Enter file extension type. If you would like to get all files of that type enter '*.filetype'."

$new_dir = -join("PDFS_", (Get-Date).ToString('MM-dd-yyyy'))
$new_path = Join-Path $dest $new_dir
if(!(Test-Path $new_path)){
    New-Item -Force -Path $new_path -ItemType "directory"
}
$items = Join-Path $source $extension
Move-Item -Path $items -Destination $new_path 


# move_items "C:\Users\ocarpent\Downloads" "C:\Users\ocarpent\Documents\PDF" "*.pdf"
