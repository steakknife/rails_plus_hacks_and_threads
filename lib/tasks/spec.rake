desc 'Run specs'
task :spec do
  ENV['SIMPLECOV'] = 'y' if ARGV.delete('--simplecov') || ARGV.delete('-S')
  ARGV.delete('spec')
  sh 'bundle', 'exec', 'rspec', *ARGV
end
