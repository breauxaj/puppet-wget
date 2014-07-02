require 'fileutils'

Puppet::Type.type(:wget).provide(:ruby) do
  desc "WGET Support"

  commands :wget => 'wget'

  def create
    if File.directory? resource[:path]
      puts resource[:source], resource[:path]
      wget resource[:source], '-P', resource[:path]
    end
  end

  def destroy
    file = resource[:source].split("/").last
    puts 'destroy ' + resource[:path] + file
    FileUtils.rm_f(resource[:path] + file)
  end

  def exists?
    file = resource[:source].split("/").last
    puts 'exists? ' + resource[:path] + file
    File.exists?(resource[:path] + file)
  end
  
end
