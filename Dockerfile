FROM listmonk/listmonk:latest

# Create entrypoint script as a separate file
COPY <<-"EOF" /entrypoint.sh
#!/bin/sh
set -e
echo "Checking the database..."
if [ ! -f "/listmonk/.init" ]; then
    echo "Running setup, feels like the very first time..."
    /listmonk/listmonk --install --yes
    if [ $? -eq 0 ]; then
        echo "Installation successful"
        touch /listmonk/.init
    else
        echo "Installation failed"
        exit 1
    fi
else
    echo "Already initialized, starting normally"
fi
echo "Starting listmonk..."
exec /listmonk/listmonk
EOF

RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]