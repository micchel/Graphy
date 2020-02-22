$app_path = "/var/www/Graphy"
$worker  = 2
$timeout = 30
$app_dir = "/var/www/Graphy/current"
$listen  = "#{$app_path}/shared/tmp/sockets/.unicorn.sock"
$pid     = "#{$app_path}/shared/tmp/pids/unicorn.pid"
$std_log = "#{$app_path}/shared/log/unicorn.log"

worker_processes  $worker
working_directory $app_dir
stderr_path $std_log
stdout_path $std_log
timeout $timeout
listen  $listen
pid $pid

preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
        logger.error e
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end