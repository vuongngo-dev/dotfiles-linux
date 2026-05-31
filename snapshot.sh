#!/usr/bin/bash

# ==============================================================================
# SCRIPT: arch-snapshot.sh
# DESCRIPTION: Snapshot root and reload grub
# ==============================================================================

echo "=================================================="
echo "📸 Start create snapshot timeshift..."
echo "=================================================="

BACKUP_COMMENT="Backup data ($(date '+%Y-%m-%d %H:%M:%S'))"
sudo timeshift --create --comments "$BACKUP_COMMENT"

# Check the exit status code of the Timeshift command
if [ $? -eq 0 ]; then
    echo ""
    echo "=================================================="
    echo "✅ SUCCESS: Snapshot has been saved securely!"
    echo "🔄 Regenerating GRUB configuration file..."
    echo "=================================================="
    
    # Reloading/Regenerating GRUB configuration on Arch Linux
    grub-mkconfig -o /boot/grub/grub.cfg
    if [ $? -eq 0 ]; then
        echo ""
        echo "=================================================="
        echo "🎉 DONE: Timeshift snapshot saved and GRUB updated successfully!"
        echo "=================================================="
    else
        echo ""
        echo "=================================================="
        echo "⚠️  WARNING: Backup succeeded, but GRUB configuration failed."
        echo "👉 Please verify your /boot partition or GRUB installation manually."
        echo "=================================================="
        exit 3
    fi
else
    echo ""
    echo "=================================================="
    echo "❌ ERROR: Timeshift snapshot creation failed!"
    echo "⚠️  GRUB reload has been ABORTED for system safety."
    echo "👉 Please check your disk space or Timeshift configuration."
    echo "=================================================="
    exit 2
fi
