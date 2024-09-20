# This is still TBI



# Step 1: Install `trash-cli`
sudo apt install trash-cli

# Step 2: Create a systemd service to empty the trash
sudo nano /etc/systemd/system/trash-empty.service

# Add the following content:
[Unit]
Description=Empty Trash Periodically

[Service]
Type=oneshot
ExecStart=/usr/bin/trash-empty

# Step 3: Create a systemd timer to run the service daily
sudo nano /etc/systemd/system/trash-empty.timer

# Add the following content:
[Unit]
Description=Run trash-empty daily

[Timer]
OnCalendar=daily
Persistent=true

[Install]
WantedBy=timers.target

# Step 4: Reload systemd, enable and start the timer
sudo systemctl daemon-reload
sudo systemctl enable --now trash-empty.timer