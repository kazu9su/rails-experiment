worker_processes(2)

# Set the path for the PID file of the unicorn master process.
# See https://github.com/discourse/prometheus_exporter#unicorn-process-metrics
pid_filepath = '/var/run/unicorn.pid'
pid(pid_filepath)

timeout 30
preload_app true
check_client_connection true
