function move_items{
    Param($source, $dest, $extension)
    $new_dir = -join("PDFS_", (Get-Date).ToString('MM-dd-yyyy'))
    $new_path = Join-Path $dest $new_dir
    if(!(Test-Path $new_path)){
        New-Item -Force -Path $new_path -ItemType "directory"
    }
    $items = Join-Path $source $extension
    Move-Item -Path $items -Destination $new_path 
}

    move_items "C:\Users\ocarpent\Downloads" "C:\Users\ocarpent\Documents\PDF" "*.pdf"
