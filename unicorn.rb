# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/andars/andars-web"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/andars/andars-web/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/logs/unicorn.log"
# stdout_path "/path/to/logs/unicorn.log"
stderr_path "/home/andars/andars-web/logs/unicorn.log"
stdout_path "/home/andars/andars-web/logs/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.andars-web.sock"

# Number of processes
# worker_processes 4
worker_processes 2
# Time-out
timeout 30
