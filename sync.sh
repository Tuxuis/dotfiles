# Execute this shell to sync all configs made in this dir to the real config files. Useful for updating.

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

SOURCE_DIR="$(pwd)"
DEST_DIR="$HOME/.config"

sync_directory() {
    local dir=$1
    echo -e "${BLUE}Syncing ${dir}/ to ${DEST_DIR}/${dir}/${NC}"
    
    mkdir -p "${DEST_DIR}/${dir}"
    
    if rsync -av --progress "${SOURCE_DIR}/${dir}/" "${DEST_DIR}/${dir}/"; then
        echo -e "${GREEN}✓ Successfully synced ${dir}/${NC}"
    else
        echo -e "${RED}✗ Failed to sync ${dir}/${NC}"
        return 1
    fi
    return 0
}

main() {
    echo -e "${YELLOW}=== Starting config sync ===${NC}"
    
    directories=("hypr" "kitty" "waybar" "wofi")
    
    failed=0
    
    for dir in "${directories[@]}"; do
        if ! sync_directory "$dir"; then
            failed=1
        fi
    done
    
    if [ $failed -eq 0 ]; then
        echo -e "${GREEN}=== All configs synced successfully! ===${NC}"
    else
        echo -e "${RED}=== Some configs failed to sync, please check errors above ===${NC}"
    fi
}

main